---
name: SDUI5Calendar
description: SithasoDaisy5 SDUI5Calendar component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5Calendar

## Source References

- **Framework Source**: No matching module is present in the current upstream framework source folder. This is an unregistered local reference note, not an active component skill.
- **Demo References**: No direct `As`/`New` type reference was detected in the audited `pg*.bas` demo snapshot.

## Core Idea
<!-- 1-2 sentences: what this component is and when to reach for it. Auto-stub: fill for high-value components. -->
_SDUI5Calendar is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._

## Skeleton Contract
Every SithasoDaisy5 component follows the same shape (see SDUI5Component base):
1. `Initialize(Callback, Name, EventName)` — sets `mCallBack`, `mName`, `mEventName`, calls `SetDefaults`.
2. `setParentID(id)` — attach point in the DOM.
3. `DesignerCreateView(Target, Props)` — INTERNAL (`AddComponent` calls it, never call from app code); reads `CustProps`, pushes daisyUI classes via `UI.AddClassDT/AddColorDT/AddRoundedDT/AddShadowDT`, appends `[BANCLEAN]<tag id="{name}">`, wires `UI.OnEvent`.
4. Live setters mutate the DOM via `UI.*ByID("{name}_child")`.

**Init signature**: `Initialize(Callback As Object, Name As String, EventName As String)` | **Has DesignerCreateView**: Yes

## Designer Properties
| Key | Type | Default | List | Setter | Getter |
|---|---|---|---|---|---|
| `ParentID` | String | — | — | `setParentID` | `getParentID` |
| `Text` | String | Calendar | — | `setText` | `getText` |
| `Color` | String | none | accent, error, info, neutral, primary, secondary, success, warning, none | `setColor` | `getColor` |
| `Size` | String | none | lg, md, none, sm, xl, xs | `setSize` | `getSize` |
| `Rounded` | String | none | none, rounded, 2xl, 3xl, full, lg, md, sm, xl, 0 | — | — |
| `Shadow` | String | none | 2xl, inner, lg, md, none, shadow, sm, xl | — | — |
| `Visible` | Boolean | True | — | `setVisible` | `getVisible` |
| `Enabled` | Boolean | True | — | `setEnabled` | `getEnabled` |
| `PositionStyle` | String | none | absolute, fixed, none, relative, static, sticky | — | — |
| `Position` | String | t=?; b=?; r=?; l=? | — | — | — |
| `MarginAXYTBLR` | String | a=?; x=?; y=?; t=?; b=?; l=?; r=? | — | — | — |
| `PaddingAXYTBLR` | String | a=?; x=?; y=?; t=?; b=?; l=?; r=? | — | — | — |
| `RawClasses` | String | — | — | — | — |
| `RawStyles` | String | — | — | — | — |
| `RawAttributes` | String | — | — | — | — |

Setter and getter names are the actual source `Sub` names. `—` means this component has no named accessor for that side; designer-time values may still be consumed through `Props` in `DesignerCreateView`.
## Events
`Click`

Wire in parent: `Sub calendar_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.

## Public Methods (6)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_

## Key Setters (7)
- `setParentID(s As String)` _(public)_
- `setText(text As String)` _(public)_
- `setColor(s As String)` _(public)_
- `setSize(s As String)` _(public)_
- `setVariant(s As String)` _(public)_
- `setVisible(b As Boolean)` _(public)_
- `setEnabled(b As Boolean)` _(public)_

## Getters (9)
- `getID()` As String _(public)_
- `getParentID()` As String _(public)_
- `getHere()` As String _(public)_
- `getText()` As String _(public)_
- `getColor()` As String _(public)_
- `getSize()` As String _(public)_
- `getVariant()` As String _(public)_
- `getVisible()` As Boolean _(public)_
- `getEnabled()` As Boolean _(public)_

## Private Methods (1)
- `SetDefaults()` _(private)_

## Emits (daisyUI classes pushed in DesignerCreateView)
**Classes**: `calendar`
**Colors**: `calendar:sColor`

## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim calendar As SDUI5Calendar
calendar.Initialize(Me, "SDUI5Calendar", "SDUI5Calendar")
calendar.ParentID = "placeholder"
BANano.Await(calendar.AddComponent)   ' DesignerCreateView runs internally
```

## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.


