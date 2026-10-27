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
| `PrependImage` | String | — | — | `setPrependImage` | `getPrependImage` |
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
## Public Methods (8)
- `AddComponent()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Focus()` _(public)_
- `HintError(s As String)` _(public)_
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `IsBlank()` _(public)_
- `Remove()` _(public)_
- `ResetValidation()` _(public)_

## Key Setters (46)
- `setAppendColor(s As String)` _(public)_
- `setAppendIcon(s As String)` _(public)_
- `setAppendIconColor(s As String)` _(public)_
- `setAppendImage(s As String)` _(public)_
- `setAppendVisible(b As Boolean)` _(public)_
- `setAttributes(s As String)` _(public)_
- `setAutoSizeToContent(b As Boolean)` _(public)_
- `setBackgroundColor(s As String)` _(public)_
- `setBorder(b As Boolean)` _(public)_
- `setBorderColor(s As String)` _(public)_
- `setClasses(s As String)` _(public)_
- `setColor(s As String)` _(public)_
- `setEnabled(b As Boolean)` _(public)_
- `setGhost(b As Boolean)` _(public)_
- `setHeight(s As String)` _(public)_
- `setHint(s As String)` _(public)_
- `setInputType(s As String)` _(public)_
- `setLabel(s As String)` _(public)_
- `setLegendColor(s As String)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setMaxHeight(s As String)` _(public)_
- `setMaxWidth(s As String)` _(public)_
- `setMinHeight(s As String)` _(public)_
- `setMinWidth(s As String)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setParentID(s As String)` _(public)_
- `setPlaceholder(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setPositionStyle(s As String)` _(public)_
- `setPrependColor(s As String)` _(public)_
- `setPrependIcon(s As String)` _(public)_
- `setPrependIconColor(s As String)` _(public)_
- `setPrependImage(s As String)` _(public)_
- `setPrependVisible(b As Boolean)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `setRequired(b As Boolean)` _(public)_
- `setRoundedBox(b As Boolean)` _(public)_
- `setRows(s As String)` _(public)_
- `setShadow(s As String)` _(public)_
- `setSize(s As String)` _(public)_
- `setStyles(s As String)` _(public)_
- `setValidator(b As Boolean)` _(public)_
- `setValidatorHint(s As String)` _(public)_
- `setValue(s As String)` _(public)_
- `setVisible(b As Boolean)` _(public)_
- `setWidth(s As String)` _(public)_

## Getters (48)
- `getAppendColor()` _(public)_
- `getAppendIcon()` _(public)_
- `getAppendIconColor()` _(public)_
- `getAppendImage()` _(public)_
- `getAppendVisible()` _(public)_
- `getAttributes()` _(public)_
- `getAutoSizeToContent()` _(public)_
- `getBackgroundColor()` _(public)_
- `getBorder()` _(public)_
- `getBorderColor()` _(public)_
- `getClasses()` _(public)_
- `getColor()` _(public)_
- `getEnabled()` _(public)_
- `getGhost()` _(public)_
- `getHeight()` _(public)_
- `getHere()` As String _(public)_
- `getHint()` _(public)_
- `getID()` As String _(public)_
- `getInputType()` _(public)_
- `getLabel()` _(public)_
- `getLegendColor()` _(public)_
- `getMarginAXYTBLR()` _(public)_
- `getMaxHeight()` _(public)_
- `getMaxWidth()` _(public)_
- `getMinHeight()` _(public)_
- `getMinWidth()` _(public)_
- `getPaddingAXYTBLR()` _(public)_
- `getParentID()` _(public)_
- `getPlaceholder()` _(public)_
- `getPosition()` _(public)_
- `getPositionStyle()` _(public)_
- `getPrependColor()` _(public)_
- `getPrependIcon()` _(public)_
- `getPrependIconColor()` _(public)_
- `getPrependImage()` _(public)_
- `getPrependVisible()` _(public)_
- `GetProperties()` _(public)_
- `getRequired()` _(public)_
- `getRoundedBox()` _(public)_
- `getRows()` _(public)_
- `getShadow()` _(public)_
- `getSize()` _(public)_
- `getStyles()` _(public)_
- `getValidator()` _(public)_
- `getValidatorHint()` _(public)_
- `getValue()` _(public)_
- `getVisible()` _(public)_
- `getWidth()` _(public)_

## Private Methods (3)
- `changed(e As BANanoEvent)` _(private)_
- `changed1(e As BANanoEvent)` _(private)_
- `SetDefaults()` _(private)_

## Verified Demo Usage

Real syntax from [`pgTextArea.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgTextArea.bas) (verified demo):

```b4j
Private SDUI5TextArea1 As SDUI5TextArea		'ignore
Private SDUI5TextArea10 As SDUI5TextArea		'ignore
Private SDUI5TextArea11 As SDUI5TextArea		'ignore
Private SDUI5TextArea12 As SDUI5TextArea		'ignore
Private SDUI5TextArea13 As SDUI5TextArea		'ignore
Private SDUI5TextArea14 As SDUI5TextArea		'ignore
Private SDUI5TextArea15 As SDUI5TextArea		'ignore
Private SDUI5TextArea16 As SDUI5TextArea		'ignore
Private SDUI5TextArea17 As SDUI5TextArea		'ignore
Private SDUI5TextArea18 As SDUI5TextArea		'ignore
BANano.Await(SDUI5Container1.AddComponent)
```

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
