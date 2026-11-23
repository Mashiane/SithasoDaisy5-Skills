# SithasoDaisy5 — Composition Patterns

Practitioner recipes for wiring components together in B4J/BANano. All code is B4J `.bas` that drives the framework.

## P0 — Avatar Size is numeric (STRICT)

`SDUI5Avatar.Size` is a **numeric width/height string** (e.g. `"12"`, `"16"`, `"48px"`) applied to the `_host` element — NOT a daisyUI size token (`"lg"`, `"md"`, `"sm"`). Passing `"lg"` produces invalid CSS (height: lg) and the avatar renders unsized. Default is `"12"`.

## P0 — Labels require the right mode (STRICT)

**A `Label` only renders when the component's mode property is set to a label-bearing variant.** Defaults are label-less:
- `SDUI5TextBox`, `SDUI5TextArea`, `SDUI5Select`, `SDUI5MultiSelect`, `SDUI5Rating`, `SDUI5FileInput`: `InputType` defaults to `"normal"` (bare input, no label). Set `InputType = "legend"` (or `"label-input"`) for the `Label` to display.
- `SDUI5CheckBox`, `SDUI5Radio`, `SDUI5Toggle`: `*Type` defaults to `"normal"` (no label). Set `CheckBoxType`/`RadioType`/`ToggleType = "legend"` / `"left-label"` / `"right-label"` for the `Label` to display.

Leaving the default in place silently hides the label — there is no error, just a missing label. Always set the mode when a `Label` is intended.

## P0 — Assets and colors

**Icon/image paths**: use `./assets/<name>.svg`, with the prefix and extension. Bare names and
extension-only values produce a 404. Full rule: [RULE-ASSET-001](references/rules-enforcer.md#rule-asset-001).
Sourcing workflow: [SKILL.md](SKILL.md#sourcing-icons-iconify-mitfree-only).

**Color values**: inspect the exact `*Color` property in the component reference and use the behavior it documents.
Prefer semantic tokens for theme switching; the shared converter wraps `#hex` but not `rgb(...)`/`rgba(...)`.
Do not use `none` unless the component documents it as a sentinel. Channel policy:
[design-tokens.md](references/design-tokens.md#11-color-channels). Definitions: RULE-MOUNT-001 and
RULE-CODE-003 in [rules-enforcer.md](references/rules-enforcer.md).

## P1 — Mount a single component

```vb
' In a BANano page/module; host div exists in the layout with id="host"
Dim btn As SDUI5Button
btn.Initialize(Me, "btn", "btn")
btn.ParentID = "host"
btn.setText("Save")
btn.setColor("primary")
BANano.Await(btn.AddComponent)       ' resolves "#host" and mounts internally
' Event handler in this module:
Sub btn_click(e As BANanoEvent)
    app.ShowSwalSuccess("Saved")
End Sub
```

**Rule**: `Initialize` → set `ParentID` → set props (props set before `AddComponent` are baked in via CustProps; setters after mount mutate the live DOM) → `BANano.Await(AddComponent)`. **Never call `DesignerCreateView` from app code** — it is internal and `AddComponent` calls it for you. Event handler name = `${mEventName}_${event}` (here `btn_click`).

## P2 — Parent/child via parentID chain

Children attach by setting their `ParentID` to the parent's id. The parent must be mounted first (`AddComponent` appends its `[BANCLEAN]` node).

```vb
Dim card As SDUI5Card
card.Initialize(Me, "card", "card")
card.ParentID = "content"
BANano.Await(card.AddComponent)

Dim body As SDUI5Text
body.Initialize(Me, "cardbody", "cardbody")
body.ParentID = card.getID           ' "card"
body.setText("Hello")
BANano.Await(body.AddComponent)
```

**Rule**: parent `AddComponent` runs before child `AddComponent`; child `ParentID = parent.getID` (no `#`).

## P2a — Propagate BANano awaits through helper calls

If a helper sub contains `BANano.Await(...)`, its caller must use `BANano.Await(HelperSub)` whenever later work depends on the helper finishing. Apply this transitively: a `Show` routine must await each `Build*` sub that awaits `AddComponent`, and a caller of `Show` must await `Show` when it needs the page mounted before continuing. Keep dependent DOM work in sequence; do not start sibling builders before their awaited mounts have completed.

```vb
Sub Show
    BANano.Await(BuildBrandPanel)
    BANano.Await(BuildSignInPanel)
End Sub

Private Sub BuildBrandPanel
    'Initialize, set ParentID, then:
    BANano.Await(BrandCard.AddComponent)
    BANano.Await(BrandHeadline.AddComponent)
End Sub
```

## P2b — Full-viewport shells and composed cards

`SDUI5Container.Container` defaults to `True`, which adds a max-width `container` class. Set `Container = False` on a root intended to fill the viewport. `SDUI5Card.Width` defaults to `"96"`, while its `TitleVisible` and starter `Content` defaults show `Card Title` and `Card Content`; for cards whose content is built from child components, set `Width = "full"`, `TitleVisible = False`, and `Content = ""` as appropriate. Check the actual screenshot at the target viewport for overflow and starter text.

## P3 — Container/Row/Column grid

`SDUI5Container` → `SDUI5Row` → `SDUI5Column` is the Tailwind grid stack. Container emits `container`; Row emits `grid`; Column emits `p-2`. Nest by id chain (P2).

## P4 — Form with validation + submit

```vb
Dim frm As SDUI5Form
frm.Initialize(Me, "frm", "frm")
frm.ParentID = "host"
BANano.Await(frm.AddComponent)

Dim inp As SDUI5TextBox
inp.Initialize(Me, "email", "email")
inp.ParentID = frm.getID
inp.setLabel("Email")
inp.setRequired(True)
inp.setValidator("email")            ' framework validation hook
BANano.Await(inp.AddComponent)

Sub frm_submit(e As BANanoEvent)
    Dim em As String = inp.getText
    If em = "" Then app.ShowSwalError("Email required") : Return
    ' ...save...
End Sub
```

Form components that play here: `SDUI5TextBox`, `SDUI5TextArea`, `SDUI5CheckBox`, `SDUI5Radio`, `SDUI5Select`, `SDUI5MultiSelect`, `SDUI5FileInput`, `SDUI5Toggle`, `SDUI5Range`, `SDUI5Rating`, `SDUI5OTP`. Group with `SDUI5FieldSet` / `SDUI5CheckBoxGroup` / `SDUI5RadioGroup` (all emit `fieldset, border, rounded-box`).

### P4a — Light-surface form field styling

For text-entry and selection fields placed on a light form surface, use a transparent background and remove the component frame when the surrounding card/panel provides the visual boundary:

```vb
field.BackgroundColor = ""
field.Border = False
field.BorderColor = ""
```

Use this trio for `SDUI5TextBox`, `SDUI5TextArea`, and `SDUI5Select`; use it for `SDUI5MultiSelect`, `SDUI5GroupSelect`, or `SDUI5FileInput` only when their field presentation should blend into that same surface. The demo form pages use this treatment for textboxes, selects, checkboxes, and file inputs, while component showcase pages also retain the defaults or intentionally demonstrate a filled/bordered state. Check the component demo when unsure.

Do not apply this trio automatically to `SDUI5CheckBox`, `SDUI5Toggle`, `SDUI5Radio`, `SDUI5Range`, `SDUI5Rating`, or `SDUI5NoUISlider`; their visual state is the control, and demos use backgrounds/borders to distinguish variants. Keep `SDUI5FieldSet`, `SDUI5CheckBoxGroup`, and `SDUI5RadioGroup` decisions separate: remove a wrapper frame when it is only layout, and keep it when it meaningfully groups choices. Do not clear a border color as a substitute for setting `Border = False`.

For sizing, use a component's `Width` or `Height` property when that component exposes the property and matching setter/getter. These dimension APIs are component-specific; do not assume they are inherited by every control. Use `Classes` utilities such as `w-full` or `h-full` when the corresponding dimension property is absent, or when responsive/min/max sizing is needed, and verify which rendered element receives those classes.

### P4b — Shared layout and raw styling properties (The Property-First Rule)

`.Classes` is strictly an auxiliary fallback. If a component exposes a designer property for layout, spacing, dimension, elevation, or positioning, you **MUST** assign it via that property and never leak it into `.Classes`. See [Base Designer Properties & DSL Guide](references/base-properties-dsl.md).

When a component exposes these shared designer properties, use them for their intended root-element concerns:

- **The `Raw*` Code Property Mapping (CRITICAL)**:
  In `#DesignerProperty` headers, keys are named `RawClasses`, `RawStyles`, and `RawAttributes`. But framework setters are `setClasses`, `setStyles`, `setAttributes`.
  In B4J code, always assign `.Classes`, `.Styles`, and `.Attributes`.
  Never write `.RawClasses`, `.RawStyles`, or `.RawAttributes` in B4J code (causes compilation error: `Field not found`).
- **Property Assignment Syntax Only (No Capital `Set*` Methods)**:
  Designer properties have lowercase setters in framework classes (`setPosition`, `setMarginAXYTBLR`). In B4X code, always invoke them as property assignments: `comp.Position = ...`, `comp.MarginAXYTBLR = ...`.
  * **Forbidden**: Never call or invent capitalized methods like `comp.SetPositionStyle(...)`, `comp.SetPosition(...)`, `comp.SetMarginAXYTBLR(...)`, or granular sub-setters (`SetTop`, `SetMarginT`).
- **Clean Compact Spacing DSL (`MarginAXYTBLR` / `PaddingAXYTBLR`)**:
  Generates Tailwind spacing classes from keys `a` (all), `x` (horizontal/auto), `y` (vertical), `t`, `b`, `l`, `r`, and `n` prefix for negative (`t=n4` → `-mt-4`).
  The designer default `a=?; x=?; ...` has `?` placeholders, but app code should write only active sides:
  e.g. `comp.MarginAXYTBLR = "b=4"` (`mb-4`), `comp.MarginAXYTBLR = "x=auto; b=6"` (`mx-auto mb-6`), `comp.PaddingAXYTBLR = "x=4; y=6"` (`px-4 py-6`).
  * Assigning replaces previous spacing as a whole. Preserve useful component defaults explicitly (e.g. `SDUI5Column` defaults to `p-2`).
  * Outer element only: compound components pad inner regions via named APIs (e.g. `SDUI5Card.BodyClasses` for `.card-body`).
- **Positioning DSL (`PositionStyle` & `Position`)**:
  * `PositionStyle`: `"relative"`, `"absolute"`, `"fixed"`, `"sticky"`, `"static"`. Emits inline CSS `style="position: ...;"`.
  * `Position`: `"t=0; r=0"`, `"t=50%; l=50%"`. Uses CSS length/percentage units (`0`, `10px`, `1rem`, `50%`), NOT Tailwind tokens. Emits inline CSS `top`, `bottom`, `left`, `right`.
  * Position properties do NOT output Tailwind classes.
- **UIShared Engine Contract**:
  * `UI.BuildExClass`: Only outputs Tailwind classes for `MarginAXYTBLR`, `PaddingAXYTBLR`, and auxiliary `Classes`.
  * `UI.BuildExStyle`: Handles `PositionStyle`, `Position`, and custom `Styles`.
  * `UI.BuildExAttributes`: Handles custom `Attributes`.
- **Exact Token Syntax for String Properties**:
  * Suffix only; framework prepends prefix (`FixSize` → `w-`/`h-`, `FixShadow` → `shadow-`, `FixRounded` → `rounded-`). A full utility doubles it (`"w-full"` → `w-w-full`).
  * `Width`: `comp.Width = "full"`, `comp.Width = "64"`, `comp.Width = "screen"` (never `"w-full"`).
  * `Height`: `comp.Height = "64"`, `comp.Height = "full"`, `comp.Height = "screen"` (never `"h-64"`).
  * `Shadow`: `comp.Shadow = "md"` or `"shadow"` (never `"shadow-md"`).
  * `Rounded`: `comp.Rounded = "box"` or `"rounded"` / `"rounded-full"` (never `"rounded-box"`).
- **Strict `.Classes` Reservation (Responsive & Unmanaged Only)**:
  `Classes` remains strictly reserved for:
  1. Breakpoint-specific / responsive variants (`sm:px-8`, `md:w-1/2`, `lg:h-96`, `hidden md:flex`).
  2. Transitions and hover animations (`transition-transform`, `duration-200`, `motion-safe:hover:-translate-y-1`, `hover:shadow-xl`).
  3. Flex/Grid child layout tokens (`flex-1`, `grow`, `shrink-0`, `col-span-2`).
  4. Utilities without a matching component property (`overflow-hidden`, `backdrop-blur-sm`, `divide-y`).
  Never place static, base (unprefixed) `m-*`, `p-*`, `w-*`, `h-*`, `shadow-*`, `rounded-*`, `relative`, or `absolute` into `.Classes`. Split out base values into dedicated properties and retain only responsive/unmanaged utilities in `.Classes`.

## P5 — Drawer + navbar shell

`SDUI5App` initializes `#body`. Add a `SDUI5Drawer` (emits `drawer`, `lg:drawer-open`), a `SDUI5NavBar` inside, and a content panel. Toggle via `app.OpenDrawer(drawerID, True/False)` / `app.ToggleDrawer(drawerID)` / `app.ForceCloseDrawer(drawerID)`.

## P6 — Modal dialog

```vb
Dim mdl As SDUI5Modal
mdl.Initialize(Me, "mdl", "mdl")
mdl.ParentID = "body"
mdl.setTitle("Confirm")
mdl.SetActionType("yes-no")          ' cancel|no|yes|yes-no|yes-no-cancel|ok-cancel|retry-cancel|abort-retry-ignore
BANano.Await(mdl.AddComponent)
mdl.Show
Sub mdl_Yes_Click(e As BANanoEvent)
    mdl.Close
End Sub

Sub mdl_Cancel_Click(e As BANanoEvent)
    mdl.Close
End Sub
```

For dialog visibility, always pair `Show` with `Close`. In every action handler that should dismiss the dialog (including Cancel), call `Close`. Do not use the `Open` property or `setOpen` to open/close a dialog: that setter changes the `modal-open` CSS class without synchronizing the hidden checkbox that drives the modal's close and backdrop controls.

For async confirm use `app.ShowSwalConfirmWait(title, msg, okText, cancelText)` — returns Boolean via `BANano.Await`.

## P7 — Tabs / segments

`SDUI5Tabs` (emits `tabs`) + `SDUI5TabsItem` children. `SDUI5Segment` emits `tabs tabs-box` for pill-style switching. It fires `Change`.

## P8 — List / menu / tree

`SDUI5List` (`list, rounded-box`) + `SDUI5ListItem` (`list-row`). `SDUI5Menu` (`menu`, 52 props) + `SDUI5MenuItem` (`menu-active`, `menu-focus`) — fires `ItemClick`. `SDUI5TreeView` (`menu, overflow-y-auto`) fires `nodeDrop, nodeDragStart, nodeExpanded`. `SDUI5TreeSpider` for spider-style trees (needs `app.UsesTreeSpider`).

## P9 — Data display

- **Table** (`SDUI5Table`, 95 props, `card card-border`) — fires `AlphaClick, RowClick, HeaderClick`.
- **Stats** — `SDUI5Stat` (`stats`) + `SDUI5StatItem` (`stat`). RULE-LAYOUT-005: the item mounts inside the stat parent, never directly to a Row, Column, Container, or PageView.
- **Other companions** — `SDUI5StepsItem`, `SDUI5TimelineItem`, `SDUI5TabsItem`, `SDUI5MenuItem`, `SDUI5ListItem`, and `SDUI5CarouselItem` each mount into their designated parent.
- **Charts** — `SDUI5ToastChart` (`toastui-chart`), `SDUI5TrendChart`, `SDUI5GenderChart`.
- **Pivot** — `SDUI5Pivot` (`webdatarocks`).
- **JSON** — `SDUI5JsonEditor`, `SDUI5JsonTree`.

## P10 — Lazy-load external assets

Before using a component that wraps an external lib, call its `UsesX` loader once (in `BANano_Ready` or before first use):

```vb
Banano.Await(app.UsesDatePicker)     ' flatpickr
Banano.Await(app.UsesExcel)          ' xlsx / exceljs
Banano.Await(app.UsesQuill)          ' SDUI5QuillEditor
Banano.Await(app.UsesLeaflet)        ' SDUI5Leaflet
Banano.Await(app.UsesKanBan)         ' SDUI5KanBan
Banano.Await(app.UsesSignaturePad)   ' SDUI5SignaturePad
Banano.Await(app.UsesQRCode)         ' SDUI5QRCode
Banano.Await(app.UsesVideoAudioPlayer) ' SDUI5VideoPlayer (plyr)
Banano.Await(app.UsesOfficeRibbon)   ' SDUI5OfficeRibbon
```

Full list in `SDUI5App.bas` — every `UsesX` maps to `UI.LoadAssetsOnDemand(name, files...)`.

## P11 — Responsive sizing

Most components expose `Size` plus breakpoint-specific `SizeLarge/SizeMedium/SizeSmall/SizeXLarge` which emit `lg:btn-*`, `md:btn-*`, `sm:btn-*`, `xl:btn-*`. Set base `Size` then override per breakpoint. Margins/Paddings use the `a=?;x=?;y=?;t=?;b=?;l=?;r=?` string → Tailwind `m-*`/`p-*` utilities.

## P12 — Feedback

- Toast: `app.ShowToast*` (uses `SDUI5MDToast`).
- SweetAlert: `app.ShowSwal*` / `ShowSwal*Wait` (async) — positions `SWAL_TOP_END` etc., timer `SwalTimer`.
- Inline: `SDUI5Alert`, `SDUI5Toast` (`toast`), `SDUI5Loading` (`loading`), `SDUI5Skeleton` (`skeleton`), `SDUI5Status` (`status`).

## P13 — Context-Aware Default Value Overrides

Components have default property values intended for standalone canvas drops. When mounted inside container contexts, these defaults must be explicitly overridden to prevent layout conflicts:
- **`SDUI5Card` inside `SDUI5Column`**: Defaults to `Width = "96"` ($384\text{px}$ fixed). Always set `Card.Width = "full"` so it fluidly fills the responsive column cell.
- **`SDUI5Wizard` inside containers**: Defaults to `Width = "96"`. Always set `Wizard.Width = "full"`.
- **`SDUI5Menu` inside columns/drawers**: Defaults to `Width = "56"` ($224\text{px}$). Set `Menu.Width = "full"` when expanding across the sidebar container.
- **`SDUI5Hero` with overlay and rounded corners**: Set `Hero.Classes = "overflow-hidden"` to clip the sharp overlay corners to the rounded border curve.
- See full matrix in `references/context-aware-defaults.md`.
