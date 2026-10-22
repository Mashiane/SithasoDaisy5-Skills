---
name: SDUI5TextArea
description: SithasoDaisy5 SDUI5TextArea component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5TextArea

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5TextArea.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5TextArea.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgJSONQuery.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgJSONQuery.bas)
  - [`pgModal.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgModal.bas)
  - [`pgTextArea.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgTextArea.bas)
  - [`pgValidation.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgValidation.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5TextArea is a daisyUI textarea with label, hint, placeholder, auto-grow, validation (Required, MinLength/MaxLength), and sizing. **InputType controls label rendering: `normal` renders a bare textarea (no label), `legend`/`label-input` render the `Label` above the textarea, `buttons`/`buttons-floating` add prepend/append buttons.** Set `InputType = "legend"` (or `"label-input"`) for the label to display. Use GetValue/SetValue and Validate/IsValid for form handling.
_SDUI5TextArea is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
## Skeleton Contract
Every SithasoDaisy5 component follows the same shape (see SDUI5Component base):
1. `Initialize(Callback, Name, EventName)` — sets `mCallBack`, `mName`, `mEventName`, calls `SetDefaults`.
2. `ParentID` (property / `setParentID(id)`) — attach point in the DOM.
3. `DesignerCreateView(Target, Props)` — INTERNAL (called by `AddComponent`, never from app code); reads `CustProps`, pushes daisyUI classes via `UI.AddClassDT/AddColorDT/AddRoundedDT/AddShadowDT`, appends `[BANCLEAN]<tag id="{name}">`, wires `UI.OnEvent`.
4. Live setters mutate the DOM via `UI.*ByID("{name}_child")`.

**Init signature**: `Initialize(Callback As Object, Name As String, EventName As String)` | **Has DesignerCreateView**: Yes
## Designer Properties
| Key | Type | Default | List | Setter | Getter |
|---|---|---|---|---|---|
| `ParentID` | String | — | — | `setParentID` | `getParentID` |
| `InputType` | String | normal | normal, legend, buttons, label-input, buttons-floating | `setInputType` | `getInputType` |
| `Label` | String | Text Area | — | `setLabel` | `getLabel` |
| `LegendColor` | String | — | — | `setLegendColor` | `getLegendColor` |
| `Placeholder` | String | — | — | `setPlaceholder` | `getPlaceholder` |
| `Value` | String | — | — | `setValue` | `getValue` |
| `Color` | String | none | accent, error, info, neutral, none, primary, secondary, success, warning | `setColor` | `getColor` |
| `Size` | String | md | lg, md, none, sm, xl, xs | `setSize` | `getSize` |
| `Rows` | String | 4 | — | `setRows` | `getRows` |
| `Ghost` | Boolean | False | — | `setGhost` | `getGhost` |
| `Hint` | String | — | — | `setHint` | `getHint` |
| `AutoSizeToContent` | Boolean | False | — | `setAutoSizeToContent` | `getAutoSizeToContent` |
| `MinHeight` | String | — | — | `setMinHeight` | `getMinHeight` |
| `Height` | String | 12 | — | `setHeight` | `getHeight` |
| `MaxHeight` | String | — | — | `setMaxHeight` | `getMaxHeight` |
| `MinWidth` | String | — | — | `setMinWidth` | `getMinWidth` |
| `Width` | String | full | — | `setWidth` | `getWidth` |
| `MaxWidth` | String | — | — | `setMaxWidth` | `getMaxWidth` |
| `Required` | Boolean | False | — | `setRequired` | `getRequired` |
| `Validator` | Boolean | False | — | `setValidator` | `getValidator` |
| `ValidatorHint` | String | — | — | `setValidatorHint` | `getValidatorHint` |
| `PrependColor` | String | none | — | `setPrependColor` | `getPrependColor` |
| `PrependImage` | String | — | — | `setPrependImage` | — |
| `PrependIcon` | String | — | — | `setPrependIcon` | `getPrependIcon` |
| `PrependIconColor` | String | none | — | `setPrependIconColor` | `getPrependIconColor` |
| `PrependVisible` | Boolean | False | — | `setPrependVisible` | `getPrependVisible` |
| `AppendColor` | String | none | — | `setAppendColor` | `getAppendColor` |
| `AppendImage` | String | — | — | `setAppendImage` | `getAppendImage` |
| `AppendIcon` | String | — | — | `setAppendIcon` | `getAppendIcon` |
| `AppendIconColor` | String | none | — | `setAppendIconColor` | `getAppendIconColor` |
| `AppendVisible` | Boolean | False | — | `setAppendVisible` | `getAppendVisible` |
| `Visible` | Boolean | True | — | `setVisible` | `getVisible` |
| `BackgroundColor` | String | base-200 | — | `setBackgroundColor` | `getBackgroundColor` |
| `Border` | Boolean | True | — | `setBorder` | `getBorder` |
| `BorderColor` | String | base-300 | — | `setBorderColor` | `getBorderColor` |
| `RoundedBox` | Boolean | False | — | `setRoundedBox` | `getRoundedBox` |
| `Shadow` | String | none | 2xl, inner, lg, md, none, shadow, sm, xl | `setShadow` | `getShadow` |
| `Enabled` | Boolean | True | — | `setEnabled` | `getEnabled` |
| `PositionStyle` | String | none | absolute, fixed, none, relative, static, sticky | `setPositionStyle` | `getPositionStyle` |
| `Position` | String | t=?; b=?; r=?; l=? | — | `setPosition` | `getPosition` |
| `MarginAXYTBLR` | String | a=?; x=?; y=?; t=?; b=?; l=?; r=? | — | `setMarginAXYTBLR` | `getMarginAXYTBLR` |
| `PaddingAXYTBLR` | String | a=?; x=?; y=?; t=?; b=?; l=?; r=? | — | `setPaddingAXYTBLR` | `getPaddingAXYTBLR` |
| `RawClasses` | String | — | — | `setClasses` | `getClasses` |
| `RawStyles` | String | — | — | `setStyles` | `getStyles` |
| `RawAttributes` | String | — | — | `setAttributes` | `getAttributes` |

Setter and getter names are the actual source `Sub` names. `—` means this component has no named accessor for that side; designer-time values may still be consumed through `Props` in `DesignerCreateView`.
Where a designer key and method name differ, the method names shown are the source-verified mapping.
## Events
`Change`, `Append`, `Prepend`, `Input`

Wire in parent: `Sub textarea_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (10)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Focus()` _(public)_
- `HintError(s As String)` As 'ignoredeadcode _(public)_
- `IsBlank()` As Boolean _(public)_
- `ResetValidation()` _(public)_
## Key Setters (45)
- `setLegendColor(s As String)` As 'ignoredeadcode _(public)_
- `setParentID(s As String)` _(public)_
- `setVisible(b As Boolean)` _(public)_
- `setEnabled(b As Boolean)` As 'ignoredeadcode _(public)_
- `setPositionStyle(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setAttributes(s As String)` _(public)_
- `setStyles(s As String)` _(public)_
- `setClasses(s As String)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setRows(s As String)` As 'ignoredeadcode _(public)_
- `setAppendColor(s As String)` As 'ignoredeadcode _(public)_
- `setAppendIconColor(s As String)` As 'ignoredeadcode _(public)_
- `setPrependColor(s As String)` As 'ignoredeadcode _(public)_
- `setPrependIconColor(s As String)` As 'ignoredeadcode _(public)_
- `setBackgroundColor(s As String)` As 'ignoredeadcode _(public)_
- `setBorder(b As Boolean)` As 'ignoredeadcode _(public)_
- `setBorderColor(s As String)` As 'ignoredeadcode _(public)_
- `setRoundedBox(b As Boolean)` As 'ignoredeadcode _(public)_
- `setShadow(s As String)` As 'ignoredeadcode _(public)_
- `setAutoSizeToContent(b As Boolean)` As 'ignoredeadcode _(public)_
- `setMaxHeight(s As String)` As 'ignoredeadcode _(public)_
- `setMaxWidth(s As String)` As 'ignoredeadcode _(public)_
- `setMinHeight(s As String)` As 'ignoredeadcode _(public)_
- `setMinWidth(s As String)` As 'ignoredeadcode _(public)_
- `setWidth(s As String)` As 'ignoredeadcode _(public)_
- `setInputType(s As String)` _(public)_
- `setPrependVisible(b As Boolean)` As 'ignoredeadcode _(public)_
- `setAppendVisible(b As Boolean)` As 'ignoredeadcode _(public)_
- `setAppendImage(s As String)` As 'ignoredeadcode _(public)_
- `setAppendIcon(s As String)` As 'ignoredeadcode _(public)_
- `setPrependImage(s As String)` As 'ignoredeadcode _(public)_
- `setPrependIcon(s As String)` As 'ignoredeadcode _(public)_
- `setColor(s As String)` As 'ignoredeadcode _(public)_
- `setGhost(b As Boolean)` As 'ignoredeadcode _(public)_
- `setHeight(s As String)` As 'ignoredeadcode _(public)_
- `setHint(s As String)` _(public)_
- `setLabel(s As String)` _(public)_
- `setPlaceholder(s As String)` As 'ignoredeadcode _(public)_
- `setRequired(b As Boolean)` As 'ignoredeadcode _(public)_
- `setSize(s As String)` As 'ignoredeadcode _(public)_
- `setValidator(b As Boolean)` _(public)_
- `setValidatorHint(s As String)` _(public)_
- `setValue(s As String)` As 'ignoredeadcode _(public)_
## Getters (46)
- `getLegendColor()` As String _(public)_
- `getID()` As String _(public)_
- `getParentID()` As String _(public)_
- `getHere()` As String _(public)_
- `getVisible()` As Boolean _(public)_
- `getEnabled()` As Boolean _(public)_
- `getPositionStyle()` As String _(public)_
- `getPosition()` As String _(public)_
- `getAttributes()` As String _(public)_
- `getStyles()` As String _(public)_
- `getClasses()` As String _(public)_
- `getPaddingAXYTBLR()` As String _(public)_
- `getMarginAXYTBLR()` As String _(public)_
- `getRows()` As String _(public)_
- `getAppendColor()` As String _(public)_
- `getAppendIconColor()` As String _(public)_
- `getPrependColor()` As String _(public)_
- `getPrependIconColor()` As String _(public)_
- `getBackgroundColor()` As String _(public)_
- `getBorder()` As Boolean _(public)_
- `getBorderColor()` As String _(public)_
- `getRoundedBox()` As Boolean _(public)_
- `getShadow()` As String _(public)_
- `getAutoSizeToContent()` As Boolean _(public)_
- `getMaxHeight()` As String _(public)_
- `getMaxWidth()` As String _(public)_
- `getMinHeight()` As String _(public)_
- `getMinWidth()` As String _(public)_
- `getWidth()` As String _(public)_
- `getInputType()` As String _(public)_
- `getAppendIcon()` As String _(public)_
- `getAppendVisible()` As Boolean _(public)_
- `getPrependIcon()` As String _(public)_
- `getPrependVisible()` As Boolean _(public)_
- `getAppendImage()` As String _(public)_
- `getColor()` As String _(public)_
- `getGhost()` As Boolean _(public)_
- `getHeight()` As String _(public)_
- `getHint()` As String _(public)_
- `getLabel()` As String _(public)_
- `getPlaceholder()` As String _(public)_
- `getRequired()` As Boolean _(public)_
- `getSize()` As String _(public)_
- `getValidator()` As Boolean _(public)_
- `getValidatorHint()` As String _(public)_
- `getValue()` As String _(public)_
## Private Methods (1)
- `SetDefaults()` _(private)_
## Verified Demo Usage

Real syntax from [`pgTextArea.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgTextArea.bas) (verified demo). `SDUI5TextArea1` = a SDUI5TextArea.

```b4j
	SDUI5TextArea1.Initialize(Me, "SDUI5TextArea1", "SDUI5TextArea1")
	SDUI5TextArea1.ParentID = "SDUI5Column1"
	SDUI5TextArea1.AppendColor = "none"
	SDUI5TextArea1.AppendIcon = ""
	SDUI5TextArea1.AppendIconColor = "none"
	SDUI5TextArea1.AppendImage = "./assets/search.svg"
	SDUI5TextArea1.AppendVisible = True
	SDUI5TextArea1.AutoSizeToContent = False
	SDUI5TextArea1.BackgroundColor = "base-200"
	SDUI5TextArea1.Border = True
	SDUI5TextArea1.BorderColor = "base-300"
	SDUI5TextArea1.Color = "none"
	SDUI5TextArea1.Enabled = True
	SDUI5TextArea1.Ghost = False
	SDUI5TextArea1.Height = ""
	SDUI5TextArea1.Hint = ""
	SDUI5TextArea1.InputType = "buttons"
	SDUI5TextArea1.Label = ""
	SDUI5TextArea1.MarginAXYTBLR = "a=?; x=?; y=?; t=?; b=?; l=?; r=?"
	SDUI5TextArea1.MaxHeight = ""
	SDUI5TextArea1.MaxWidth = ""
	SDUI5TextArea1.MinHeight = ""
	SDUI5TextArea1.MinWidth = ""
	SDUI5TextArea1.PaddingAXYTBLR = "a=?; x=?; y=?; t=?; b=?; l=?; r=?"
	SDUI5TextArea1.Placeholder = "Bio"
	SDUI5TextArea1.Position = "t=?; b=?; r=?; l=?"
	SDUI5TextArea1.PositionStyle = "none"
	SDUI5TextArea1.PrependColor = "none"
	'   ... (see demo source for the rest)
```

Demo-wired events: `Append`, `Change`, `Input`, `Prepend` — handlers named `SDUI5TextArea1_<Event>`.

Also used in: `pgJSONQuery`, `pgModal`, `pgValidation`
## Emits (daisyUI classes pushed in DesignerCreateView)
_(none emitted directly — relies on base/CustProps)_
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim textarea As SDUI5TextArea
textarea.Initialize(Me, "SDUI5TextArea", "SDUI5TextArea")
textarea.ParentID = "placeholder"
BANano.Await(textarea.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.


