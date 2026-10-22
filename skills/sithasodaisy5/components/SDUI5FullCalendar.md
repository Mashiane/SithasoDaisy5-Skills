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
## Public Methods (25)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `OnEvent(event As String, methodName As String)` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Refresh()` As 'ignoredeadcode _(public)_
- `UpdateLocale(s As String)` _(public)_
- `gotoDate(s As String)` _(public)_
- `gotoToday()` _(public)_
- `gotoPrevMonth()` _(public)_
- `gotoNextMonth()` _(public)_
- `changeView(vName As String)` _(public)_
- `ChangeViewDayGridMonth()` _(public)_
- `ChangeViewDayGridWeek()` _(public)_
- `ChangeViewListMonth()` _(public)_
- `ChangeViewListWeek()` _(public)_
- `ChangeViewTimeGridDay(day As String)` _(public)_
- `ChangeViewTimeGridWeek()` _(public)_
- `gotoPrevYear()` _(public)_
- `gotoNextYear()` _(public)_
- `Clear()` _(public)_
- `AddEvent(eID As String, egroupId As String, eTitle As String, eStart As String, eEnd As String, eAllDay As Boolean, eurl As String, eColor As String, eConstraint As String, eBackground As Boolean, eOverlap As Boolean)` _(public)_
- `UnSelect()` _(public)_
## Key Setters (44)
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
- `setAspectRatio(s As String)` _(public)_
- `setBusinessHours(b As Boolean)` _(public)_
- `setButtonIcons(b As Boolean)` _(public)_
- `setContentHeight(s As String)` _(public)_
- `setDayMaxEvents(b As Boolean)` _(public)_
- `setDayText(s As String)` _(public)_
- `setDroppable(b As Boolean)` _(public)_
- `setEditable(b As Boolean)` _(public)_
- `setExpandRows(b As Boolean)` _(public)_
- `setHeaderToolbarCenter(s As String)` _(public)_
- `setHeaderToolbarLeft(s As String)` _(public)_
- `setHeaderToolbarRight(s As String)` _(public)_
- `setHeaderToolbarVisible(b As Boolean)` _(public)_
- `setHeight(s As String)` _(public)_
- `setInitialDate(s As String)` _(public)_
- `setNow(s As String)` _(public)_
- `setInitialView(s As String)` _(public)_
- `setListText(s As String)` _(public)_
- `setLocale(s As String)` _(public)_
- `setMonthText(s As String)` _(public)_
- `setNavLinks(b As Boolean)` _(public)_
- `setNextClickOn(b As Boolean)` _(public)_
- `setNowIndicator(b As Boolean)` _(public)_
- `setPrevClickOn(b As Boolean)` _(public)_
- `setScrollTime(s As String)` _(public)_
- `setScrollTimeReset(b As Boolean)` _(public)_
- `setSelectMirror(b As Boolean)` _(public)_
- `setSelectable(b As Boolean)` _(public)_
- `setSlotDuration(s As String)` _(public)_
- `setSlotMaxTime(s As String)` _(public)_
- `setSlotMinTime(s As String)` _(public)_
- `setToDayText(s As String)` _(public)_
- `setWeekNumbers(b As Boolean)` _(public)_
- `setWeekText(s As String)` _(public)_
## Getters (48)
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
- `getAspectRatio()` As String _(public)_
- `getBusinessHours()` As Boolean _(public)_
- `getButtonIcons()` As Boolean _(public)_
- `getContentHeight()` As String _(public)_
- `getDayMaxEvents()` As Boolean _(public)_
- `getDayText()` As String _(public)_
- `getDroppable()` As Boolean _(public)_
- `getEditable()` As Boolean _(public)_
- `getExpandRows()` As Boolean _(public)_
- `getHeaderToolbarCenter()` As String _(public)_
- `getHeaderToolbarLeft()` As String _(public)_
- `getHeaderToolbarRight()` As String _(public)_
- `getHeaderToolbarVisible()` As Boolean _(public)_
- `getHeight()` As String _(public)_
- `getInitialDate()` As String _(public)_
- `getInitialView()` As String _(public)_
- `getListText()` As String _(public)_
- `getLocale()` As String _(public)_
- `getMonthText()` As String _(public)_
- `getNavLinks()` As Boolean _(public)_
- `getNextClickOn()` As Boolean _(public)_
- `getNowIndicator()` As Boolean _(public)_
- `getPrevClickOn()` As Boolean _(public)_
- `getScrollTime()` As String _(public)_
- `getScrollTimeReset()` As Boolean _(public)_
- `getSelectMirror()` As Boolean _(public)_
- `getSelectable()` As Boolean _(public)_
- `getSlotDuration()` As String _(public)_
- `getSlotMaxTime()` As String _(public)_
- `getSlotMinTime()` As String _(public)_
- `getToDayText()` As String _(public)_
- `getWeekNumbers()` As Boolean _(public)_
- `getWeekText()` As String _(public)_
- `getCurrentDate()` As String _(public)_
- `getCurrentStartDate()` As String _(public)_
- `getCurrentEndDate()` As String _(public)_
## Private Methods (1)
- `EventClick(e As Map)` _(private)_
## Verified Demo Usage

Real syntax from [`pgFullCalendar.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgFullCalendar.bas) (verified demo). `fc` = a SDUI5FullCalendar.

```b4j
	fc.Initialize(Me, "fc", "fc")
	fc.ParentID = "SDUI5Column1"
	fc.InitialView = "multiMonthYear"
	fc.ScrollTime = "06:00:00"
	fc.SlotDuration = "00:30:00"
	fc.SlotMaxTime = "24:00:00"
	fc.SlotMinTime = "00:00:00"
	BANano.Await(fc.AddComponent)
```

Builder methods, real call order (from `pgFullCalendar.bas`):

```b4j
	fc.AddEvent("1", "", "All Day Event",  sStartMonth, "", False, "", "", "", False, True)
	fc.AddEvent("2", "", "Long Event", app.ui.DateAdd(sStartMonth, 7), app.ui.DateAdd(sStartMonth, 10), False, "", "", "", False, True)
	fc.AddEvent("3", "", "Repeating Event", app.ui.DateAdd(sStartMonth, 9) & "T16:00:00-05:00", "", False, "", "", "", False,True)
	fc.AddEvent("4", "", "Conference", app.ui.DateAdd(sStartMonth, 11), app.ui.DateAdd(sStartMonth, 13), False, "", "", "", False, True)
	fc.AddEvent("5", "", "Meeting", app.ui.DateAdd(sStartMonth, 12) & "12T10:30:00-05:00", app.ui.DateAdd(sStartMonth, 12)  & "T12:30:00-05:00", False, "","", "", False, True)
	fc.AddEvent("6", "", "Lunch", app.ui.DateAdd(sStartMonth, 13) & "13T12:00:00-05:00", "", True, "", "", "", False, True)
```

Demo-wired events: `DateClick`, `DateRangeChange`, `Drop`, `EventClick`, `EventDrop`, `EventResize`, `NextMonth`, `NextYear`, `PrevMonth`, `PrevYear` — handlers named `fc_<Event>`.
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


