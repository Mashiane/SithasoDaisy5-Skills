---
name: SDUI5EvoCalendar
description: SithasoDaisy5 SDUI5EvoCalendar component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5EvoCalendar

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5EvoCalendar.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5EvoCalendar.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgEvoCalendar.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgEvoCalendar.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5EvoCalendar is an event calendar component built on UmbrellaJS (zero jQuery dependency) with responsive drawer auto-collapsing, cross-month date auto-navigation, and event badges. Use for scheduling, appointment booking, or milestone tracking with custom metadata payloads.
_SDUI5EvoCalendar is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `Theme` | String | default | blue, coral, default, navy | `setTheme` | `getTheme` |
| `Language` | String | en | de, en, es, pt | `setLanguage` | `getLanguage` |
| `Format` | String | yyyy-mm-dd | — | `setFormat` | `getFormat` |
| `TitleFormat` | String | MM yyyy | — | `setTitleFormat` | `getTitleFormat` |
| `EventHeaderFormat` | String | MM d, yyyy | — | `setEventHeaderFormat` | `getEventHeaderFormat` |
| `CanAddEvent` | Boolean | False | — | `setCanAddEvent` | `getCanAddEvent` |
| `FirstDayOfWeek` | String | 0 | — | `setFirstDayOfWeek` | `getFirstDayOfWeek` |
| `EventDisplayDefault` | Boolean | True | — | `setEventDisplayDefault` | `getEventDisplayDefault` |
| `EventListToggler` | Boolean | True | — | `setEventListToggler` | `getEventListToggler` |
| `SidebarDisplayDefault` | Boolean | True | — | `setSidebarDisplayDefault` | `getSidebarDisplayDefault` |
| `SidebarToggler` | Boolean | True | — | `setSidebarToggler` | `getSidebarToggler` |
| `TodayHighlight` | Boolean | False | — | `setTodayHighlight` | `getTodayHighlight` |
| `Height` | String | auto | — | — | — |
| `Width` | String | auto | — | — | — |
| `Visible` | Boolean | True | — | `setVisible` | `getVisible` |
| `Enabled` | Boolean | True | — | `setEnabled` | `getEnabled` |
| `PositionStyle` | String | none | absolute, fixed, none, relative, static, sticky | — | — |
| `Position` | String | t=?; b=?; r=?; l=? | — | — | — |
| `MarginAXYTBLR` | String | a=?; x=?; y=?; t=?; b=?; l=?; r=? | — | — | — |
| `PaddingAXYTBLR` | String | a=?; x=?; y=?; t=?; b=?; l=?; r=? | — | — | — |
| `RawClasses` | String | — | — | — | — |
| `RawStyles` | String | — | — | — | — |
| `RawAttributes` | String | — | — | — | — |

Setter and getter names are the actual source `Sub` names. `—` means this component has no named accessor for that side; designer-time values may still be consumed through `Props` in `DesignerCreateView`.
## Events
`selectDate`, `selectEvent`, `selectMonth`, `selectYear`, `destroy`, `toggleSidebar`, `toggleEventList`

Wire in parent: `Sub evocalendar_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (19)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `Refresh()` _(public)_
- `selectYear(y As Object)` _(public)_
- `selectDate(d As String)` _(public)_
- `selectMonth(d As Object)` _(public)_
- `Clear()` _(public)_
- `AddEvent(eID As String, eName As String, eBadge As String, eDate1 As String, eDate2 As String, eDescription As String, eType As String, eColor As String, bEveryYear As Boolean)` _(public)_
- `AddHoliday(eID As String, eName As String, eBadge As String, eDate1 As String, eDate2 As String, eDescription As String, eColor As String, bEveryYear As Boolean)` _(public)_
- `AddBirthday(eID As String, eName As String, eBadge As String, eDate1 As String, eDate2 As String, eDescription As String, eColor As String, bEveryYear As Boolean)` _(public)_
- `AddEvent1(eventm As Map)` _(public)_
- `Destroy()` _(public)_
- `AddEventWithData(eID As String, eName As String, eBadge As String, eDate1 As String, eDate2 As String, eDescription As String, eType As String, eColor As String, bEveryYear As Boolean, CustomData As Map)` _(public)_
- `AddCalendarEvent(eventMap As Map)` _(public)_
- `RemoveCalendarEvent(eventId As String)` _(public)_
- `ToggleSidebar(bOpen As Boolean)` _(public)_
- `ToggleEventList(bOpen As Boolean)` _(public)_
## Key Setters (15)
- `setParentID(s As String)` _(public)_
- `setVisible(b As Boolean)` _(public)_
- `setEnabled(b As Boolean)` _(public)_
- `setTheme(s As String)` _(public)_
- `setLanguage(s As String)` _(public)_
- `setFormat(s As String)` _(public)_
- `setTitleFormat(s As String)` _(public)_
- `setEventHeaderFormat(s As String)` _(public)_
- `setFirstDayOfWeek(s As String)` _(public)_
- `setEventDisplayDefault(b As Boolean)` _(public)_
- `setEventListToggler(b As Boolean)` _(public)_
- `setSidebarDisplayDefault(b As Boolean)` _(public)_
- `setSidebarToggler(b As Boolean)` _(public)_
- `setTodayHighlight(b As Boolean)` _(public)_
- `setCanAddEvent(b As Boolean)` _(public)_
## Getters (19)
- `getID()` As String _(public)_
- `getHere()` As String _(public)_
- `getParentID()` As String _(public)_
- `getVisible()` As Boolean _(public)_
- `getEnabled()` As Boolean _(public)_
- `getActiveDate()` As String _(public)_
- `getActiveEvents()` As List _(public)_
- `getTheme()` As String _(public)_
- `getLanguage()` As String _(public)_
- `getFormat()` As String _(public)_
- `getTitleFormat()` As String _(public)_
- `getEventHeaderFormat()` As String _(public)_
- `getFirstDayOfWeek()` As String _(public)_
- `getEventDisplayDefault()` As Boolean _(public)_
- `getEventListToggler()` As Boolean _(public)_
- `getSidebarDisplayDefault()` As Boolean _(public)_
- `getSidebarToggler()` As Boolean _(public)_
- `getTodayHighlight()` As Boolean _(public)_
- `getCanAddEvent()` As Boolean _(public)_
## Private Methods (1)
- `SetDefaults()` _(private)_
## Verified Demo Usage

Real syntax from [`pgEvoCalendar.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgEvoCalendar.bas) (verified demo):

```b4j
Private evo As SDUI5EvoCalendar		'ignore
BANano.Await(app.UsesEvoCalendar)
evo.Initialize(Me, "evo", "evo")
evo.ParentID = "SDUI5ColCalendar"
evo.Theme = "default"
evo.Language = "en"
evo.Format = "yyyy-mm-dd"
evo.TodayHighlight = True
BANano.Await(evo.AddComponent)
evo.AddEventWithData("evt-1", "Full Distribution Audit", "AUDIT", "2026-11-08", "", "Physical inventory audit.", "event", "#E95420", False, CreateMap("store": "Cape Town"))
evo.Refresh
```
## Emits (daisyUI classes pushed in DesignerCreateView)
_(none emitted directly — relies on base/CustProps)_
## Code Example
```b4j
BANano.Await(app.UsesEvoCalendar)
Dim evo As SDUI5EvoCalendar
evo.Initialize(Me, "evo", "evo")
evo.ParentID = "calendarContainer"
evo.Theme = "default"
evo.Language = "en"
evo.TodayHighlight = True
evo.SidebarToggler = True
evo.EventListToggler = True
BANano.Await(evo.AddComponent)
evo.AddEvent("e1", "Sprint Release", "RELEASE", "2026-11-20", "", "Release v0.91", "event", "#10b981", False)
evo.Refresh
```
## Composes With
- Mounts inside **SDUI5Column**, **SDUI5Container**, or **SDUI5Card**.
- Requires asset registration via `BANano.Await(app.UsesEvoCalendar)` before `AddComponent`.
- Dispatches `${mEventName}_selectDate(event As Map, newDate As Object)` and `${mEventName}_selectEvent(event As Map, newEvent As Object)` to parent callback.
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width).
