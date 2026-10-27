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
| `Value` | String | — | — | `setValue` | `getValue` |
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
## Public Methods (6)
- `AddComponent()` _(public)_
- `AddOption(iKey As String, iValue As String)` _(public)_
- `Clear()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `Remove()` _(public)_

## Key Setters (32)
- `setAttributes(s As String)` _(public)_
- `setClasses(s As String)` _(public)_
- `setColor(s As String)` _(public)_
- `setEnabled(b As Boolean)` _(public)_
- `setFloatingLabel(b As Boolean)` _(public)_
- `setInputType(s As String)` _(public)_
- `setLabel(s As String)` _(public)_
- `setLabelWidth(s As String)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setMaxLength(s As String)` _(public)_
- `setMaxValue(s As String)` _(public)_
- `setMinLength(s As String)` _(public)_
- `setMinValue(s As String)` _(public)_
- `setOptions(s As String)` _(public)_
- `SetOptionsFromList(m As List)` _(public)_
- `SetOptionsFromMap(m As Map)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setParentID(s As String)` _(public)_
- `setPlaceholder(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setPositionStyle(s As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `setRequired(b As Boolean)` _(public)_
- `setSize(s As String)` _(public)_
- `setStepValue(s As String)` _(public)_
- `setStyles(s As String)` _(public)_
- `setSuffix(s As String)` _(public)_
- `setValidator(b As Boolean)` _(public)_
- `setValidatorHint(s As String)` _(public)_
- `setValue(s As String)` _(public)_
- `setVisible(b As Boolean)` _(public)_
- `setWidth(s As String)` _(public)_

## Getters (32)
- `getAttributes()` _(public)_
- `getClasses()` _(public)_
- `getColor()` _(public)_
- `getEnabled()` _(public)_
- `getFloatingLabel()` _(public)_
- `getHere()` As String _(public)_
- `getID()` As String _(public)_
- `getInputType()` _(public)_
- `getLabel()` _(public)_
- `getLabelWidth()` _(public)_
- `getMarginAXYTBLR()` _(public)_
- `getMaxLength()` _(public)_
- `getMaxValue()` _(public)_
- `getMinLength()` _(public)_
- `getMinValue()` _(public)_
- `getOptions()` _(public)_
- `getPaddingAXYTBLR()` _(public)_
- `getParentID()` _(public)_
- `getPlaceholder()` _(public)_
- `getPosition()` _(public)_
- `getPositionStyle()` _(public)_
- `GetProperties()` _(public)_
- `getRequired()` _(public)_
- `getSize()` _(public)_
- `getStepValue()` _(public)_
- `getStyles()` _(public)_
- `getSuffix()` _(public)_
- `getValidator()` _(public)_
- `getValidatorHint()` _(public)_
- `getValue()` _(public)_
- `getVisible()` _(public)_
- `getWidth()` _(public)_

## Private Methods (1)
- `SetDefaults()` _(private)_

## Verified Demo Usage

Real syntax from [`pgLabel.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgLabel.bas) (verified demo):

```b4j
Private SDUI5Label1 As SDUI5Label		'ignore
Private SDUI5Label10 As SDUI5Label		'ignore
Private SDUI5Label12 As SDUI5Label		'ignore
Private SDUI5Label15 As SDUI5Label		'ignore
BANano.Await(SDUI5Container1.AddComponent)
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
