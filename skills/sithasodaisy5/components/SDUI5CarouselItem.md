---
name: SDUI5CarouselItem
description: SithasoDaisy5 SDUI5CarouselItem component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5CarouselItem

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5CarouselItem.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5CarouselItem.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgCarousel.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgCarousel.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5CarouselItem is a single slide for SDUI5Carousel. Mount into the carousel via `ParentID = carouselName`. Holds image/content.
_SDUI5CarouselItem is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `Refresh` | Boolean | False | — | `setRefresh` | `getRefresh` |
| `Relative` | Boolean | False | — | `setRelative` | `getRelative` |
| `Height` | String | 80 | — | `setHeight` | `getHeight` |
| `Width` | String | 80 | — | `setWidth` | `getWidth` |
| `ImageHeight` | String | 80 | — | `setImageHeight` | `getImageHeight` |
| `ImageWidth` | String | 80 | — | `setImageWidth` | `getImageWidth` |
| `ImageRounded` | String | none | 0, 2xl, 3xl, full, lg, md, none, rounded, sm, xl | `setImageRounded` | `getImageRounded` |
| `ImageRoundedBox` | Boolean | False | — | `setImageRoundedBox` | `getImageRoundedBox` |
| `ImageShadow` | String | none | 2xl, inner, lg, md, none, shadow, sm, xl | `setImageShadow` | `getImageShadow` |
| `NavigationButtons` | Boolean | False | — | `setNavigationButtons` | `getNavigationButtons` |
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
_(none declared)_

Wire in parent: `Sub carouselitem_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (6)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
## Key Setters (22)
- `setParentID(s As String)` _(public)_
- `setVisible(b As Boolean)` _(public)_
- `setEnabled(b As Boolean)` _(public)_
- `setPositionStyle(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setAttributes(s As String)` _(public)_
- `setStyles(s As String)` _(public)_
- `setClasses(s As String)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setRefresh(b As Boolean)` _(public)_
- `setImageRounded(s As String)` As 'ignoredeadcode _(public)_
- `setImageRoundedBox(b As Boolean)` As 'ignoredeadcode _(public)_
- `setImageShadow(s As String)` As 'ignoredeadcode _(public)_
- `setImageHeight(s As String)` As 'ignoredeadcode _(public)_
- `setImageWidth(s As String)` As 'ignoredeadcode _(public)_
- `setHeight(s As String)` As 'ignoredeadcode _(public)_
- `setImage(s As String)` As 'ignoredeadcode _(public)_
- `setNavigationButtons(b As Boolean)` _(public)_
- `setRelative(b As Boolean)` _(public)_
- `setTypeOf(s As String)` _(public)_
- `setWidth(s As String)` As 'ignoredeadcode _(public)_
## Getters (24)
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
- `getRefresh()` As Boolean _(public)_
- `getImageRounded()` As String _(public)_
- `getImageRoundedBox()` As Boolean _(public)_
- `getImageShadow()` As String _(public)_
- `getImageHeight()` As String _(public)_
- `getImageWidth()` As String _(public)_
- `getHeight()` As String _(public)_
- `getImage()` As String _(public)_
- `getNavigationButtons()` As Boolean _(public)_
- `getRelative()` As Boolean _(public)_
- `getTypeOf()` As String _(public)_
- `getWidth()` As String _(public)_
## Private Methods (0)
_(none)_
## Verified Demo Usage

Real syntax from [`pgCarousel.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgCarousel.bas) (verified demo). `SDUI5CarouselItem4` = a SDUI5CarouselItem.

```b4j
	SDUI5CarouselItem4.Initialize(Me, "SDUI5CarouselItem4", "SDUI5CarouselItem4")
	SDUI5CarouselItem4.ParentID = "carousel1"
	SDUI5CarouselItem4.Height = "full"
	SDUI5CarouselItem4.Image = "https://img.daisyui.com/images/stock/photo-1494253109108-2e30c049369b.webp"
	SDUI5CarouselItem4.ImageHeight = "full"
	SDUI5CarouselItem4.ImageWidth = "full"
	SDUI5CarouselItem4.NavigationButtons = True
	SDUI5CarouselItem4.Refresh = True
	SDUI5CarouselItem4.Width = "full"
	BANano.Await(SDUI5CarouselItem4.AddComponent)
```
## Emits (daisyUI classes pushed in DesignerCreateView)
**Classes**: `carousel-item`, `relative`
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim carouselitem As SDUI5CarouselItem
carouselitem.Initialize(Me, "SDUI5CarouselItem", "SDUI5CarouselItem")
carouselitem.ParentID = "placeholder"
BANano.Await(carouselitem.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.


