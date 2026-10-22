---
name: SDUI5Label
description: SithasoDaisy5 SDUI5Label component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5Label

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5Label.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5Label.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgLabel.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgLabel.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5Label is a text label with color/size. Use for captions and labels.
_SDUI5Label is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `InputType` | String | input | select, input, email, password, tel, url, number, file | `setInputType` | `getInputType` |
| `Label` | String | Label | — | `setLabel` | `getLabel` |
| `Suffix` | String | — | — | `setSuffix` | `getSuffix` |
| `FloatingLabel` | Boolean | False | — | `setFloatingLabel` | `getFloatingLabel` |
| `LabelWidth` | String | — | — | `setLabelWidth` | `getLabelWidth` |
| `Placeholder` | String | — | — | `setPlaceholder` | `getPlaceholder` |
| `RawOptions` | String | b4a=b4a; b4j=b4j; b4i=b4i; b4r=b4r | — | `setOptions` | `getOptions` |
| `Value` | String | — | — | — | — |
| `Width` | String | full | — | `setWidth` | `getWidth` |
| `MinLength` | String | — | — | `setMinLength` | `getMinLength` |
| `MaxLength` | String | — | — | `setMaxLength` | `getMaxLength` |
| `MinValue` | String | — | — | `setMinValue` | `getMinValue` |
| `StepValue` | String | — | — | `setStepValue` | `getStepValue` |
| `MaxValue` | String | — | — | `setMaxValue` | `getMaxValue` |
| `Required` | Boolean | False | — | `setRequired` | `getRequired` |
| `Color` | String | none | accent, error, info, neutral, none, primary, secondary, success, warning | `setColor` | `getColor` |
| `Size` | String | none | lg, md, none, sm, xl, xs | `setSize` | `getSize` |
| `Validator` | Boolean | False | — | `setValidator` | `getValidator` |
| `ValidatorHint` | String | — | — | `setValidatorHint` | `getValidatorHint` |
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
_(none declared)_

Wire in parent: `Sub label_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (10)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `SetOptionsFromMap(m As Map)` As 'ignoredeadcode _(public)_
- `SetOptionsFromList(m As List)` _(public)_
- `Clear()` As 'ignoredeadcode _(public)_
- `AddOption(iKey As String, iValue As String)` _(public)_
## Key Setters (28)
- `setParentID(s As String)` _(public)_
- `setVisible(b As Boolean)` _(public)_
- `setEnabled(b As Boolean)` _(public)_
- `setPositionStyle(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setAttributes(s As String)` _(public)_
- `setStyles(s As String)` _(public)_
- `setClasses(s As String)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setWidth(s As String)` As 'ignoredeadcode _(public)_
- `setLabelWidth(s As String)` As 'ignoredeadcode _(public)_
- `setMaxLength(s As String)` As 'ignoredeadcode _(public)_
- `setMaxValue(s As String)` As 'ignoredeadcode _(public)_
- `setMinLength(s As String)` As 'ignoredeadcode _(public)_
- `setMinValue(s As String)` As 'ignoredeadcode _(public)_
- `setRequired(b As Boolean)` As 'ignoredeadcode _(public)_
- `setStepValue(s As String)` As 'ignoredeadcode _(public)_
- `setLabel(s As String)` As 'ignoredeadcode _(public)_
- `setColor(s As String)` As 'ignoredeadcode _(public)_
- `setFloatingLabel(b As Boolean)` _(public)_
- `setInputType(s As String)` _(public)_
- `setPlaceholder(s As String)` As 'ignoredeadcode _(public)_
- `setOptions(s As String)` As 'ignoredeadcode _(public)_
- `setSize(s As String)` As 'ignoredeadcode _(public)_
- `setSuffix(s As String)` As 'ignoredeadcode _(public)_
- `setValidator(b As Boolean)` As 'ignoredeadcode _(public)_
- `setValidatorHint(s As String)` As 'ignoredeadcode _(public)_
## Getters (30)
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
- `getWidth()` As String _(public)_
- `getLabelWidth()` As String _(public)_
- `getMaxLength()` As String _(public)_
- `getMaxValue()` As String _(public)_
- `getMinLength()` As String _(public)_
- `getMinValue()` As String _(public)_
- `getRequired()` As Boolean _(public)_
- `getStepValue()` As String _(public)_
- `getOptions()` As String _(public)_
- `getLabel()` As String _(public)_
- `getColor()` As String _(public)_
- `getFloatingLabel()` As Boolean _(public)_
- `getInputType()` As String _(public)_
- `getPlaceholder()` As String _(public)_
- `getSize()` As String _(public)_
- `getSuffix()` As String _(public)_
- `getValidator()` As Boolean _(public)_
- `getValidatorHint()` As String _(public)_
## Private Methods (0)
_(none)_
## Verified Demo Usage

Real syntax from [`pgLabel.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgLabel.bas) (verified demo). `SDUI5Label12` = a SDUI5Label.

```b4j
	SDUI5Label12.Initialize(Me, "SDUI5Label12", "SDUI5Label12")
	SDUI5Label12.ParentID = "SDUI5Column12"
	SDUI5Label12.Color = "info"
	SDUI5Label12.InputType = "number"
	SDUI5Label12.Label = "Range"
	SDUI5Label12.MaxValue = "100"
	SDUI5Label12.MinValue = "0"
	SDUI5Label12.Options = "b4a:b4a; b4j:b4j; b4i:b4i; b4r:b4r"
	SDUI5Label12.StepValue = "1"
	BANano.Await(SDUI5Label12.AddComponent)
```
## Emits (daisyUI classes pushed in DesignerCreateView)
**Classes**: `floating-label`
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim label As SDUI5Label
label.Initialize(Me, "SDUI5Label", "SDUI5Label")
label.ParentID = "placeholder"
BANano.Await(label.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.


