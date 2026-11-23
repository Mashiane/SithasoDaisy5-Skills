---
name: negative-knowledge
description: Anti-hallucination rules for SithasoDaisy5. Documented anti-patterns, common agent mistakes, and the corrected way. Cite NEG-* IDs in your reasoning trace.
---

# SithasoDaisy5 — Negative Knowledge

Documented anti-patterns and common agent mistakes. Each item: **the wrong thing** agents tend to produce, **why it's wrong**, and **the correct pattern**. Cite `NEG-*` IDs when correcting.

Grounded in: 140 registered `SDUI5*` UI classes + 123 demo files with matching UI type usage + audit of common LLM outputs.

---

## 1. Setter & Property Anti-Patterns

### NEG-001 — Inventing Setter Names

**Wrong**: `btn.setRequired(True)` / `input.setValidator(...)` / `form.setLabel(...)`  
**Reality**: SithasoDaisy5 uses **direct property assignment** (`.Required = True`, `.Validator = ...`, `.Label = ...`), not the `setX` / `getX` convention some agents assume from Java/Swift naming.  
**Correct**: Read `components/<Name>.md` and use the listed setter pattern. Most setters are direct fields.

### NEG-002 — Inventing Method Names

**Wrong**: `comp.SetValue("x")` / `comp.UpdateContent(...)`  
**Reality**: Method names must match the `.bas` source exactly.  
**Correct**: Consult `components/<Name>.md` Methods section before calling any method. If it's not listed, it doesn't exist.

### NEG-003 — Treating every `.Color` as the same API

**Wrong**: Assuming any component's `.Color` accepts the same values or has the same effect.
**Reality**: `.Color` may be a semantic variant, nested-child color, HTML attribute, or raw CSS color. Shared `BackgroundColor`/`TextColor`/`BorderColor` helpers use `UIShared.FixColor`; it wraps `#hex` as a Tailwind arbitrary class but does not convert CSS `rgb(...)`/`rgba(...)` strings into valid arbitrary syntax.
**Correct**: Check the exact property's designer list, component reference, and setter. Use listed semantic values for variant properties; use literal CSS colors only in documented raw-CSS channels. See `design-tokens.md` §1.1.

### NEG-004 — Numeric Pixel Dimensions

**Wrong**: `card.Width = 320`, `card.Height = 200`  
**Reality**: Numeric pixels are not accepted by `SDUI5*` width/height setters.  
**Correct**: `.Width = "full"` or `.Classes = "w-80 max-w-sm"` (Tailwind utilities on `.Classes`).

### NEG-005 — Capitalised Tokens

**Wrong**: `.Color = "Primary"` / `.Size = "MD"`  
**Reality**: Tokens are lowercase.  
**Correct**: `.Color = "primary"`, `.Size = "md"`.

---

### NEG-039 — FieldSet Stray Default "Label"

**Wrong**: An `SDUI5FieldSet` is given a real `Legend` but `Label`/`LabelVisible` are left at defaults (`Label = "Label"`, `LabelVisible = True`), so the rendered fieldset carries a stray `<p class="fieldset-label">Label</p>` that is not part of the design.

**Reality**: `SDUI5FieldSet.Label` defaults to the literal string `"Label"` and `LabelVisible` defaults to `True`. The `Label` is a *secondary* descriptor (distinct from `Legend`); when you only want a legend, the default label still renders.

**Correct**: Set `LabelVisible = False` (or set a meaningful `Label`) whenever a fieldset only needs a `Legend`. Never rely on the default.

---

### NEG-040 — Toggle / Range Labels Hidden by Default

**Wrong**: `SDUI5Toggle` / `SDUI5Range` are given a `Label` but render with no visible label, because `ToggleType` / `RangeType` are left at their default `"normal"`.

**Reality**: `SDUI5Toggle.Label` only renders when `ToggleType` is `legend` / `left-label` / `right-label` (`normal` renders no label). `SDUI5Range.Label` only renders when `RangeType` is `legend` (which also shows the current value); `normal`/`tooltip` render no static label. Defaults are `"normal"` for both.

**Correct**: Set `ToggleType = "left-label"` (or `right-label`/`legend`) and `RangeType = "legend"` when a label is required. Verify the label text actually appears in the rendered DOM.

---

## 2. Lifecycle Anti-Patterns

### NEG-006 — Missing `ClearPageView`

**Wrong**:
```b4j
Sub Show
    app = pgIndex.App
    ' ... mount components directly ...
End Sub
```
**Reality**: Without `BANano.Await(app.ClearPageView)` first, stale views from the previous page persist, causing duplicate child stacking on resize.  
**Correct**: `BANano.Await(app.ClearPageView)` is the **first statement** after `app = pgIndex.App`.

### NEG-007 — Missing `UpdateTitle`

**Wrong**: `Sub Show` ends without `pgIndex.UpdateTitle("...")`.  
**Reality**: Browser tab title stays stale.  
**Correct**: `pgIndex.UpdateTitle("...")` is the **last statement** before `End Sub`.

### NEG-008 — DOM Mutation Without Parent Mount

**Wrong**:
```b4j
SDUI5Row1.Initialize(Me, "SDUI5Row1", "SDUI5Row1")
SDUI5Button1.ParentID = "SDUI5Row1"   ' Row hasn't called AddComponent yet!
BANano.Await(SDUI5Button1.AddComponent)
```
**Reality**: Child's `ParentID` must reference a parent that has already called `AddComponent`. Otherwise runtime error.  
**Correct**: Always `AddComponent` the parent before setting child `ParentID`.

---

## 3. Architecture Anti-Patterns

### NEG-009 — Skipping the Hierarchy

**Wrong**: Components added directly to a container without `SDUI5Row`/`SDUI5Column` between.  
**Reality**: No grid, no responsive behavior, layout collapses on mobile.  
**Correct**: Always go `SDUI5Container` → `SDUI5Row` → `SDUI5Column` → leaf.

### NEG-010 — No State Coverage

**Wrong**: Data-driven view only renders the happy path:
```b4j
If data.Size > 0 Then
    table.SetItems(data)
End If
```
**Reality**: When `data.Size = 0`, the user sees a blank screen. When fetch fails, same.  
**Correct**: Core 4 states — Loading + Populated + Empty + Error. Use `SDUI5Loading` or `SDUI5Skeleton` for loading, `SDUI5Text` with an optional `SDUI5Button` for empty data, and `SDUI5Alert` for errors. Extended states (offline, permission denied, validation, partial data, first-use) must be declared in the screen contract (RULE-INTERACT-003).

### NEG-011 — Top-Level Nav with 6+ Items

**Wrong**: Navbar with 6 tabs at the top.  
**Reality**: Hick's Law. Cognitive friction scales with choice count.  
**Correct**: ≤ 5 top-level items. Overflow behind a "More" menu / `SDUI5Dropdown`.

### NEG-012 — Touch Targets Smaller Than 48px

**Wrong**: Tiny icon button without size padding.  
**Reality**: Fitts's Law + WCAG 2.5.5. Sub-48px targets fail.  
**Correct**: `.Classes = "min-h-12 min-w-12"` or use `SDUI5IconButton` if it exists for your use case.

### NEG-013 — Multiple Primary CTAs on One Screen

**Wrong**: Two buttons both with `.Color = "primary"`.  
**Reality**: Visual hierarchy collapses. User can't tell which to click.  
**Correct**: One primary per screen (`.Color = "primary"`, `.Size = "lg"`). Others use `neutral`, `ghost`, or `secondary`.

### NEG-014 — Destructive Actions Without Confirmation

**Wrong**: Delete button that fires the destructive action on click.  
**Reality**: One-tap destruction is hostile UX.  
**Correct**: `app.ShowSwalConfirm(message)` async before executing.

---

### NEG-041 — Grid Row Children Without Column Spans

**Wrong**: Two or more controls are placed in an `SDUI5Row` (which renders `grid grid-cols-12`) and `JustifyContent = "between"` is set, but the children are given no `Classes = "col-span-N"`. They collapse to the left and overlap, because each defaults to a single grid column.

**Reality**: `SDUI5Row` defaults to `GridCols = 12` (`grid-cols-12`). Without explicit `col-span-*` on the children, `justify-between` has no columns to distribute and the items stack in column 1.

**Correct**: Give each child an explicit span (`col-span-6`, `col-span-4`, etc.) so the 12-column grid lays them out. Verify the rendered row shows the buttons separated, not overlapping.

---

## 4. Web → SithasoDaisy5 Translation Anti-Patterns

### NEG-015 — `<div onclick="...">`

**Wrong**: Producing `<div class="row" onclick="fn()">` HTML.  
**Reality**: Not keyboard-navigable. WCAG 2.1.1 fail.  
**Correct**: Use `SDUI5Button` (real `<button>`) or another interactive component.

### NEG-016 — Custom `<style>` Blocks in Page Modules

**Wrong**: Producing `<style>.my-class { color: red; }</style>` inside pg*.bas component code.  
**Reality**: Component styling belongs in framework channels. One-off raw `<style>` blocks scattered per page fragment theming and get duplicated on navigation.  
**Correct**: `.Classes` (Tailwind, incl. arbitrary values), `.Styles` (inline CSS — first-class, never blocked), or app-level theme CSS for global rules (fonts, keyframes) loaded once via `UI.LoadAssetsOnDemand` / stylesheet.

### NEG-017 — Bypassing Framework Channels for Styling

**Wrong**: Emitting HTML strings with `style="..."` attributes to style components.  
**Reality**: Unnecessary — the framework has a first-class inline-style channel.  
**Correct**: `.Styles = "display: flex; gap: 16px"` on the SDUI5 component (base-class `setStyles`, `SDUI5Component.bas`) or `.Classes = "flex gap-4"`. Both allowed; prefer `.Classes` so Tailwind handles responsive variants.

### NEG-018 — Adding `localStorage.setItem`

**Wrong**: Direct browser storage API.  
**Reality**: Bypasses framework helpers (`app.LocalStorageSet/Get` add namespacing, JSON serialization, expiry).  
**Correct**: `app.LocalStorageSet(key, value)` / `app.LocalStorageGet(key, defaultValue)`.

### NEG-019 — React-style `useState` / `useEffect`

**Wrong**: Trying to mirror React state machinery.  
**Reality**: SDUI5 components are live objects; you mutate directly with setters.  
**Correct**: Set `.X = value` on the component instance; the framework re-renders that node.

### NEG-020 — Routing with `<a href>` Page Reloads

**Wrong**: Producing `<a href="login.html">Login</a>` to switch pages.  
**Reality**: Causes full page reload, loses app state.  
**Correct**: `BANano.Await(pgLogin.Show)` — pages navigate by calling the target page's `Show` directly.

### NEG-021 — JSON.parse for What `app` Provides

**Wrong**: Manually `JSON.parse(...)` for app data.  
**Reality**: `app` exposes typed wrappers.  
**Correct**: `app.LocalStorageGet` (already JSON-aware), `app.PBCollection(...)` for PocketBase, etc.

---

## 5. Data Display Anti-Patterns

### NEG-022 — Showing All Rows in an Unbounded Table

**Wrong**: `SDUI5Table.SetItems(thousandsOfRows)`  
**Reality**: Performance collapse, broken scroll.  
**Correct**: Paginate to 10–25 visible rows, or use `SDUI5List` for virtualization.

### NEG-023 — Forgetting `.Soft` / `.Outline` on Alters

**Wrong**: Every alert uses default `solid` styling.  
**Reality**: Visual fatigue; alert priority is unclear.  
**Correct**: Use `.Soft` for informational, `.Outline` for context, `.Solid` only for critical errors.

### NEG-024 — Infinite-Scroll-Without-Skeleton

**Wrong**: Table loads with no skeleton, then jumps from empty to populated.  
**Reality**: Layout shift (CLS) hurts perceived performance.  
**Correct**: Show `SDUI5Skeleton` (or `SDUI5Loading`) during fetch.

---

## 6. Theme & Color Anti-Patterns

### NEG-025 — Hex on Themed Components That Should Follow the Theme

**Wrong**: `.Classes = "bg-[#FF6B35]"` on a button that represents the app's primary action.  
**Reality**: Breaks theme switching — the component stops following `data-theme` and becomes a 1-theme app.  
**Correct**: For brand identity, configure it as the theme's `primary` (daisyUI CSS vars) + `.Color = "primary"`. Hex via `.Classes`/`.Styles` is fine for accents, decorative surfaces, and one-off designs where theme-following isn't the intent.

### NEG-026 — Different Colors for Same Semantic

**Wrong**: `.Color = "success"` on one button, `.Color = "primary"` on another "confirm" button.  
**Reality**: Same semantic = same color. Confuses users.  
**Correct**: Pick a token per semantic and stick to it across the app.

### NEG-027 — Background Colors on Text

**Wrong**: Light grey text on white background (`text-base-100` on `bg-base-100`).  
**Reality**: Insufficient contrast. WCAG fail.  
**Correct**: Match content to container (`text-base-content` on `bg-base-100`, `text-primary-content` on `bg-primary`).

---

### NEG-038 — The App Applies Its Own Theme

**Wrong**: Calling `app.SetTheme("nord")` (or any theme) in `Show`/`BANano_Ready`, writing `data-theme` directly, or otherwise committing the app to one palette.
**Reality**: The theme belongs to the host page/user. An app-level call overrides their choice, hides theme regressions during QA, and makes the app non-portable.
**Correct**: Never set a theme (RULE-THEME-001). Use semantic tokens (`primary`, `base-100`, `base-content`, …) and verify the page under the host theme. If the user asks for a switcher, build the control, not a default.

---

## 7. Build / Wiring Anti-Patterns

### NEG-028 — Editing `0SithasoDaisy5\*.bas`

**Wrong**: Adding a method to `SDUI5Button.bas` to fix a missing setter.  
**Reality**: Your edit is in the source but not in `SithasoDaisy5.b4xlib` — it's lost on next build.  
**Correct**: Compose with existing public APIs only. If something is missing, request it upstream.

### NEG-029 — Forgetting `ModuleN=` for New Pages

**Wrong**: Adding `pgNewPage.bas` but not editing `<App>.b4j` to add `ModuleN=pgNewPage`.  
**Reality**: Unwired pages are silently omitted from the build.  
**Correct**: Add `ModuleN=pgNewPage` + bump `NumberOfModules` in your app's `.b4j`.

### NEG-030 — Custom Asset Missing `FileGroupN`

**Wrong**: `FileN=my-icon.svg` without `FileGroupN=Default Group`.  
**Reality**: Build crash with `ResourcesNotFoundException`.  
**Correct**: Both entries in `<App>.b4j`.

---

## 8. Web-Style Anti-Patterns

### NEG-031 — Using Web Framework Vocabulary

**Wrong**: "I'll mount a `<Portal>` to render this" / "wrap with `<Suspense>`".  
**Reality**: There is no portal/suspense in BANano.  
**Correct**: Use `app.ShowSwalXxx(...)` for async feedback; component visibility (`.Visible = True/False`) for show/hide.

### NEG-032 — Using HTML `title=` Attribute

**Wrong**: `<button title="Click me">×</button>`  
**Reality**: HTML `title` is OS-tooltip, not part of daisyUI tooltip system. Accessibility separate.  
**Correct**: `SDUI5ToolTip` with `.Title="Click me"` + component initialization.

### NEG-033 — Tailwind `bg-primary-content` on Buttons

**Wrong**: `.Classes = "bg-primary text-primary-content"` (manually applying the content pair).  
**Reality**: daisyUI's `btn-primary` class already applies the right content color. Manually adding it doubles up.  
**Correct**: Use semantic tokens only; trust daisyUI's built-in pairings.

---

## 9. Error Recovery Anti-Patterns

### NEG-034 — Swallowing Exceptions

**Wrong**:
```b4j
Try
    DoSomething
Catch
    ' silently do nothing
End Try
```
**Reality**: User has no idea why the screen is broken.  
**Correct**:
```b4j
Try
    DoSomething
Catch
    Log("pgXxx.DoSomething: " & LastException.Message)
    app.ShowSwalError(LastException.Message)
End Try
```

### NEG-035 — No Retry on Failed Fetch

**Wrong**: Error state shows "Failed to load" with no action.  
**Reality**: User has no way to recover.  
**Correct**: Add a "Retry" button (`SDUI5Button`) that re-invokes the load sub.

### NEG-036 — Component Cargo-Culting (screenshot/mockup literalism)

**Wrong**: Translating a mockup literally — "there is a card, therefore `SDUI5Card`", "there is a round thing, therefore `btn-circle`".  
**Reality**: Visual patterns in prompts/mockups are hypotheses, not specs. 1:1 pixel-to-component mapping produces semantically wrong markup (cards used as incidental groupers, divs-as-buttons, icons-as-buttons) and fights theme/accessibility.  
**Correct**: Extract function first, structure second, style last (design-intelligence.md DI-12). "There is a card" → "there is a grouped visual region representing related information" → then decide whether `SDUI5Card`, `SDUI5FieldSet`, `SDUI5ListItem`, `SDUI5Panel`, or plain layout is semantically right. Cite DI-12 in the trace when deviating from the literal mockup.

### NEG-037 — Orphan Companion Child Components Without Container Parent

**Wrong**: Mounting `SDUI5StatItem`, `SDUI5StepsItem`, `SDUI5TimelineItem`, `SDUI5TabsItem`, `SDUI5MenuItem`, `SDUI5ListItem`, `SDUI5AccordionItem`, `SDUI5BreadcrumbItem`, or `SDUI5CarouselItem` directly to an `SDUI5Column`, `SDUI5Row`, `SDUI5Container`, or `app.PageView`.
```b4j
Private SDUI5Stat1 As SDUI5StatItem	'ignore
SDUI5Stat1.Initialize(Me, "SDUI5Stat1", "SDUI5Stat1")
SDUI5Stat1.ParentID = "SDUI5Column1"	' BROKEN! Missing SDUI5Stat container
```
**Reality**: daisyUI child items (`.stat`, `.step`, `.timeline-item`, `.tab`) rely on parent container CSS rules (`.stats`, `.steps`, `.timeline`, `.tabs`) for divider lines, flex/grid directions, rounded boxes, and elevation. Without the container, styling and layout collapse.
**Correct**: Always mount the child item into its designated parent container (RULE-LAYOUT-005):
```b4j
Private SDUI5Stat1 As SDUI5Stat	'ignore
Private SDUI5StatItem1 As SDUI5StatItem	'ignore

SDUI5Stat1.Initialize(Me, "SDUI5Stat1", "SDUI5Stat1")
SDUI5Stat1.ParentID = "SDUI5Column1"
SDUI5Stat1.Border = True
SDUI5Stat1.RoundedBox = True
BANano.Await(SDUI5Stat1.AddComponent)

SDUI5StatItem1.Initialize(Me, "SDUI5StatItem1", "SDUI5StatItem1")
SDUI5StatItem1.ParentID = "SDUI5Stat1"	' Correct parent container!
BANano.Await(SDUI5StatItem1.AddComponent)
```

---

### NEG-042 — Unverified Icon Name on a Button

**Wrong**: A button is given `RightIcon = "save"` (or any icon name) without confirming the icon resolves in the shipped `svg-renderer`/FontAwesome set. The renderer emits `data-src="save"` and, on failure, shows red "Failed to load SVG" text that breaks the CTA; on mobile the broken button can also clip/overlap siblings.

**Reality**: Not every short icon name resolves against the bundled icon set/SVG renderer. The failure is silent at generation time and only surfaces in the rendered DOM.

**Correct**: Use only verified icon names, or remove the icon (`NoRightIcon = True` / `NoLeftIcon = True`, or omit the property) when an icon is not essential. Verify the rendered button has no "Failed to load SVG" text.

### NEG-044 — FieldSet default width shrinks the form

**Wrong**: Add `SDUI5FieldSet` children without setting `Width`, expecting them to span the card.
**Reality**: `SDUI5FieldSet` defaults to `Width = "xs"`. In Tailwind v4 `w-xs` is 20rem (320px), so the fieldset renders as a narrow column inside a wide card.
**Correct**: Set `.Width = "full"` on every fieldset that should span its card, then confirm the rendered width in the browser.

### NEG-045 — Divider renders the literal word "Divider"

**Wrong**: Initialize an `SDUI5Divider` and leave `Text` at its default.
**Reality**: The designer default for `Text` is `"Divider"`, so an unlabeled divider displays that word.
**Correct**: Set `.Text = ""` for a plain rule, or set the intended section label explicitly.

### NEG-046 — Soft alert variants fail contrast

**Wrong**: `alert.Soft = True` with a semantic color, assuming daisyUI keeps it readable.
**Reality**: On the Nord theme, `alert-soft alert-warning` renders amber text on a pale surface at 1.32:1, far below WCAG AA.
**Correct**: Use the solid variant (`Soft = False`) for semantic alerts, or set explicit `BackgroundColor`/`TextColor` and measure the composited contrast.

### NEG-047 — Timeline items render without connecting lines

**Wrong**: Mount `SDUI5TimelineItem` rows and expect daisyUI to draw the timeline line.
**Reality**: Each item renders the connector `<hr>` elements hidden. `StartJoinPrefix` and `EndJoinSuffix` both default to `False`, so the icons sit isolated.
**Correct**: First item `EndJoinSuffix = True`; middle items both `True`; last item `StartJoinPrefix = True`. Optionally set the join colors.

### NEG-048 — Card shows the default "Card Content"

**Wrong**: Add children to an `SDUI5Card` and leave `Content` unset.
**Reality**: `RawContent` defaults to `"Card Content"`, so the card renders that placeholder, often overlapping a mounted avatar.
**Correct**: Set `.Content = ""` (or real copy) before `AddComponent`.

### NEG-049 — Tabs render a "<Tab> Content" placeholder panel

**Wrong**: Use `SDUI5Tabs` options and assume the active panel is empty until you fill it.
**Reality**: Each tab item renders `<div class="tab-content">${Text} Content</div>`, for example "Overview Content".
**Correct**: Set `.ClearContents = True` and mount real content via `ContentAt(key)`, or hide the panel.

### NEG-050 — SpeedDial icons pass names, not asset paths

**Wrong**: `ChildIcons = "compose=edit; share=share-2"`, or `MainButtonType = "main"` with no `MainButtonIcon`.
**Reality**: Icon values are fetched as asset URLs, so bare names resolve to nothing; a main action without icon/text is an empty circle. `setChildIcons` also sets width twice and never height.
**Correct**: Use `./assets/<file>.svg` for `Icon`, `MainButtonIcon` and `ChildIcons`, set a main icon or `MainButtonType = "none"`, set `CenterChildren = True`, and verify the rendered FAB.

### NEG-052 — AddColumn before AddComponent drops headers

**Symptom**: the table renders rows but no column headings (and, with `HasFilter`, no filter row). The `<thead>` is empty; `Columns` still contains the columns.
**Cause**: `AddColumn*` calls `UI.AppendByID("#<name>_theadtr", "<th>...")` immediately. Before `AddComponent`, that element does not exist; `UIShared.AppendByID` catches and discards the error. `Columns` registration still succeeds, so rows render against a headerless table.
**Correct**: initialize, set table properties, `BANano.Await(table.AddComponent)`, then call `AddColumn*` (RULE-TABLE-001). Verify `<thead>` has one `<th>` per column.

### NEG-053 — Modal auto actions do not close, and gray is not a colour

**Wrong**: Expecting `ActionType` buttons to close the dialog; leaving `CancelColor` at its `gray`
default; using `BackgroundColor` tokens with the default white text.
**Reality**: Auto action buttons only emit `<modal>_ok_click` / `<modal>_cancel_click`; nothing calls
`Close`. `gray` becomes `bg-gray`, which is not a daisyUI token (no background). White text on
`bg-success` measured 1.96:1. `.Html` defaults to empty, so only the title and actions render.
**Correct**: Implement the action handlers and call `Close`; use `neutral` (or another semantic token);
use `success-content` / `neutral-content` text tokens; set `.Html` for body copy. See RULE-MODAL-001.

### NEG-054 — Modal box overflows a phone viewport

**Wrong**: Leaving `SDUI5Modal.Width` at its `700px` default with no viewport cap.
**Reality**: `setWidth` applies both width and max-width to `.modal-box`, so the box stays 700px at
every viewport and is clipped on a 390px screen (`right=700`, `vw=390`).
**Correct**: Keep the width and cap the box from the modal root:
`.Classes = "[&_.modal-box]:max-w-[calc(100vw_-_2rem)] [&_.modal-box]:max-h-[calc(100vh_-_2rem)]"`.
Verify `box.right <= innerWidth` at 390px; the box renders 358px on phone, 686-700px on desktop.

### NEG-055 — Alert defaults to a 384px width

**Wrong**: Adding `SDUI5Alert` to a phone layout without setting `Width`.
**Reality**: `Width` defaults to `96` (`w-96` = 24rem = 384px), so the alert overflows a 390px viewport and creates horizontal scroll.
**Correct**: Set `.Width = "full"` (or a narrower value) and verify `alert.right <= innerWidth` at 390px.

### NEG-056 — List rows need column classes on their children

**Wrong**: Expecting `SDUI5ListItem` to provide `.Title`, `.SubTitle`, `.Color` or `.Active`, or to grow/wrap a column automatically.
**Reality**: `SDUI5ListItem` is a plain `<li class="list-row">` shell with `.Text`; growth and wrapping come from `list-col-grow` / `list-col-wrap` on a row child, and rich rows need child components.
**Correct**: Header row `ListRow = False`; mount avatar + text container + actions as children; add `list-col-grow` to the column that should fill and `list-col-wrap` to the paragraph that wraps.

### NEG-057 — Stack defaults collapse or emit an invalid direction

**Wrong**: Leaving `SDUI5Stack.Width`, `Height` and `Alignment` at defaults and expecting a sized stack.
**Reality**: `Alignment` defaults to `bottom`, which emits the non-daisyUI `stack-bottom`; with no explicit size the stack has no intrinsic size and collapses around text children. There is no combined `size` property.
**Correct**: Set `Alignment = ""` for the base rule (`top`/`start`/`end` for variants), give it a definite size (`Width`/`Height` or `.Classes = "size-*"`), and use `SDUI5Image` children (`Src`, `Mask = "rounded"`, `Width/Height = "full"`) for image stacks.

### NEG-058 — Stack direction classes are not applied by the shipped CSS

**Wrong**: Trusting `stack-top` / `stack-start` / `stack-end` to reposition children with the current `daisyui.min.css`.
**Reality**: The compiled base rule `:is(.stack, .stack.stack-bottom) > *` wins at equal specificity, so every direction computes the same `grid-area`; verified on the daisyUI reference render. The vendored source `stack.css` is correct, so this is an upstream compiled-CSS regression.
**Correct**: Compare computed `grid-area` per direction. Until the shipped CSS is regenerated, treat stack direction as a declared GAP and do not rely on the offset.

### NEG-059 — Card cannot hide its title, and `Border` is not the docs' border

**Wrong**: Expecting `.TitleVisible = False` to remove the default "Card Title", or `.Border = True` to reproduce the docs' `border border-base-content`.
**Reality**: `setTitleVisible` only stores the flag; the title stays in the DOM and remains visible. `Border = True` emits `card-border`, which the docs card examples do not use. `Width` defaults to `96` (384px), so a card used as a stack child must clear it.
**Correct**: Set `.Title = ""` and `.TitleClasses = "hidden"`; set `.Border = False` and put the docs' `border border-base-content` in `.Classes`. Set `.Width = ""` and `.Height = ""` on cards inside a stack.

### NEG-051 — DatePickerTimeLine appears not to scroll

**Wrong**: Wrap `SDUI5DatePickerTimeLine` in `overflow-x-auto` and expect the wrapper to scroll, or expect a visible scrollbar.
**Reality**: The component renders a daisyUI `carousel` that scrolls itself (`overflow-x: scroll`, snap points) with the scrollbar hidden; it is `width: full`, so the wrapper has nothing to scroll.
**Correct**: Treat the element as the scroller and give it discoverable navigation. Add prev/next buttons that call `BANano.GetElement("#datetimeline").RunMethod("scrollBy", Array(CreateMap("left": 336, "behavior": "smooth")))`, size the pane, or reduce `DaysCount`. Verify `scrollWidth > clientWidth` on the element, not the wrapper.

### NEG-060 — Collapse and Accordion defaults emit `collapse-arrow`, `border`, and placeholder items

**Wrong**: Initialize `SDUI5Collapse` or `SDUI5Accordion` assuming a plain collapse or empty accordion container.
**Reality**: `SDUI5Collapse` defaults to `RightIcon = "arrow"` (`collapse-arrow`), `Border = True` (`border`), `BorderColor = "base-300"`, and `BackgroundColor = "base-100"`, and uses `.Active = True` (not `.Checked`) to check its internal `<input type="radio">`. `SDUI5Accordion` defaults to `RawOptions = "item1=Item 1; item2=Item 2; item3=Item 3"`.
**Correct**: Set `acc.Options = ""` before mounting manual `SDUI5Collapse` children; set `.RightIcon = ""` when no arrow/plus indicator is wanted; set `.Border = False`, `.BorderColor = ""`, `.BackgroundColor = ""` for a borderless/transparent collapse; and use `.Active = True` for the open item.

### NEG-061 — BreadCrumbs defaults render "b4a / b4j / b4i / b4r"

**Wrong**: Mount `SDUI5Link` or `SDUI5Text` children into `bc.ID & "_content"` without clearing `SDUI5BreadCrumbs.Options`.
**Reality**: `SDUI5BreadCrumbs.RawOptions` defaults to `"b4a=b4a; b4j=b4j; b4i=b4i; b4r=b4r"`, so those four placeholder crumbs render ahead of any mounted child items, and `TextSize` defaults to `"none"`.
**Correct**: Set `.Options = "home=Home; docs=Documents"` (or `.Options = ""` when mounting child `SDUI5Text` with `.TextTag = "li"`, `.ApplyDefaults = False`, `.Icon = "./assets/..."` into `<id>_content`), and set `.TextSize = "sm"`.

### NEG-062 — DropDown defaults to `dropdown-bottom` and lacks a `Close` property

**Wrong**: Leave `SDUI5DropDown.Placement` at default when expecting a base `dropdown`, or look for `.Close = True` for `dropdown-close`.
**Reality**: `Placement` defaults to `"bottom"`, emitting `dropdown-bottom`. Setting `.Placement = ""` still passes `""` to `UI.AddPlacementDT("dropdown", "")`, which emits a benign trailing `dropdown-` token while avoiding `dropdown-bottom`. There is no `.Close` property for `dropdown-close`.
**Correct**: Set `.Placement = ""` for base dropdowns, use `.Classes = "dropdown-close"` when force-closing, mount triggers as `SDUI5Button` with `.Activator = True`, and clear child `SDUI5Menu` defaults (`.DropdownContent = True`, `.Direction = ""`, `.MinHeight = ""`, `.Width = "52"`, `.BackgroundColor = "base-100"`).

### NEG-063 — Menu and MenuItem defaults and dead `setTooltip` setters

**Wrong**: Mount an inline `SDUI5Menu` without clearing `Direction`/`MinHeight`/`Width`, call `menu.AddItem(...)`, or set `SDUI5MenuItem.Tooltip = "..."` expecting a daisyUI tooltip.
**Reality**: `SDUI5Menu` defaults to `Direction = "vertical"` (`menu-vertical`), `MinHeight = "full"` (`min-h-full`), `Width = "56"` (`w-56`), and `BackgroundColor = "base-200"`. Its responsive properties are `LgDirection` / `XlDirection` (not `DirectionOnLg`), and its item helper is `AddItemChild(parentID, itemKey, icon, text)` (not `AddItem`). In `SDUI5MenuItem.bas` (lines 638-639, 957-980), `setTooltip` and `setTooltipPosition` are commented out, so `.Tooltip` does nothing!
**Correct**: Set `.Direction = ""`, `.MinHeight = ""`, `.Width = ""` when overriding menu defaults; use `AddItemChild("", key, icon, text)` or `SDUI5MenuItem` children; and pass `.ItemClasses = "tooltip tooltip-right"` when a menu item needs a tooltip class.

### NEG-064 — `SDUI5MegaMenu` is a 1-div framework stub

**Wrong**: Instantiate `SDUI5MegaMenu` and attempt to mount child menus, popovers, or multi-column links inside it.
**Reality**: In `SDUI5MegaMenu.bas` (lines 146-162), `DesignerCreateView` appends `<div id="${mName}" class="megamenu ...">${sText}</div>` and immediately calls `setText(sText)` (`UI.SetText(mElement, s)`), which overwrites `textContent`. It has no popover wiring or child slots.
**Correct**: Build real responsive mega menus with `SDUI5Menu` (`.XlDirection = "horizontal"`, `ItemType = "collapse-item"`), and treat `SDUI5MegaMenu` as a class-token stub (`PARTIAL`/`GAP`).

### NEG-065 — NavBar defaults to `sticky top-0 z-30` and `.TextColor` only styles `#_title`

**Wrong**: Render an `SDUI5NavBar` inside a section or card without clearing `Sticky`, or set `navbar.TextColor = "primary-content"` expecting the whole navbar to inherit the text colour.
**Reality**: `SDUI5NavBar` defaults to `Sticky = True` (`sticky`), `Top = "0"` (`top-0`), `ZIndex = "30"` (`z-30`), `HasBurger = True`, and `Title = "NavBar"`. In `SDUI5NavBar.bas` (lines 338, 432, 1271), `UI.ExcludeTextColor = True` is set and `UI.AddTextColorDT` is commented out, so `setTextColor` only applies `text-*` to `#<id>_title` and leaves the `<div class="navbar">` root unstyled!
**Correct**: For inline navbars, set `.Sticky = False`, `.Top = ""`, `.ZIndex = ""`, `.HasBurger = False`. When setting a navbar foreground colour (such as `neutral-content` or `primary-content`), set both `.TextColor = "primary-content"` and `.Classes = "text-primary-content"`.

### NEG-066 — Tabs defaults to `tabs-lift tabs-top` and `SDUI5Tabs.Active` omits `tab-active`

**Wrong**: Mount `SDUI5TabsItem` children without clearing `SDUI5Tabs.Options`, or rely on `SDUI5Tabs.Active = "key"` to emit the `tab-active` class.
**Reality**: `SDUI5Tabs` defaults to `Style = "lift"` (`tabs-lift`), `Placement = "top"` (`tabs-top`), and `RawOptions = "btn1=Button 1; btn2=Button 2; btn3=Button 3"`. Moreover, `SDUI5Tabs.setActive` only checks the radio `<input>` without adding `tab-active` to the `<label>`, whereas `SDUI5TabsItem.Active = True` both checks the input and adds `tab-active` to `#<item>_<parent>_label`.
**Correct**: Set `.Options = ""`, `.Active = ""` on `SDUI5Tabs` when mounting `SDUI5TabsItem` children; clear `.Style = ""` and `.Placement = ""` for base `tabs`; and set `.Active = True` on the active `SDUI5TabsItem`.

### NEG-067 — Dock is `position: fixed` by default, and `SDUI5Drawer` forces `min-h-screen`

**Wrong**: Render `SDUI5Dock` inside a container without overriding `PositionStyle`, or embed `SDUI5Drawer` in a card without overriding `MinHeight`.
**Reality**: daisyUI `.dock` is `position: fixed; bottom: 0`, so an unmodified `SDUI5Dock` pins to the viewport bottom (`relative` in `.Classes` is banned by `RULE-PROP-001`). `SDUI5Drawer` defaults to `MinHeight = "screen"` (`min-h-screen` on `#_side`), stretching any host card to `100vh`, and uses `.RightSide = True` / `.LgOpen = True` (not `Placement` / `OpenOnLg`).
**Correct**: Set `.PositionStyle = "relative"` on inline `SDUI5Dock` instances (and `.NoText = True` on icon-only dock buttons); set `.MinHeight = "full"` and a bounded `.Height` on embedded `SDUI5Drawer` instances.

### NEG-068 — Steps prepends 4 default steps unless `Steps` and `ActiveStep` are cleared

**Wrong**: Mount custom `SDUI5StepsItem` children into `SDUI5Steps` without clearing `.Steps` and `.ActiveStep`, or put Unicode symbols (`✓`, `★`, `😕`) in `.Icon` / `.DataContent`.
**Reality**: `SDUI5Steps` defaults to `RawSteps = "Register;Choose Plan;Purchase;Receive Product"`, `ActiveStep = "1"`, and `Direction = "horizontal"` (`steps-horizontal`). Leaving `Steps` at default prepends those 4 items ahead of your `SDUI5StepsItem` children. Its responsive property is `LGDirection` (not `DirectionOnLg`). Non-ASCII characters in `.bas` string literals fail `RULE-ENCODING-003` (`pre-scan.ps1`).
**Correct**: Set `.Steps = ""`, `.ActiveStep = ""`, and `.Direction = ""` (or `"vertical"`) on `SDUI5Steps` before mounting `SDUI5StepsItem` children, and use pure ASCII tokens in `.Icon` and `.DataContent`.

### NEG-069 — `SDUI5Button.Shape = "circle"` or `"square"` hides button `.Text`

**Wrong**: Set `btn.Shape = "circle"` (or `"square"`) with `btn.Text = "?"` and no icon, expecting a circular text badge/helper button.
**Reality**: In `SDUI5Button.bas` (lines 655-660), `Case "square"` and `Case "circle"` force `bTextVisible = False`, which hides `<span id="<id>_text">`. If `btn.Ghost = True` and no icon is set, the button renders completely blank!
**Correct**: Supply `.LeftIcon = "./assets/<icon>.svg"` on `Shape = "circle"` / `"square"` buttons, or call `UI.SetVisibleByID(btn.ID & "_text", True)` after `AddComponent` when a circular button must display text.

### NEG-070 — Large B4J `Show` subs exceed the 64KB Java bytecode method limit

**Wrong**: Put hundreds of component initializations inside a single `Sub Show` in a large page module (`pg*.bas`).
**Reality**: B4J transpiles each resumable `Sub` into a single Java state-machine method (`_show()`). Beyond ~1,500 lines of B4J component code, `javac` fails at compile time with `error: code too large` (the 64KB JVM method limit).
**Correct**: Split large page builds into private helper subs (`Private Sub ShowBatch1`, `ShowBatch2`, ...) and invoke them sequentially from `Sub Show` via `BANano.Await(ShowBatch1)`.

### NEG-071 — `SDUI5AvatarGroup.setImages` writes `"RawOptions"` while `DesignerCreateView` reads `"RawImages"`

**Wrong**: Set `ag.Images = "a=./assets/600by600.jpg; b=./assets/mashy.jpg"` before `ag.AddComponent` on `SDUI5AvatarGroup`, or rely on `SDUI5Avatar.Ring = True` to emit `ring-2`.
**Reality**: In `SDUI5AvatarGroup.bas` (lines 216, 263), `setImages` writes `CustProps.put("RawOptions", s)`, whereas `DesignerCreateView` reads `Props.GetDefault("RawImages", "one=./assets/1.jpg; ...; five=./assets/5.jpg")`. Setting `.Images` before `AddComponent` is overwritten by the default `./assets/1.jpg`..`5.jpg` paths (causing 5 HTTP 404s!). Also, `SDUI5Avatar.setRing` (`SDUI5Avatar.bas:670`) emits `ring` rather than `ring-2`, and `Ring = False` on `AvatarType = "placeholder"` adds `border-1 border-black`.
**Correct**: Call `ag.CustProps.Put("RawImages", "a=./assets/600by600.jpg; ...")` before `ag.AddComponent` (or set `ag.Images = "..."` after `ag.AddComponent`), and add `ring-2` via `av.UI.AddClassByID(av.ID & "_host", "ring-2")` when a 2px ring is required.

### NEG-072 — `SDUI5ChatBubble` defaults show avatar, header, and footer, and `setPlacement` omits `"chat-"`

**Wrong**: Initialize `SDUI5ChatBubble` expecting a bare `.chat-bubble`, or change `cb.Placement = "end"` after `cb.AddComponent`.
**Reality**: `ImageVisible`, `HeaderVisible`, and `FooterVisible` all default to `True` (`SDUI5ChatBubble.bas:91-93`). Furthermore, `DesignerCreateView` (`SDUI5ChatBubble.bas:283`) prefixes `"chat-" & sPlacement`, whereas `setPlacement` (`SDUI5ChatBubble.bas:409`) calls `UI.UpdateClass(mElement, "placement", s)` without `"chat-"`, emitting invalid `start`/`end` classes if called post-mount!
**Correct**: Explicitly set `.ImageVisible = False`, `.HeaderVisible = False`, `.FooterVisible = False` when those parts are not wanted, and always set `.Placement` before `AddComponent`.

### NEG-073 — `SDUI5CountDown` auto-starts a 1-second decrementing timer on mount

**Wrong**: Mount `SDUI5CountDown` with `.Value = "59"` and expect `--value` to remain static.
**Reality**: `DesignerCreateView` (`SDUI5CountDown.bas:269`) unconditionally calls `StartCountDown`, enabling a 1000ms `Timer` that decrements `--value` down to `0`. Also, `Font` defaults to `"mono"` (`font-mono`).
**Correct**: Call `cd.EndCountDown` immediately after `BANano.Await(cd.AddComponent)` whenever a static or externally driven countdown display is desired, and set `.Font = ""` when `font-mono` is not wanted.

### NEG-074 — `SDUI5Diff` defaults `Image1` and `Image2` to missing `./assets/13.jpg`

**Wrong**: Instantiate `SDUI5Diff` with `DiffType = "image"` without overriding `Image1` and `Image2`.
**Reality**: Both `Image1` and `Image2` default to `./assets/13.jpg` (`SDUI5Diff.bas:12-13, 88-89`), which is not present in the standard template `assets/` folder and causes an HTTP 404.
**Correct**: Always set `Image1` and `Image2` to verified assets in `Files/` (e.g. `./assets/600by600.jpg`, `./assets/mashy.jpg`).

### NEG-075 — `SDUI5Hover3D` is image-only and `SDUI5HoverGallery` defaults emit `h-300px w-600px`

**Wrong**: Attempt to wrap an `SDUI5Card` inside `SDUI5Hover3D`, or leave `SDUI5HoverGallery.Width` and `Height` at their `"600px"` / `"300px"` defaults.
**Reality**: `SDUI5Hover3D` (`SDUI5Hover3D.bas:274-286`) hardcodes `<div class="hover-3d"><figure><img/></figure>8x<div></div></div>`, and `setHeight` (`SDUI5Hover3D.bas:327-328`) calls `SetMaxHeightByID` twice instead of `SetHeightByID`. `SDUI5HoverGallery` (`SDUI5HoverGallery.bas:232-235, 249-250`) defaults to `Height = "300px"` and `Width = "600px"` and passes them to `UI.AddSizeDT`, emitting invalid classes `h-300px` and `w-600px`.
**Correct**: Use `SDUI5Hover3D` for 3D tilt image figures; on `SDUI5HoverGallery`, clear `.Width = ""` and `.Height = ""` (or set Tailwind scale tokens like `"60"`).

### NEG-076 — `SDUI5Stat` defaults to `stats-vertical md:stats-horizontal` and `SDUI5StatItem.FigureColor` skips `#_figure`

**Wrong**: Leave `SDUI5Stat.Direction` and `MDDirection` at defaults expecting a horizontal `.stats` strip, or rely on `SDUI5StatItem.FigureColor = "primary"` to put `text-primary` on `.stat-figure`.
**Reality**: `SDUI5Stat` defaults to `Direction = "vertical"` and `MDDirection = "horizontal"` (`SDUI5Stat.bas:83-85`). On `SDUI5StatItem` (`SDUI5StatItem.bas:470-481`), `setFigureColor` only colors `#<id>_icon` (inline style) or `#<id>_radial`, leaving `<div id="<id>_figure" class="stat-figure">` without `text-<color>`.
**Correct**: Set `st.Direction = ""` and `st.MDDirection = "none"` for horizontal `.stats`; when `.stat-figure` itself requires `text-primary`/`text-secondary`, add `si.UI.AddClassByID(si.ID & "_figure", "text-primary")` after `AddComponent`.

### NEG-077 — `SDUI5Table` enables toolbar/choosers/pagination by default and lacks `PinCols`

**Wrong**: Mount `SDUI5Table` expecting a bare `<table class="table">`, or rely on `SetRowBackgroundColor(0, "base-200")` to add `bg-base-200` to `<tr>`.
**Reality**: `SDUI5Table` defaults `TitleVisible`, `HasAlphaChooser`, `HasColumnChooser`, `HasAddnew`, `HasRefresh`, `HasBack`, `HasEdit`, `HasDelete`, and `Pagination` to `True`, and hardcodes `table-pin-rows` on `#<id>_table` (`SDUI5Table.bas:786`) with no `PinCols` DesignerProperty. `SetRowBackgroundColor` (`SDUI5Table.bas:10723`) adds `[&>*]:bg-base-200` rather than `bg-base-200`.
**Correct**: Disable unused chrome flags (`TitleVisible = False`, `HasAlphaChooser = False`, `HasColumnChooser = False`, `HasAddnew = False`, `HasRefresh = False`, `HasBack = False`, `HasEdit = False`, `HasDelete = False`, `Pagination = False`) for simple tables, and use `tb.UI.AddClassByID(tb.ID & "_table", "table-pin-cols")` when column pinning is needed.

### NEG-078 — `SDUI5Timeline.DesignerCreateView` has a `timeline-snap-con` typo

**Wrong**: Set `tl.SnapIcon = True` BEFORE `tl.AddComponent` on `SDUI5Timeline` expecting `timeline-snap-icon`.
**Reality**: In `SDUI5Timeline.bas` line 261, `DesignerCreateView` has a typo: `If bSnapIcon = True Then UI.AddClassDT("timeline-snap-con")` (missing `i`!). However, `setSnapIcon(True)` at line 332 calls `UI.AddClass(mElement, "timeline-snap-icon")`. Also, `SDUI5Timeline` defaults to `Direction = "vertical"` (`timeline-vertical`).
**Correct**: Set `tl.Direction = ""` for horizontal timelines, and assign `tl.SnapIcon = True` AFTER `BANano.Await(tl.AddComponent)` so `setSnapIcon(True)` applies the valid `timeline-snap-icon` class.

### NEG-079 — `SDUI5FieldSet.setLegend` destroys the entire `<fieldset>` DOM when called after `AddComponent`

**Wrong**: Call `fs.Legend = "Page title"` AFTER `BANano.Await(fs.AddComponent)` on `SDUI5FieldSet`.
**Reality**: In `SDUI5FieldSet.bas` line 373, `Sub setLegend(s As String)` calls `UI.SetTextByID($"${mName}"$, s)` instead of `UI.SetTextByID($"${mName}_legend"$, s)`. Calling `.Legend` after `AddComponent` overwrites `textContent` on the root `<fieldset id="${mName}">`, wiping `#<id>_legend`, `#<id>_content`, and `#<id>_label`! Also, `SDUI5FieldSet` (`SDUI5FieldSet.bas:312`) and `InputType = "legend"` across `SDUI5TextBox`/`SDUI5Select`/`SDUI5TextArea`/`SDUI5FileInput` emit `class="fieldset-label"` (daisyUI v5 beta name) on `#<id>_label` / `#<id>_hint` rather than `class="label"`.
**Correct**: Always set `fs.Legend = "..."` BEFORE `BANano.Await(fs.AddComponent)`.

### NEG-080 — `SDUI5Select`, `SDUI5TextArea`, and `SDUI5FileInput` omit `setHint` (and `SDUI5FileInput` omits `setEnabled`) in `DesignerCreateView`

**Wrong**: Set `sel.Hint = "Optional"` on `SDUI5Select` or `SDUI5TextArea`, or `fi.Hint = "Max 2MB"` / `fi.Enabled = False` on `SDUI5FileInput`, before `AddComponent` and expect `#<id>_hint` to be visible or `<input type="file">` to be disabled.
**Reality**: `SDUI5Select.DesignerCreateView` (`SDUI5Select.bas:455, 508-533`), `SDUI5TextArea.DesignerCreateView` (`SDUI5TextArea.bas:448, 507-537`), and `SDUI5FileInput.DesignerCreateView` (`SDUI5FileInput.bas:389, 434-471`) render `<p id="${mName}_hint" class="fieldset-label hidden">${sHint}</p>` when `InputType = "legend"` without calling `setHint(sHint)` (and `SDUI5FileInput` never calls `setEnabled(bEnabled)`).
**Correct**: Assign `.Hint = "..."` on `SDUI5Select`, `SDUI5TextArea`, and `SDUI5FileInput` — and `.Enabled = False` on `SDUI5FileInput` — AFTER `BANano.Await(comp.AddComponent)`.

### NEG-081 — `Validator` and `ValidatorHint` are omitted from `DesignerCreateView` on form controls, `setValidatorHint` sets an attribute, and `SDUI5Toggle`/`SDUI5TextArea` set `validator="true"` attribute

**Wrong**: Set `.Validator = True` and `.ValidatorHint = "Required"` before `AddComponent` on `SDUI5TextBox`, `SDUI5Select`, `SDUI5TextArea`, `SDUI5CheckBox`, `SDUI5Toggle`, or `SDUI5FileInput` expecting `.validator` and a `<p class="validator-hint">` sibling.
**Reality**:
1. Only `SDUI5Label` calls `setValidator` and `setValidatorHint` in `DesignerCreateView` (`SDUI5Label.bas:379-380`) and emits `<div id="<id>_validatorhint" class="validator-hint">`.
2. `SDUI5TextBox`, `SDUI5Select`, `SDUI5TextArea`, `SDUI5CheckBox`, `SDUI5Toggle`, and `SDUI5FileInput` never call `setValidator` in `DesignerCreateView`, and their `setValidatorHint` calls `UI.SetAttr(mElement, "validator-hint", s)` on the `<input>` tag rather than rendering a `.validator-hint` element.
3. `SDUI5Toggle.setValidator` (`SDUI5Toggle.bas:667`) and `SDUI5TextArea.setValidator` (`SDUI5TextArea.bas:1048`) call `UI.SetAttr(mElement, "validator", b)` instead of `UI.AddClass(mElement, "validator")`.
**Correct**: Call `.Validator = True` AFTER `AddComponent` on `SDUI5TextBox`, `SDUI5Select`, `SDUI5CheckBox`, and `SDUI5FileInput`; use `.Classes = "validator"` on `SDUI5Toggle` and `SDUI5TextArea`; and render a sibling `SDUI5Text` with `Classes = "validator-hint"` (or use `SDUI5Label`).

### NEG-082 — `SDUI5CheckBox`, `SDUI5Radio`, and `SDUI5Toggle` setter/template bugs (`setUncheckedColor`, `setLabel`, `RadioType = "legend"`, `CheckedIcon`)

**Wrong**: Rely on `chk.UncheckedColor` on `SDUI5CheckBox`, call `rad.Label = "..."` post-mount or use `RadioType = "legend"` box styling on `SDUI5Radio`, or use `tog.CheckedIcon` / `tog.UncheckedIcon` on `SDUI5Toggle`.
**Reality**:
1. `SDUI5CheckBox.setUncheckedColor` (`SDUI5CheckBox.bas:697-702`) has its body commented out.
2. `SDUI5Radio.setLabel` (`SDUI5Radio.bas:507`) updates `#<id>_legend` instead of `#<id>_label`, and `RadioType = "legend"` (`SDUI5Radio.bas:324-338`) never calls `setBackgroundColor`, `setBorder`, `setBorderColor`, or `setRoundedBox` in `DesignerCreateView`.
3. `SDUI5Toggle` (`SDUI5Toggle.bas:412-415`) has `setCheckedIcon`, `setUncheckedIcon`, and `setUncheckedColor` commented out in `DesignerCreateView` with no `#<id>_checkedicon` DOM nodes.
**Correct**: Pass custom unchecked border/bg tokens via `.Classes` on `SDUI5CheckBox`/`SDUI5Radio`/`SDUI5Toggle`, and set `SDUI5Radio.Label` before `AddComponent`.

### NEG-083 — `SDUI5Range` dead setters (`setMeasure`, `setThumbColor`) and legacy `--range-shdw` variable

**Wrong**: Set `rng.Measure = True`, `rng.ThumbColor = "blue"`, or `rng.RangeBackgroundColor = "orange"` on `SDUI5Range` expecting daisyUI v5 step ticks or `[--range-bg:orange] [--range-thumb:blue]`.
**Reality**: `SDUI5Range.setMeasure` (`SDUI5Range.bas:639-648`) and `SDUI5Range.setThumbColor` (`SDUI5Range.bas:684-689`) have their bodies commented out, `SDUI5Range` has no `Fill` or `Vertical` property, and `setRangeBackgroundColor` (`SDUI5Range.bas:585`) sets the legacy daisyUI v4 inline style `--range-shdw` instead of daisyUI v5's `--range-bg`.
**Correct**: Pass daisyUI v5 custom range CSS variables and vertical orientation via `.Classes` (e.g. `rng.Classes = "[--range-bg:orange] [--range-thumb:blue] [--range-fill:0]"` or `rng.Classes = "range-vertical"`).

### NEG-084 — `SDUI5Rating` adds `hidden` to `rating-hidden` and defaults to `Size = "md"`, `Gap = "2"`, `Color = "primary"`

**Wrong**: Mount `SDUI5Rating` with `FirstHidden = True` expecting the `.rating-hidden` clear radio to be clickable, or change `Mask`/`Color`/`ReadOnly`/`FirstHidden` after `AddComponent` without calling `Refresh`.
**Reality**: `SDUI5Rating.Refresh` (`SDUI5Rating.bas:508`) emits `<input id="<id>_0" type="radio" class="rating-hidden hidden">`, where Tailwind's `hidden` (`display: none`) hides the zero-width `.rating-hidden` radio from user clicks. In addition, `Size` defaults to `"md"` (`rating-md`), `Gap` defaults to `"2"` (`gap-2`), `Color` defaults to `"primary"` (`bg-primary`), and `setMask`/`setColor`/`setReadOnly`/`setFirstHidden` only update fields until `BANano.Await(rt.Refresh)` is called.
**Correct**: Set `FirstHidden`, `ReadOnly`, `Half`, `Mask`, `Color`, `Size`, and `Gap` before `AddComponent`, and call `rt.UI.RemoveClassByID(rt.ID & "_0", "hidden")` after `AddComponent` when `FirstHidden = True` should remain interactive.

### NEG-085 — `SDUI5Filter` defaults to `Shape = "full"`, `Color = "primary"`, `ActiveColor = "#00ff00"` and has no `setActiveTextColor` setter

**Wrong**: Mount `SDUI5Filter` with default properties expecting unstyled daisyUI filter buttons, or assign `flt.ActiveTextColor = ""` in B4J code.
**Reality**: `SDUI5Filter` (`SDUI5Filter.bas:269-280, 511-553`) defaults `Shape = "full"` (`rounded-full`), `Color = "primary"` (`btn-primary`), `ActiveColor = "#00ff00"` (`checked:bg-[#00ff00]`), `ActiveTextColor = "#ffffff"`, and `RawOptions = "b4a=b4a; b4j=b4j; b4i=b4i; b4r=b4r"`. Furthermore, `ActiveTextColor` is declared as a `#DesignerProperty` (`SDUI5Filter.bas:81`) and read from `Props.GetDefault("ActiveTextColor", "#ffffff")` (`SDUI5Filter.bas:279`), but `SDUI5Filter.bas` has no `setActiveTextColor` or `getActiveTextColor` sub!
**Correct**: For standard daisyUI filter buttons, set `flt.Shape = "none"`, `flt.Color = ""`, `flt.ActiveColor = ""`, and `flt.CustProps.Put("ActiveTextColor", "")` before `AddComponent`.

### NEG-086 — `SDUI5Label` `InputType = "date"` leaves `mElement = Null`, and `FloatingLabel = True` keeps `input` on the outer `<label>`

**Wrong**: Set `lbl.InputType = "date"` on `SDUI5Label` (listed in `#DesignerProperty` options `date|file|input|none|select` at `SDUI5Label.bas:70`).
**Reality**: `SDUI5Label.DesignerCreateView` (`SDUI5Label.bas:312-368`) only handles `Case "select"`, `Case "input", "email", "password", "tel", "url", "number"`, and `Case "file"`. Passing `InputType = "date"` skips `mTarget.Append(...)`, leaving `mElement = Null` and throwing a null error! Also, when `FloatingLabel = True`, `SDUI5Label` puts `class="floating-label input w-full"` on the outer `<label>` and leaves the inner `<input id="<id>_input">` without the base `input` class.
**Correct**: Use `lbl.InputType = "input"` and call `lbl.UI.SetAttrByID(lbl.ID & "_input", "type", "date")` after `AddComponent`.

### NEG-087 — External library asset bundlers missing in `pgIndex.bas` (`SDUI5Code`, `SDUI5EvoCalendar`, `SDUI5FullCalendar`)

**Wrong**: Instantiate and mount `SDUI5Code`, `SDUI5EvoCalendar`, or `SDUI5FullCalendar` in a page without calling `BANano.Await(App.UsesCode)`, `BANano.Await(App.UsesEvoCalendar)`, or `BANano.Await(App.UsesFullCalendar)` during app initialization.
**Reality**: `SDUI5Code` and calendar components depend on third-party JS/CSS assets (Prism, EvoCalendar, FullCalendar). If `App.Uses*` is omitted in `pgIndex.bas:InitApp`, BANano throws runtime console errors (`Uses Error: 'BANano.Await(app.UsesCode)' should be added for '<id>'`), halting page execution and crashing subsequent component mounts.
**Correct**: In `pgIndex.bas:InitApp`, call `BANano.Await(App.UsesCode)`, `BANano.Await(App.UsesEvoCalendar)`, and `BANano.Await(App.UsesFullCalendar)` before navigating to or mounting pages that contain these components.

### NEG-088 — `SDUI5EvoCalendar` has no `Height` property setter

**Wrong**: Assign `cal.Height = "280px"` or `cal.Height = 280` in B4J code.
**Reality**: Although `Height` is declared in `#DesignerProperty`, `SDUI5EvoCalendar.bas` does not define `setHeight` or `getHeight`. Calling `.Height` produces a B4J compile-time error (`Unknown member: height`).
**Correct**: Use `cal.CustProps.Put("Height", "280px")` prior to `AddComponent`, or apply sizing utility classes via `.Classes`.

### NEG-089 — `SDUI5Indicator` position tokens reside on the child badge, not the root container

**Wrong**: Expecting `.indicator-start`, `.indicator-center`, `.indicator-end`, `.indicator-top`, `.indicator-middle`, `.indicator-bottom` on the outer `<div class="indicator">` container.
**Reality**: `SDUI5Indicator` emits an outer `<div class="indicator">` and an inner `<span id="${mName}_text" class="indicator-item ...">`. All positioning, alignment, and badge styling classes are applied to the inner `indicator-item` span, while the root wrapper remains bare `class="indicator"`.
**Correct**: Target the child `.indicator-item` or `${mName}_text` span when querying or verifying positioning classes.

### NEG-090 — `SDUI5Footer` renders a `<div>` with `footer` class rather than a `<footer>` tag

**Wrong**: Querying `document.querySelector("footer")` or asserting semantic `<footer>` tags in markup.
**Reality**: `SDUI5Footer` renders a `<div class="footer ...">`.
**Correct**: Query `.footer` class selector rather than the `footer` element tag, and pass `"ignore_tags": true` in parity contracts.

### NEG-091 — `SDUI5Image.Mask = "circle"` maps to `rounded-full` in `UIShared.FixMask`

**Wrong**: Expecting `SDUI5Image` or `UIShared.FixMask("circle")` to emit daisyUI's `mask-circle` class.
**Reality**: `UIShared.bas:FixMask` explicitly translates `"circle"` into Tailwind's `"rounded-full"` border-radius utility rather than `mask mask-circle` to avoid SVG/CSS clipping artifacts.
**Correct**: Document `"circle"` as mapping to `rounded-full`, and declare the difference in parity scope where `mask-circle` is tested.

### NEG-092 — BANano lowercases element IDs in runtime DOM output

**Wrong**: Using mixed-case or uppercase element IDs (e.g. `thc8A`) in client-side queries, custom styles, or automated probes.
**Reality**: BANano transpiles member names and element IDs to lowercase (e.g. `thc8A` -> `thc8a`). Any case-sensitive DOM selector or probe targeting camelCase IDs will fail to locate the element.
**Correct**: Always use lowercase element IDs when querying, styling, or probing BANano runtime DOM elements.

---

## 10. Quick Red Reference Table

| Mistake | Rule violated | Citation |
|---|---|---|
| Mixed-case element IDs (e.g. `thc8A`) used in DOM probes | NEG-092 | BANano transpiles member and element IDs to lowercase (e.g. `thc8a`) |
| `SDUI5Image.Mask = "circle"` expected to emit `mask-circle` | NEG-091 | `UIShared.FixMask` translates `"circle"` to `rounded-full` |
| `SDUI5Footer` expected to render semantic `<footer>` tag | NEG-090 | Renders `<div class="footer">`; query via class selector `.footer` |
| `SDUI5Indicator` position tokens expected on outer `.indicator` | NEG-089 | Position tokens reside on inner `span.indicator-item` (`#_text`), not wrapper div |
| `SDUI5EvoCalendar.Height` setter called | NEG-088 | No `setHeight` sub in `.bas`; compile fails `Unknown member: height`; use `CustProps.Put` |
| `SDUI5Code`/`EvoCalendar`/`FullCalendar` mounted without `App.Uses*` in `pgIndex` | NEG-087 | Throws runtime `Uses Error: 'BANano.Await(app.UsesCode)' should be added` |
| `SDUI5Label.InputType = "date"` | NEG-086 | Missing from `DesignerCreateView` `Select Case`; leaves `mElement = Null` |
| `SDUI5Filter` left with defaults or `flt.ActiveTextColor` called | NEG-085 | Defaults to `rounded-full btn-primary checked:bg-[#00ff00]`; no `setActiveTextColor` sub |
| `SDUI5Rating` `FirstHidden = True` left with `.hidden` on `#<id>_0` | NEG-084 | `Refresh` emits `class="rating-hidden hidden"`; remove `hidden` for clickable clear |
| `SDUI5Range.Measure` / `.ThumbColor` / `.RangeBackgroundColor` used for v5 vars | NEG-083 | `setMeasure`/`setThumbColor` commented out; `setRangeBackgroundColor` sets v4 `--range-shdw` |
| `SDUI5CheckBox.UncheckedColor`, `SDUI5Radio.Label` post-mount, or `SDUI5Toggle.CheckedIcon` | NEG-082 | Commented out or targets `#<id>_legend` instead of `#<id>_label` |
| `.Validator = True` set before `AddComponent`, or `.Validator` on `SDUI5Toggle`/`SDUI5TextArea` | NEG-081 | Omitted from `DesignerCreateView`; `Toggle`/`TextArea` set `validator="true"` attr |
| `SDUI5Select`/`SDUI5TextArea`/`SDUI5FileInput` `.Hint` (or `FileInput.Enabled`) set before `AddComponent` | NEG-080 | Omitted from `DesignerCreateView`; call `.Hint` / `.Enabled` after `AddComponent` |
| `SDUI5FieldSet.Legend` called after `AddComponent` | NEG-079 | `setLegend` calls `SetTextByID(mName, s)`, wiping the entire `<fieldset>` DOM |
| `SDUI5Timeline.SnapIcon = True` set before `AddComponent` | NEG-078 | `DesignerCreateView` emits typo `timeline-snap-con`; set `.SnapIcon = True` after `AddComponent` |
| `SDUI5Table` left with default toolbar/chooser flags on simple table | NEG-077 | Renders card toolbar, alpha chooser, column chooser, and action columns; no `PinCols` prop |
| `SDUI5Stat` left with default `Direction="vertical"`/`MDDirection="horizontal"` | NEG-076 | Emits `stats-vertical md:stats-horizontal`; `FigureColor` only colors `#_icon` |
| `SDUI5HoverGallery` left with default `Width="600px"` / `Height="300px"` | NEG-075 | Emits invalid `w-600px h-300px`; clear `Width=""` and `Height=""` |
| `SDUI5Diff` left with default `Image1`/`Image2` (`./assets/13.jpg`) | NEG-074 | `./assets/13.jpg` does not exist in template `assets/`; causes HTTP 404 |
| `SDUI5CountDown` mounted without `EndCountDown` for static display | NEG-073 | `DesignerCreateView` auto-starts a 1s timer decrementing `--value` to `0` |
| `SDUI5ChatBubble` left with default `ImageVisible`/`HeaderVisible`/`FooterVisible` | NEG-072 | All 3 default to `True`; `setPlacement` post-mount omits `"chat-"` prefix |
| `SDUI5AvatarGroup.Images` set before `AddComponent` | NEG-071 | `setImages` writes `"RawOptions"` while `DesignerCreateView` reads `"RawImages"` (`./assets/1.jpg`..`5.jpg` 404s) |
| Single `Sub Show` with >1,500 lines of component setup | NEG-070 | `javac` fails with `error: code too large` (64KB JVM limit); split into `BANano.Await(ShowBatch*)` |
| `SDUI5Button` with `Shape = "circle"`/`"square"` and `.Text` only | NEG-069 | `Shape` forces `bTextVisible = False`; button renders blank without `LeftIcon` |
| `SDUI5Steps` left with default `Steps` when mounting `SDUI5StepsItem` | NEG-068 | Prepends 4 default steps (`Register..Receive Product`); set `Steps=""` and `ActiveStep=""` |
| Inline `SDUI5Dock` without `PositionStyle="relative"` or `SDUI5Drawer` with `MinHeight="screen"` | NEG-067 | Dock pins to viewport bottom; Drawer forces 100vh height |
| `SDUI5Tabs` left with default `Options`/`Style`/`Placement` | NEG-066 | Prepends 3 default tabs and `tabs-lift tabs-top`; `SDUI5Tabs.Active` omits `tab-active` |
| Inline `SDUI5NavBar` left `Sticky=True`, or relying on `.TextColor` alone | NEG-065 | Sticks to top of viewport; `.TextColor` only styles `#_title`, not the `.navbar` root |
| Mounting children into `SDUI5MegaMenu` | NEG-064 | 1-div framework stub whose `setText` overwrites `textContent`; use `SDUI5Menu` |
| `SDUI5Menu` defaults left on inline menu, or `SDUI5MenuItem.Tooltip` used | NEG-063 | Emits `menu-vertical min-h-full w-56`; `setTooltip` is commented out in source |
| `SDUI5DropDown` left at default `Placement="bottom"` | NEG-062 | Emits `dropdown-bottom`; set `Placement=""` for base dropdown |
| `SDUI5BreadCrumbs` left with default `Options` | NEG-061 | Renders `b4a / b4j / b4i / b4r` placeholders |
| `SDUI5Collapse` left with default `RightIcon="arrow"` or `SDUI5Accordion` with default `Options` | NEG-060 | Emits `collapse-arrow` and 3 placeholder accordion items |
|---|---|---|
| Modal body empty; actions do not close; `gray` has no background | NEG-053 | Only title/actions render; Cancel looks broken |
| Modal `Width` left uncapped on a phone | NEG-054 | Box stays 700px and is clipped; cap it from the root |
| Alert `Width` left at its `96` default | NEG-055 | `w-96` (384px) overflows a 390px viewport |
| ListItem expected to supply title/subtitle or auto-grow a column | NEG-056 | No such properties; use children plus `list-col-grow`/`list-col-wrap` |
| Stack left at default alignment and size | NEG-057 | Emits invalid `stack-bottom`; collapses without a definite size |
| Stack direction classes trusted to offset children | NEG-058 | Shipped CSS keeps the default `grid-area`; upstream gap |
| Card title expected to disappear with `TitleVisible = False` | NEG-059 | Flag is stored only; hide via `Title=""` + `TitleClasses="hidden"` |
| Table rows without headings (`AddColumn` before `AddComponent`) | NEG-052 | Silent empty `<thead>`; no filter cells |
| DatePickerTimeLine wrapped in a scroll container | NEG-051 | Wrapper cannot scroll; hidden carousel scrollbar |
| SpeedDial icon given a name, not an asset path | NEG-050 | Broken child icons, empty main action |
| Timeline items without join flags | NEG-047 | Isolated icons, no connecting line |
| Card `Content` left unset | NEG-048 | Literal "Card Content" placeholder |
| Tabs left with default contents | NEG-049 | Literal "<Tab> Content" panel |
| FieldSet left at default `Width = "xs"` (320px) | NEG-044 | Form column shrinks to a narrow half-width block |
| Divider added without setting `Text` | NEG-045 | Literal "Divider" label leaks into the UI |
| Alert uses `Soft = True` | NEG-046 | Soft amber text on pale surface measured 1.32:1 contrast |
| `btn.setRequired(True)` | NEG-001 | Inventing setter names |
| `btn.Color = "#FF6B35"` | NEG-003 | Hex in `.Color` (setter contract) |
| `<button onclick="...">` | NEG-015 | Not keyboard-accessible |
| `<style>.x{}</style>` in pg*.bas | NEG-016 | Fragments theming — use .Classes/.Styles/app-level CSS |
| Skip hierarchy | NEG-009 | Layout collapse |
| No Empty state | NEG-010 | Blank screen on zero data |
| 6 tabs in navbar | NEG-011 | Hick's Law |
| Tiny icon button | NEG-012 | Fitts's Law + WCAG |
| Delete without confirm | NEG-014 | Hostile UX |
| Use `localStorage` directly | NEG-018 | Bypasses helpers |
| Hardcode theme-following component colors | NEG-025 | Breaks theme switching |
| Edit lib `.bas` | NEG-028 | Lost on next build |
| Missing `ModuleN=` | NEG-029 | Page silently omitted |
| Swallow exceptions | NEG-034 | User has no feedback |
| Mockup-mapped components 1:1 | NEG-036 | Component cargo-culting (DI-12) |
| App applies its own theme (`SetTheme` / `data-theme`) | NEG-038 | Overrides the user's theme; hides theme regressions |
| FieldSet stray default "Label" (`LabelVisible` left True) | NEG-039 | Stray `<p class="fieldset-label">Label</p>` |
| Toggle/Range labels hidden (ToggleType/RangeType = "normal") | NEG-040 | Labels silently dropped |
| Grid row children without `col-span-*` | NEG-041 | Buttons collapse/overlap in `grid-cols-12` |
| Unverified icon name on a button | NEG-042 | "Failed to load SVG" breaks the CTA |
| Heading size ignored because `ApplyDefaults` is left True | NEG-043 | `SDUI5Text` rewrites the size/weight from `TextTag` (h1→5xl, h2→4xl, h3→3xl, h4→2xl, h5→xl, h6→lg) after reading props, so `.TextSize`/`.Classes` lose. Set `ApplyDefaults = False` before AddComponent when you control the scale. |

---

## 11. When You Spot One of These Mid-Generation

1. **Stop and correct** the code you're about to emit
2. **Cite the `NEG-*` ID** in your reasoning trace
3. **If the user's request mandates the violation**, document the trade-off explicitly
4. **Update the skill** (this file) if the anti-pattern is novel — add a new `NEG-XXX`

---

## 12. References

- `rules-enforcer.md` — the L1–L5 rules that turn some of these NEGs into hard gates
- `daisyui-compatibility.md` — the web → SDUI5 translation table; use it instead of guessing
- `component-manifest.md` — every component + status, so you know what's safe to use
- `ux-master-doctrine.md` — quantitative laws underpinning the NEGs above
