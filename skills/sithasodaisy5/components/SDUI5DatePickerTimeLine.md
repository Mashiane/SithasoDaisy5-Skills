---
name: SDUI5DatePickerTimeLine
description: SithasoDaisy5 SDUI5DatePickerTimeLine component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5DatePickerTimeLine

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5DatePickerTimeLine.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5DatePickerTimeLine.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgdatetimeline.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgdatetimeline.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5DatePickerTimeLine is a timeline-style date picker. It renders a daisyUI `carousel` (`inline-flex`, `overflow-x: scroll`, `scroll-snap-type: x mandatory`) whose items are `ItemWidth` wide. The component element itself is the horizontal scroller.
_SDUI5DatePickerTimeLine is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `InitialSelectedDate` | String | 2025-01-01 | — | `setInitialSelectedDate` | `getInitialSelectedDate` |
| `DaysCount` | String | 31 | — | `setDaysCount` | `getDaysCount` |
| `ItemWidth` | String | 80px | — | `setItemWidth` | `getItemWidth` |
| `ItemHeight` | String | 80px | — | `setItemHeight` | `getItemHeight` |
| `MonthColor` | String | #000000 | — | `setMonthColor` | `getMonthColor` |
| `MonthFontSize` | String | 11px | — | `setMonthFontSize` | `getMonthFontSize` |
| `MonthFontWeight` | String | medium | — | `setMonthFontWeight` | `getMonthFontWeight` |
| `DateColor` | String | #000000 | — | `setDateColor` | `getDateColor` |
| `DateFontSize` | String | 24px | — | `setDateFontSize` | `getDateFontSize` |
| `DateFontWeight` | String | medium | — | `setDateFontWeight` | `getDateFontWeight` |
| `DayColor` | String | #000000 | — | `setDayColor` | `getDayColor` |
| `DayFontSize` | String | 11px | — | `setDayFontSize` | `getDayFontSize` |
| `DayFontWeight` | String | medium | — | `setDayFontWeight` | `getDayFontWeight` |
| `SelectionColor` | String | #30000000 | — | `setSelectionColor` | `getSelectionColor` |
| `SelectedTextColor` | String | — | — | `setSelectedTextColor` | `getSelectedTextColor` |
| `ActiveDates` | String | — | — | `setActiveDates` | `getActiveDates` |
| `InActiveDates` | String | — | — | `setInActiveDates` | `getInActiveDates` |
| `DeActivatedColor` | String | #666666 | accent, error, info, neutral, none, primary, secondary, success, warning | `setDeActivatedColor` | `getDeActivatedColor` |
| `Direction` | String | horizontal | horizontal, vertical | `setDirection` | `getDirection` |
| `Height` | String | content | — | `setHeight` | `getHeight` |
| `Width` | String | full | — | `setWidth` | `getWidth` |
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

## Scrolling

- The component is the scroll container: `.carousel` is `inline-flex` with `overflow-x: scroll` and a snap point per item.
- daisyUI hides the scrollbar (`scrollbar-width: none`) and the component exposes no scroll buttons, so a plain mouse wheel does not move it. Use Shift+wheel, a trackpad horizontal gesture, or programmatic `scrollBy`.
- Wrapping it in an `overflow-x-auto` container does **not** add scrolling, because the component is `width: full`; the wrapper's `scrollWidth` equals its `clientWidth`. Measured in `sd5sprint`: wrapper 325/325, component 293 client / 1286 scroll.
- For discoverable navigation, size the pane to the number of days (`ItemWidth` x visible days), add explicit prev/next buttons that call `scrollBy` on the element, or reduce `DaysCount`.

Verified navigation (used by `07-project-tracker`):

```b4j
BANano.GetElement("#datetimeline").RunMethod("scrollBy", Array(CreateMap("left": 336, "behavior": "smooth")))
```
## Events
`Change`

Wire in parent: `Sub datepickertimeline_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (7)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Clear()` _(public)_
## Key Setters (31)
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
- `setActiveDates(s As String)` _(public)_
- `setDateColor(s As String)` _(public)_
- `setDateFontSize(s As String)` _(public)_
- `setDateFontWeight(s As String)` _(public)_
- `setDayColor(s As String)` _(public)_
- `setDayFontSize(s As String)` _(public)_
- `setDayFontWeight(s As String)` _(public)_
- `setDaysCount(s As String)` _(public)_
- `setDeActivatedColor(s As String)` _(public)_
- `setDirection(s As String)` As 'ignoredeadcode _(public)_
- `setHeight(s As String)` _(public)_
- `setInActiveDates(s As String)` _(public)_
- `setInitialSelectedDate(s As String)` As 'ignoredeadcode _(public)_
- `setItemWidth(s As String)` _(public)_
- `setItemHeight(s As String)` _(public)_
- `setMonthColor(s As String)` _(public)_
- `setMonthFontSize(s As String)` _(public)_
- `setMonthFontWeight(s As String)` _(public)_
- `setSelectedTextColor(s As String)` _(public)_
- `setSelectionColor(s As String)` _(public)_
- `setWidth(s As String)` _(public)_
## Getters (33)
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
- `getActiveDates()` As String _(public)_
- `getDateColor()` As String _(public)_
- `getDateFontSize()` As String _(public)_
- `getDateFontWeight()` As String _(public)_
- `getDayColor()` As String _(public)_
- `getDayFontSize()` As String _(public)_
- `getDayFontWeight()` As String _(public)_
- `getDaysCount()` As String _(public)_
- `getDeActivatedColor()` As String _(public)_
- `getDirection()` As String _(public)_
- `getHeight()` As String _(public)_
- `getInActiveDates()` As String _(public)_
- `getInitialSelectedDate()` As String _(public)_
- `getItemWidth()` As String _(public)_
- `getItemHeight()` As String _(public)_
- `getMonthColor()` As String _(public)_
- `getMonthFontSize()` As String _(public)_
- `getMonthFontWeight()` As String _(public)_
- `getSelectedTextColor()` As String _(public)_
- `getSelectionColor()` As String _(public)_
- `getWidth()` As String _(public)_
## Private Methods (0)
_(none)_
## Verified Demo Usage

Real syntax from [`pgdatetimeline.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgdatetimeline.bas) (verified demo):

```b4j
Private dptime As SDUI5DatePickerTimeLine		'ignore
BANano.Await(SDUI5Container1.AddComponent)
```
## Emits (daisyUI classes pushed in DesignerCreateView)
**Classes**: `carousel rounded-box gap-1`
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim datepickertimeline As SDUI5DatePickerTimeLine
datepickertimeline.Initialize(Me, "SDUI5DatePickerTimeLine", "SDUI5DatePickerTimeLine")
datepickertimeline.ParentID = "placeholder"
BANano.Await(datepickertimeline.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.
