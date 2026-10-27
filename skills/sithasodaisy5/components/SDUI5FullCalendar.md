---
name: SDUI5FullCalendar
description: SithasoDaisy5 SDUI5FullCalendar component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5FullCalendar

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5FullCalendar.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5FullCalendar.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgFullCalendar.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgFullCalendar.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5FullCalendar is a full calendar (FullCalendar) with events. Use for scheduling/event display.
_SDUI5FullCalendar is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `InitialDate` | String | now | — | `setInitialDate` | `getInitialDate` |
| `InitialView` | String | dayGridMonth | dayGridMonth, dayGridWeek, listMonth, listWeek, timeGridDay, timeGridWeek, multiMonthYear | `setInitialView` | `getInitialView` |
| `Height` | String | auto | — | `setHeight` | `getHeight` |
| `MonthText` | String | month | — | `setMonthText` | `getMonthText` |
| `DayText` | String | day | — | `setDayText` | `getDayText` |
| `ToDayText` | String | today | — | `setToDayText` | `getToDayText` |
| `WeekText` | String | week | — | `setWeekText` | `getWeekText` |
| `AspectRatio` | String | 3 | — | `setAspectRatio` | `getAspectRatio` |
| `BusinessHours` | Boolean | False | — | `setBusinessHours` | `getBusinessHours` |
| `ButtonIcons` | Boolean | True | — | `setButtonIcons` | `getButtonIcons` |
| `ContentHeight` | String | auto | — | `setContentHeight` | `getContentHeight` |
| `DayMaxEvents` | Boolean | True | — | `setDayMaxEvents` | `getDayMaxEvents` |
| `Droppable` | Boolean | True | — | `setDroppable` | `getDroppable` |
| `Editable` | Boolean | True | — | `setEditable` | `getEditable` |
| `ExpandRows` | Boolean | False | — | `setExpandRows` | `getExpandRows` |
| `HeaderToolbarCenter` | String | title | — | `setHeaderToolbarCenter` | `getHeaderToolbarCenter` |
| `HeaderToolbarLeft` | String | prevYear;prev;next;nextYear today | — | `setHeaderToolbarLeft` | `getHeaderToolbarLeft` |
| `HeaderToolbarRight` | String | dayGridMonth;timeGridWeek;timeGridDay;listMonth;multiMonthYear | — | `setHeaderToolbarRight` | `getHeaderToolbarRight` |
| `HeaderToolbarVisible` | Boolean | True | — | `setHeaderToolbarVisible` | `getHeaderToolbarVisible` |
| `ListText` | String | list | — | `setListText` | `getListText` |
| `Locale` | String | en | — | `setLocale` | `getLocale` |
| `NavLinks` | Boolean | True | — | `setNavLinks` | `getNavLinks` |
| `NextClickOn` | Boolean | False | — | `setNextClickOn` | `getNextClickOn` |
| `NowIndicator` | Boolean | True | — | `setNowIndicator` | `getNowIndicator` |
| `PrevClickOn` | Boolean | False | — | `setPrevClickOn` | `getPrevClickOn` |
| `ScrollTime` | String | 06:00:00 | — | `setScrollTime` | `getScrollTime` |
| `ScrollTimeReset` | Boolean | True | — | `setScrollTimeReset` | `getScrollTimeReset` |
| `SelectMirror` | Boolean | True | — | `setSelectMirror` | `getSelectMirror` |
| `Selectable` | Boolean | True | — | `setSelectable` | `getSelectable` |
| `SlotDuration` | String | 00:30:00 | — | `setSlotDuration` | `getSlotDuration` |
| `SlotMaxTime` | String | 24:00:00 | — | `setSlotMaxTime` | `getSlotMaxTime` |
| `SlotMinTime` | String | 00:00:00 | — | `setSlotMinTime` | `getSlotMinTime` |
| `WeekNumbers` | Boolean | False | — | `setWeekNumbers` | `getWeekNumbers` |
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
`EventClick`, `EventDrop`, `EventResize`, `Drop`, `DateClick`, `Select`, `NextMonth`, `PrevMonth`, `NextYear`, `PrevYear`, `DateRangeChange`

Wire in parent: `Sub fullcalendar_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (23)
- `AddComponent()` _(public)_
- `AddEvent(eID As String, egroupId As String, eTitle As String, eStart As String, eEnd As String, eAllDay As Boolean, eurl As String, eColor As String, eConstraint As String, eBackground As Boolean, eOverlap As Boolean)` _(public)_
- `changeView(vName As String)` _(public)_
- `ChangeViewDayGridMonth()` _(public)_
- `ChangeViewDayGridWeek()` _(public)_
- `ChangeViewListMonth()` _(public)_
- `ChangeViewListWeek()` _(public)_
- `ChangeViewTimeGridDay(day As String)` _(public)_
- `ChangeViewTimeGridWeek()` _(public)_
- `Clear()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `gotoDate(s As String)` _(public)_
- `gotoNextMonth()` _(public)_
- `gotoNextYear()` _(public)_
- `gotoPrevMonth()` _(public)_
- `gotoPrevYear()` _(public)_
- `gotoToday()` _(public)_
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `OnEvent(event As String, methodName As String)` _(public)_
- `Refresh()` _(public)_
- `Remove()` _(public)_
- `UnSelect()` _(public)_
- `UpdateLocale(s As String)` _(public)_

## Key Setters (45)
- `setAspectRatio(s As String)` _(public)_
- `setAttributes(s As String)` _(public)_
- `setBusinessHours(b As Boolean)` _(public)_
- `setButtonIcons(b As Boolean)` _(public)_
- `setClasses(s As String)` _(public)_
- `setContentHeight(s As String)` _(public)_
- `setDayMaxEvents(b As Boolean)` _(public)_
- `setDayText(s As String)` _(public)_
- `setDroppable(b As Boolean)` _(public)_
- `setEditable(b As Boolean)` _(public)_
- `setEnabled(b As Boolean)` _(public)_
- `setExpandRows(b As Boolean)` _(public)_
- `setHeaderToolbarCenter(s As String)` _(public)_
- `setHeaderToolbarLeft(s As String)` _(public)_
- `setHeaderToolbarRight(s As String)` _(public)_
- `setHeaderToolbarVisible(b As Boolean)` _(public)_
- `setHeight(s As String)` _(public)_
- `setInitialDate(s As String)` _(public)_
- `setInitialView(s As String)` _(public)_
- `setListText(s As String)` _(public)_
- `setLocale(s As String)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setMonthText(s As String)` _(public)_
- `setNavLinks(b As Boolean)` _(public)_
- `setNextClickOn(b As Boolean)` _(public)_
- `setNow(s As String)` _(public)_
- `setNowIndicator(b As Boolean)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setParentID(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setPositionStyle(s As String)` _(public)_
- `setPrevClickOn(b As Boolean)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `setScrollTime(s As String)` _(public)_
- `setScrollTimeReset(b As Boolean)` _(public)_
- `setSelectable(b As Boolean)` _(public)_
- `setSelectMirror(b As Boolean)` _(public)_
- `setSlotDuration(s As String)` _(public)_
- `setSlotMaxTime(s As String)` _(public)_
- `setSlotMinTime(s As String)` _(public)_
- `setStyles(s As String)` _(public)_
- `setToDayText(s As String)` _(public)_
- `setVisible(b As Boolean)` _(public)_
- `setWeekNumbers(b As Boolean)` _(public)_
- `setWeekText(s As String)` _(public)_

## Getters (49)
- `getAspectRatio()` _(public)_
- `getAttributes()` _(public)_
- `getBusinessHours()` _(public)_
- `getButtonIcons()` _(public)_
- `getClasses()` _(public)_
- `getContentHeight()` _(public)_
- `getCurrentDate()` _(public)_
- `getCurrentEndDate()` _(public)_
- `getCurrentStartDate()` _(public)_
- `getDayMaxEvents()` _(public)_
- `getDayText()` _(public)_
- `getDroppable()` _(public)_
- `getEditable()` _(public)_
- `getEnabled()` _(public)_
- `getExpandRows()` _(public)_
- `getHeaderToolbarCenter()` _(public)_
- `getHeaderToolbarLeft()` _(public)_
- `getHeaderToolbarRight()` _(public)_
- `getHeaderToolbarVisible()` _(public)_
- `getHeight()` _(public)_
- `getHere()` As String _(public)_
- `getID()` As String _(public)_
- `getInitialDate()` _(public)_
- `getInitialView()` _(public)_
- `getListText()` _(public)_
- `getLocale()` _(public)_
- `getMarginAXYTBLR()` _(public)_
- `getMonthText()` _(public)_
- `getNavLinks()` _(public)_
- `getNextClickOn()` _(public)_
- `getNowIndicator()` _(public)_
- `getPaddingAXYTBLR()` _(public)_
- `getParentID()` _(public)_
- `getPosition()` _(public)_
- `getPositionStyle()` _(public)_
- `getPrevClickOn()` _(public)_
- `GetProperties()` _(public)_
- `getScrollTime()` _(public)_
- `getScrollTimeReset()` _(public)_
- `getSelectable()` _(public)_
- `getSelectMirror()` _(public)_
- `getSlotDuration()` _(public)_
- `getSlotMaxTime()` _(public)_
- `getSlotMinTime()` _(public)_
- `getStyles()` _(public)_
- `getToDayText()` _(public)_
- `getVisible()` _(public)_
- `getWeekNumbers()` _(public)_
- `getWeekText()` _(public)_

## Private Methods (8)
- `DateRangeChange(dateInfo As Map)` _(private)_
- `EventClick(e As Map)` _(private)_
- `GetDateRange(dateInfo As Map)` As Map _(private)_
- `nextmonth(e As BANanoEvent)` _(private)_
- `nextyear(e As BANanoEvent)` _(private)_
- `prevmonth(e As BANanoEvent)` _(private)_
- `prevyear(e As BANanoEvent)` _(private)_
- `SetDefaults()` _(private)_

## Verified Demo Usage

Real syntax from [`pgFullCalendar.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgFullCalendar.bas) (verified demo):

```b4j
Private fc As SDUI5FullCalendar		'ignore
BANano.Await(SDUI5Container1.AddComponent)
```

## Emits (daisyUI classes pushed in DesignerCreateView)
_(none emitted directly — relies on base/CustProps)_
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim fullcalendar As SDUI5FullCalendar
fullcalendar.Initialize(Me, "SDUI5FullCalendar", "SDUI5FullCalendar")
fullcalendar.ParentID = "placeholder"
BANano.Await(fullcalendar.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.
