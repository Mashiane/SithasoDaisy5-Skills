---
name: SDUI5BottomDrawer
description: SithasoDaisy5 SDUI5BottomDrawer component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5BottomDrawer

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5BottomDrawer.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5BottomDrawer.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgBottomDrawer.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgBottomDrawer.bas)
  - [`pgIndex.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgIndex.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5BottomDrawer is a bottom slide-up drawer. Content mounts via `ParentID = drawerName`. Use for mobile-style bottom sheets.
_SDUI5BottomDrawer is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `Open` | Boolean | False | — | `setOpen` | `getOpen` |
| `BackgroundColor` | String | bg-base-200 | — | `setBackgroundColor` | `getBackgroundColor` |
| `Breakpoints` | String | 0;0.1;0.2;0.3;0.4;0.5;0.7;0.8;1 | — | `setBreakpoints` | `getBreakpoints` |
| `InitialBreakpoint` | String | 0.5 | — | `setInitialBreakpoint` | `getInitialBreakpoint` |
| `Duration` | Int | 300 | — | `setDuration` | `getDuration` |
| `ShowHandle` | Boolean | True | — | `setShowHandle` | `getShowHandle` |
| `HandleBg` | String | bg-base-300 | — | `setHandleBg` | `getHandleBg` |
| `HandleShadow` | String | md | 2xl, inner, lg, md, none, shadow, sm, xl | `setHandleShadow` | `getHandleShadow` |
| `MaxWidth` | String | 100% | — | `setMaxWidth` | `getMaxWidth` |
| `Width` | String | 100% | — | `setWidth` | `getWidth` |
| `Showbackdrop` | Boolean | True | — | `setShowbackdrop` | `getShowbackdrop` |
| `BackdropColor` | String | #00000052 | — | `setBackdropColor` | `getBackdropColor` |
| `Backdropdismiss` | Boolean | True | — | `setBackdropdismiss` | `getBackdropdismiss` |

Setter and getter names are the actual source `Sub` names. `—` means this component has no named accessor for that side; designer-time values may still be consumed through `Props` in `DesignerCreateView`.
## Events
_(none declared)_

Wire in parent: `Sub bottomdrawer_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (10)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `OnEvent(event As String, methodName As String)` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Show()` _(public)_
- `ShowOnBreakPoint(bp As Double)` _(public)_
- `Hide()` _(public)_
## Key Setters (14)
- `setParentID(s As String)` _(public)_
- `setBackdropColor(s As String)` _(public)_
- `setBackdropdismiss(b As Boolean)` _(public)_
- `setBackgroundColor(s As String)` _(public)_
- `setBreakpoints(s As String)` _(public)_
- `setDuration(i As Int)` _(public)_
- `setHandleBg(s As String)` _(public)_
- `setHandleShadow(s As String)` _(public)_
- `setInitialBreakpoint(s As String)` _(public)_
- `setMaxWidth(s As String)` _(public)_
- `setOpen(b As Boolean)` _(public)_
- `setShowHandle(b As Boolean)` _(public)_
- `setShowbackdrop(b As Boolean)` _(public)_
- `setWidth(s As String)` _(public)_
## Getters (16)
- `getID()` As String _(public)_
- `getParentID()` As String _(public)_
- `getHere()` As String _(public)_
- `getBackdropColor()` As String _(public)_
- `getBackdropdismiss()` As Boolean _(public)_
- `getBackgroundColor()` As String _(public)_
- `getBreakpoints()` As String _(public)_
- `getDuration()` As Int _(public)_
- `getHandleBg()` As String _(public)_
- `getHandleShadow()` As String _(public)_
- `getInitialBreakpoint()` As String _(public)_
- `getMaxWidth()` As String _(public)_
- `getOpen()` As Boolean _(public)_
- `getShowHandle()` As Boolean _(public)_
- `getShowbackdrop()` As Boolean _(public)_
- `getWidth()` As String _(public)_
## Private Methods (0)
_(none)_
## Verified Demo Usage

Real syntax from [`pgBottomDrawer.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgBottomDrawer.bas) (verified demo). `bdrawer1` = a SDUI5BottomDrawer.

```b4j
	bdrawer1.Initialize(Me, "bdrawer1", "bdrawer1")
	bdrawer1.ParentID = app.PageView
	bdrawer1.BackdropColor = ""
	bdrawer1.BackgroundColor = "base-300"
	bdrawer1.Breakpoints = ""
	bdrawer1.MaxWidth = "90%"
	bdrawer1.Showbackdrop = False
	BANano.Await(bdrawer1.AddComponent)
```

Also used in: `pgIndex`
## Emits (daisyUI classes pushed in DesignerCreateView)
**Classes**: `z-99`
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim bottomdrawer As SDUI5BottomDrawer
bottomdrawer.Initialize(Me, "SDUI5BottomDrawer", "SDUI5BottomDrawer")
bottomdrawer.ParentID = "placeholder"
BANano.Await(bottomdrawer.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.


