---
name: SDUI5Swal
description: SithasoDaisy5 SDUI5Swal component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5Swal

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5Swal.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5Swal.bas)
- **Demo References**: No direct `As`/`New` type reference was detected in the audited `pg*.bas` demo snapshot.
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5Swal is a SweetAlert-style modal dialog (alert/confirm/prompt). Use for confirmations and alerts; call Show/ShowConfirm etc.
_SDUI5Swal is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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

Wire in parent: `Sub swal_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (40)
- `Initialize()` As SDUI5Swal _(public)_
- `buttonsStyling(b As Boolean)` As SDUI5Swal _(public)_
- `confirmButtonClass(s As String)` As SDUI5Swal _(public)_
- `cancelButtonClass(s As String)` As SDUI5Swal _(public)_
- `fire()` As Map _(public)_
- `title(s As String)` As SDUI5Swal _(public)_
- `position(s As String)` As SDUI5Swal _(public)_
- `icon(s As String)` As SDUI5Swal _(public)_
- `text(s As String)` As SDUI5Swal _(public)_
- `html(s As String)` As SDUI5Swal _(public)_
- `footer(s As String)` As SDUI5Swal _(public)_
- `imageUrl(s As String)` As SDUI5Swal _(public)_
- `imageHeight(s As String)` As SDUI5Swal _(public)_
- `imageAlt(s As String)` As SDUI5Swal _(public)_
- `showCloseButton(b As Boolean)` As SDUI5Swal _(public)_
- `showCancelButton(b As Boolean)` As SDUI5Swal _(public)_
- `focusConfirm(b As Boolean)` As SDUI5Swal _(public)_
- `iconHtml(s As String)` As SDUI5Swal _(public)_
- `confirmButtonText(s As String)` As SDUI5Swal _(public)_
- `confirmButtonColor(s As String)` As SDUI5Swal _(public)_
- `showDenyButton(b As Boolean)` As SDUI5Swal _(public)_
- `denyButtonText(s As String)` As SDUI5Swal _(public)_
- `showConfirmButton(b As Boolean)` As SDUI5Swal _(public)_
- `timer(t As Int)` As SDUI5Swal _(public)_
- `cancelButtonColor(s As String)` As SDUI5Swal _(public)_
- `imageWidth(s As String)` As SDUI5Swal _(public)_
- `width(s As String)` As SDUI5Swal _(public)_
- `padding(s As String)` As SDUI5Swal _(public)_
- `rows(s As String)` As SDUI5Swal _(public)_
- `timerProgressBar(b As Boolean)` As SDUI5Swal _(public)_
- `cancelButtonText(s As String)` As SDUI5Swal _(public)_
- `input(s As String)` As SDUI5Swal _(public)_
- `allowOutsideClick(b As Boolean)` As SDUI5Swal _(public)_
- `allowEscapeKey(b As Boolean)` As SDUI5Swal _(public)_
- `allowEnterKey(b As Boolean)` As SDUI5Swal _(public)_
- `closeButtonHtml(s As String)` As SDUI5Swal _(public)_
- `inputLabel(s As String)` As SDUI5Swal _(public)_
- `inputPlaceholder(s As String)` As SDUI5Swal _(public)_
- `inputValue(s As String)` As SDUI5Swal _(public)_
- `toast(b As Boolean)` As SDUI5Swal _(public)_
## Key Setters (0)
_(none — uses base SDUI5Component setters only)_
## Getters (0)
_(none)_
## Private Methods (1)
- `Class_Globals()` _(private)_
## Emits (daisyUI classes pushed in DesignerCreateView)
_(none emitted directly — relies on base/CustProps)_
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim swal As SDUI5Swal
swal.Initialize(Me, "SDUI5Swal", "SDUI5Swal")
swal.ParentID = "placeholder"
BANano.Await(swal.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.


