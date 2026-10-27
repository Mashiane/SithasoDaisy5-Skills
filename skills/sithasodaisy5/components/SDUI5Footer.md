---
name: SDUI5Footer
description: SithasoDaisy5 SDUI5Footer component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5Footer

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5Footer.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5Footer.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgFooter.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgFooter.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5Footer is a page footer container. Children (links, titles, sections) mount via `ParentID = footerName`. Use for site footer.
_SDUI5Footer is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `TextColor` | String | — | — | `setTextColor` | `getTextColor` |
| `BackgroundColor` | String | — | — | `setBackgroundColor` | `getBackgroundColor` |
| `Center` | Boolean | False | — | `setCenter` | `getCenter` |
| `Direction` | String | none | horizontal, none, vertical | `setDirection` | `getDirection` |
| `DirectionOnSmall` | String | horizontal | horizontal, none, vertical | `setDirectionOnSmall` | `getDirectionOnSmall` |
| `Height` | String | — | — | `setHeight` | `getHeight` |
| `Width` | String | — | — | `setWidth` | `getWidth` |
| `Visible` | Boolean | True | — | `setVisible` | `getVisible` |
| `Enabled` | Boolean | True | — | `setEnabled` | `getEnabled` |
| `PositionStyle` | String | sticky | absolute, fixed, none, relative, static, sticky | `setPositionStyle` | `getPositionStyle` |
| `Position` | String | t=?; b=0; r=?; l=? | — | `setPosition` | `getPosition` |
| `MarginAXYTBLR` | String | a=?; x=?; y=?; t=?; b=?; l=?; r=? | — | `setMarginAXYTBLR` | `getMarginAXYTBLR` |
| `PaddingAXYTBLR` | String | a=4; x=?; y=?; t=?; b=?; l=?; r=? | — | `setPaddingAXYTBLR` | `getPaddingAXYTBLR` |
| `RawClasses` | String | — | — | `setClasses` | `getClasses` |
| `RawStyles` | String | — | — | `setStyles` | `getStyles` |
| `RawAttributes` | String | — | — | `setAttributes` | `getAttributes` |

Setter and getter names are the actual source `Sub` names. `—` means this component has no named accessor for that side; designer-time values may still be consumed through `Props` in `DesignerCreateView`.
Where a designer key and method name differ, the method names shown are the source-verified mapping.
## Events
_(none declared)_

Wire in parent: `Sub footer_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (5)
- `AddComponent()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `Remove()` _(public)_
- `ResponsiveClass(className As String, xs As Boolean, sm As Boolean, md As Boolean, lg As Boolean)` _(public)_

## Key Setters (18)
- `setAttributes(s As String)` _(public)_
- `setBackgroundColor(s As String)` _(public)_
- `setCenter(b As Boolean)` _(public)_
- `setClasses(s As String)` _(public)_
- `setDirection(s As String)` _(public)_
- `setDirectionOnSmall(s As String)` _(public)_
- `setEnabled(b As Boolean)` _(public)_
- `setHeight(s As String)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setParentID(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setPositionStyle(s As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `setStyles(s As String)` _(public)_
- `setTextColor(s As String)` _(public)_
- `setVisible(b As Boolean)` _(public)_
- `setWidth(s As String)` _(public)_

## Getters (20)
- `getAttributes()` _(public)_
- `getBackgroundColor()` _(public)_
- `getCenter()` _(public)_
- `getClasses()` _(public)_
- `getDirection()` _(public)_
- `getDirectionOnSmall()` _(public)_
- `getEnabled()` _(public)_
- `getHeight()` _(public)_
- `getHere()` As String _(public)_
- `getID()` As String _(public)_
- `getMarginAXYTBLR()` _(public)_
- `getPaddingAXYTBLR()` _(public)_
- `getParentID()` As String _(public)_
- `getPosition()` _(public)_
- `getPositionStyle()` _(public)_
- `GetProperties()` _(public)_
- `getStyles()` _(public)_
- `getTextColor()` _(public)_
- `getVisible()` _(public)_
- `getWidth()` _(public)_

## Private Methods (1)
- `SetDefaults()` _(private)_

## Verified Demo Usage

Real syntax from [`pgFooter.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgFooter.bas) (verified demo):

```b4j
Private SDUI5Footer1 As SDUI5Footer		'ignore
BANano.Await(SDUI5Container1.AddComponent)
```

## Emits (daisyUI classes pushed in DesignerCreateView)
**Classes**: `footer`, `footer-center`
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim footer As SDUI5Footer
footer.Initialize(Me, "SDUI5Footer", "SDUI5Footer")
footer.ParentID = "placeholder"
BANano.Await(footer.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.
