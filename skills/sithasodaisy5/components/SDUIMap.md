---
name: SDUIMap
description: SithasoDaisy5 SDUIMap component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUIMap

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUIMap.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUIMap.bas)
- **Demo References**: No direct `As`/`New` type reference was detected in the audited `pg*.bas` demo snapshot.
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
_Serializable map/collection helper for storing and passing key-value data._

This is a **service module**, not a designer component: no `DesignerCreateView`, no designer properties, no daisyUI class emission. Add it to the B4J project and call its methods directly.
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

Wire in parent: `Sub map_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (9)
- `Initialize()` _(public)_
- `Put(Key As Object, Value As Object)` _(public)_
- `Remove(Key As Object)` _(public)_
- `Clear()` _(public)_
- `Get(Key As Object)` As Object _(public)_
- `GetDefault(Key As Object, DefaultValue As Object)` As Object _(public)_
- `ContainsKey(Key As Object)` As Boolean _(public)_
- `GetDataForSerializator()` As Object _(public)_
- `SetDataFromSerializator(Data As Object)` _(public)_
## Key Setters (0)
_(none — uses base SDUI5Component setters only)_
## Getters (6)
- `getKeys()` As List _(public)_
- `getSize()` As Int _(public)_
- `getValues()` As List _(public)_
- `getFirst()` As Object _(public)_
- `getNth(n As Int)` As Object _(public)_
- `getLast()` As Object _(public)_
## Private Methods (0)
_(none)_
## Emits (daisyUI classes pushed in DesignerCreateView)
_(none emitted directly — relies on base/CustProps)_
## Code Example
```b4j
Dim svc As SDUIMap
svc.Initialize(' parameters per Init signature above)
```
## Composes With
- Pairs with the SDUI5 page components: call service methods from page/component event handlers.


