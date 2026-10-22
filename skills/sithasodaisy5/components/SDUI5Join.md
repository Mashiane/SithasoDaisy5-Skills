---
name: SDUI5Join
description: SithasoDaisy5 SDUI5Join component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5Join

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5Join.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5Join.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgJoin.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgJoin.bas)
  - [`pgPagination.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgPagination.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5Join groups inputs/buttons with joined borders. Children mount via ParentID. Use for input groups.
_SDUI5Join is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `Grid` | Boolean | False | — | `setGrid` | `getGrid` |
| `GridCols` | String | — | — | `setGridCols` | `getGridCols` |
| `Direction` | String | none | horizontal, none, vertical | `setDirection` | `getDirection` |
| `DirectionOnSm` | String | none | horizontal, none, vertical | `setDirectionOnSm` | `getDirectionOnSm` |
| `DirectionOnLg` | String | none | horizontal, none, vertical | `setDirectionOnLg` | `getDirectionOnLg` |
| `DirectionOnMd` | String | none | horizontal, none, vertical | `setDirectionOnMd` | `getDirectionOnMd` |
| `DirectionOnXl` | String | none | horizontal, none, vertical | `setDirectionOnXl` | `getDirectionOnXl` |
| `DirectionOnXxl` | String | none | horizontal, none, vertical | `setDirectionOnXxl` | `getDirectionOnXxl` |
| `PositionStyle` | String | none | absolute, fixed, none, relative, static, sticky | `setPositionStyle` | `getPositionStyle` |
| `Position` | String | t=?; b=?; r=?; l=? | — | `setPosition` | `getPosition` |

Setter and getter names are the actual source `Sub` names. `—` means this component has no named accessor for that side; designer-time values may still be consumed through `Props` in `DesignerCreateView`.
## Events
_(none declared)_

Wire in parent: `Sub join_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (6)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
## Key Setters (11)
- `setParentID(s As String)` _(public)_
- `setPositionStyle(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setDirection(s As String)` _(public)_
- `setDirectionOnLg(s As String)` _(public)_
- `setDirectionOnMd(s As String)` _(public)_
- `setDirectionOnSm(s As String)` _(public)_
- `setDirectionOnXl(s As String)` _(public)_
- `setDirectionOnXxl(s As String)` _(public)_
- `setGrid(b As Boolean)` _(public)_
- `setGridCols(s As String)` _(public)_
## Getters (13)
- `getID()` As String _(public)_
- `getParentID()` As String _(public)_
- `getHere()` As String _(public)_
- `getPositionStyle()` As String _(public)_
- `getPosition()` As String _(public)_
- `getDirection()` As String _(public)_
- `getDirectionOnLg()` As String _(public)_
- `getDirectionOnMd()` As String _(public)_
- `getDirectionOnSm()` As String _(public)_
- `getDirectionOnXl()` As String _(public)_
- `getDirectionOnXxl()` As String _(public)_
- `getGrid()` As Boolean _(public)_
- `getGridCols()` As String _(public)_
## Private Methods (0)
_(none)_
## Verified Demo Usage

Real syntax from [`pgJoin.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgJoin.bas) (verified demo). `SDUI5Join3` = a SDUI5Join.

```b4j
	SDUI5Join3.Initialize(Me, "SDUI5Join3", "SDUI5Join3")
	SDUI5Join3.ParentID = "SDUI5Column3"
	SDUI5Join3.Direction = "vertical"
	SDUI5Join3.DirectionOnLg = "horizontal"
	BANano.Await(SDUI5Join3.AddComponent)
```

Also used in: `pgPagination`
## Emits (daisyUI classes pushed in DesignerCreateView)
**Classes**: `join`, `grid`
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim join As SDUI5Join
join.Initialize(Me, "SDUI5Join", "SDUI5Join")
join.ParentID = "placeholder"
BANano.Await(join.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.


