---
name: SDUI5TextBox
description: SithasoDaisy5 SDUI5TextBox component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5TextBox

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5TextBox.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5TextBox.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgCategories.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgCategories.bas)
  - [`pgColorPicker.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgColorPicker.bas)
  - [`pgContacts.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgContacts.bas)
  - [`pgdatetimeline.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgdatetimeline.bas)
  - [`pgFieldSet.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgFieldSet.bas)
  - [`pgGhostLogin.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgGhostLogin.bas)
  - [`pgInput.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgInput.bas)
  - [`pgModal.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgModal.bas)
  - [`pgValidation.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgValidation.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5TextBox is a daisyUI `input` (text/hidden) with label, hint, placeholder, validation (Required, MinLength/MaxLength, MinValue/MaxValue, Pattern, StepValue), sizing (Size md), Ghost/Grow, ReadOnly. **InputType** controls rendering: `normal` renders a bare `<input>` (no label), `legend`/`label-input` render the `Label` above the input, `buttons`/`buttons-floating` add prepend/append buttons, `searchbox` adds search affordance, `hidden` renders a hidden input. Set `InputType = "legend"` (or `"label-input"`) for the label to display. Use GetValue/SetValue and Validate/IsValid for form validation. Required/Pattern drive client-side validation messaging. For light input surfaces that should blend with a light card, explicitly set `BackgroundColor = ""`, `Border = False`, and `BorderColor = ""`; the default border and `base-200` fill otherwise add visible framing.
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
| `InputType` | String | normal | normal, legend, buttons, label-input, buttons-floating, searchbox, hidden | `setInputType` | `getInputType` |
| `TypeOf` | String | text | dialer, date-picker, date-time-picker, time-picker, email, number, password, search, tel, text, time, url, color-wheel | `setTypeOf` | `getTypeOf` |
| `Label` | String | — | — | `setLabel` | `getLabel` |
| `LegendColor` | String | — | — | `setLegendColor` | `getLegendColor` |
| `Placeholder` | String | — | — | `setPlaceholder` | `getPlaceholder` |
| `Value` | String | — | — | `setValue` | `getValue` |
| `Color` | String | none | accent, error, info, neutral, none, primary, secondary, success, warning | `setColor` | `getColor` |
| `Size` | String | md | lg, md, none, sm, xl, xs | `setSize` | `getSize` |
| `Width` | String | full | — | `setWidth` | `getWidth` |
| `ShowEyes` | Boolean | False | — | `setShowEyes` | `getShowEyes` |
| `Ghost` | Boolean | False | — | `setGhost` | `getGhost` |
| `Grow` | Boolean | False | — | `setGrow` | `getGrow` |
| `NoFocusBorder` | Boolean | False | — | `setNoFocusBorder` | `getNoFocusBorder` |
| `Hint` | String | — | — | `setHint` | `getHint` |
| `MinLength` | String | — | — | `setMinLength` | `getMinLength` |
| `MaxLength` | String | — | — | `setMaxLength` | `getMaxLength` |
| `MinValue` | String | — | — | `setMinValue` | `getMinValue` |
| `StepValue` | String | — | — | `setStepValue` | `getStepValue` |
| `MaxValue` | String | — | — | `setMaxValue` | `getMaxValue` |
| `Pattern` | String | — | — | `setPattern` | `getPattern` |
| `Required` | Boolean | False | — | `setRequired` | `getRequired` |
| `ReadOnly` | Boolean | False | — | `setReadOnly` | `getReadOnly` |
| `DPMode` | String | single | multiple, range, single, time | `setDPMode` | `getDPMode` |
| `DPDateFormat` | String | Y-m-d | — | `setDPDateFormat` | `getDPDateFormat` |
| `DPAltFormat` | String | D, d M Y | — | `setDPAltFormat` | `getDPAltFormat` |
| `DPAllowInput` | Boolean | False | — | `setDPAllowInput` | `getDPAllowInput` |
| `DPAltInput` | Boolean | True | — | `setDPAltInput` | `getDPAltInput` |
| `DPAltInputClass` | String | — | — | `setDPAltInputClass` | `getDPAltInputClass` |
| `DPCloseOnSelect` | Boolean | False | — | `setDPCloseOnSelect` | `getDPCloseOnSelect` |
| `DPConjunction` | String | — | — | `setDPConjunction` | `getDPConjunction` |
| `DPShowMonths` | Int | 1 | — | `setDPShowMonths` | `getDPShowMonths` |
| `DPTwentyFour` | Boolean | True | — | `setDPTwentyFour` | `getDPTwentyFour` |
| `DPLocale` | String | en | — | `setDPLocale` | `getDPLocale` |
| `DPPosition` | String | auto | auto, above, below, auto left, auto center, auto right, above left, above center, above right, below left, below center, below right | `setDPPosition` | `getDPPosition` |
| `HandleDiameter` | Int | 16 | — | `setHandleDiameter` | `getHandleDiameter` |
| `WheelDiameter` | Int | 200 | — | `setWheelDiameter` | `getWheelDiameter` |
| `WheelThickness` | Int | 20 | — | `setWheelThickness` | `getWheelThickness` |
| `WheelPlacement` | String | top-end | bottom, bottom-center, bottom-end, center, end, left, left-center, left-end, right, right-center, right-end, start, top, top-center, top-end | `setWheelPlacement` | `getWheelPlacement` |
| `ToggleColorPicker` | Boolean | False | — | `setToggleColorPicker` | `getToggleColorPicker` |
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
| `BackgroundColor` | String | base-200 | — | `setBackgroundColor` | `getBackgroundColor` |
| `Border` | Boolean | True | — | `setBorder` | `getBorder` |
| `BorderColor` | String | base-300 | — | `setBorderColor` | `getBorderColor` |
| `RoundedBox` | Boolean | False | — | `setRoundedBox` | `getRoundedBox` |
| `Shadow` | String | none | 2xl, inner, lg, md, none, shadow, sm, xl | `setShadow` | `getShadow` |
| `Visible` | Boolean | True | — | `setVisible` | `getVisible` |
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
`Append`, `Prepend`, `Change`, `Input`, `SearchClear`, `SearchClick`, `SearchKeyUp`

Wire in parent: `Sub textbox_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (26)
- `AddComponent()` _(public)_
- `CloseColorPicker()` _(public)_
- `CloseDatePicker()` _(public)_
- `DefaultPassword()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Focus()` _(public)_
- `HintError(s As String)` _(public)_
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `IsAlphanumeric()` _(public)_
- `IsBlank()` _(public)_
- `IsLength(minLen As Int)` As Boolean _(public)_
- `IsMatch(otherValue As String, tErrorMessage As String)` As Boolean _(public)_
- `IsMaxLength(minLen As Int)` As Boolean _(public)_
- `IsMinLength(minLen As Int)` As Boolean _(public)_
- `IsNumeric()` _(public)_
- `IsStrongPassword()` _(public)_
- `IsValidEmail()` _(public)_
- `IsValidUrl()` _(public)_
- `OpenColorPicker()` _(public)_
- `OpenDatePicker()` _(public)_
- `RedrawDatePicker()` _(public)_
- `RefreshColorWheel()` _(public)_
- `RefreshDatePicker()` _(public)_
- `Remove()` _(public)_
- `ResetValidation()` _(public)_
- `ToogleDatePicker()` _(public)_

## Key Setters (67)
- `setAppendColor(s As String)` _(public)_
- `setAppendIcon(s As String)` _(public)_
- `setAppendIconColor(s As String)` _(public)_
- `setAppendImage(s As String)` _(public)_
- `setAppendVisible(b As Boolean)` _(public)_
- `setAttributes(s As String)` _(public)_
- `setBackgroundColor(s As String)` _(public)_
- `setBorder(b As Boolean)` _(public)_
- `setBorderColor(s As String)` _(public)_
- `setClasses(s As String)` _(public)_
- `setColor(s As String)` _(public)_
- `setDPAllowInput(b As Boolean)` _(public)_
- `setDPAltFormat(s As String)` _(public)_
- `setDPAltInput(b As Boolean)` _(public)_
- `setDPAltInputClass(s As String)` _(public)_
- `setDPCloseOnSelect(b As Boolean)` _(public)_
- `setDPConjunction(s As String)` _(public)_
- `setDPDateFormat(s As String)` _(public)_
- `setDPLocale(s As String)` _(public)_
- `setDPMode(s As String)` _(public)_
- `setDPPosition(s As String)` _(public)_
- `setDPShowMonths(i As Int)` _(public)_
- `setDPTwentyFour(b As Boolean)` _(public)_
- `setEnabled(b As Boolean)` _(public)_
- `setGhost(b As Boolean)` _(public)_
- `setGrow(b As Boolean)` _(public)_
- `setHandleDiameter(i As Int)` _(public)_
- `setHint(s As String)` _(public)_
- `setInputType(s As String)` _(public)_
- `setLabel(s As String)` _(public)_
- `setLegendColor(s As String)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setMaxLength(s As String)` _(public)_
- `setMaxValue(s As String)` _(public)_
- `setMinLength(s As String)` _(public)_
- `setMinValue(s As String)` _(public)_
- `setNoFocusBorder(b As Boolean)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setParentID(s As String)` _(public)_
- `setPattern(s As String)` _(public)_
- `setPlaceholder(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setPositionStyle(s As String)` _(public)_
- `setPrependColor(s As String)` _(public)_
- `setPrependIcon(s As String)` _(public)_
- `setPrependIconColor(s As String)` _(public)_
- `setPrependImage(s As String)` _(public)_
- `setPrependVisible(b As Boolean)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `setReadOnly(b As Boolean)` _(public)_
- `setRequired(b As Boolean)` _(public)_
- `setRoundedBox(b As Boolean)` _(public)_
- `setShadow(s As String)` _(public)_
- `setShowEyes(b As Boolean)` _(public)_
- `setSize(s As String)` _(public)_
- `setStepValue(s As String)` _(public)_
- `setStyles(s As String)` _(public)_
- `setToggleColorPicker(b As Boolean)` _(public)_
- `setTypeOf(s As String)` _(public)_
- `setValidator(b As Boolean)` _(public)_
- `setValidatorHint(s As String)` _(public)_
- `setValue(text As String)` _(public)_
- `setVisible(b As Boolean)` _(public)_
- `setWheelDiameter(i As Int)` _(public)_
- `setWheelPlacement(s As String)` _(public)_
- `setWheelThickness(i As Int)` _(public)_
- `setWidth(s As String)` _(public)_

## Getters (69)
- `getAppendColor()` _(public)_
- `getAppendIcon()` _(public)_
- `getAppendIconColor()` _(public)_
- `getAppendImage()` _(public)_
- `getAppendVisible()` _(public)_
- `getAttributes()` _(public)_
- `getBackgroundColor()` _(public)_
- `getBorder()` _(public)_
- `getBorderColor()` _(public)_
- `getClasses()` _(public)_
- `getColor()` _(public)_
- `getDPAllowInput()` _(public)_
- `getDPAltFormat()` _(public)_
- `getDPAltInput()` _(public)_
- `getDPAltInputClass()` _(public)_
- `getDPCloseOnSelect()` _(public)_
- `getDPConjunction()` _(public)_
- `getDPDateFormat()` _(public)_
- `getDPLocale()` _(public)_
- `getDPMode()` _(public)_
- `getDPPosition()` _(public)_
- `getDPShowMonths()` _(public)_
- `getDPTwentyFour()` _(public)_
- `getEnabled()` _(public)_
- `getGhost()` _(public)_
- `getGrow()` _(public)_
- `getHandleDiameter()` _(public)_
- `getHere()` As String _(public)_
- `getHint()` _(public)_
- `getID()` As String _(public)_
- `getInputType()` _(public)_
- `getLabel()` _(public)_
- `getLegendColor()` _(public)_
- `getMarginAXYTBLR()` _(public)_
- `getMaxLength()` _(public)_
- `getMaxValue()` _(public)_
- `getMinLength()` _(public)_
- `getMinValue()` _(public)_
- `getNoFocusBorder()` _(public)_
- `getPaddingAXYTBLR()` _(public)_
- `getParentID()` _(public)_
- `getPattern()` _(public)_
- `getPlaceholder()` _(public)_
- `getPosition()` _(public)_
- `getPositionStyle()` _(public)_
- `getPrependColor()` _(public)_
- `getPrependIcon()` _(public)_
- `getPrependIconColor()` _(public)_
- `getPrependImage()` _(public)_
- `getPrependVisible()` _(public)_
- `GetProperties()` _(public)_
- `getReadOnly()` _(public)_
- `getRequired()` _(public)_
- `getRoundedBox()` _(public)_
- `getShadow()` _(public)_
- `getShowEyes()` _(public)_
- `getSize()` _(public)_
- `getStepValue()` _(public)_
- `getStyles()` _(public)_
- `getToggleColorPicker()` _(public)_
- `getTypeOf()` _(public)_
- `getValidator()` _(public)_
- `getValidatorHint()` _(public)_
- `getValue()` _(public)_
- `getVisible()` _(public)_
- `getWheelDiameter()` _(public)_
- `getWheelPlacement()` _(public)_
- `getWheelThickness()` _(public)_
- `getWidth()` _(public)_

## Private Methods (12)
- `changed(e As BANanoEvent)` _(private)_
- `changed1(e As BANanoEvent)` _(private)_
- `ColorChange(color As BANanoObject)` _(private)_
- `DateChange(selectedDates As Object, dateStr As Object, instance As Object)` _(private)_
- `PropertyDecrement(event As BANanoEvent)` _(private)_
- `PropertyIncrement(event As BANanoEvent)` _(private)_
- `SearchClear(e As BANanoEvent)` _(private)_
- `SearchClick(e As BANanoEvent)` _(private)_
- `SearchInternal(e As BANanoEvent)` _(private)_
- `SetDefaults()` _(private)_
- `ToggleColorPicker1(e As BANanoEvent)` _(private)_
- `TogglePassword(e As BANanoEvent)` _(private)_

## Verified Demo Usage

Real syntax from [`pgCategories.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgCategories.bas) (verified demo):

```b4j
Private txtId As SDUI5TextBox		'ignore
BANano.Await(tblCategories.AddComponent)
```

## Emits (daisyUI classes pushed in DesignerCreateView)
_(none emitted directly — relies on base/CustProps)_
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim textbox As SDUI5TextBox
textbox.Initialize(Me, "SDUI5TextBox", "SDUI5TextBox")
textbox.ParentID = "placeholder"
BANano.Await(textbox.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Shared helpers: Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/TextSize/BackgroundImage. Dimensions are component-specific: this component exposes Width, but not Height; use only dimensions listed in this component's properties and methods above.
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.
