---
name: SDUI5Aura
description: SithasoDaisy5 SDUI5Aura component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5Aura

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5Aura.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5Aura.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgAura.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgAura.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
An aura adds a light effect around the border of a component. Use it to make an important button, card, or div easy to see. Wraps **exactly one direct child** — nest the child by setting the child's `ParentID` to the aura's `ID`. daisyUI guidance: do not use more than one prominent aura per page (demo/gallery pages showing all variants are the exception).
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
| `TypeOf` | String | none | dual, rainbow, holo, gold, silver, glow, none | `setTypeOf` | `getTypeOf` |
| `TextColor` | String | — | — | `setTextColor` | `getTextColor` |
| `BackgroundColor` | String | — | — | `setBackgroundColor` | `getBackgroundColor` |
| `Size` | String | none | lg, md, none, sm, xl, xs | `setSize` | `getSize` |
| `Visible` | Boolean | True | — | `setVisible` | `getVisible` |
| `Enabled` | Boolean | True | — | `setEnabled` | `getEnabled` |
| `PositionStyle` | String | none | absolute, fixed, none, relative, static, sticky | `setPositionStyle` | `getPositionStyle` |
| `Position` | String | t=?; b=?; r=?; l=? | — | `setPosition` | `getPosition` |
| `MarginAXYTBLR` | String | a=?; x=?; y=?; t=?; b=?; l=?; r=? | — | `setMarginAXYTBLR` | `getMarginAXYTBLR` |
| `PaddingAXYTBLR` | String | a=?; x=?; y=?; t=?; b=?; l=?; r=? | — | `setPaddingAXYTBLR` | `getPaddingAXYTBLR` |
| `RawClasses` | String | — | — | `setClasses` | `getClasses` |
| `RawStyles` | String | — | — | `setStyles` | `getStyles` |
| `RawAttributes` | String | — | — | `setAttributes` | `getAttributes` |

Setter and getter names are the actual source `Sub` names. `—` means this component has no named accessor for that side; designer-time values may still be consumed through `Props` in `DesignerCreateView`.
Where a designer key and method name differ, the method names shown are the source-verified mapping.
## Events
`Click`

Wire in parent: `Sub aura_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (6)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
## Key Setters (14)
- `setParentID(s As String)` _(public)_
- `setTypeOf(s As String)` _(public)_
- `setBackgroundColor(s As String)` _(public)_
- `setTextColor(s As String)` _(public)_
- `setSize(s As String)` _(public)_
- `setVisible(b As Boolean)` _(public)_
- `setEnabled(b As Boolean)` _(public)_
- `setPositionStyle(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setAttributes(s As String)` _(public)_
- `setStyles(s As String)` _(public)_
- `setClasses(s As String)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
## Getters (16)
- `getID()` As String _(public)_
- `getParentID()` As String _(public)_
- `getHere()` As String _(public)_
- `getTypeOf()` As String _(public)_
- `getTextColor()` As String _(public)_
- `getBackgroundColor()` As String _(public)_
- `getSize()` As String _(public)_
- `getVisible()` As Boolean _(public)_
- `getEnabled()` As Boolean _(public)_
- `getPositionStyle()` As String _(public)_
- `getPosition()` As String _(public)_
- `getAttributes()` As String _(public)_
- `getStyles()` As String _(public)_
- `getClasses()` As String _(public)_
- `getPaddingAXYTBLR()` As String _(public)_
- `getMarginAXYTBLR()` As String _(public)_
## Private Methods (1)
- `SetDefaults()` _(private)_
## Emits (daisyUI classes pushed in DesignerCreateView)
**Classes**: `aura`
## Code Example
```vb
Dim aura As SDUI5Aura
aura.Initialize(Me, "aura1", "aura1")
aura.ParentID = "placeholder"      ' attach point (e.g. container cell ID)
aura.TypeOf = "gold"               ' dual | rainbow | holo | gold | silver | glow
aura.Size = "lg"                   ' xs | sm | md | lg | xl
BANano.Await(aura.AddComponent)

Dim btn As SDUI5Button
btn.Initialize(Me, "aura1btn", "aura1btn")
btn.ParentID = aura.getID          ' the single direct child of the aura
btn.Text = "Upgrade"
btn.Color = "primary"
BANano.Await(btn.AddComponent)
```
## Composes With
- Any single child component (commonly `SDUI5Button`, `SDUI5Card`) nested via child `.ParentID = aura.getID()`.
- Attach the aura itself to a container cell: `aura.ParentID = cont.CellID(r, c)` (SDUI5Container grid) or any existing element id.
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes).
## daisyUI v5 Mapping
- component: `aura`; styles: `aura-dual`, `aura-rainbow`, `aura-holo`, `aura-gold`, `aura-silver`, `aura-glow`; sizes: `aura-xs` … `aura-xl`
- custom aura color → `text-*` (via `TextColor`); custom background → `bg-*` (via `BackgroundColor`); custom animation time → `duration-*` (via `Classes`/`RawClasses`)
- The aura element must have exactly one direct child — set the child component's `ParentID = aura.getID()` before `BANano.Await(child.AddComponent)`.
## Demonstrated
✅ Demonstrated in SithasoDaisy5Demo: `pgAura.bas` (Components → Data Display → Aura) — shows all 6 styles, sizes xs–xl, custom text-color, `duration-1000` timing via `Classes`, and a gold aura highlighting a card.


