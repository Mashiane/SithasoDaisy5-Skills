---
name: BANanoAnimeJSItem
description: SithasoDaisy5 BANanoAnimeJSItem component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# BANanoAnimeJSItem

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`BANanoAnimeJSItem.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/BANanoAnimeJSItem.bas)
- **Demo References**: No direct `As`/`New` type reference was detected in the audited `pg*.bas` demo snapshot.
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
_Single anime.js animation item — property/value/easing configuration consumed by BANanoAnimeJS._

This is a **class**, not a designer component: no `DesignerCreateView`, no designer properties, no daisyUI class emission. Add it to the B4J project and call its methods directly.
## Skeleton Contract
Every SithasoDaisy5 component follows the same shape (see SDUI5Component base):
1. `Initialize(Callback, Name, EventName)` — sets `mCallBack`, `mName`, `mEventName`, calls `SetDefaults`.
2. `ParentID` (property / `setParentID(id)`) — attach point in the DOM.
3. `DesignerCreateView(Target, Props)` — INTERNAL (called by `AddComponent`, never from app code); reads `CustProps`, pushes daisyUI classes via `UI.AddClassDT/AddColorDT/AddRoundedDT/AddShadowDT`, appends `[BANCLEAN]<tag id="{name}">`, wires `UI.OnEvent`.
4. Live setters mutate the DOM via `UI.*ByID("{name}_child")`.

**Init signature**: `Initialize()` | **Has DesignerCreateView**: No
## Designer Properties
_(inherits from SDUI5Component base — see base contract)_
## Events
_(none declared)_

Wire in parent: `Sub bananoanimejsitem_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (67)
- `Initialize()` As BANanoAnimeJSItem _(public)_
- `borderRadius(toValue As Object)` As BANanoAnimeJSItem _(public)_
- `fontSize(toValue As Object)` As BANanoAnimeJSItem _(public)_
- `alternate(b As Boolean)` As BANanoAnimeJSItem _(public)_
- `propertyEndValue(prop As String, propEndValue As Object)` As BANanoAnimeJSItem _(public)_
- `delay(d As Object)` As BANanoAnimeJSItem _(public)_
- `delayCallBack(Module As Object, methodName As String)` As BANanoAnimeJSItem _(public)_
- `translateXCallBack(Module As Object, methodName As String)` As BANanoAnimeJSItem _(public)_
- `updateCallBack(Module As Object, methodName As String, elID As String, obj As Map)` As BANanoAnimeJSItem _(public)_
- `translateYCallBack(Module As Object, methodName As String)` As BANanoAnimeJSItem _(public)_
- `scaleCallBack(Module As Object, methodName As String)` As BANanoAnimeJSItem _(public)_
- `rotateCallBack(Module As Object, methodName As String)` As BANanoAnimeJSItem _(public)_
- `borderRadiusCallBack(Module As Object, methodName As String)` As BANanoAnimeJSItem _(public)_
- `durationCallBack(Module As Object, methodName As String)` As BANanoAnimeJSItem _(public)_
- `value(v As Object)` As BANanoAnimeJSItem _(public)_
- `opacity(v As Double)` As BANanoAnimeJSItem _(public)_
- `easing(e As Object)` As BANanoAnimeJSItem _(public)_
- `steps(numberOfSteps As Int)` As BANanoAnimeJSItem _(public)_
- `cubicBezier(x1 As Object, y1 As Object, x2 As Object, y2 As Object)` As BANanoAnimeJSItem _(public)_
- `spring(mass As Object, stiffness As Object, damping As Object, velocity As Object)` As BANanoAnimeJSItem _(public)_
- `easeInElastic(amplitude As Object, period As Object)` As BANanoAnimeJSItem _(public)_
- `easeOutElastic(amplitude As Object, period As Object)` As BANanoAnimeJSItem _(public)_
- `easeInOutElastic(amplitude As Object, period As Object)` As BANanoAnimeJSItem _(public)_
- `easeOutInElastic(amplitude As Object, period As Object)` As BANanoAnimeJSItem _(public)_
- `duration(d As Object)` As BANanoAnimeJSItem _(public)_
- `pop()` As Map _(public)_
- `left(l As Object)` As BANanoAnimeJSItem _(public)_
- `right(l As Object)` As BANanoAnimeJSItem _(public)_
- `bottom(l As Object)` As BANanoAnimeJSItem _(public)_
- `backgroundColor(bg As String)` As BANanoAnimeJSItem _(public)_
- `visibility(b As Boolean)` As BANanoAnimeJSItem _(public)_
- `color(bg As String)` As BANanoAnimeJSItem _(public)_
- `marginTop(bg As String)` As BANanoAnimeJSItem _(public)_
- `marginRight(bg As String)` As BANanoAnimeJSItem _(public)_
- `marginBottom(bg As String)` As BANanoAnimeJSItem _(public)_
- `marginLeft(bg As String)` As BANanoAnimeJSItem _(public)_
- `backgroundColor1(bg1 As String, bg2 As String)` As BANanoAnimeJSItem _(public)_
- `color1(bg1 As String, bg2 As String)` As BANanoAnimeJSItem _(public)_
- `borderRadius1(fromValue As Object, toValue As Object)` As BANanoAnimeJSItem _(public)_
- `scale1(fromValue As Object, toValue As Object)` As BANanoAnimeJSItem _(public)_
- `translateX(x As Object)` As BANanoAnimeJSItem _(public)_
- `translateX1(x0 As Object, x1 As Object)` As BANanoAnimeJSItem _(public)_
- `translateY(x As Object)` As BANanoAnimeJSItem _(public)_
- `translateZ(x As Object)` As BANanoAnimeJSItem _(public)_
- `rotate(r As Int)` As BANanoAnimeJSItem _(public)_
- `rotateX(r As Object)` As BANanoAnimeJSItem _(public)_
- `rotateY(r As Object)` As BANanoAnimeJSItem _(public)_
- `rotateZ(r As Object)` As BANanoAnimeJSItem _(public)_
- `scale(s As Object)` As BANanoAnimeJSItem _(public)_
- `scaleX(s As Object)` As BANanoAnimeJSItem _(public)_
- `scaleY(s As Object)` As BANanoAnimeJSItem _(public)_
- `scaleZ(s As Object)` As BANanoAnimeJSItem _(public)_
- `skew(s As Object)` As BANanoAnimeJSItem _(public)_
- `skewX(s As Object)` As BANanoAnimeJSItem _(public)_
- `skewY(s As Object)` As BANanoAnimeJSItem _(public)_
- `perspective(s As Object)` As BANanoAnimeJSItem _(public)_
- `roundIT(s As Object)` As BANanoAnimeJSItem _(public)_
- `loopIT(s As Boolean)` As BANanoAnimeJSItem _(public)_
- `baseFrequency(s As Object)` As BANanoAnimeJSItem _(public)_
- `direction(d As Object)` As BANanoAnimeJSItem _(public)_
- `endDelay(s As Object)` As BANanoAnimeJSItem _(public)_
- `innerHTML(fromValue As Object, toValue As Object)` As BANanoAnimeJSItem _(public)_
- `autoplay(b As Boolean)` As BANanoAnimeJSItem _(public)_
- `width(w As Object)` As BANanoAnimeJSItem _(public)_
- `top(w As Object)` As BANanoAnimeJSItem _(public)_
- `height(h As Object)` As BANanoAnimeJSItem _(public)_
- `target(jTarget As String)` As BANanoAnimeJSItem _(public)_
## Key Setters (0)
_(none — uses base SDUI5Component setters only)_
## Getters (0)
_(none)_
## Private Methods (0)
_(none)_
## Emits (daisyUI classes pushed in DesignerCreateView)
_(none emitted directly — relies on base/CustProps)_
## Code Example
```b4j
Dim helper As BANanoAnimeJSItem
helper.Initialize(' parameters per Init signature above)
```
## Composes With
- Call from SDUI5 page/component event handlers.


