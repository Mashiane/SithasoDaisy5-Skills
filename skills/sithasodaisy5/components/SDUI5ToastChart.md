---
name: SDUI5ToastChart
description: SithasoDaisy5 SDUI5ToastChart component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5ToastChart

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5ToastChart.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5ToastChart.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgBottomDrawer.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgBottomDrawer.bas)
  - [`pgToastCharts.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgToastCharts.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5ToastChart is a chart rendered inside a toast notification. Use for inline chart toasts.
_SDUI5ToastChart is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `TitleText` | String | Chart | — | `setTitleText` | `getTitleText` |
| `TitleAlign` | String | left | center, left, right | `setTitleAlign` | `getTitleAlign` |
| `ChartType` | String | bar | area, bar, column, line, pie, radial-bar, gauge | `setChartType` | `getChartType` |
| `XAxisTitle` | String | X Axis | — | `setXAxisTitle` | `getXAxisTitle` |
| `YAxisTitle` | String | Y Axis | — | `setYAxisTitle` | `getYAxisTitle` |
| `ExportMenuFileName` | String | — | — | `setExportMenuFileName` | `getExportMenuFileName` |
| `ExportMenuVisible` | Boolean | True | — | `setExportMenuVisible` | `getExportMenuVisible` |
| `Height` | String | 400px | — | `setHeight` | `getHeight` |
| `Width` | String | 100% | — | `setWidth` | `getWidth` |
| `LegendVisible` | Boolean | True | — | `setLegendVisible` | `getLegendVisible` |
| `LegendPosition` | String | right | bottom, left, right, top | `setLegendPosition` | `getLegendPosition` |
| `LegendShowCheckbox` | Boolean | True | — | `setLegendShowCheckbox` | `getLegendShowCheckbox` |
| `SeriesDataLabelsOffsetX` | String | — | — | `setSeriesDataLabelsOffsetX` | `getSeriesDataLabelsOffsetX` |
| `SeriesDataLabelsOffsetY` | String | — | — | `setSeriesDataLabelsOffsetY` | `getSeriesDataLabelsOffsetY` |
| `SeriesDataLabelsPieSeriesNameVisible` | Boolean | True | — | `setSeriesDataLabelsPieSeriesNameVisible` | `getSeriesDataLabelsPieSeriesNameVisible` |
| `SeriesDataLabelsVisible` | Boolean | False | — | `setSeriesDataLabelsVisible` | `getSeriesDataLabelsVisible` |
| `SeriesSelectable` | Boolean | False | — | `setSeriesSelectable` | `getSeriesSelectable` |
| `SeriesShowDot` | Boolean | False | — | `setSeriesShowDot` | `getSeriesShowDot` |
| `SeriesSpline` | Boolean | False | — | `setSeriesSpline` | `getSeriesSpline` |
| `SeriesStacked` | Boolean | False | — | `setSeriesStacked` | `getSeriesStacked` |
| `SeriesZoomable` | Boolean | False | — | `setSeriesZoomable` | `getSeriesZoomable` |
| `XAxisDateFormat` | String | — | — | `setXAxisDateFormat` | `getXAxisDateFormat` |
| `XAxisPointOnColumn` | Boolean | False | — | `setXAxisPointOnColumn` | `getXAxisPointOnColumn` |
| `Rounded` | String | none | 0, 2xl, 3xl, full, lg, md, none, rounded, sm, xl | `setRounded` | `getRounded` |
| `RoundedBox` | Boolean | False | — | `setRoundedBox` | `getRoundedBox` |
| `Shadow` | String | sm | 2xl, inner, lg, md, none, shadow, sm, xl | `setShadow` | `getShadow` |
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

Wire in parent: `Sub toastchart_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (16)
- `AddCategories(cats As List)` _(public)_
- `AddCategory(catName As String)` _(public)_
- `AddColors(cats As List)` _(public)_
- `AddComponent()` _(public)_
- `AddPlotBandRange(iStart As Object, iEnd As String, sColor As String)` _(public)_
- `AddSeries(SeriesName As String, values As List)` _(public)_
- `AddSeriesCategoryValue(seriesName As String, catName As String, value As Object)` _(public)_
- `AddSeriesValue(SeriesName As String, value As Object)` _(public)_
- `AddXY(X As String, y As Object)` _(public)_
- `Clear()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `OnEvent(event As String, methodName As String)` _(public)_
- `PlotBandInitialize()` _(public)_
- `Refresh()` _(public)_
- `Remove()` _(public)_

## Key Setters (52)
- `setAttributes(s As String)` _(public)_
- `setChartType(s As String)` _(public)_
- `setCircularAxisScaleMax(i As Int)` _(public)_
- `setCircularAxisScaleMin(i As Int)` _(public)_
- `setCircularAxisTitleText(s As String)` _(public)_
- `setCircularLabelMargin(i As Int)` _(public)_
- `setClasses(s As String)` _(public)_
- `setEnabled(b As Boolean)` _(public)_
- `setExportMenuFileName(s As String)` _(public)_
- `setExportMenuVisible(b As Boolean)` _(public)_
- `setHeight(s As String)` _(public)_
- `setLegendPosition(s As String)` _(public)_
- `setLegendShowCheckbox(b As Boolean)` _(public)_
- `setLegendVisible(b As Boolean)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setParentID(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setPositionStyle(s As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `setRounded(s As String)` _(public)_
- `setRoundedBox(b As Boolean)` _(public)_
- `setSeriesAngleRangeEnd(i As Int)` _(public)_
- `setSeriesAngleRangeStart(i As Int)` _(public)_
- `setSeriesClockWise(b As Boolean)` _(public)_
- `setSeriesDataLabelsAnchor(s As String)` _(public)_
- `setSeriesDataLabelsOffsetX(s As String)` _(public)_
- `setSeriesDataLabelsOffsetY(s As String)` _(public)_
- `setSeriesDataLabelsPieSeriesNameAnchorOuter(b As Boolean)` _(public)_
- `setSeriesDataLabelsPieSeriesNameVisible(b As Boolean)` _(public)_
- `setSeriesDataLabelsVisible(b As Boolean)` _(public)_
- `setSeriesDiverging(b As Boolean)` _(public)_
- `setSeriesSelectable(b As Boolean)` _(public)_
- `setSeriesShift(b As Boolean)` _(public)_
- `setSeriesShowDot(b As Boolean)` _(public)_
- `setSeriesSolidClockHand(b As Boolean)` _(public)_
- `setSeriesSpline(b As Boolean)` _(public)_
- `setSeriesStacked(b As Boolean)` _(public)_
- `setSeriesStackedPercent(b As Boolean)` _(public)_
- `setSeriesZoomable(b As Boolean)` _(public)_
- `setShadow(s As String)` _(public)_
- `setStyles(s As String)` _(public)_
- `setThemePlotBandsBarWidth(i As Int)` _(public)_
- `setTitleAlign(s As String)` _(public)_
- `setTitleText(s As String)` _(public)_
- `setVisible(b As Boolean)` _(public)_
- `setWidth(s As String)` _(public)_
- `setXAxisDateFormat(s As String)` _(public)_
- `setXAxisPointOnColumn(b As Boolean)` _(public)_
- `setXAxisTitle(s As String)` _(public)_
- `setYAxisTitle(s As String)` _(public)_
- `setYAxisTitleAlign(s As String)` _(public)_

## Getters (54)
- `getAttributes()` _(public)_
- `getChartType()` _(public)_
- `getCircularAxisScaleMax()` _(public)_
- `getCircularAxisScaleMin()` _(public)_
- `getCircularAxisTitleText()` _(public)_
- `getClasses()` _(public)_
- `getEnabled()` _(public)_
- `getExportMenuFileName()` _(public)_
- `getExportMenuVisible()` _(public)_
- `getHeight()` _(public)_
- `getHere()` As String _(public)_
- `getiCircularLabelMargin()` _(public)_
- `getID()` As String _(public)_
- `getLegendPosition()` _(public)_
- `getLegendShowCheckbox()` _(public)_
- `getLegendVisible()` _(public)_
- `getMarginAXYTBLR()` _(public)_
- `getPaddingAXYTBLR()` _(public)_
- `getParentID()` _(public)_
- `getPosition()` _(public)_
- `getPositionStyle()` _(public)_
- `GetProperties()` _(public)_
- `getRounded()` _(public)_
- `getRoundedBox()` _(public)_
- `getSeriesAngleRangeEnd()` _(public)_
- `getSeriesAngleRangeStart()` _(public)_
- `getSeriesClockWise()` _(public)_
- `getSeriesDataLabelsAnchor()` _(public)_
- `getSeriesDataLabelsOffsetX()` _(public)_
- `getSeriesDataLabelsOffsetY()` _(public)_
- `getSeriesDataLabelsPieSeriesNameAnchorOuter()` _(public)_
- `getSeriesDataLabelsPieSeriesNameVisible()` _(public)_
- `getSeriesDataLabelsVisible()` _(public)_
- `getSeriesDiverging()` _(public)_
- `getSeriesSelectable()` _(public)_
- `getSeriesShift()` _(public)_
- `getSeriesShowDot()` _(public)_
- `getSeriesSolidClockHand()` _(public)_
- `getSeriesSpline()` _(public)_
- `getSeriesStacked()` _(public)_
- `getSeriesStackedPercent()` _(public)_
- `getSeriesZoomable()` _(public)_
- `getShadow()` _(public)_
- `getStyles()` _(public)_
- `getThemePlotBandsBarWidth()` _(public)_
- `getTitleAlign()` _(public)_
- `getTitleText()` _(public)_
- `getVisible()` _(public)_
- `getWidth()` _(public)_
- `getXAxisDateFormat()` _(public)_
- `getXAxisPointOnColumn()` _(public)_
- `getXAxisTitle()` _(public)_
- `getYAxisTitle()` _(public)_
- `getYAxisTitleAlign()` _(public)_

## Private Methods (1)
- `SetDefaults()` _(private)_

## Verified Demo Usage

Real syntax from [`pgToastCharts.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgToastCharts.bas) (verified demo):

```b4j
Private chart1 As SDUI5ToastChart		'ignore
Private chart10 As SDUI5ToastChart		'ignore
Private chart11 As SDUI5ToastChart		'ignore
Private chart12 As SDUI5ToastChart		'ignore
Private chart13 As SDUI5ToastChart		'ignore
Private chart14 As SDUI5ToastChart		'ignore
Private chart15 As SDUI5ToastChart		'ignore
Private chart16 As SDUI5ToastChart		'ignore
Private chart17 As SDUI5ToastChart		'ignore
Private chart18 As SDUI5ToastChart		'ignore
Private chart19 As SDUI5ToastChart		'ignore
BANano.Await(SDUI5Container1.AddComponent)
```

## Emits (daisyUI classes pushed in DesignerCreateView)
**Classes**: `rounded-box`
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim toastchart As SDUI5ToastChart
toastchart.Initialize(Me, "SDUI5ToastChart", "SDUI5ToastChart")
toastchart.ParentID = "placeholder"
BANano.Await(toastchart.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.
