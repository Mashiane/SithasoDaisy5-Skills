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
## Public Methods (6)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
## Key Setters (25)
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
- `setEnd(b As Boolean)` As 'ignoredeadcode _(public)_
- `setEndBox(b As Boolean)` As 'ignoredeadcode _(public)_
- `setEndJoinSuffix(b As Boolean)` As 'ignoredeadcode _(public)_
- `setEndJoinSuffixColor(s As String)` As 'ignoredeadcode _(public)_
- `setEndText(s As String)` As 'ignoredeadcode _(public)_
- `setMiddle(b As Boolean)` As 'ignoredeadcode _(public)_
- `setMiddleBox(b As Boolean)` As 'ignoredeadcode _(public)_
- `setMiddleIcon(s As String)` As 'ignoredeadcode _(public)_
- `setMiddleIconSize(s As String)` As 'ignoredeadcode _(public)_
- `setMiddleText(s As String)` As 'ignoredeadcode _(public)_
- `setStart(b As Boolean)` As 'ignoredeadcode _(public)_
- `setStartBox(b As Boolean)` As 'ignoredeadcode _(public)_
- `setStartJoinPrefix(b As Boolean)` As 'ignoredeadcode _(public)_
- `setStartJoinPrefixColor(s As String)` As 'ignoredeadcode _(public)_
- `setStartText(s As String)` As 'ignoredeadcode _(public)_
## Getters (27)
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
- `getEnd()` As Boolean _(public)_
- `getEndBox()` As Boolean _(public)_
- `getEndJoinSuffix()` As Boolean _(public)_
- `getEndJoinSuffixColor()` As String _(public)_
- `getEndText()` As String _(public)_
- `getMiddle()` As Boolean _(public)_
- `getMiddleBox()` As Boolean _(public)_
- `getMiddleIcon()` As String _(public)_
- `getMiddleIconSize()` As String _(public)_
- `getMiddleText()` As String _(public)_
- `getStart()` As Boolean _(public)_
- `getStartBox()` As Boolean _(public)_
- `getStartJoinPrefix()` As Boolean _(public)_
- `getStartJoinPrefixColor()` As String _(public)_
- `getStartText()` As String _(public)_
## Private Methods (1)
- `SetDefaults()` _(private)_
## Verified Demo Usage

Real syntax from [`pgTimeline.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgTimeline.bas) (verified demo). `SDUI5TimelineItem1` = a SDUI5TimelineItem.

```b4j
	SDUI5TimelineItem1.Initialize(Me, "SDUI5TimelineItem1", "SDUI5TimelineItem1")
	SDUI5TimelineItem1.ParentID = "SDUI5Timeline1"
	SDUI5TimelineItem1.Enabled = True
	SDUI5TimelineItem1.End = True
	SDUI5TimelineItem1.EndBox = True
	SDUI5TimelineItem1.EndJoinSuffix = True
	SDUI5TimelineItem1.EndJoinSuffixColor = ""
	SDUI5TimelineItem1.EndText = "First Macintosh computer"
	SDUI5TimelineItem1.MarginAXYTBLR = "a=?; x=?; y=?; t=?; b=?; l=?; r=?"
	SDUI5TimelineItem1.Middle = True
	SDUI5TimelineItem1.MiddleBox = False
	SDUI5TimelineItem1.MiddleIcon = "./assets/checkblack.svg"
	SDUI5TimelineItem1.MiddleIconSize = "16px"
	SDUI5TimelineItem1.MiddleText = ""
	SDUI5TimelineItem1.PaddingAXYTBLR = "a=?; x=?; y=?; t=?; b=?; l=?; r=?"
	SDUI5TimelineItem1.Position = "t=?; b=?; r=?; l=?"
	SDUI5TimelineItem1.PositionStyle = "none"
	SDUI5TimelineItem1.Attributes = ""
	SDUI5TimelineItem1.Classes = ""
	SDUI5TimelineItem1.Styles = ""
	SDUI5TimelineItem1.Start = True
	SDUI5TimelineItem1.StartBox = False
	SDUI5TimelineItem1.StartJoinPrefix = False
	SDUI5TimelineItem1.StartJoinPrefixColor = ""
	SDUI5TimelineItem1.StartText = "1984"
	SDUI5TimelineItem1.Visible = True
	BANano.Await(SDUI5TimelineItem1.AddComponent)
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


