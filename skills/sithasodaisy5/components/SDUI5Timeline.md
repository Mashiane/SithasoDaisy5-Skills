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
SDUI5Timeline is a vertical timeline. Items (SDUI5TimelineItem) mount via `ParentID = timelineName`. Use for activity/audit logs.
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
## Events
_(none declared)_

Wire in parent: `Sub timeline_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (5)
- `AddComponent()` _(public)_
- `Clear()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `Remove()` _(public)_

## Key Setters (18)
- `setAttributes(s As String)` _(public)_
- `setClasses(s As String)` _(public)_
- `setCompact(b As Boolean)` _(public)_
- `setDirection(s As String)` _(public)_
- `setEnabled(b As Boolean)` _(public)_
- `setLGDirection(s As String)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setMDDirection(s As String)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setParentID(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setPositionStyle(s As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `setSMDirection(s As String)` _(public)_
- `setSnapIcon(b As Boolean)` _(public)_
- `setStyles(s As String)` _(public)_
- `setVisible(b As Boolean)` _(public)_
- `setXLDirection(s As String)` _(public)_

## Getters (20)
- `getAttributes()` _(public)_
- `getClasses()` _(public)_
- `getCompact()` _(public)_
- `getDirection()` _(public)_
- `getEnabled()` _(public)_
- `getHere()` As String _(public)_
- `getID()` As String _(public)_
- `getLGDirection()` _(public)_
- `getMarginAXYTBLR()` _(public)_
- `getMDDirection()` _(public)_
- `getPaddingAXYTBLR()` _(public)_
- `getParentID()` _(public)_
- `getPosition()` _(public)_
- `getPositionStyle()` _(public)_
- `GetProperties()` _(public)_
- `getSMDirection()` _(public)_
- `getSnapIcon()` _(public)_
- `getStyles()` _(public)_
- `getVisible()` _(public)_
- `getXLDirection()` _(public)_

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
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim timeline As SDUI5Timeline
timeline.Initialize(Me, "SDUI5Timeline", "SDUI5Timeline")
timeline.ParentID = "placeholder"
BANano.Await(timeline.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.
