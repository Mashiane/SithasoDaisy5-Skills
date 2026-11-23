---
name: SDUI5AOS
description: SithasoDaisy5 SDUI5AOS component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5AOS

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5AOS.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5AOS.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgAOS.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgAOS.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5AOS is an Animate On Scroll (AOS) controller component for triggering CSS animations as elements scroll into view. It configures global scroll trigger behaviors (duration, delay, offset, easing, once, mirror, anchor placement) and allows animating target elements declaratively or programmatically.
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
| `Duration` | Int | 800 | — | `setDuration` | `getDuration` |
| `Delay` | Int | 0 | — | `setDelay` | `getDelay` |
| `Offset` | Int | 120 | — | `setOffset` | `getOffset` |
| `Easing` | String | ease | ease, ease-in, ease-out, ease-in-out, ease-in-back, ease-out-back, ease-in-out-back, ease-in-sine, ease-out-sine, ease-in-out-sine, ease-in-quad, ease-out-quad, ease-in-out-quad, ease-in-cubic, ease-out-cubic, ease-in-out-cubic, ease-in-quart, ease-out-quart, ease-in-out-quart, linear | `setEasing` | `getEasing` |
| `Once` | Boolean | False | — | `setOnce` | `getOnce` |
| `Mirror` | Boolean | False | — | `setMirror` | `getMirror` |
| `AnchorPlacement` | String | top-bottom | top-bottom, top-center, top-top, center-bottom, center-center, center-top, bottom-bottom, bottom-center, bottom-top | `setAnchorPlacement` | `getAnchorPlacement` |
| `Disable` | String | none | none, phone, tablet, mobile, true, false | `setDisable` | `getDisable` |
| `StartEvent` | String | DOMContentLoaded | — | `setStartEvent` | `getStartEvent` |
| `ThrottleDelay` | Int | 99 | — | `setThrottleDelay` | `getThrottleDelay` |
| `DebounceDelay` | Int | 50 | — | `setDebounceDelay` | `getDebounceDelay` |
| `DisableMutationObserver` | Boolean | False | — | `setDisableMutationObserver` | `getDisableMutationObserver` |

Setter and getter names are the actual source `Sub` names. `—` means this component has no named accessor for that side; designer-time values may still be consumed through `Props` in `DesignerCreateView`.
## Events
_(none declared)_

Wire in parent: `Sub aos_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (21)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `OnEvent(event As String, methodName As String)` _(public)_
- `BuildOptions()` As Map _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Init()` _(public)_
- `InitWithOptions(options As Map)` _(public)_
- `Refresh()` _(public)_
- `RefreshHard()` _(public)_
- `Animate(selectorOrID As String, animation As String)` As SDUI5AOS _(public)_
- `AnimateAdvanced(selectorOrID As String, animation As String, duration As Int, delay As Int, once As Boolean, offset As Int, easing As String)` As SDUI5AOS _(public)_
- `SetAnimation(selectorOrID As String, animation As String)` As SDUI5AOS _(public)_
- `SetDurationOn(selectorOrID As String, duration As Int)` As SDUI5AOS _(public)_
- `SetDelayOn(selectorOrID As String, delay As Int)` As SDUI5AOS _(public)_
- `SetEasingOn(selectorOrID As String, easing As String)` As SDUI5AOS _(public)_
- `SetAnchorOn(selectorOrID As String, anchorSelector As String)` As SDUI5AOS _(public)_
- `SetAnchorPlacementOn(selectorOrID As String, placement As String)` As SDUI5AOS _(public)_
- `SetOnceOn(selectorOrID As String, once As Boolean)` As SDUI5AOS _(public)_
## Key Setters (13)
- `setParentID(s As String)` _(public)_
- `setDuration(i As Int)` _(public)_
- `setDelay(i As Int)` _(public)_
- `setOffset(i As Int)` _(public)_
- `setEasing(s As String)` _(public)_
- `setOnce(b As Boolean)` _(public)_
- `setMirror(b As Boolean)` _(public)_
- `setAnchorPlacement(s As String)` _(public)_
- `setDisable(s As String)` _(public)_
- `setStartEvent(s As String)` _(public)_
- `setThrottleDelay(i As Int)` _(public)_
- `setDebounceDelay(i As Int)` _(public)_
- `setDisableMutationObserver(b As Boolean)` _(public)_
## Getters (15)
- `getID()` As String _(public)_
- `getParentID()` As String _(public)_
- `getHere()` As String _(public)_
- `getDuration()` As Int _(public)_
- `getDelay()` As Int _(public)_
- `getOffset()` As Int _(public)_
- `getEasing()` As String _(public)_
- `getOnce()` As Boolean _(public)_
- `getMirror()` As Boolean _(public)_
- `getAnchorPlacement()` As String _(public)_
- `getDisable()` As String _(public)_
- `getStartEvent()` As String _(public)_
- `getThrottleDelay()` As Int _(public)_
- `getDebounceDelay()` As Int _(public)_
- `getDisableMutationObserver()` As Boolean _(public)_
## Private Methods (1)
- `SetDefaults()` _(private)_
## Verified Demo Usage

Real syntax from [`pgAOS.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgAOS.bas) (verified demo):

```b4j
' Ensure AOS asset is loaded
BANano.Await(app.UsesAOS)

' Mount the AOS controller view
Dim SDUI5AOS1 As SDUI5AOS
SDUI5AOS1.Initialize(Me, "SDUI5AOS1", "SDUI5AOS1")
SDUI5AOS1.ParentID = "SDUI5Container1"
SDUI5AOS1.Duration = 800
SDUI5AOS1.Once = True
SDUI5AOS1.Offset = 100
SDUI5AOS1.Easing = "ease-out-cubic"
BANano.Await(SDUI5AOS1.AddComponent)

' Elements can be animated via declarative attributes:
card1.Attributes = "data-aos=fade-up; data-aos-duration=800; data-aos-offset=100"
```
## Emits (daisyUI classes pushed in DesignerCreateView)
_(none emitted directly — relies on base/CustProps)_
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. Never call DesignerCreateView from app code — AddComponent runs it internally. -->
```vb
Dim aos As SDUI5AOS
aos.Initialize(Me, "SDUI5AOS", "SDUI5AOS")
aos.ParentID = "placeholder"
BANano.Await(aos.AddComponent)
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.
