---
name: SDUI5GenderChart
description: SithasoDaisy5 SDUI5GenderChart component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5GenderChart

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5GenderChart.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5GenderChart.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgGenderChart.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgGenderChart.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5GenderChart is a gender distribution chart (pie/donut). Use for demographic gender breakdowns.
_SDUI5GenderChart is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `DataType` | String | numbers | numbers, percentages | `setDataType` | `getDataType` |
| `FemaleLabel` | String | Female | — | `setFemaleLabel` | `getFemaleLabel` |
| `FemaleValue` | String | 0 | — | `setFemaleValue` | `getFemaleValue` |
| `FemaleTarget` | String | 0 | — | `setFemaleTarget` | `getFemaleTarget` |
| `FemaleColor` | Color | #FF1493 | — | `setFemaleColor` | `getFemaleColor` |
| `MaleLabel` | String | Male | — | `setMaleLabel` | `getMaleLabel` |
| `MaleValue` | String | 0 | — | `setMaleValue` | `getMaleValue` |
| `MaleTarget` | String | 0 | — | `setMaleTarget` | `getMaleTarget` |
| `MaleColor` | Color | #0000FF | — | `setMaleColor` | `getMaleColor` |
| `Width` | String | 100% | — | `setWidth` | `getWidth` |
| `Height` | String | 400px | — | `setHeight` | `getHeight` |
| `Duration` | String | 5000 | — | `setDuration` | `getDuration` |
| `Waves` | Boolean | True | — | `setWaves` | `getWaves` |
| `WaveSpeed` | String | 0.09 | — | `setWaveSpeed` | `getWaveSpeed` |
| `Autoplay` | Boolean | True | — | `setAutoplay` | `getAutoplay` |
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

Wire in parent: `Sub genderchart_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (8)
- `AddClass(className As String)` _(public)_
- `AddComponent()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `OnEvent(event As String, MethodName As String)` _(public)_
- `Remove()` _(public)_
- `Start()` _(public)_
- `Stop()` _(public)_

## Key Setters (28)
- `setAttributes(s As String)` _(public)_
- `setAutoplay(b As Boolean)` _(public)_
- `setClasses(s As String)` _(public)_
- `setDataType(s As String)` _(public)_
- `setDuration(s As String)` _(public)_
- `setEnabled(b As Boolean)` _(public)_
- `setFemaleColor(s As String)` _(public)_
- `setFemaleLabel(s As String)` _(public)_
- `setFemaleSvg(s As String)` _(public)_
- `setFemaleTarget(s As String)` _(public)_
- `setFemaleValue(s As String)` _(public)_
- `setHeight(s As String)` _(public)_
- `setMaleColor(s As String)` _(public)_
- `setMaleLabel(s As String)` _(public)_
- `setMaleSvg(s As String)` _(public)_
- `setMaleTarget(s As String)` _(public)_
- `setMaleValue(s As String)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setParentID(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setPositionStyle(s As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `setStyles(s As String)` _(public)_
- `setVisible(b As Boolean)` _(public)_
- `setWaves(b As Boolean)` _(public)_
- `setWaveSpeed(s As String)` _(public)_
- `setWidth(s As String)` _(public)_

## Getters (30)
- `getAttributes()` _(public)_
- `getAutoplay()` _(public)_
- `getClasses()` _(public)_
- `getDataType()` _(public)_
- `getDuration()` _(public)_
- `getEnabled()` _(public)_
- `getFemaleColor()` _(public)_
- `getFemaleLabel()` _(public)_
- `getFemaleSvg()` _(public)_
- `getFemaleTarget()` _(public)_
- `getFemaleValue()` _(public)_
- `getHeight()` _(public)_
- `getHere()` As String _(public)_
- `getID()` As String _(public)_
- `getMaleColor()` _(public)_
- `getMaleLabel()` _(public)_
- `getMaleSvg()` _(public)_
- `getMaleTarget()` _(public)_
- `getMaleValue()` _(public)_
- `getMarginAXYTBLR()` _(public)_
- `getPaddingAXYTBLR()` _(public)_
- `getParentID()` _(public)_
- `getPosition()` _(public)_
- `getPositionStyle()` _(public)_
- `GetProperties()` _(public)_
- `getStyles()` _(public)_
- `getVisible()` _(public)_
- `getWaves()` _(public)_
- `getWaveSpeed()` _(public)_
- `getWidth()` _(public)_

## Private Methods (1)
- `SetDefaults()` _(private)_

## Verified Demo Usage

Real syntax from [`pgGenderChart.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgGenderChart.bas) (verified demo):

```b4j
Private SDUI5GenderChart1 As SDUI5GenderChart		'ignore
BANano.Await(SDUI5Container1.AddComponent)
```

## Emits (daisyUI classes pushed in DesignerCreateView)
_(none emitted directly — relies on base/CustProps)_
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim genderchart As SDUI5GenderChart
genderchart.Initialize(Me, "SDUI5GenderChart", "SDUI5GenderChart")
genderchart.ParentID = "placeholder"
BANano.Await(genderchart.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.
