---
name: BANanoAnimeJS
description: SithasoDaisy5 BANanoAnimeJS component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# BANanoAnimeJS

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`BANanoAnimeJS.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/BANanoAnimeJS.bas)
- **Demo References**: No direct `As`/`New` type reference was detected in the audited `pg*.bas` demo snapshot.
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
_anime.js animation wrapper — animate DOM targets with easing, keyframes and looping; raises Update/Begin/Complete/Loop* events._

This is a **class**, not a designer component: no `DesignerCreateView`, no designer properties, no daisyUI class emission. Add it to the B4J project and call its methods directly.
## Skeleton Contract
Every SithasoDaisy5 component follows the same shape (see SDUI5Component base):
1. `Initialize(Callback, Name, EventName)` — sets `mCallBack`, `mName`, `mEventName`, calls `SetDefaults`.
2. `ParentID` (property / `setParentID(id)`) — attach point in the DOM.
3. `DesignerCreateView(Target, Props)` — INTERNAL (called by `AddComponent`, never from app code); reads `CustProps`, pushes daisyUI classes via `UI.AddClassDT/AddColorDT/AddRoundedDT/AddShadowDT`, appends `[BANCLEAN]<tag id="{name}">`, wires `UI.OnEvent`.
4. Live setters mutate the DOM via `UI.*ByID("{name}_child")`.

**Init signature**: `Initialize(Module As Object, EventName As String, targetx As Object)` | **Has DesignerCreateView**: No
## Designer Properties
_(inherits from SDUI5Component base — see base contract)_
## Events
`Update`, `Begin`, `Complete`, `LoopComplete`, `LoopBegin`, `Change`, `ChangeBegin`, `ChangeComplete`

Wire in parent: `Sub bananoanimejs_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (9)
- `Initialize(Module As Object, EventName As String, targetx As Object)` As BANanoAnimeJS _(public)_
- `animation()` As BANanoAnimeJSItem _(public)_
- `keyframes(kf As BANanoAnimeJSItem)` As BANanoAnimeJS _(public)_
- `target(jTarget As String)` As BANanoAnimeJS _(public)_
- `create()` _(public)_
- `play()` _(public)_
- `pause()` _(public)_
- `restart()` _(public)_
- `reverse()` _(public)_
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
Dim helper As BANanoAnimeJS
helper.Initialize(Module As Object, EventName As String, targetx As Object)
```
## Composes With
- Call from SDUI5 page/component event handlers.


