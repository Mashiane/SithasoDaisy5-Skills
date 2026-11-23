---
name: SDUI5FrappeGantt
description: SithasoDaisy5 SDUI5FrappeGantt component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5FrappeGantt

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5FrappeGantt.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5FrappeGantt.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgFrappeGantt.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgFrappeGantt.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5FrappeGantt provides an interactive SVG Gantt chart with drag-and-drop timeline manipulation, dependency linking, progress tracking, weekend shading, and multiple view modes (Day, Week, Month, Year). Use for project management, sprint roadmaps, and scheduling timelines.
_SDUI5FrappeGantt is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `ViewMode` | String | Day | Day, Half Day, Hour, Month, Quarter Day, Week, Year | `setViewMode` | `getViewMode` |
| `ViewModes` | String | Quarter Day;Half Day;Day;Week;Month;Year | — | `setViewModes` | `getViewModes` |
| `DateFormat` | String | YYYY-MM-DD | — | `setDateFormat` | `getDateFormat` |
| `Language` | String | en | de, en, es, fr, hu, it, ptBr, ru, tr, zh | `setLanguage` | `getLanguage` |
| `BarHeight` | Int | 30 | — | `setBarHeight` | `getBarHeight` |
| `BarCornerRadius` | Int | 3 | — | `setBarCornerRadius` | `getBarCornerRadius` |
| `ArrowCurve` | Int | 5 | — | `setArrowCurve` | `getArrowCurve` |
| `Padding` | Int | 18 | — | `setPadding` | `getPadding` |
| `UpperHeaderHeight` | Int | 45 | — | `setUpperHeaderHeight` | `getUpperHeaderHeight` |
| `LowerHeaderHeight` | Int | 30 | — | `setLowerHeaderHeight` | `getLowerHeaderHeight` |
| `ColumnWidth` | Int | 45 | — | `setColumnWidth` | `getColumnWidth` |
| `Lines` | String | both | both, horizontal, none, vertical | `setLines` | `getLines` |
| `Popup` | Boolean | True | — | `setPopup` | `getPopup` |
| `PopupOn` | String | click | click, hover | `setPopupOn` | `getPopupOn` |
| `ScrollTo` | String | today | end, start, today | `setScrollTo` | `getScrollTo` |
| `TodayButton` | Boolean | True | — | `setTodayButton` | `getTodayButton` |
| `ViewModeSelect` | Boolean | False | — | `setViewModeSelect` | `getViewModeSelect` |
| `AutoMoveLabel` | Boolean | False | — | `setAutoMoveLabel` | `getAutoMoveLabel` |
| `MoveDependencies` | Boolean | True | — | `setMoveDependencies` | `getMoveDependencies` |
| `ShowExpectedProgress` | Boolean | False | — | `setShowExpectedProgress` | `getShowExpectedProgress` |
| `IgnoreWeekends` | Boolean | False | — | `setIgnoreWeekends` | `getIgnoreWeekends` |
| `Readonly` | Boolean | False | — | `setReadonly` | `getReadonly` |
| `ReadonlyDates` | Boolean | False | — | `setReadonlyDates` | `getReadonlyDates` |
| `ReadonlyProgress` | Boolean | False | — | `setReadonlyProgress` | `getReadonlyProgress` |
| `FixedDuration` | Boolean | False | — | `setFixedDuration` | `getFixedDuration` |
| `HoverOnDate` | Boolean | False | — | `setHoverOnDate` | `getHoverOnDate` |
| `SnapAt` | String | 1d | — | `setSnapAt` | `getSnapAt` |
| `InfinitePadding` | Boolean | True | — | `setInfinitePadding` | `getInfinitePadding` |
| `ContainerHeight` | String | auto | — | `setContainerHeight` | `getContainerHeight` |
| `BarColor` | String | — | — | `setBarColor` | `getBarColor` |
| `BarLabelColor` | String | — | — | `setBarLabelColor` | `getBarLabelColor` |
| `BarProgressColor` | String | — | — | `setBarProgressColor` | `getBarProgressColor` |
| `ArrowColor` | String | — | — | `SetArrowColorWidth` | — |
| `ArrowWidth` | String | — | — | `SetArrowColorWidth` | — |
| `TickColor` | String | — | — | `setTickColor` | `getTickColor` |
| `ExpectedProgressColor` | String | — | — | `setExpectedProgressColor` | `getExpectedProgressColor` |
| `TodayHighlightColor` | String | — | — | `setTodayHighlightColor` | `getTodayHighlightColor` |
| `WeekendHighlightColor` | String | — | — | `setWeekendHighlightColor` | `getWeekendHighlightColor` |
| `Height` | String | 500px | — | `setHeight` | `getHeight` |
| `Width` | String | 100% | — | `setWidth` | `getWidth` |
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
`Click`, `DoubleClick`, `DateChange`, `ProgressChange`, `ViewChange`, `Hover`, `DateClick`

Wire in parent: `Sub frappegantt_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (81)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Refresh()` _(public)_
- `RefreshTasks(tasksList As List)` _(public)_
- `UpdateTask(taskID As String, newDetails As Map)` _(public)_
- `AddComponent()` _(public)_
- `AddToParent(targetID As String, props As Map)` _(public)_
- `AddFrappeGantt(Callback As Object, ParentID As String, ID As String)` _(public)_
- `Remove()` _(public)_
- `Show()` _(public)_
- `Hide()` _(public)_
- `Enable()` _(public)_
- `Disable()` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `OnEvent(event As String, methodName As String)` _(public)_
- `shadow(s As String)` _(public)_
- `RoundedBox()` _(public)_
- `ApplyStyles()` _(public)_
- `SetArrowColorWidth(c As String, w As String)` _(public)_
- `AddCustomClass(className As String, barColor As String, barProgressColor As String, barLabelColor As String)` _(public)_
- `ClearTasks()` As SDUI5FrappeGantt _(public)_
- `Clear()` As SDUI5FrappeGantt _(public)_
- `AddTaskObject(obj As Map)` As SDUI5FrappeGantt _(public)_
- `AddTask(tID As String, tName As String, tStart As String, tEnd As String, tProgress As Int)` As SDUI5FrappeGantt _(public)_
- `AddTask1(tID As String, tName As String, tStart As String, tEnd As String, tProgress As Int, tClass As String)` As SDUI5FrappeGantt _(public)_
- `AddTask2(tID As String, tName As String, tStart As String, tEnd As String, tProgress As Int, tClass As String, tDependencies As List)` As SDUI5FrappeGantt _(public)_
- `AddTask3(tID As String, tName As String, tStart As String, tEnd As String, tProgress As Int, tClass As String, tDependencies As List, tDescription As String, tColor As String, tColorProgress As String, tThumbnail As String)` As SDUI5FrappeGantt _(public)_
- `AddTask4(tID As String, tName As String, tStart As String, tEnd As String, tProgress As Int, tExpectedProgress As Double, tClass As String, tDependencies As List, tDescription As String, tColor As String, tColorProgress As String, tThumbnail As String)` As SDUI5FrappeGantt _(public)_
- `AddTaskDuration(tID As String, tName As String, tStart As String, tDuration As String, tProgress As Int)` As SDUI5FrappeGantt _(public)_
- `AddTaskWithDuration(tID As String, tName As String, tStart As String, tDuration As String, tProgress As Int, tClass As String, tDependencies As List, tDescription As String, tColor As String, tColorProgress As String, tThumbnail As String)` As SDUI5FrappeGantt _(public)_
- `SetTasks(taskList As List)` As SDUI5FrappeGantt _(public)_
- `GetTasks()` As List _(public)_
- `GetTask(tID As String)` As Map _(public)_
- `HasTask(tID As String)` As Boolean _(public)_
- `DeleteTask(tID As String)` As SDUI5FrappeGantt _(public)_
- `GetTaskCount()` As Int _(public)_
- `GetTaskIds()` As List _(public)_
- `SetTaskClass(tID As String, tCustomClass As String)` As SDUI5FrappeGantt _(public)_
- `SetTaskDependencies(tID As String, tDependencies As List)` As SDUI5FrappeGantt _(public)_
- `SetTaskExpectedProgress(tID As String, ExpectedProgress As Double)` As SDUI5FrappeGantt _(public)_
- `SetTaskColor(tID As String, color As String, progressColor As String)` As SDUI5FrappeGantt _(public)_
- `SetTaskColor1(tID As String, color As String)` As SDUI5FrappeGantt _(public)_
- `SetTaskColorByID(tID As String, barColor As String, progressColor As String, labelColor As String)` As SDUI5FrappeGantt _(public)_
- `SetTaskColors(colorsMap As Map)` As SDUI5FrappeGantt _(public)_
- `SetTaskElementColor(tID As String, barColor As String)` As SDUI5FrappeGantt _(public)_
- `SetTaskElementProgressColor(tID As String, progressColor As String)` As SDUI5FrappeGantt _(public)_
- `SetTaskElementLabelColor(tID As String, labelColor As String)` As SDUI5FrappeGantt _(public)_
- `SetTaskDescription(tID As String, description As String)` As SDUI5FrappeGantt _(public)_
- `SetTaskThumbnail(tID As String, thumbnailURL As String)` As SDUI5FrappeGantt _(public)_
- `SetTaskDates(tID As String, startDate As String, endDate As String)` As SDUI5FrappeGantt _(public)_
- `SetTaskProgress(tID As String, progress As Int)` As SDUI5FrappeGantt _(public)_
- `ChangeViewMode(mode As String)` _(public)_
- `ChangeViewMode1(mode As String, maintainPos As Boolean)` _(public)_
- `DayMode()` _(public)_
- `HalfDayMode()` _(public)_
- `QuarterDayMode()` _(public)_
- `HourMode()` _(public)_
- `WeekMode()` _(public)_
- `MonthMode()` _(public)_
- `YearMode()` _(public)_
- `ScrollCurrent()` _(public)_
- `ScrollToToday()` _(public)_
- `ScrollTo(pos As String)` _(public)_
- `UnselectAll()` _(public)_
- `HidePopup()` _(public)_
- `UpdateOptions(newOptions As Map)` _(public)_
- `GetGantt()` As BANanoObject _(public)_
- `GetTaskBar(tID As String)` As BANanoObject _(public)_
- `GetTaskFromGantt(tID As String)` As BANanoObject _(public)_
- `SetThemeVariable(varName As String, varValue As String)` As SDUI5FrappeGantt _(public)_
- `SetHeaderBackground(color As String)` As SDUI5FrappeGantt _(public)_
- `SetRowColor(color As String)` As SDUI5FrappeGantt _(public)_
- `SetRowBorderColor(color As String)` As SDUI5FrappeGantt _(public)_
- `AddDaisyUIThemeClasses()` As SDUI5FrappeGantt _(public)_
- `AddHoliday(dateStr As String, holidayName As String, highlightColor As String)` As SDUI5FrappeGantt _(public)_
- `AddHolidays(highlightColor As String, dateList As List)` As SDUI5FrappeGantt _(public)_
- `ClearHolidays()` As SDUI5FrappeGantt _(public)_
- `AddIgnoredDate(dateStr As String)` As SDUI5FrappeGantt _(public)_
- `SetIgnoredDates(dateList As List)` As SDUI5FrappeGantt _(public)_
- `ClearIgnoredDates()` As SDUI5FrappeGantt _(public)_
## Key Setters (53)
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
- `setWidth(s As String)` _(public)_
- `setHeight(s As String)` _(public)_
- `setBarColor(s As String)` _(public)_
- `setBarLabelColor(s As String)` _(public)_
- `setBarProgressColor(s As String)` _(public)_
- `setTickColor(s As String)` _(public)_
- `setTodayHighlightColor(color As String)` _(public)_
- `setWeekendHighlightColor(color As String)` _(public)_
- `setExpectedProgressColor(color As String)` _(public)_
- `setIgnoreWeekends(b As Boolean)` _(public)_
- `setViewMode(s As String)` _(public)_
- `setViewModes(s As String)` _(public)_
- `setDateFormat(s As String)` _(public)_
- `setLanguage(s As String)` _(public)_
- `setBarHeight(i As Int)` _(public)_
- `setBarCornerRadius(i As Int)` _(public)_
- `setArrowCurve(i As Int)` _(public)_
- `setPadding(i As Int)` _(public)_
- `setUpperHeaderHeight(i As Int)` _(public)_
- `setLowerHeaderHeight(i As Int)` _(public)_
- `setHeaderHeight(i As Int)` _(public)_
- `setColumnWidth(i As Int)` _(public)_
- `setStepValue(i As Int)` _(public)_
- `setLines(s As String)` _(public)_
- `setPopup(b As Boolean)` _(public)_
- `setPopupOn(s As String)` _(public)_
- `setScrollTo(s As String)` _(public)_
- `setTodayButton(b As Boolean)` _(public)_
- `setViewModeSelect(b As Boolean)` _(public)_
- `setAutoMoveLabel(b As Boolean)` _(public)_
- `setMoveDependencies(b As Boolean)` _(public)_
- `setShowExpectedProgress(b As Boolean)` _(public)_
- `setReadonly(b As Boolean)` _(public)_
- `setReadonlyDates(b As Boolean)` _(public)_
- `setReadonlyProgress(b As Boolean)` _(public)_
- `setFixedDuration(b As Boolean)` _(public)_
- `setHoverOnDate(b As Boolean)` _(public)_
- `setSnapAt(s As String)` _(public)_
- `setContainerHeight(s As String)` _(public)_
- `setInfinitePadding(b As Boolean)` _(public)_
- `setCustomPopupHtml(s As Object)` _(public)_
- `setHolidays(h As Object)` _(public)_
- `setIgnore(ig As Object)` _(public)_
## Getters (54)
- `getID()` As String _(public)_
- `getHere()` As String _(public)_
- `getName()` As String _(public)_
- `getParentID()` As String _(public)_
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
- `getHeight()` As String _(public)_
- `getBarColor()` As String _(public)_
- `getBarLabelColor()` As String _(public)_
- `getBarProgressColor()` As String _(public)_
- `getTickColor()` As String _(public)_
- `getTodayHighlightColor()` As String _(public)_
- `getWeekendHighlightColor()` As String _(public)_
- `getExpectedProgressColor()` As String _(public)_
- `getIgnoreWeekends()` As Boolean _(public)_
- `getViewMode()` As String _(public)_
- `getViewModes()` As String _(public)_
- `getDateFormat()` As String _(public)_
- `getLanguage()` As String _(public)_
- `getBarHeight()` As Int _(public)_
- `getBarCornerRadius()` As Int _(public)_
- `getArrowCurve()` As Int _(public)_
- `getPadding()` As Int _(public)_
- `getUpperHeaderHeight()` As Int _(public)_
- `getLowerHeaderHeight()` As Int _(public)_
- `getColumnWidth()` As Int _(public)_
- `getLines()` As String _(public)_
- `getPopup()` As Boolean _(public)_
- `getPopupOn()` As String _(public)_
- `getScrollTo()` As String _(public)_
- `getTodayButton()` As Boolean _(public)_
- `getViewModeSelect()` As Boolean _(public)_
- `getAutoMoveLabel()` As Boolean _(public)_
- `getMoveDependencies()` As Boolean _(public)_
- `getShowExpectedProgress()` As Boolean _(public)_
- `getReadonly()` As Boolean _(public)_
- `getReadonlyDates()` As Boolean _(public)_
- `getReadonlyProgress()` As Boolean _(public)_
- `getFixedDuration()` As Boolean _(public)_
- `getHoverOnDate()` As Boolean _(public)_
- `getSnapAt()` As String _(public)_
- `getContainerHeight()` As String _(public)_
- `getInfinitePadding()` As Boolean _(public)_
- `getCustomPopupHtml()` As Object _(public)_
- `getHolidays()` As Object _(public)_
- `getIgnore()` As Object _(public)_
## Private Methods (2)
- `SetDefaults()` _(private)_
- `BuildOptions()` _(private)_
## Verified Demo Usage

Real syntax from [`pgFrappeGantt.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgFrappeGantt.bas) (verified demo):

```b4j
Private ganttInteractive As SDUI5FrappeGantt		'ignore
BANano.Await(app.UsesFrappeGantt)
ganttInteractive.Initialize(Me, "ganttInteractive", "ganttInteractive")
ganttInteractive.ParentID = "SDUI5ColGantt1"
ganttInteractive.ViewMode = "Day"
ganttInteractive.TodayButton = True
ganttInteractive.Lines = "both"
ganttInteractive.MoveDependencies = True
ganttInteractive.Height = "360px"
BANano.Await(ganttInteractive.AddComponent)

ganttInteractive.ClearTasks
ganttInteractive.AddTask3("task-1", "Requirements", "2026-11-01", "2026-11-05", 100, "", Null, "Initial scoping", "", "", "")
ganttInteractive.AddTask3("task-2", "Architecture", "2026-11-05", "2026-11-10", 90, "", Array("task-1"), "Design & schemas", "", "", "")
ganttInteractive.Refresh
```
## Emits (daisyUI classes pushed in DesignerCreateView)
_(none emitted directly — relies on base/CustProps)_
## Code Example
```b4j
BANano.Await(app.UsesFrappeGantt)
Dim gantt As SDUI5FrappeGantt
gantt.Initialize(Me, "gantt", "gantt")
gantt.ParentID = "ganttWrapper"
gantt.ViewMode = "Day"
gantt.Lines = "both"
gantt.TodayButton = True
gantt.Height = "400px"
BANano.Await(gantt.AddComponent)

gantt.ClearTasks
gantt.AddTask3("t1", "API Design", "2026-11-10", "2026-11-15", 80, "", Null, "REST Endpoints", "", "", "")
gantt.AddTask3("t2", "Frontend", "2026-11-15", "2026-11-25", 30, "", Array("t1"), "UI Layouts", "", "", "")
gantt.Refresh
```
## Composes With
- Mounts inside **SDUI5Column**, **SDUI5Container**, or **SDUI5Card**.
- Requires asset registration via `BANano.Await(app.UsesFrappeGantt)` before `AddComponent`.
- Dispatches `${mEventName}_Click(task As Map)`, `${mEventName}_DateChange(task As Map, start As String, end_date As String)`, `${mEventName}_ProgressChange(task As Map, progress As Int)`, and `${mEventName}_ViewChange(mode As String)` to parent callback.
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width).
