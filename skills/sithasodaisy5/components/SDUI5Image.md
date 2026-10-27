---
name: SDUI5Image
description: SithasoDaisy5 SDUI5Image component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5Image

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5Image.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5Image.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgDropDown.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgDropDown.bas)
  - [`pgGifPlayer.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgGifPlayer.bas)
  - [`pgHero.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgHero.bas)
  - [`pgHoverGallery.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgHoverGallery.bas)
  - [`pgImage.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgImage.bas)
  - [`pgIndicator.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgIndicator.bas)
  - [`pgLIst.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgLIst.bas)
  - [`pgSignaturePad.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgSignaturePad.bas)
  - [`pgStack.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgStack.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5Image is an image with sizing, masking, and loading. Use for displaying images.
_SDUI5Image is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `TypeOf` | String | normal | legend, normal | `setTypeOf` | `getTypeOf` |
| `Label` | String | — | — | `setLabel` | `getLabel` |
| `Src` | String | ./assets/mashy.jpg | — | `setSrc` | `getSrc` |
| `Alt` | String | Image | — | `setAlt` | `getAlt` |
| `Height` | String | 12 | — | `setHeight` | `getHeight` |
| `Width` | String | 12 | — | `setWidth` | `getWidth` |
| `CenterFieldSet` | Boolean | True | — | `setCenterFieldSet` | `getCenterFieldSet` |
| `Lazy` | Boolean | False | — | `setLazy` | `getLazy` |
| `Gif` | Boolean | False | — | `setGif` | `getGif` |
| `GifPoster` | String | — | — | `setGifPoster` | `getGifPoster` |
| `Cover` | Boolean | True | — | `setCover` | `getCover` |
| `Center` | Boolean | True | — | `setCenter` | `getCenter` |
| `NoRepeat` | Boolean | True | — | `setNoRepeat` | `getNoRepeat` |
| `MinHeight` | String | — | — | `setMinHeight` | `getMinHeight` |
| `MaxHeight` | String | — | — | `setMaxHeight` | `getMaxHeight` |
| `MinWidth` | String | — | — | `setMinWidth` | `getMinWidth` |
| `MaxWidth` | String | — | — | `setMaxWidth` | `getMaxWidth` |
| `Mask` | String | rounded | circle, decagon, diamond, heart, hexagon, hexagon-2, none, pentagon, rounded, rounded-2xl, rounded-3xl, rounded-lg, rounded-md, rounded-sm, rounded-xl, square, squircle, star, star-2, triangle, triangle-2, triangle-3, triangle-4 | `setMask` | `getMask` |
| `Shadow` | String | none | 2xl, inner, lg, md, none, shadow, sm, xl | `setShadow` | `getShadow` |
| `RoundedBox` | Boolean | False | — | `setRoundedBox` | `getRoundedBox` |
| `PopOverTarget` | String | — | — | `setPopOverTarget` | `getPopOverTarget` |
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

Wire in parent: `Sub image_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (7)
- `AddAttr(k As String, v As String)` _(public)_
- `AddClass(className As String)` _(public)_
- `AddComponent()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `Remove()` _(public)_
- `RemoveClass(className As String)` _(public)_

## Key Setters (32)
- `setAlt(s As String)` _(public)_
- `setAttributes(s As String)` _(public)_
- `setCenter(b As Boolean)` _(public)_
- `setCenterFieldSet(b As Boolean)` _(public)_
- `setClasses(s As String)` _(public)_
- `setCover(b As Boolean)` _(public)_
- `setEnabled(b As Boolean)` _(public)_
- `setGif(b As Boolean)` _(public)_
- `setGifPoster(s As String)` _(public)_
- `setHeight(s As String)` _(public)_
- `setLabel(s As String)` _(public)_
- `setLazy(b As Boolean)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setMask(s As String)` _(public)_
- `setMaxHeight(s As String)` _(public)_
- `setMaxWidth(s As String)` _(public)_
- `setMinHeight(s As String)` _(public)_
- `setMinWidth(s As String)` _(public)_
- `setNoRepeat(b As Boolean)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setParentID(s As String)` _(public)_
- `setPopOverTarget(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setPositionStyle(s As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `setRoundedBox(b As Boolean)` _(public)_
- `setShadow(s As String)` _(public)_
- `setSrc(s As String)` _(public)_
- `setStyles(s As String)` _(public)_
- `setTypeOf(s As String)` _(public)_
- `setVisible(b As Boolean)` _(public)_
- `setWidth(s As String)` _(public)_

## Getters (34)
- `getAlt()` _(public)_
- `getAttributes()` _(public)_
- `getCenter()` _(public)_
- `getCenterFieldSet()` _(public)_
- `getClasses()` _(public)_
- `getCover()` _(public)_
- `getEnabled()` _(public)_
- `getGif()` _(public)_
- `getGifPoster()` _(public)_
- `getHeight()` _(public)_
- `getHere()` As String _(public)_
- `getID()` As String _(public)_
- `getLabel()` _(public)_
- `getLazy()` _(public)_
- `getMarginAXYTBLR()` _(public)_
- `getMask()` _(public)_
- `getMaxHeight()` _(public)_
- `getMaxWidth()` _(public)_
- `getMinHeight()` _(public)_
- `getMinWidth()` _(public)_
- `getNoRepeat()` _(public)_
- `getPaddingAXYTBLR()` _(public)_
- `getParentID()` _(public)_
- `getPopOverTarget()` _(public)_
- `getPosition()` _(public)_
- `getPositionStyle()` _(public)_
- `GetProperties()` _(public)_
- `getRoundedBox()` _(public)_
- `getShadow()` _(public)_
- `getSrc()` _(public)_
- `getStyles()` _(public)_
- `getTypeOf()` _(public)_
- `getVisible()` _(public)_
- `getWidth()` _(public)_

## Private Methods (1)
- `SetDefaults()` _(private)_

## Verified Demo Usage

Real syntax from [`pgImage.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgImage.bas) (verified demo):

```b4j
Private SDUI5Image1 As SDUI5Image		'ignore
Private SDUI5Image10 As SDUI5Image		'ignore
Private SDUI5Image11 As SDUI5Image		'ignore
Private SDUI5Image12 As SDUI5Image		'ignore
Private SDUI5Image13 As SDUI5Image		'ignore
Private SDUI5Image14 As SDUI5Image		'ignore
Private SDUI5Image15 As SDUI5Image		'ignore
BANano.Await(SDUI5Container1.AddComponent)
```

## Emits (daisyUI classes pushed in DesignerCreateView)
**Classes**: `bg-cover`, `bg-center`, `bg-no-repeat`, `rounded-box`
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim image As SDUI5Image
image.Initialize(Me, "SDUI5Image", "SDUI5Image")
image.ParentID = "placeholder"
BANano.Await(image.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.
