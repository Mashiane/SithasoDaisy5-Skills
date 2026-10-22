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
## Public Methods (9)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `AddClass(className As String)` _(public)_
- `RemoveClass(className As String)` _(public)_
- `AddAttr(k As String, v As String)` _(public)_
## Key Setters (31)
- `setParentID(s As String)` _(public)_
- `setVisible(b As Boolean)` As 'ignoredeadcode _(public)_
- `setEnabled(b As Boolean)` _(public)_
- `setPositionStyle(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setAttributes(s As String)` _(public)_
- `setStyles(s As String)` _(public)_
- `setClasses(s As String)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setCenterFieldSet(b As Boolean)` As 'ignoredeadcode _(public)_
- `setLabel(s As String)` _(public)_
- `setTypeOf(s As String)` _(public)_
- `setGifPoster(s As String)` As 'ignoredeadcode _(public)_
- `setGif(b As Boolean)` As 'ignoredeadcode _(public)_
- `setLazy(b As Boolean)` As 'ignoredeadcode _(public)_
- `setCover(b As Boolean)` As 'ignoredeadcode _(public)_
- `setCenter(b As Boolean)` As 'ignoredeadcode _(public)_
- `setNoRepeat(b As Boolean)` As 'ignoredeadcode _(public)_
- `setPopOverTarget(s As String)` As 'ignoredeadcode _(public)_
- `setRoundedBox(b As Boolean)` As 'ignoredeadcode _(public)_
- `setAlt(s As String)` As 'ignoredeadcode _(public)_
- `setHeight(s As String)` As 'ignoredeadcode _(public)_
- `setMask(s As String)` As 'ignoredeadcode _(public)_
- `setShadow(s As String)` As 'ignoredeadcode _(public)_
- `setSrc(s As String)` As 'ignoredeadcode _(public)_
- `setWidth(s As String)` As 'ignoredeadcode _(public)_
- `setMaxHeight(s As String)` As 'ignoredeadcode _(public)_
- `setMaxWidth(s As String)` As 'ignoredeadcode _(public)_
- `setMinHeight(s As String)` As 'ignoredeadcode _(public)_
- `setMinWidth(s As String)` As 'ignoredeadcode _(public)_
## Getters (33)
- `getID()` As String _(public)_
- `getParentID()` As String _(public)_
- `getHere()` As String _(public)_
- `getVisible()` As Boolean _(public)_
- `getEnabled()` As Boolean _(public)_
- `getPositionStyle()` As String _(public)_
- `getPosition()` As String _(public)_
- `getAttributes()` As String _(public)_
- `getStyles()` As String _(public)_
- `getClasses()` As String _(public)_
- `getPaddingAXYTBLR()` As String _(public)_
- `getMarginAXYTBLR()` As String _(public)_
- `getCenterFieldSet()` As Boolean _(public)_
- `getLabel()` As String _(public)_
- `getTypeOf()` As String _(public)_
- `getGifPoster()` As String _(public)_
- `getGif()` As Boolean _(public)_
- `getLazy()` As Boolean _(public)_
- `getCover()` As Boolean _(public)_
- `getCenter()` As Boolean _(public)_
- `getNoRepeat()` As Boolean _(public)_
- `getPopOverTarget()` As String					'ignoredeadcode _(public)_
- `getRoundedBox()` As Boolean _(public)_
- `getAlt()` As String _(public)_
- `getHeight()` As String _(public)_
- `getMask()` As String _(public)_
- `getShadow()` As String _(public)_
- `getSrc()` As String _(public)_
- `getWidth()` As String _(public)_
- `getMaxHeight()` As String _(public)_
- `getMaxWidth()` As String _(public)_
- `getMinHeight()` As String _(public)_
- `getMinWidth()` As String _(public)_
## Private Methods (0)
_(none)_
## Verified Demo Usage

Real syntax from [`pgGifPlayer.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgGifPlayer.bas) (verified demo). `SDUI5Image1` = a SDUI5Image.

```b4j
	SDUI5Image1.Initialize(Me, "SDUI5Image1", "SDUI5Image1")
	SDUI5Image1.ParentID = "SDUI5Column1"
	SDUI5Image1.Center = False
	SDUI5Image1.Cover = False
	SDUI5Image1.Height = "400px"
	SDUI5Image1.Mask = "none"
	SDUI5Image1.NoRepeat = False
	SDUI5Image1.Src = "./assets/sample.webp"
	SDUI5Image1.Width = "400px"
	SDUI5Image1.Gif = True
	SDUI5Image1.GifPoster = "./assets/cat.png"
	BANano.Await(SDUI5Image1.AddComponent)
```

Demo-wired events: `Click` — handlers named `SDUI5Image1_<Event>`.

Also used in: `pgDropDown`, `pgHero`, `pgHoverGallery`, `pgImage`, `pgIndicator`, `pgLIst`, `pgSignaturePad`, `pgStack`
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


