---
name: SDUI5Radio
description: SithasoDaisy5 SDUI5Radio component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5Radio

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5Radio.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5Radio.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgRadio.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgRadio.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5Radio is a daisyUI radio input with label, hint, legend (group), Checked/CheckedColor/UncheckedColor, Indeterminate, Required, Validator/ValidatorHint, Size. **RadioType controls label placement: `normal` renders the radio with no label, `legend` renders the `Label` as a group legend, `left-label`/`right-label` render the `Label` to the left/right of the radio.** Set `RadioType` to one of the label modes (`legend`, `left-label`, `right-label`) for the `Label` to display; `normal` shows no label. Use GetValue/SetValue and Validate/IsValid; Checked state persists via Checked prop.
_SDUI5Radio is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `RadioType` | String | normal | legend, normal, left-label, right-label | `setRadioType` | `getRadioType` |
| `Legend` | String | Toggle | — | `setLegend` | `getLegend` |
| `LegendColor` | String | — | — | `setLegendColor` | `getLegendColor` |
| `Label` | String | Radio | — | `setLabel` | `getLabel` |
| `LabelColor` | String | — | — | `setLabelColor` | `getLabelColor` |
| `Value` | String | — | — | `setValue` | `getValue` |
| `Color` | String | none | accent, error, info, neutral, none, primary, secondary, success, warning | `setColor` | `getColor` |
| `Size` | String | none | lg, md, none, sm, xl, xs | `setSize` | `getSize` |
| `AriaLabel` | String | — | — | `setAriaLabel` | `getAriaLabel` |
| `GroupName` | String | — | — | `setGroupName` | `getGroupName` |
| `BackgroundColor` | String | — | — | `setBackgroundColor` | `getBackgroundColor` |
| `Checked` | Boolean | False | — | `setChecked` | `getChecked` |
| `CheckedColor` | String | — | — | `setCheckedColor` | `getCheckedColor` |
| `ThemeController` | Boolean | False | — | `setThemeController` | `getThemeController` |
| `Hint` | String | — | — | `setHint` | `getHint` |
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
`Change`

Wire in parent: `Sub radio_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (6)
- `AddComponent()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Focus()` _(public)_
- `HintError(s As String)` _(public)_
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `Remove()` _(public)_

## Key Setters (26)
- `setAriaLabel(s As String)` _(public)_
- `setAttributes(s As String)` _(public)_
- `setBackgroundColor(s As String)` _(public)_
- `setChecked(b As Boolean)` _(public)_
- `setCheckedColor(s As String)` _(public)_
- `setClasses(s As String)` _(public)_
- `setColor(s As String)` _(public)_
- `setEnabled(b As Boolean)` _(public)_
- `setGroupName(s As String)` _(public)_
- `setHint(s As String)` _(public)_
- `setLabel(s As String)` _(public)_
- `setLabelColor(s As String)` _(public)_
- `setLegend(s As String)` _(public)_
- `setLegendColor(s As String)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setParentID(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setPositionStyle(s As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `setRadioType(s As String)` _(public)_
- `setSize(s As String)` _(public)_
- `setStyles(s As String)` _(public)_
- `setThemeController(b As Boolean)` _(public)_
- `setValue(s As String)` _(public)_
- `setVisible(b As Boolean)` _(public)_

## Getters (28)
- `getAriaLabel()` _(public)_
- `getAttributes()` _(public)_
- `getBackgroundColor()` _(public)_
- `getChecked()` _(public)_
- `getCheckedColor()` _(public)_
- `getClasses()` _(public)_
- `getColor()` _(public)_
- `getEnabled()` _(public)_
- `getGroupName()` _(public)_
- `getHere()` As String _(public)_
- `getHint()` _(public)_
- `getID()` As String _(public)_
- `getLabel()` _(public)_
- `getLabelColor()` _(public)_
- `getLegend()` _(public)_
- `getLegendColor()` _(public)_
- `getMarginAXYTBLR()` _(public)_
- `getPaddingAXYTBLR()` _(public)_
- `getParentID()` _(public)_
- `getPosition()` _(public)_
- `getPositionStyle()` _(public)_
- `GetProperties()` _(public)_
- `getRadioType()` _(public)_
- `getSize()` _(public)_
- `getStyles()` _(public)_
- `getThemeController()` _(public)_
- `getValue()` _(public)_
- `getVisible()` _(public)_

## Private Methods (2)
- `changed(e As BANanoEvent)` _(private)_
- `SetDefaults()` _(private)_

## Verified Demo Usage

Real syntax from [`pgRadio.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgRadio.bas) (verified demo):

```b4j
Private SDUI5Radio1 As SDUI5Radio		'ignore
Private SDUI5Radio10 As SDUI5Radio		'ignore
Private SDUI5Radio11 As SDUI5Radio		'ignore
Private SDUI5Radio12 As SDUI5Radio		'ignore
Private SDUI5Radio13 As SDUI5Radio		'ignore
Private SDUI5Radio14 As SDUI5Radio		'ignore
Private SDUI5Radio15 As SDUI5Radio		'ignore
Private SDUI5Radio16 As SDUI5Radio		'ignore
Private SDUI5Radio17 As SDUI5Radio		'ignore
Private SDUI5Radio18 As SDUI5Radio		'ignore
Private SDUI5Radio19 As SDUI5Radio		'ignore
BANano.Await(SDUI5Container1.AddComponent)
```

## Emits (daisyUI classes pushed in DesignerCreateView)
_(none emitted directly — relies on base/CustProps)_
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim radio As SDUI5Radio
radio.Initialize(Me, "SDUI5Radio", "SDUI5Radio")
radio.ParentID = "placeholder"
BANano.Await(radio.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.
