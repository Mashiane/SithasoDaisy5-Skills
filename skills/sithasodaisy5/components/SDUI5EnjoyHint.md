---
name: SDUI5EnjoyHint
description: SithasoDaisy5 SDUI5EnjoyHint component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5EnjoyHint

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5EnjoyHint.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5EnjoyHint.bas)
- **Demo References**: No direct `As`/`New` type reference was detected in the audited `pg*.bas` demo snapshot.
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5EnjoyHint is a guided tour/hint overlay for onboarding. Use to highlight UI elements step-by-step.
_SDUI5EnjoyHint is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
## Skeleton Contract
Every SithasoDaisy5 component follows the same shape (see SDUI5Component base):
1. `Initialize(Callback, Name, EventName)` — sets `mCallBack`, `mName`, `mEventName`, calls `SetDefaults`.
2. `ParentID` (property / `setParentID(id)`) — attach point in the DOM.
3. `DesignerCreateView(Target, Props)` — INTERNAL (called by `AddComponent`, never from app code); reads `CustProps`, pushes daisyUI classes via `UI.AddClassDT/AddColorDT/AddRoundedDT/AddShadowDT`, appends `[BANCLEAN]<tag id="{name}">`, wires `UI.OnEvent`.
4. Live setters mutate the DOM via `UI.*ByID("{name}_child")`.

**Init signature**: `Initialize(Module As Object, EventName As String, bUnique As Boolean)` | **Has DesignerCreateView**: No
## Designer Properties
_(inherits from SDUI5Component base — see base contract)_
## Events
`EnjoyStarted`, `EnjoyEnded`, `EnjoySkip`

Wire in parent: `Sub enjoyhint_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (22)
- `Initialize(Module As Object, EventName As String, bUnique As Boolean)` _(public)_
- `JoinDescription(items As List)` As String _(public)_
- `AddStep(eID As String,eDescription As String)` As String _(public)_
- `AddStepAsIs(eID As String,eDescription As String)` As String _(public)_
- `AddClick(eID As String,eDescription As String)` As String _(public)_
- `AddClickAsIs(eID As String,eDescription As String)` As String _(public)_
- `AddKeyPress(eID As String,eDescription As String)` As String _(public)_
- `AddKeyPressAsIs(eID As String,eDescription As String)` As String _(public)_
- `EndsOn(eID As String, Description As String)` _(public)_
- `EndsOnAsIs(eID As String, Description As String)` _(public)_
- `HideSkip(eID As String)` _(public)_
- `HideSkipAsIs(eID As String)` _(public)_
- `HideNext(eID As String)` _(public)_
- `HideNextAsIs(eID As String)` _(public)_
- `SetOnBeforeStart(eID As String, Module As Object, MethodName As String)` _(public)_
- `SetNextButton(eID As String, Text As String)` _(public)_
- `SetNextButtonAsIs(eID As String, Text As String)` _(public)_
- `SetSkipButton(eID As String, Text As String)` _(public)_
- `SetSkipButtonAsIs(eID As String, Text As String)` _(public)_
- `SetCircle(eID As String, radius As Int)` _(public)_
- `SetCircleAsIs(eID As String, radius As Int)` _(public)_
- `Run(Module As Object)` _(public)_
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
Dim enjoyhint As SDUI5EnjoyHint
enjoyhint.Initialize(Me, "SDUI5EnjoyHint", "SDUI5EnjoyHint")
enjoyhint.ParentID = "placeholder"
BANano.Await(enjoyhint.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.


