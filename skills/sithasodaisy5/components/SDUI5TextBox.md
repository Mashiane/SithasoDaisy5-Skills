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
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `RefreshColorWheel()` As 'ignoredeadcode _(public)_
- `Focus()` _(public)_
- `RefreshDatePicker()` As 'ignoredeadcode _(public)_
- `CloseDatePicker()` _(public)_
- `OpenDatePicker()` _(public)_
- `RedrawDatePicker()` _(public)_
- `ToogleDatePicker()` _(public)_
- `DefaultPassword()` _(public)_
- `HintError(s As String)` As 'ignoredeadcode _(public)_
- `IsMatch(otherValue As String, tErrorMessage As String)` As Boolean			'ignore _(public)_
- `IsMinLength(minLen As Int)` As Boolean				'ignore _(public)_
- `IsMaxLength(minLen As Int)` As Boolean				'ignore _(public)_
- `IsLength(minLen As Int)` As Boolean				'ignore _(public)_
- `IsBlank()` As Boolean _(public)_
- `IsValidEmail()` As Boolean _(public)_
- `IsValidUrl()` As Boolean _(public)_
- `IsAlphanumeric()` As Boolean _(public)_
- `IsNumeric()` As Boolean _(public)_
- `IsStrongPassword()` As Boolean _(public)_
- `ResetValidation()` _(public)_
## Key Setters (66)
- `setLegendColor(s As String)` As 'ignoredeadcode _(public)_
- `setParentID(s As String)` _(public)_
- `setPositionStyle(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setAttributes(s As String)` _(public)_
- `setStyles(s As String)` _(public)_
- `setClasses(s As String)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setNoFocusBorder(b As Boolean)` As 'ignoredeadcode _(public)_
- `setToggleColorPicker(b As Boolean)` _(public)_
- `setWheelPlacement(s As String)` As 'ignoredeadcode _(public)_
- `setHandleDiameter(i As Int)` _(public)_
- `setWheelDiameter(i As Int)` _(public)_
- `setWheelThickness(i As Int)` _(public)_
- `setAppendColor(s As String)` As 'ignoredeadcode _(public)_
- `setAppendIconColor(s As String)` As 'ignoredeadcode _(public)_
- `setPrependColor(s As String)` As 'ignoredeadcode _(public)_
- `setPrependIconColor(s As String)` As 'ignoredeadcode _(public)_
- `setDPTwentyFour(b As Boolean)` _(public)_
- `setDPPosition(s As String)` _(public)_
- `setDPLocale(s As String)` _(public)_
- `setDPAllowInput(b As Boolean)` _(public)_
- `setDPAltFormat(s As String)` _(public)_
- `setDPAltInput(b As Boolean)` _(public)_
- `setDPAltInputClass(s As String)` _(public)_
- `setDPCloseOnSelect(b As Boolean)` _(public)_
- `setDPConjunction(s As String)` _(public)_
- `setDPDateFormat(s As String)` _(public)_
- `setDPMode(s As String)` _(public)_
- `setDPShowMonths(i As Int)` _(public)_
- `setShowEyes(b As Boolean)` As 'ignoredeadcode _(public)_
- `setBackgroundColor(s As String)` As 'ignoredeadcode _(public)_
- `setBorder(b As Boolean)` As 'ignoredeadcode _(public)_
- `setBorderColor(s As String)` As 'ignoredeadcode _(public)_
- `setRoundedBox(b As Boolean)` As 'ignoredeadcode _(public)_
- `setShadow(s As String)` As 'ignoredeadcode _(public)_
- `setWidth(s As String)` As 'ignoredeadcode _(public)_
- `setInputType(s As String)` _(public)_
- `setAppendImage(s As String)` As 'ignoredeadcode _(public)_
- `setAppendIcon(s As String)` As 'ignoredeadcode _(public)_
- `setAppendVisible(b As Boolean)` As 'ignoredeadcode _(public)_
- `setPrependImage(s As String)` As 'ignoredeadcode _(public)_
- `setPrependIcon(s As String)` As 'ignoredeadcode _(public)_
- `setPrependVisible(b As Boolean)` As 'ignoredeadcode _(public)_
- `setValue(text As String)` As 'ignoredeadcode _(public)_
- `setVisible(b As Boolean)` _(public)_
- `setEnabled(b As Boolean)` As 'ignoredeadcode _(public)_
- `setColor(s As String)` As 'ignoredeadcode _(public)_
- `setGhost(b As Boolean)` As 'ignoredeadcode _(public)_
- `setGrow(b As Boolean)` As 'ignoredeadcode _(public)_
- `setHint(s As String)` As 'ignoredeadcode _(public)_
- `setLabel(s As String)` _(public)_
- `setMaxLength(s As String)` As 'ignoredeadcode _(public)_
- `setMaxValue(s As String)` As 'ignoredeadcode _(public)_
- `setMinLength(s As String)` As 'ignoredeadcode _(public)_
- `setMinValue(s As String)` As 'ignoredeadcode _(public)_
- `setPattern(s As String)` As 'ignoredeadcode _(public)_
- `setPlaceholder(s As String)` As 'ignoredeadcode _(public)_
- `setRequired(b As Boolean)` As 'ignoredeadcode _(public)_
- `setReadOnly(b As Boolean)` As 'ignoredeadcode _(public)_
- `setSize(s As String)` As 'ignoredeadcode _(public)_
- `setStepValue(s As String)` As 'ignoredeadcode _(public)_
- `setTypeOf(s As String)` As 'ignoredeadcode _(public)_
- `setValidator(b As Boolean)` _(public)_
- `setValidatorHint(s As String)` _(public)_
## Getters (68)
- `getID()` As String _(public)_
- `getLegendColor()` As String _(public)_
- `getParentID()` As String _(public)_
- `getHere()` As String _(public)_
- `getPositionStyle()` As String _(public)_
- `getPosition()` As String _(public)_
- `getAttributes()` As String _(public)_
- `getStyles()` As String _(public)_
- `getClasses()` As String _(public)_
- `getPaddingAXYTBLR()` As String _(public)_
- `getMarginAXYTBLR()` As String _(public)_
- `getNoFocusBorder()` As Boolean _(public)_
- `getToggleColorPicker()` As Boolean _(public)_
- `getWheelPlacement()` As String _(public)_
- `getHandleDiameter()` As Int _(public)_
- `getWheelDiameter()` As Int _(public)_
- `getWheelThickness()` As Int _(public)_
- `getAppendColor()` As String _(public)_
- `getAppendIconColor()` As String _(public)_
- `getPrependColor()` As String _(public)_
- `getPrependIconColor()` As String _(public)_
- `getDPTwentyFour()` As Boolean _(public)_
- `getDPPosition()` As String _(public)_
- `getDPLocale()` As String _(public)_
- `getDPAllowInput()` As Boolean _(public)_
- `getDPAltFormat()` As String _(public)_
- `getDPAltInput()` As Boolean _(public)_
- `getDPAltInputClass()` As String _(public)_
- `getDPCloseOnSelect()` As Boolean _(public)_
- `getDPConjunction()` As String _(public)_
- `getDPDateFormat()` As String _(public)_
- `getDPMode()` As String _(public)_
- `getDPShowMonths()` As Int _(public)_
- `getShowEyes()` As Boolean _(public)_
- `getBackgroundColor()` As String _(public)_
- `getBorder()` As Boolean _(public)_
- `getBorderColor()` As String _(public)_
- `getRoundedBox()` As Boolean _(public)_
- `getShadow()` As String _(public)_
- `getWidth()` As String _(public)_
- `getInputType()` As String _(public)_
- `getAppendImage()` As String _(public)_
- `getPrependImage()` As String _(public)_
- `getAppendIcon()` As String _(public)_
- `getAppendVisible()` As Boolean _(public)_
- `getPrependIcon()` As String _(public)_
- `getPrependVisible()` As Boolean _(public)_
- `getValue()` As String					'ignoredeadcode _(public)_
- `getVisible()` As Boolean _(public)_
- `getEnabled()` As Boolean _(public)_
- `getReadOnly()` As Boolean _(public)_
- `getColor()` As String _(public)_
- `getGhost()` As Boolean _(public)_
- `getGrow()` As Boolean _(public)_
- `getHint()` As String _(public)_
- `getLabel()` As String _(public)_
- `getMaxLength()` As String _(public)_
- `getMaxValue()` As String _(public)_
- `getMinLength()` As String _(public)_
- `getMinValue()` As String _(public)_
- `getPattern()` As String _(public)_
- `getPlaceholder()` As String _(public)_
- `getRequired()` As Boolean _(public)_
- `getSize()` As String _(public)_
- `getStepValue()` As String _(public)_
- `getTypeOf()` As String _(public)_
- `getValidator()` As Boolean _(public)_
- `getValidatorHint()` As String _(public)_
## Private Methods (2)
- `SetDefaults()` _(private)_
- `ColorChange(color As BANanoObject)` As 'ignoredeadcode _(private)_
## Verified Demo Usage

Real syntax from [`pgInput.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgInput.bas) (verified demo). `SDUI5TextBox3` = a SDUI5TextBox.

```b4j
	SDUI5TextBox3.Initialize(Me, "SDUI5TextBox3", "SDUI5TextBox3")
	SDUI5TextBox3.ParentID = "SDUI5Column3"
	SDUI5TextBox3.AppendImage = "./assets/search.svg"
	SDUI5TextBox3.AppendVisible = True
	SDUI5TextBox3.BackgroundColor = ""
	SDUI5TextBox3.Border = False
	SDUI5TextBox3.BorderColor = ""
	SDUI5TextBox3.DPAltFormat = "Y-m-d H:i"
	SDUI5TextBox3.DPDateFormat = "Y-m-d H:i"
	SDUI5TextBox3.DPPosition = "none"
	SDUI5TextBox3.Hint = "Optional"
	SDUI5TextBox3.InputType = "legend"
	SDUI5TextBox3.Label = "What is your name?"
	SDUI5TextBox3.Placeholder = "Type here"
	SDUI5TextBox3.PrependImage = "./assets/search.svg"
	SDUI5TextBox3.PrependVisible = True
	SDUI5TextBox3.Required = True
	SDUI5TextBox3.Size = "xs"
	BANano.Await(SDUI5TextBox3.AddComponent)
```

Demo-wired events: `Append`, `Change`, `Input`, `Prepend` — handlers named `SDUI5TextBox3_<Event>`.

Also used in: `pgCategories`, `pgColorPicker`, `pgContacts`, `pgFieldSet`, `pgGhostLogin`, `pgModal`, `pgValidation`, `pgdatetimeline`
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


