---
name: SDUI5SwiperSlide
description: SithasoDaisy5 SDUI5SwiperSlide component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5SwiperSlide

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5SwiperSlide.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5SwiperSlide.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgSwiper.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgSwiper.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5SwiperSlide is a single slide for SDUI5Swiper. Mount into swiper via ParentID. Holds content.
_SDUI5SwiperSlide is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `SwiperId` | String | — | — | `setSwiperId` | `getSwiperId` |
| `RefreshSwiper` | Boolean | False | — | `setRefreshSwiper` | `getRefreshSwiper` |
| `Image` | String | ./assets/600by600.jpg | — | `setImage` | `getImage` |
| `ImageAlt` | String | — | — | `setImageAlt` | `getImageAlt` |
| `ImageCenter` | Boolean | False | — | `setImageCenter` | `getImageCenter` |
| `ImageCover` | Boolean | True | — | `setImageCover` | `getImageCover` |
| `ImageLazyLoad` | Boolean | False | — | `setImageLazyLoad` | `getImageLazyLoad` |
| `ImageNoRepeat` | Boolean | False | — | `setImageNoRepeat` | `getImageNoRepeat` |
| `RawImageAttributes` | String | — | — | `setImageAttributes` | `getImageAttributes` |
| `RawImageClasses` | String | — | — | `setImageClasses` | `getImageClasses` |
| `RawImageStyles` | String | — | — | `setImageStyles` | `getImageStyles` |
| `TextAlign` | String | none | center, end, justify, left, none, right, start | `setTextAlign` | `getTextAlign` |
| `Visible` | Boolean | True | — | `setVisible` | `getVisible` |
| `MarginAXYTBLR` | String | a=?; x=?; y=?; t=?; b=?; l=?; r=? | — | `setMarginAXYTBLR` | `getMarginAXYTBLR` |
| `PaddingAXYTBLR` | String | a=?; x=?; y=?; t=?; b=?; l=?; r=? | — | `setPaddingAXYTBLR` | `getPaddingAXYTBLR` |
| `RawClasses` | String | — | — | `setClasses` | `getClasses` |
| `RawStyles` | String | — | — | `setStyles` | `getStyles` |
| `RawAttributes` | String | — | — | `setAttributes` | `getAttributes` |

Setter and getter names are the actual source `Sub` names. `—` means this component has no named accessor for that side; designer-time values may still be consumed through `Props` in `DesignerCreateView`.
Where a designer key and method name differ, the method names shown are the source-verified mapping.
## Events
`Click`, `ImageClick`

Wire in parent: `Sub swiperslide_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (11)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `LoadComponentJson(designName As String)` _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `Clear()` _(public)_
- `LinkExisting()` _(public)_
- `TriggerEvent(event As String, params() As String)` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `RemoveImageClasses(s As String)` _(public)_
## Key Setters (20)
- `setAttributes(s As String)` _(public)_
- `setStyles(s As String)` _(public)_
- `setClasses(s As String)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setElement(e As BANanoElement)` _(public)_
- `setVisible(b As Boolean)` _(public)_
- `setImageClasses(s As String)` As 'ignoredeadcode _(public)_
- `setImageStyles(s As String)` As 'ignoredeadcode _(public)_
- `setImageAttributes(s As String)` As 'ignoredeadcode _(public)_
- `setImageNoRepeat(b As Boolean)` As 'ignoredeadcode _(public)_
- `setImageLazyLoad(b As Boolean)` As 'ignoredeadcode _(public)_
- `setImageAlt(s As String)` As 'ignoredeadcode _(public)_
- `setImageCenter(b As Boolean)` As 'ignoredeadcode _(public)_
- `setImageCover(b As Boolean)` As 'ignoredeadcode _(public)_
- `setImage(s As String)` _(public)_
- `setTextAlign(s As String)` As 'ignoredeadcode _(public)_
- `setRefreshSwiper(b As Boolean)` _(public)_
- `setSwiperId(s As String)` _(public)_
- `setParentID(xParentID As String)` _(public)_
## Getters (23)
- `getAttributes()` As String _(public)_
- `getStyles()` As String _(public)_
- `getClasses()` As String _(public)_
- `getPaddingAXYTBLR()` As String _(public)_
- `getMarginAXYTBLR()` As String _(public)_
- `getElement()` As BANanoElement _(public)_
- `getID()` As String _(public)_
- `getHere()` As String _(public)_
- `getVisible()` As Boolean _(public)_
- `getImageID()` As String _(public)_
- `getImageAlt()` As String _(public)_
- `getImageCenter()` As Boolean _(public)_
- `getImageCover()` As Boolean _(public)_
- `getImageLazyLoad()` As Boolean _(public)_
- `getImageNoRepeat()` As Boolean _(public)_
- `getImageAttributes()` As String _(public)_
- `getImageClasses()` As String _(public)_
- `getImageStyles()` As String _(public)_
- `getImage()` As String _(public)_
- `getTextAlign()` As String _(public)_
- `getRefreshSwiper()` As Boolean _(public)_
- `getSwiperId()` As String _(public)_
- `getParentID()` As String _(public)_
## Private Methods (1)
- `SetDefaults()` _(private)_
## Verified Demo Usage

Real syntax from [`pgSwiper.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgSwiper.bas) (verified demo). `slide11` = a SDUI5SwiperSlide.

```b4j
	slide11.Initialize(Me, "slide11", "slide11")
	slide11.ParentID = "swiper1_slides"
	slide11.SwiperId = "swiper1"
	slide11.Image = "./assets/swiper_01.jpg"
	slide11.ImageCover = True
	slide11.ImageClasses = "w-full h-full object-cover"
	slide11.RefreshSwiper = False
	slide11.Classes = "w-full h-full"
	BANano.Await(slide11.AddComponent)
```
## Emits (daisyUI classes pushed in DesignerCreateView)
**Classes**: `swiper-slide`
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim swiperslide As SDUI5SwiperSlide
swiperslide.Initialize(Me, "SDUI5SwiperSlide", "SDUI5SwiperSlide")
swiperslide.ParentID = "placeholder"
BANano.Await(swiperslide.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.


