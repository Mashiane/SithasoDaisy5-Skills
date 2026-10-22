# SithasoDaisy5 — Composition Patterns

Practitioner recipes for wiring components together in B4J/BANano. All code is B4J `.bas` that drives the framework.

## P0 — Avatar Size is numeric (STRICT)

`SDUI5Avatar.Size` is a **numeric width/height string** (e.g. `"12"`, `"16"`, `"48px"`) applied to the `_host` element — NOT a daisyUI size token (`"lg"`, `"md"`, `"sm"`). Passing `"lg"` produces invalid CSS (height: lg) and the avatar renders unsized. Default is `"12"`.

## P0 — Labels require the right mode (STRICT)

**A `Label` only renders when the component's mode property is set to a label-bearing variant.** Defaults are label-less:
- `SDUI5TextBox`, `SDUI5TextArea`, `SDUI5Select`, `SDUI5MultiSelect`, `SDUI5Rating`, `SDUI5FileInput`: `InputType` defaults to `"normal"` (bare input, no label). Set `InputType = "legend"` (or `"label-input"`) for the `Label` to display.
- `SDUI5CheckBox`, `SDUI5Radio`, `SDUI5Toggle`: `*Type` defaults to `"normal"` (no label). Set `CheckBoxType`/`RadioType`/`ToggleType = "legend"` / `"left-label"` / `"right-label"` for the `Label` to display.

Leaving the default in place silently hides the label — there is no error, just a missing label. Always set the mode when a `Label` is intended.

## P0 — Icon & Image asset paths (STRICT)

**Every icon/image property that points at a file under `assets/` MUST use the full relative path `./assets/<name>.svg` (extension included).** Bare names or extension-only values are forbidden — the runtime fetches the literal string as a URL, so `LeftIcon = "log-in"` or `LeftIcon = "log-in.svg"` 404s and the button renders `"Failed to load SVG Sign in"` instead of the icon. Always write `LeftIcon = "./assets/log-in.svg"`, `Image = "./assets/addfolder.svg"`. Applies to `LeftIcon`, `RightIcon`, `Image`, `RightImage`, and any asset-path property. If no matching file exists in `assets/`, choose an existing one (e.g. `"./assets/door-open-solid.svg"`) or add the file — never drop the `./assets/` prefix or the extension.

**Sourcing new icons**: use Iconify (prefer the `tabler` set; source repo https://github.com/tabler/tabler-icons, license MIT) or Iconstack (https://iconstack.io, aggregates 21 MIT-licensed libraries, free search API + MCP). Check the collection license is MIT or otherwise fully free before adding. Download the SVG into the app's `Files/` folder (BANano publishes `Files/` → `assets/` at build, so this alone suffices; copy to published `assets/` only to verify), then reference it locally with its extension (`LeftIcon = "mail.svg"`). Never hotlink the source URL at runtime.

## P0 — Color values follow each component property contract (STRICT)

Before setting any `*Color` property, inspect that exact property in the component reference (including its allowed-value list) and use the behavior it documents. A `.Color` property may select a daisyUI variant, style a nested control, set an HTML attribute, or pass a literal color into a library; the property name alone does not tell you which. For listed variant properties such as `SDUI5Button.Color`, choose a listed semantic value such as `"primary"` or `"error"`.

For shared `BackgroundColor`, `TextColor`, and `BorderColor` helpers, semantic tokens and base tokens are preferred so colors follow the active daisyUI theme. The shared converter wraps `#hex` as an arbitrary Tailwind class, but it does not make `rgb(...)`/`rgba(...)` valid arbitrary class syntax. Use documented raw CSS color properties or `.Styles` when a literal CSS color is required. Do not use `none` unless that component documents it as a no-color sentinel; leave optional color properties empty when no override is intended. See [design-tokens.md](references/design-tokens.md#11-color-channels).

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

### P4b — Shared layout and raw styling properties

When a component exposes these shared designer properties, use them for their intended root-element concerns:

- `PaddingAXYTBLR` / `MarginAXYTBLR` generate Tailwind spacing classes from `a` (all), `x` (left/right), `y` (top/bottom), `t`, `b`, `l`, and `r` values. Use `?` for an unchanged side; e.g. `"a=?; x=4; y=6; t=?; b=?; l=?; r=?"` generates horizontal `px-4` and vertical `py-6` spacing.
- Assigning a spacing property replaces the component's previous spacing value as a whole. Preserve any useful component default explicitly; for example, `SDUI5Column` defaults to `p-2`, so a custom value that should retain its horizontal padding must include `x=2`.
- These properties express one non-responsive value per side. Keep breakpoint-specific spacing such as `sm:px-8` or `md:py-8` in `Classes`; remove the matching base utility from `Classes` when moving it to a spacing property, and do not define the same side at the same breakpoint in both places.
- They style the component's outer rendered element. For compound components, use the component's named inner-region API (for example, `SDUI5Card.BodyClasses` for the `.card-body`) when the padding belongs inside that region. `PaddingAXYTBLR` on a card pads its outer root, not its card body.
- Use `PositionStyle` for CSS positioning mode and `Position` for top/bottom/right/left offsets; offsets only have positioning effect when an appropriate position mode is active. Use `RawStyles` for exceptional inline CSS and `RawAttributes` for HTML attributes, not as substitutes for spacing properties or layout classes.

Before writing a utility in `Classes`, inspect the component's exact designer-property contract and prefer a matching typed property for the same intent. Examples include `SDUI5Text.FontWeight` for `font-bold`/`font-semibold`, `SDUI5Text.Opacity` for `opacity-*`, `SDUI5Text.TextAlign` for `text-center`, `SDUI5Button.Shadow` or `SDUI5Avatar.Shadow` for supported shadows, `Width`/`Height` for dimensions, and `SDUI5Row.AlignItems` for `items-center`. Use only properties actually exposed by that component; do not infer support from another component or from a similar property name.

`RawClasses`/`Classes` remain appropriate for responsive variants, flex/grid layout, typography or visual utilities without a matching component property, and values such as max/min sizing, tracking, leading, overflow, or partial borders. A responsive utility such as `sm:text-5xl` stays in `Classes` even if the component has a non-responsive `TextSize` property. Split out only the matching base utility and preserve all responsive behavior.

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
- **Stats** — `SDUI5Stat` (`stats`) + `SDUI5StatItem` (`stat`).
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
