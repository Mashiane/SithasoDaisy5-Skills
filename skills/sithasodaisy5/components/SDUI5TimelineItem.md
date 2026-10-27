---
name: SDUI5TimelineItem
description: SithasoDaisy5 SDUI5TimelineItem component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5TimelineItem

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5TimelineItem.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5TimelineItem.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgTimeline.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgTimeline.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5TimelineItem is a single timeline entry. Mount into the timeline via `ParentID = timelineName`. Holds date/content/icon.
_SDUI5TimelineItem is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `StartJoinPrefix` | Boolean | False | — | `setStartJoinPrefix` | `getStartJoinPrefix` |
| `StartJoinPrefixColor` | String | — | — | `setStartJoinPrefixColor` | `getStartJoinPrefixColor` |
| `Start` | Boolean | True | — | `setStart` | `getStart` |
| `StartText` | String | — | — | `setStartText` | `getStartText` |
| `StartBox` | Boolean | False | — | `setStartBox` | `getStartBox` |
| `Middle` | Boolean | True | — | `setMiddle` | `getMiddle` |
| `MiddleText` | String | — | — | `setMiddleText` | `getMiddleText` |
| `MiddleIcon` | String | ./assets/checkblack.svg | — | `setMiddleIcon` | `getMiddleIcon` |
| `MiddleIconSize` | String | 16px | — | `setMiddleIconSize` | `getMiddleIconSize` |
| `MiddleBox` | Boolean | False | — | `setMiddleBox` | `getMiddleBox` |
| `End` | Boolean | True | — | `setEnd` | `getEnd` |
| `EndText` | String | — | — | `setEndText` | `getEndText` |
| `EndBox` | Boolean | False | — | `setEndBox` | `getEndBox` |
| `EndJoinSuffix` | Boolean | False | — | `setEndJoinSuffix` | `getEndJoinSuffix` |
| `EndJoinSuffixColor` | String | — | — | `setEndJoinSuffixColor` | `getEndJoinSuffixColor` |
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

Wire in parent: `Sub timelineitem_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (4)
- `AddComponent()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `Remove()` _(public)_

## Key Setters (26)
- `setAttributes(s As String)` _(public)_
- `setClasses(s As String)` _(public)_
- `setEnabled(b As Boolean)` _(public)_
- `setEnd(b As Boolean)` _(public)_
- `setEndBox(b As Boolean)` _(public)_
- `setEndJoinSuffix(b As Boolean)` _(public)_
- `setEndJoinSuffixColor(s As String)` _(public)_
- `setEndText(s As String)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setMiddle(b As Boolean)` _(public)_
- `setMiddleBox(b As Boolean)` _(public)_
- `setMiddleIcon(s As String)` _(public)_
- `setMiddleIconSize(s As String)` _(public)_
- `setMiddleText(s As String)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setParentID(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setPositionStyle(s As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `setStart(b As Boolean)` _(public)_
- `setStartBox(b As Boolean)` _(public)_
- `setStartJoinPrefix(b As Boolean)` _(public)_
- `setStartJoinPrefixColor(s As String)` _(public)_
- `setStartText(s As String)` _(public)_
- `setStyles(s As String)` _(public)_
- `setVisible(b As Boolean)` _(public)_

## Getters (28)
- `getAttributes()` _(public)_
- `getClasses()` _(public)_
- `getEnabled()` _(public)_
- `getEnd()` _(public)_
- `getEndBox()` _(public)_
- `getEndJoinSuffix()` _(public)_
- `getEndJoinSuffixColor()` _(public)_
- `getEndText()` _(public)_
- `getHere()` As String _(public)_
- `getID()` As String _(public)_
- `getMarginAXYTBLR()` _(public)_
- `getMiddle()` _(public)_
- `getMiddleBox()` _(public)_
- `getMiddleIcon()` _(public)_
- `getMiddleIconSize()` _(public)_
- `getMiddleText()` _(public)_
- `getPaddingAXYTBLR()` _(public)_
- `getParentID()` _(public)_
- `getPosition()` _(public)_
- `getPositionStyle()` _(public)_
- `GetProperties()` _(public)_
- `getStart()` _(public)_
- `getStartBox()` _(public)_
- `getStartJoinPrefix()` _(public)_
- `getStartJoinPrefixColor()` _(public)_
- `getStartText()` _(public)_
- `getStyles()` _(public)_
- `getVisible()` _(public)_

## Private Methods (1)
- `SetDefaults()` _(private)_

## Verified Demo Usage

Real syntax from [`pgTimeline.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgTimeline.bas) (verified demo):

```b4j
Private SDUI5TimelineItem1 As SDUI5TimelineItem		'ignore
Private SDUI5TimelineItem10 As SDUI5TimelineItem		'ignore
Private SDUI5TimelineItem11 As SDUI5TimelineItem		'ignore
Private SDUI5TimelineItem12 As SDUI5TimelineItem		'ignore
Private SDUI5TimelineItem13 As SDUI5TimelineItem		'ignore
Private SDUI5TimelineItem14 As SDUI5TimelineItem		'ignore
Private SDUI5TimelineItem15 As SDUI5TimelineItem		'ignore
Private SDUI5TimelineItem16 As SDUI5TimelineItem		'ignore
Private SDUI5TimelineItem17 As SDUI5TimelineItem		'ignore
Private SDUI5TimelineItem18 As SDUI5TimelineItem		'ignore
Private SDUI5TimelineItem19 As SDUI5TimelineItem		'ignore
BANano.Await(SDUI5Container1.AddComponent)
```

## Emits (daisyUI classes pushed in DesignerCreateView)
_(none emitted directly — relies on base/CustProps)_
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim timelineitem As SDUI5TimelineItem
timelineitem.Initialize(Me, "SDUI5TimelineItem", "SDUI5TimelineItem")
timelineitem.ParentID = "placeholder"
BANano.Await(timelineitem.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.
