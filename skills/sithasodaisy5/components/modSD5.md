---
name: modSD5
description: SithasoDaisy5 modSD5 component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# modSD5

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`modSD5.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/modSD5.bas)
- **Demo References**: No direct `As`/`New` type reference was detected in the audited `pg*.bas` demo snapshot.
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
<!-- 1-2 sentences: what this component is and when to reach for it. Auto-stub: fill for high-value components. -->
_modSD5 is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
## Skeleton Contract
Every SithasoDaisy5 component follows the same shape (see SDUI5Component base):
1. `Initialize(Callback, Name, EventName)` — sets `mCallBack`, `mName`, `mEventName`, calls `SetDefaults`.
2. `ParentID` (property / `setParentID(id)`) — attach point in the DOM.
3. `DesignerCreateView(Target, Props)` — INTERNAL (called by `AddComponent`, never from app code); reads `CustProps`, pushes daisyUI classes via `UI.AddClassDT/AddColorDT/AddRoundedDT/AddShadowDT`, appends `[BANCLEAN]<tag id="{name}">`, wires `UI.OnEvent`.
4. Live setters mutate the DOM via `UI.*ByID("{name}_child")`.

**Init signature**: `_(no Initialize)_` | **Has DesignerCreateView**: No
## Designer Properties
_(inherits from SDUI5Component base — see base contract)_
## Events
_(none declared)_

Wire in parent: `Sub modsd5_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (13)
- `Process_Globals()` _(public)_
- `Val(InputStr As String)` As String _(public)_
- `CInt(o As Object)` As Int _(public)_
- `CleanID(s As String)` As String _(public)_
- `DOMContentLoaded()` As String _(public)_
- `InitDays()` As 'ignoredeadcode _(public)_
- `Len(Text As String)` As Int _(public)_
- `CStr(o As Object)` As String _(public)_
- `PadRight(Value As String, MaxLen As Int, PadChar As String)` As String _(public)_
- `InitColors()` As 'ignoredeadcode _(public)_
- `InitMonths()` As 'ignoredeadcode _(public)_
- `InitCountries()` _(public)_
- `InitLanguages()` _(public)_
## Key Setters (0)
_(none — uses base SDUI5Component setters only)_
## Getters (0)
_(none)_
## Private Methods (0)
_(none)_
## Emits (daisyUI classes pushed in DesignerCreateView)
_(none emitted directly — relies on base/CustProps)_
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim modsd5 As modSD5
modsd5.Initialize(Me, "modSD5", "modSD5")
modsd5.ParentID = "placeholder"
BANano.Await(modsd5.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.


