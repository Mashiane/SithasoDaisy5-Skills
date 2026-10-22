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
## Public Methods (18)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `OnEvent(event As String, methodName As String)` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Clear()` _(public)_
- `AddSeriesCategoryValue(seriesName As String, catName As String, value As Object)` _(public)_
- `AddCategory(catName As String)` _(public)_
- `AddCategories(cats As List)` _(public)_
- `AddColors(cats As List)` _(public)_
- `AddSeries(SeriesName As String, values As List)` _(public)_
- `AddXY(X As String, y As Object)` _(public)_
- `AddSeriesValue(SeriesName As String, value As Object)` _(public)_
- `Refresh()` _(public)_
- `PlotBandInitialize()` _(public)_
- `AddPlotBandRange(iStart As Object, iEnd As String, sColor As String)` _(public)_
## Key Setters (51)
- `setParentID(s As String)` _(public)_
- `setVisible(b As Boolean)` _(public)_
- `setEnabled(b As Boolean)` _(public)_
- `setPositionStyle(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setAttributes(s As String)` _(public)_
- `setSeriesShift(b As Boolean)` _(public)_
- `setStyles(s As String)` _(public)_
- `setClasses(s As String)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setRounded(s As String)` _(public)_
- `setRoundedBox(b As Boolean)` _(public)_
- `setShadow(s As String)` _(public)_
- `setChartType(s As String)` _(public)_
- `setExportMenuFileName(s As String)` _(public)_
- `setExportMenuVisible(b As Boolean)` _(public)_
- `setHeight(s As String)` _(public)_
- `setLegendPosition(s As String)` _(public)_
- `setLegendShowCheckbox(b As Boolean)` _(public)_
- `setLegendVisible(b As Boolean)` _(public)_
- `setSeriesDataLabelsOffsetX(s As String)` _(public)_
- `setSeriesDataLabelsOffsetY(s As String)` _(public)_
- `setSeriesDataLabelsPieSeriesNameVisible(b As Boolean)` _(public)_
- `setSeriesDataLabelsPieSeriesNameAnchorOuter(b As Boolean)` _(public)_
- `setSeriesDataLabelsAnchor(s As String)` _(public)_
- `setSeriesAngleRangeStart(i As Int)` _(public)_
- `setSeriesAngleRangeEnd(i As Int)` _(public)_
- `setSeriesClockWise(b As Boolean)` _(public)_
- `setSeriesDataLabelsVisible(b As Boolean)` _(public)_
- `setSeriesSelectable(b As Boolean)` _(public)_
- `setSeriesShowDot(b As Boolean)` _(public)_
- `setSeriesSpline(b As Boolean)` _(public)_
- `setSeriesStacked(b As Boolean)` _(public)_
- `setSeriesStackedPercent(b As Boolean)` _(public)_
- `setSeriesZoomable(b As Boolean)` _(public)_
- `setTitleAlign(s As String)` _(public)_
- `setTitleText(s As String)` _(public)_
- `setWidth(s As String)` _(public)_
- `setXAxisDateFormat(s As String)` _(public)_
- `setXAxisPointOnColumn(b As Boolean)` _(public)_
- `setXAxisTitle(s As String)` _(public)_
- `setYAxisTitle(s As String)` _(public)_
- `setSeriesDiverging(b As Boolean)` _(public)_
- `setYAxisTitleAlign(s As String)` _(public)_
- `setCircularAxisTitleText(s As String)` _(public)_
- `setCircularAxisScaleMin(i As Int)` _(public)_
- `setCircularAxisScaleMax(i As Int)` _(public)_
- `setCircularLabelMargin(i As Int)` _(public)_
- `setThemePlotBandsBarWidth(i As Int)` _(public)_
- `setSeriesSolidClockHand(b As Boolean)` _(public)_
## Getters (53)
- `getID()` As String _(public)_
- `getParentID()` As String _(public)_
- `getHere()` As String _(public)_
- `getVisible()` As Boolean _(public)_
- `getEnabled()` As Boolean _(public)_
- `getPositionStyle()` As String _(public)_
- `getPosition()` As String _(public)_
- `getSeriesShift()` As Boolean _(public)_
- `getAttributes()` As String _(public)_
- `getStyles()` As String _(public)_
- `getClasses()` As String _(public)_
- `getPaddingAXYTBLR()` As String _(public)_
- `getMarginAXYTBLR()` As String _(public)_
- `getShadow()` As String _(public)_
- `getRounded()` As String _(public)_
- `getRoundedBox()` As Boolean _(public)_
- `getSeriesDataLabelsPieSeriesNameAnchorOuter()` As Boolean _(public)_
- `getSeriesAngleRangeStart()` As Int _(public)_
- `getSeriesAngleRangeEnd()` As Int _(public)_
- `getSeriesClockWise()` As Boolean _(public)_
- `getSeriesDataLabelsAnchor()` As String _(public)_
- `getChartType()` As String _(public)_
- `getExportMenuFileName()` As String _(public)_
- `getExportMenuVisible()` As Boolean _(public)_
- `getHeight()` As String _(public)_
- `getLegendPosition()` As String _(public)_
- `getLegendShowCheckbox()` As Boolean _(public)_
- `getLegendVisible()` As Boolean _(public)_
- `getSeriesDataLabelsOffsetX()` As String _(public)_
- `getSeriesDataLabelsOffsetY()` As String _(public)_
- `getSeriesDataLabelsPieSeriesNameVisible()` As Boolean _(public)_
- `getSeriesDataLabelsVisible()` As Boolean _(public)_
- `getSeriesSelectable()` As Boolean _(public)_
- `getSeriesShowDot()` As Boolean _(public)_
- `getSeriesSpline()` As Boolean _(public)_
- `getSeriesStacked()` As Boolean _(public)_
- `getSeriesStackedPercent()` As Boolean _(public)_
- `getSeriesZoomable()` As Boolean _(public)_
- `getSeriesDiverging()` As Boolean _(public)_
- `getTitleAlign()` As String _(public)_
- `getTitleText()` As String _(public)_
- `getWidth()` As String _(public)_
- `getXAxisDateFormat()` As String _(public)_
- `getXAxisPointOnColumn()` As Boolean _(public)_
- `getXAxisTitle()` As String _(public)_
- `getYAxisTitle()` As String _(public)_
- `getYAxisTitleAlign()` As String _(public)_
- `getCircularAxisTitleText()` As String _(public)_
- `getiCircularLabelMargin()` As Int _(public)_
- `getCircularAxisScaleMax()` As Int _(public)_
- `getCircularAxisScaleMin()` As Int _(public)_
- `getThemePlotBandsBarWidth()` As Int _(public)_
- `getSeriesSolidClockHand()` As Boolean _(public)_
## Private Methods (1)
- `SetDefaults()` _(private)_
## Verified Demo Usage

Real syntax from [`pgToastCharts.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgToastCharts.bas) (verified demo). `chart20` = a SDUI5ToastChart.

```b4j
	chart20.Initialize(Me, "chart20", "chart20")
	chart20.ParentID = "SDUI5Column20"
	chart20.ChartType = "bar"
	chart20.Enabled = True
	chart20.ExportMenuFileName = ""
	chart20.ExportMenuVisible = True
	chart20.Height = "400px"
	chart20.LegendPosition = "right"
	chart20.LegendShowCheckbox = True
	chart20.LegendVisible = True
	chart20.MarginAXYTBLR = "a=?; x=?; y=?; t=?; b=?; l=?; r=?"
	chart20.PaddingAXYTBLR = "a=?; x=?; y=?; t=?; b=?; l=?; r=?"
	chart20.Position = "t=?; b=?; r=?; l=?"
	chart20.PositionStyle = "none"
	chart20.Attributes = ""
	chart20.Classes = ""
	chart20.Styles = ""
	chart20.Rounded = "none"
	chart20.RoundedBox = False
	chart20.SeriesDataLabelsOffsetX = ""
	chart20.SeriesDataLabelsOffsetY = ""
	chart20.SeriesDataLabelsPieSeriesNameVisible = False
	chart20.SeriesDataLabelsVisible = False
	chart20.SeriesSelectable = False
	chart20.SeriesShowDot = False
	chart20.SeriesSpline = False
	chart20.SeriesStacked = False
	chart20.SeriesZoomable = False
	'   ... (see demo source for the rest)
```

Builder methods, real call order (from `pgToastCharts.bas`):

```b4j
	chart10.AddCategories(Array("01/01/2020", "02/01/2020","03/01/2020", "04/01/2020", "05/01/2020", "06/01/2020", "07/01/2020", "08/01/2020", "09/01/2020", "10/01/2020", "11/01/2020", "12/01/2020"))
	chart10.AddSeries("Seoul", Array(-3.5, -1.1, 4.0, 11.3, 17.5, 21.5, 25.9, 27.2, 24.4, 13.9, 6.6, -0.6))
	chart10.AddSeries("Seattle", Array(3.8, 5.6, 7.0, 9.1, 12.4, 15.3, 17.5, 17.8, 15.0, 10.6, 6.6, 3.7))
	chart10.AddSeries("Sydney", Array(22.1, 22.0, 20.9, 18.3, 15.2, 12.8, 11.8, 13.0, 15.2, 17.6, 19.4, 21.2))
	chart10.AddSeries("Moscow", Array(-10.3, -9.1, -4.1, 4.4, 12.2, 16.3, 18.5, 16.7, 10.9, 4.2, -2.0, -7.5))
	chart10.AddSeries("Jungfrau", Array(-13.2, -13.7, -13.1, -10.3, -6.1, -3.2, 0.0, -0.1, -1.8, -4.5, -9.0, -10.9))
```

Also used in: `pgBottomDrawer`
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


