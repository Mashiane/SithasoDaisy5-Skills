---
name: SDUI5Timeline
description: SithasoDaisy5 SDUI5Timeline component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5Timeline

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5Timeline.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5Timeline.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgTimeline.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgTimeline.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5Timeline is a timeline container. Items (SDUI5TimelineItem) mount via `ParentID = timelineName`. Use for activity/audit logs.

The timeline draws **no line by itself**. Each item renders a hidden `<hr>` before its icon (`StartJoinPrefix`) and after it (`EndJoinSuffix`); both default to `False`, so items appear as isolated icons until the joins are enabled.
_SDUI5Timeline is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `Compact` | Boolean | False | — | `setCompact` | `getCompact` |
| `Direction` | String | vertical | horizontal, vertical | `setDirection` | `getDirection` |
| `SMDirection` | String | none | horizontal, none, vertical | `setSMDirection` | `getSMDirection` |
| `MDDirection` | String | none | horizontal, none, vertical | `setMDDirection` | `getMDDirection` |
| `LGDirection` | String | none | horizontal, none, vertical | `setLGDirection` | `getLGDirection` |
| `XLDirection` | String | none | horizontal, none, vertical | `setXLDirection` | `getXLDirection` |
| `SnapIcon` | Boolean | False | — | `setSnapIcon` | `getSnapIcon` |
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

## Joining Lines (required for a connected timeline)

The connector is per item, not per timeline. Each `SDUI5TimelineItem` renders
`<hr id="<name>_startprefix" class="hidden">` and `<hr id="<name>_endsuffix" class="hidden">`.
`StartJoinPrefix` / `EndJoinSuffix` toggle their visibility.

| Item position | `StartJoinPrefix` | `EndJoinSuffix` |
|---|:---:|:---:|
| First | False | True |
| Middle | True | True |
| Last | True | False |
| Only item | False | False |

- Colors: `StartJoinPrefixColor` / `EndJoinSuffixColor` (semantic token or `#hex`) set the connector background.
- `Direction = "horizontal"` uses the same flags.
- Enabling both flags on every item adds a leading stub above the first and a trailing stub below the last.
- Source-verified: `setEndJoinSuffix(True)` calls `UI.SetVisibleByID("<name>_endsuffix")`.
- The current `pgTimeline.bas` demo sets neither flag, so it is not evidence that connectors appear by default.
## Events
_(none declared)_

Wire in parent: `Sub timeline_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (7)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Clear()` _(public)_
## Key Setters (17)
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
- `setCompact(b As Boolean)` _(public)_
- `setDirection(s As String)` _(public)_
- `setLGDirection(s As String)` _(public)_
- `setMDDirection(s As String)` _(public)_
- `setSMDirection(s As String)` _(public)_
- `setSnapIcon(b As Boolean)` _(public)_
- `setXLDirection(s As String)` _(public)_
## Getters (19)
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
- `getCompact()` As Boolean _(public)_
- `getDirection()` As String _(public)_
- `getLGDirection()` As String _(public)_
- `getMDDirection()` As String _(public)_
- `getSMDirection()` As String _(public)_
- `getSnapIcon()` As Boolean _(public)_
- `getXLDirection()` As String _(public)_
## Private Methods (1)
- `SetDefaults()` _(private)_
## Verified Demo Usage

Real syntax from [`pgTimeline.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgTimeline.bas) (verified demo):

```b4j
Private SDUI5Timeline1 As SDUI5Timeline		'ignore
BANano.Await(SDUI5Container1.AddComponent)
```
## Emits (daisyUI classes pushed in DesignerCreateView)
**Classes**: `timeline`, `timeline-compact`, `timeline-snap-con`
## Code Example
```vb
Dim timeline As SDUI5Timeline
timeline.Initialize(Me, "timeline", "timeline")
timeline.ParentID = "contentHost"
timeline.Direction = "vertical"
BANano.Await(timeline.AddComponent)

Dim item1 As SDUI5TimelineItem
item1.Initialize(Me, "item1", "item1")
item1.ParentID = "timeline"
item1.StartText = "Mon 09:00"
item1.EndText = "Sprint kickoff"
item1.EndJoinSuffix = True          ' first item: line below only
BANano.Await(item1.AddComponent)

Dim item2 As SDUI5TimelineItem
item2.Initialize(Me, "item2", "item2")
item2.ParentID = "timeline"
item2.StartText = "Wed 14:00"
item2.EndText = "Design review"
item2.StartJoinPrefix = True        ' middle item: line above and below
item2.EndJoinSuffix = True
BANano.Await(item2.AddComponent)
```
## Composes With
- Pairs with **SDUI5TimelineItem** (required child). Set the join flags per item position; `SDUI5Divider` is not a connector substitute.
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.
