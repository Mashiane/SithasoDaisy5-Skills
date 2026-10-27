---
name: SDUI5Toast
description: SithasoDaisy5 SDUI5Toast component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5Toast

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5Toast.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5Toast.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgSpeedDial.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgSpeedDial.bas)
  - [`pgToast.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgToast.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5Toast shows a toast notification. Use for transient messages. Position/color configurable.
_SDUI5Toast is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `HorizontalPosition` | String | end | center, end, start | `setHorizontalPosition` | `getHorizontalPosition` |
| `VerticalPosition` | String | bottom | bottom, middle, top | `setVerticalPosition` | `getVerticalPosition` |

Setter and getter names are the actual source `Sub` names. `—` means this component has no named accessor for that side; designer-time values may still be consumed through `Props` in `DesignerCreateView`.
## Events
_(none declared)_

Wire in parent: `Sub toast_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (4)
- `AddComponent()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `Remove()` _(public)_

## Key Setters (4)
- `setHorizontalPosition(s As String)` _(public)_
- `setParentID(s As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `setVerticalPosition(s As String)` _(public)_

## Getters (6)
- `getHere()` As String _(public)_
- `getHorizontalPosition()` _(public)_
- `getID()` As String _(public)_
- `getParentID()` As String _(public)_
- `GetProperties()` _(public)_
- `getVerticalPosition()` _(public)_

## Private Methods (1)
- `SetDefaults()` _(private)_

## Verified Demo Usage

Real syntax from [`pgToast.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgToast.bas) (verified demo):

```b4j
Private SDUI5Toast2 As SDUI5Toast		'ignore
SDUI5Toast2.Initialize(Me, "SDUI5Toast2", "SDUI5Toast2")
SDUI5Toast2.ParentID = app.PageView
SDUI5Toast2.HorizontalPosition = "start"
SDUI5Toast2.VerticalPosition = "bottom"
BANano.Await(SDUI5Toast2.AddComponent)
```

## Emits (daisyUI classes pushed in DesignerCreateView)
**Classes**: `toast`
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim toast As SDUI5Toast
toast.Initialize(Me, "SDUI5Toast", "SDUI5Toast")
toast.ParentID = "placeholder"
BANano.Await(toast.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.
