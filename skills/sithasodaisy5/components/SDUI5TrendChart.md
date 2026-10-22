---
name: SDUI5TrendChart
description: SithasoDaisy5 SDUI5TrendChart component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5TrendChart

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5TrendChart.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5TrendChart.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgTrendCharts.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgTrendCharts.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5TrendChart is a trend/line chart for time-series data. Use for visualizing trends over time.
_SDUI5TrendChart is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `ChartType` | String | bar | bar, line, pie, stack | `setChartType` | `getChartType` |
| `Labels` | String | — | — | `setLabels` | `getLabels` |
| `Values` | String | — | — | `setValues` | `getValues` |
| `MinValue` | String | 0 | — | `setMinValue` | `getMinValue` |
| `MaxValue` | String | 0 | — | `setMaxValue` | `getMaxValue` |
| `Gap` | String | 2 | — | `setGap` | `getGap` |
| `Horizontal` | Boolean | False | — | `setHorizontal` | `getHorizontal` |
| `Inside` | Boolean | False | — | `setInside` | `getInside` |
| `Point` | String | — | — | `setPoint` | `getPoint` |
| `Radius` | String | 2 | — | `setRadius` | `getRadius` |
| `Rotate` | String | 0 | — | `setRotate` | `getRotate` |
| `Static` | Boolean | False | — | `setStatic` | `getStatic` |
| `Donut` | String | — | — | `setDonut` | `getDonut` |
| `TooltipDisabled` | Boolean | False | — | `setTooltipDisabled` | `getTooltipDisabled` |
| `TooltipFormat` | String | @L @V | — | `setTooltipFormat` | `getTooltipFormat` |
| `Weight` | String | 2 | — | `setWeight` | `getWeight` |
| `Height` | String | 400px | — | — | — |
| `Width` | String | 400px | — | — | — |
| `Shadow` | String | none | 2xl, inner, lg, md, none, shadow, sm, xl | `setShadow` | `getShadow` |
| `Rounded` | String | none | 0, 2xl, 3xl, full, lg, md, none, rounded, sm, xl | `setRounded` | `getRounded` |
| `ShapeColor` | String | #597BFC | — | `setShapeColor` | `getShapeColor` |
| `ShapeOpacity` | String | 1 | — | `setShapeOpacity` | `getShapeOpacity` |
| `ResidualColor` | String | black | — | `setResidualColor` | `getResidualColor` |
| `ResidualOpacity` | String | 0 | — | `setResidualOpacity` | `getResidualOpacity` |
| `TooltipFontColor` | String | white | — | `setTooltipFontColor` | `getTooltipFontColor` |
| `TooltipFontSize` | String | 0.875em | — | `setTooltipFontSize` | `getTooltipFontSize` |
| `TooltipFontWeight` | String | bold | — | `setTooltipFontWeight` | `getTooltipFontWeight` |
| `TooltipRadius` | String | 3px | — | `setTooltipRadius` | `getTooltipRadius` |
| `TooltipPadding` | String | 3px 4px | — | `setTooltipPadding` | `getTooltipPadding` |
| `TooltipBackground` | String | black | — | `setTooltipBackground` | `getTooltipBackground` |
| `TooltipShadow` | String | none | — | `setTooltipShadow` | `getTooltipShadow` |
| `AreaColor` | String | — | — | `setAreaColor` | `getAreaColor` |
| `AreaOpacity` | String | 0 | — | `setAreaOpacity` | `getAreaOpacity` |
| `PointInnerColor` | String | — | — | `setPointInnerColor` | `getPointInnerColor` |
| `PointBorderColor` | String | — | — | `setPointBorderColor` | `getPointBorderColor` |
| `PointOpacity` | String | 0 | — | `setPointOpacity` | `getPointOpacity` |
| `PointOpacityActive` | String | 1 | — | `setPointOpacityActive` | `getPointOpacityActive` |
| `ShapeColorX` | String | — | — | `setShapeColorX` | `getShapeColorX` |
| `ShapeOpacityActive` | String | 0.5 | — | `setShapeOpacityActive` | `getShapeOpacityActive` |
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

Wire in parent: `Sub trendchart_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (8)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `OnEvent(event As String, methodName As String)` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `ToString()` As String _(public)_
## Key Setters (47)
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
- `setShadow(s As String)` As 'ignoredeadcode _(public)_
- `setRounded(s As String)` As 'ignoredeadcode _(public)_
- `setAreaColor(s As String)` _(public)_
- `setAreaOpacity(s As String)` _(public)_
- `setPointBorderColor(s As String)` _(public)_
- `setPointInnerColor(s As String)` _(public)_
- `setPointOpacity(s As String)` _(public)_
- `setPointOpacityActive(s As String)` _(public)_
- `setResidualColor(s As String)` _(public)_
- `setResidualOpacity(s As String)` _(public)_
- `setShapeColor(s As String)` _(public)_
- `setShapeColorX(s As String)` _(public)_
- `setShapeOpacity(s As String)` _(public)_
- `setShapeOpacityActive(s As String)` _(public)_
- `setTooltipBackground(s As String)` _(public)_
- `setTooltipFontColor(s As String)` _(public)_
- `setTooltipFontSize(s As String)` _(public)_
- `setTooltipFontWeight(s As String)` _(public)_
- `setTooltipPadding(s As String)` _(public)_
- `setTooltipRadius(s As String)` _(public)_
- `setTooltipShadow(s As String)` _(public)_
- `setChartType(s As String)` _(public)_
- `setDonut(s As String)` _(public)_
- `setGap(s As String)` _(public)_
- `setHorizontal(b As Boolean)` _(public)_
- `setInside(b As Boolean)` _(public)_
- `setLabels(s As String)` As 'ignoredeadcode _(public)_
- `setMaxValue(s As String)` _(public)_
- `setMinValue(s As String)` _(public)_
- `setPoint(s As String)` _(public)_
- `setRadius(s As String)` _(public)_
- `setRotate(s As String)` _(public)_
- `setStatic(b As Boolean)` _(public)_
- `setTooltipDisabled(b As Boolean)` _(public)_
- `setTooltipFormat(s As String)` _(public)_
- `setValues(s As String)` As 'ignoredeadcode _(public)_
- `setWeight(s As String)` _(public)_
## Getters (49)
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
- `getShadow()` As String _(public)_
- `getRounded()` As String _(public)_
- `getAreaColor()` As String _(public)_
- `getAreaOpacity()` As String _(public)_
- `getPointBorderColor()` As String _(public)_
- `getPointInnerColor()` As String _(public)_
- `getPointOpacity()` As String _(public)_
- `getPointOpacityActive()` As String _(public)_
- `getResidualColor()` As String _(public)_
- `getResidualOpacity()` As String _(public)_
- `getShapeColor()` As String _(public)_
- `getShapeColorX()` As String _(public)_
- `getShapeOpacity()` As String _(public)_
- `getShapeOpacityActive()` As String _(public)_
- `getTooltipBackground()` As String _(public)_
- `getTooltipFontColor()` As String _(public)_
- `getTooltipFontSize()` As String _(public)_
- `getTooltipFontWeight()` As String _(public)_
- `getTooltipPadding()` As String _(public)_
- `getTooltipRadius()` As String _(public)_
- `getTooltipShadow()` As String _(public)_
- `getChartType()` As String _(public)_
- `getDonut()` As String _(public)_
- `getGap()` As String _(public)_
- `getHorizontal()` As Boolean _(public)_
- `getInside()` As Boolean _(public)_
- `getLabels()` As String _(public)_
- `getMaxValue()` As String _(public)_
- `getMinValue()` As String _(public)_
- `getPoint()` As String _(public)_
- `getRadius()` As String _(public)_
- `getRotate()` As String _(public)_
- `getStatic()` As Boolean _(public)_
- `getTooltipDisabled()` As Boolean _(public)_
- `getTooltipFormat()` As String _(public)_
- `getValues()` As String _(public)_
- `getWeight()` As String _(public)_
## Private Methods (1)
- `SetDefaults()` _(private)_
## Verified Demo Usage

Real syntax from [`pgTrendCharts.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgTrendCharts.bas) (verified demo). `SDUI5TrendChart4` = a SDUI5TrendChart.

```b4j
	SDUI5TrendChart4.Initialize(Me, "SDUI5TrendChart4", "SDUI5TrendChart4")
	SDUI5TrendChart4.ParentID = "SDUI5Column4"
	SDUI5TrendChart4.ChartType = "stack"
	SDUI5TrendChart4.Gap = "3"
	SDUI5TrendChart4.Horizontal = True
	SDUI5TrendChart4.Radius = "20"
	SDUI5TrendChart4.Rounded = "lg"
	SDUI5TrendChart4.Shadow = "lg"
	SDUI5TrendChart4.ShapeColor = "#54C430"
	SDUI5TrendChart4.Values = "64,48,16,25,12,6"
	SDUI5TrendChart4.Weight = "1.6"
	BANano.Await(SDUI5TrendChart4.AddComponent)
```
## Emits (daisyUI classes pushed in DesignerCreateView)
_(none emitted directly — relies on base/CustProps)_
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim trendchart As SDUI5TrendChart
trendchart.Initialize(Me, "SDUI5TrendChart", "SDUI5TrendChart")
trendchart.ParentID = "placeholder"
BANano.Await(trendchart.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.


