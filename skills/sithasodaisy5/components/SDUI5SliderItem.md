---
name: SDUI5SliderItem
description: SithasoDaisy5 SDUI5SliderItem component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5SliderItem

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5SliderItem.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5SliderItem.bas)
- **Demo References**: No direct `As`/`New` type reference was detected in the audited `pg*.bas` demo snapshot.
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5SliderItem is a single slide for SDUI5Slider. Mount into the slider via ParentID. Contains image/content.
_SDUI5SliderItem is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `TypeOf` | String | image | custom, image | `setTypeOf` | `getTypeOf` |
| `Image` | String | ./assets/mashy.jpg | — | `setImage` | `getImage` |
| `ImageHeight` | String | full | — | `setImageHeight` | `getImageHeight` |
| `ImageWidth` | String | full | — | `setImageWidth` | `getImageWidth` |
| `ImageRounded` | String | none | 0, 2xl, 3xl, full, lg, md, none, rounded, sm, xl | `setImageRounded` | `getImageRounded` |
| `ImageRoundedBox` | Boolean | False | — | `setImageRoundedBox` | `getImageRoundedBox` |
| `ImageShadow` | String | none | 2xl, inner, lg, md, none, shadow, sm, xl | `setImageShadow` | `getImageShadow` |
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
_(none declared)_

Wire in parent: `Sub slideritem_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (4)
- `AddComponent()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `Remove()` _(public)_

## Key Setters (16)
- `setAttributes(s As String)` _(public)_
- `setClasses(s As String)` _(public)_
- `setImage(s As String)` _(public)_
- `setImageHeight(s As String)` _(public)_
- `setImageRounded(s As String)` _(public)_
- `setImageRoundedBox(b As Boolean)` _(public)_
- `setImageShadow(s As String)` _(public)_
- `setImageWidth(s As String)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setParentID(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setPositionStyle(s As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `setStyles(s As String)` _(public)_
- `setTypeOf(s As String)` _(public)_

## Getters (18)
- `getAttributes()` _(public)_
- `getClasses()` _(public)_
- `getHere()` As String _(public)_
- `getID()` As String _(public)_
- `getImage()` _(public)_
- `getImageHeight()` _(public)_
- `getImageRounded()` _(public)_
- `getImageRoundedBox()` _(public)_
- `getImageShadow()` _(public)_
- `getImageWidth()` _(public)_
- `getMarginAXYTBLR()` _(public)_
- `getPaddingAXYTBLR()` _(public)_
- `getParentID()` _(public)_
- `getPosition()` _(public)_
- `getPositionStyle()` _(public)_
- `GetProperties()` _(public)_
- `getStyles()` _(public)_
- `getTypeOf()` _(public)_

## Private Methods (1)
- `SetDefaults()` _(private)_

## Emits (daisyUI classes pushed in DesignerCreateView)
**Classes**: `jcarousel-item`
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim slideritem As SDUI5SliderItem
slideritem.Initialize(Me, "SDUI5SliderItem", "SDUI5SliderItem")
slideritem.ParentID = "placeholder"
BANano.Await(slideritem.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.
