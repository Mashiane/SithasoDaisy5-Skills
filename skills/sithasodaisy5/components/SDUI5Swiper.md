---
name: SDUI5Swiper
description: SithasoDaisy5 SDUI5Swiper component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5Swiper

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5Swiper.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5Swiper.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgSwiper.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgSwiper.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5Swiper is a swiper carousel. Slides (SDUI5SwiperSlide) mount via ParentID. Use for touch carousels.
_SDUI5Swiper is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `ReadMe` | String | _slides, _pagination, _prev, _next, _scrollbar | — | — | — |
| `ParentID` | String | — | — | `setParentID` | `getParentID` |
| `Parallax` | Boolean | False | — | `setParallax` | `getParallax` |
| `PaginationType` | String | bullets | bullets, fraction, progressbar | `setPaginationType` | `getPaginationType` |
| `SlidesPerView` | String | 1 | — | `setSlidesPerView` | `getSlidesPerView` |
| `SpaceBetween` | String | 0 | — | `setSpaceBetween` | `getSpaceBetween` |
| `CenteredSlides` | Boolean | False | — | `setCenteredSlides` | `getCenteredSlides` |
| `Direction` | String | horizontal | horizontal, vertical | `setDirection` | `getDirection` |
| `Effect` | String | slide | slide, fade, cube, coverflow, flip, creative, cards | `setEffect` | `getEffect` |
| `CssMode` | Boolean | False | — | `setCssMode` | `getCssMode` |
| `KeyboardEnabled` | Boolean | True | — | `setKeyboardEnabled` | `getKeyboardEnabled` |
| `MouseWheel` | Boolean | False | — | `setMouseWheel` | `getMouseWheel` |
| `HasNavigation` | Boolean | False | — | `setHasNavigation` | `getHasNavigation` |
| `OwnNavigation` | Boolean | False | — | `setOwnNavigation` | `getOwnNavigation` |
| `NextNavigation` | String | — | — | `setNextNavigation` | `getNextNavigation` |
| `PrevNavigation` | String | — | — | `setPrevNavigation` | `getPrevNavigation` |
| `HasPagination` | Boolean | True | — | `setHasPagination` | `getHasPagination` |
| `HasScrollbar` | Boolean | False | — | `setHasScrollbar` | `getHasScrollbar` |
| `Height` | String | 300px | — | `setHeight` | `getHeight` |
| `Width` | String | 100% | — | `setWidth` | `getWidth` |
| `Speed` | String | 300 | — | `setSpeed` | `getSpeed` |
| `Init` | Boolean | True | — | `setInit` | `getInit` |
| `InitialSlide` | String | 0 | — | `setInitialSlide` | `getInitialSlide` |
| `TotalSlides` | String | — | — | `setTotalSlides` | `getTotalSlides` |
| `Loops` | Boolean | False | — | `setLoops` | `getLoops` |
| `DynamicBullets` | Boolean | False | — | `setDynamicBullets` | `getDynamicBullets` |
| `UpdateOnWindowResize` | Boolean | True | — | `setUpdateOnWindowResize` | `getUpdateOnWindowResize` |
| `AutoPlay` | Boolean | False | — | `setAutoPlay` | `getAutoPlay` |
| `AutoPlayDelay` | Int | 3000 | — | `setAutoPlayDelay` | `getAutoPlayDelay` |
| `AutoPlayDisableOnInteraction` | Boolean | True | — | `setAutoPlayDisableOnInteraction` | `getAutoPlayDisableOnInteraction` |
| `AutoPlayPauseOnMouseEnter` | Boolean | False | — | `setAutoPlayPauseOnMouseEnter` | `getAutoPlayPauseOnMouseEnter` |
| `AutoPlayReverseDirection` | Boolean | False | — | `setAutoPlayReverseDirection` | `getAutoPlayReverseDirection` |
| `AutoPlayStopOnLastSlide` | Boolean | False | — | `setAutoPlayStopOnLastSlide` | `getAutoPlayStopOnLastSlide` |
| `AutoPlayWaitForTransition` | Boolean | True | — | `setAutoPlayWaitForTransition` | `getAutoPlayWaitForTransition` |
| `Grid` | Boolean | False | — | `setGrid` | `getGrid` |
| `GridFill` | String | column | column, row | `setGridFill` | `getGridFill` |
| `GridRows` | Int | 1 | — | `setGridRows` | `getGridRows` |
| `CardEffectPerSlideOffset` | Int | 8 | — | `setCardEffectPerSlideOffset` | `getCardEffectPerSlideOffset` |
| `CardEffectPerSlideRotate` | Int | 2 | — | `setCardEffectPerSlideRotate` | `getCardEffectPerSlideRotate` |
| `CardEffectRotate` | Boolean | True | — | `setCardEffectRotate` | `getCardEffectRotate` |
| `CardEffectSlideShadows` | Boolean | True | — | `setCardEffectSlideShadows` | `getCardEffectSlideShadows` |
| `CoverFlowDepth` | Int | 100 | — | `setCoverFlowDepth` | `getCoverFlowDepth` |
| `CoverFlowModifier` | Int | 1 | — | `setCoverFlowModifier` | `getCoverFlowModifier` |
| `CoverFlowRotate` | Int | 50 | — | `setCoverFlowRotate` | `getCoverFlowRotate` |
| `CoverFlowScale` | Int | 1 | — | `setCoverFlowScale` | `getCoverFlowScale` |
| `CoverFlowSlideShadows` | Boolean | True | — | `setCoverFlowSlideShadows` | `getCoverFlowSlideShadows` |
| `CoverFlowStretch` | Int | 0 | — | `setCoverFlowStretch` | `getCoverFlowStretch` |
| `CubeEffectShadow` | Boolean | True | — | `setCubeEffectShadow` | `getCubeEffectShadow` |
| `CubeEffectShadowOffset` | Int | 20 | — | `setCubeEffectShadowOffset` | `getCubeEffectShadowOffset` |
| `CubeEffectShadowScale` | String | 0.94 | — | `setCubeEffectShadowScale` | `getCubeEffectShadowScale` |
| `CubeEffectSlideShadows` | Boolean | True | — | `setCubeEffectSlideShadows` | `getCubeEffectSlideShadows` |
| `RawSlideImageStyle` | String | width=auto;max-width=100%;height=auto;max-height=100%;object-fit=cover | — | `setSlideImageStyle` | `getSlideImageStyle` |
| `RawSlideStyle` | String | display=flex;position=relative;flex-direction=column;flex-shrink=0;align-items=center;justify-content=center;width=100%;height=100%;font-size=18px;text-align=center;box-sizing=border-box | — | `setSlideStyle` | `getSlideStyle` |
| `Rounded` | String | none | 0, 2xl, 3xl, full, lg, md, none, rounded, sm, xl | `setRounded` | `getRounded` |
| `Shadow` | String | none | 2xl, inner, lg, md, none, shadow, sm, xl | `setShadow` | `getShadow` |
| `Visible` | Boolean | True | — | `setVisible` | `getVisible` |
| `PaddingAXYTBLR` | String | a=?; x=?; y=?; t=?; b=?; l=?; r=? | — | `setPaddingAXYTBLR` | `getPaddingAXYTBLR` |
| `MarginAXYTBLR` | String | a=?; x=?; y=?; t=?; b=?; l=?; r=? | — | `setMarginAXYTBLR` | `getMarginAXYTBLR` |
| `RawClasses` | String | — | — | `setClasses` | `getClasses` |
| `RawStyles` | String | — | — | `setStyles` | `getStyles` |
| `RawAttributes` | String | — | — | `setAttributes` | `getAttributes` |

Setter and getter names are the actual source `Sub` names. `—` means this component has no named accessor for that side; designer-time values may still be consumed through `Props` in `DesignerCreateView`.
Where a designer key and method name differ, the method names shown are the source-verified mapping.
## Events
`ImageClick`

Wire in parent: `Sub swiper_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (17)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `AddComponent()` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `LoadComponentJson(designName As String)` _(public)_
- `Remove()` _(public)_
- `Clear()` As 'ignoredeadcode _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `AddSlides(numOf As Int)` _(public)_
- `AddSlide()` As 'ignoredeadcode _(public)_
- `Slide(pos As Int)` As SDUI5SwiperSlide _(public)_
- `AddBreakPoint(bp As Int, slidesPerView As Double, spaceBetween As Int)` _(public)_
- `Refresh()` _(public)_
- `slideNext()` _(public)_
- `slidePrev()` _(public)_
- `AddSlideStyle(m As Map)` As 'ignoredeadcode _(public)_
- `AddSlideImageStyle(m As Map)` As 'ignoredeadcode _(public)_
## Key Setters (71)
- `setMouseWheel(b As Boolean)` _(public)_
- `setCssMode(b As Boolean)` _(public)_
- `setAttributes(s As String)` _(public)_
- `setStyles(s As String)` _(public)_
- `setClasses(s As String)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setRounded(s As String)` _(public)_
- `setShadow(s As String)` _(public)_
- `setVisible(b As Boolean)` _(public)_
- `setElement(e As BANanoElement)` _(public)_
- `setNextNavigation(s As String)` _(public)_
- `setOwnNavigation(b As Boolean)` _(public)_
- `setPrevNavigation(s As String)` _(public)_
- `setKeyboardEnabled(b As Boolean)` _(public)_
- `setCardsEffectPerSlideOffset(i As Int)` _(public)_
- `setCardsEffectPerSlideRotate(i As Int)` _(public)_
- `setCardsEffectRotate(b As Boolean)` _(public)_
- `setCardsEffectSlideShadows(b As Boolean)` _(public)_
- `setCoverFlowEffectDepth(i As Int)` _(public)_
- `setCoverFlowEffectModifier(i As Int)` _(public)_
- `setCoverFlowEffectRotate(i As Int)` _(public)_
- `setCoverFlowEffectScale(i As Int)` _(public)_
- `setCoverFlowEffectSlideShadows(b As Boolean)` _(public)_
- `setCoverFlowEffectStretch(i As Int)` _(public)_
- `setCubeEffectShadow(b As Boolean)` _(public)_
- `setCubeEffectShadowOffset(i As Int)` _(public)_
- `setCubeEffectShadowScale(d As Double)` _(public)_
- `setCubeEffectSlideShadows(b As Boolean)` _(public)_
- `setSlideImageStyle(s As String)` _(public)_
- `setSlideStyle(s As String)` _(public)_
- `setAutoPlay(b As Boolean)` _(public)_
- `setAutoPlayDelay(i As Int)` _(public)_
- `setAutoPlayDisableOnInteraction(b As Boolean)` _(public)_
- `setAutoPlayPauseOnMouseEnter(b As Boolean)` _(public)_
- `setAutoPlayReverseDirection(b As Boolean)` _(public)_
- `setAutoPlayStopOnLastSlide(b As Boolean)` _(public)_
- `setAutoPlayWaitForTransition(b As Boolean)` _(public)_
- `setGrid(b As Boolean)` _(public)_
- `setGridFill(s As String)` _(public)_
- `setGridRows(i As Int)` _(public)_
- `setParentID(xParentID As String)` _(public)_
- `setCenteredSlides(b As Boolean)` _(public)_
- `setDirection(s As String)` _(public)_
- `setEffect(s As String)` _(public)_
- `setHasNavigation(b As Boolean)` _(public)_
- `setHasPagination(b As Boolean)` _(public)_
- `setHasScrollbar(b As Boolean)` _(public)_
- `setWidth(s As String)` _(public)_
- `setHeight(s As String)` _(public)_
- `setInit(b As Boolean)` _(public)_
- `setInitialSlide(s As String)` _(public)_
- `setLoops(b As Boolean)` _(public)_
- `setSlidesPerView(s As String)` _(public)_
- `setSpaceBetween(s As String)` _(public)_
- `setSpeed(s As String)` _(public)_
- `setUpdateOnWindowResize(b As Boolean)` _(public)_
- `setParallax(b As Boolean)` _(public)_
- `setPaginationType(s As String)` _(public)_
- `setTotalSlides(s As String)` _(public)_
- `setDynamicBullets(b As Boolean)` _(public)_
- `setCardEffectPerSlideOffset(i As Int)` _(public)_
- `setCardEffectPerSlideRotate(i As Int)` _(public)_
- `setCardEffectRotate(b As Boolean)` _(public)_
- `setCardEffectSlideShadows(b As Boolean)` _(public)_
- `setCoverFlowDepth(i As Int)` _(public)_
- `setCoverFlowModifier(i As Int)` _(public)_
- `setCoverFlowRotate(i As Int)` _(public)_
- `setCoverFlowScale(i As Int)` _(public)_
- `setCoverFlowSlideShadows(b As Boolean)` _(public)_
- `setCoverFlowStretch(i As Int)` _(public)_
## Getters (66)
- `getMouseWheel()` As Boolean _(public)_
- `getCssMode()` As Boolean _(public)_
- `getAttributes()` As String _(public)_
- `getStyles()` As String _(public)_
- `getClasses()` As String _(public)_
- `getPaddingAXYTBLR()` As String _(public)_
- `getMarginAXYTBLR()` As String _(public)_
- `getRounded()` As String _(public)_
- `getShadow()` As String _(public)_
- `getVisible()` As Boolean _(public)_
- `getElement()` As BANanoElement _(public)_
- `getID()` As String _(public)_
- `getHere()` As String _(public)_
- `getSlidesHere()` As String _(public)_
- `getNextNavigation()` As String _(public)_
- `getOwnNavigation()` As Boolean _(public)_
- `getPrevNavigation()` As String _(public)_
- `getKeyboardEnabled()` As Boolean _(public)_
- `getCardEffectPerSlideOffset()` As Int _(public)_
- `getCardEffectPerSlideRotate()` As Int _(public)_
- `getCardEffectRotate()` As Boolean _(public)_
- `getCardEffectSlideShadows()` As Boolean _(public)_
- `getCoverFlowDepth()` As Int _(public)_
- `getCoverFlowModifier()` As Int _(public)_
- `getCoverFlowRotate()` As Int _(public)_
- `getCoverFlowScale()` As Int _(public)_
- `getCoverFlowSlideShadows()` As Boolean _(public)_
- `getCoverFlowStretch()` As Int _(public)_
- `getCubeEffectShadow()` As Boolean _(public)_
- `getCubeEffectShadowOffset()` As Int _(public)_
- `getCubeEffectShadowScale()` As Double _(public)_
- `getCubeEffectSlideShadows()` As Boolean _(public)_
- `getSlideStyle()` As String _(public)_
- `getAutoPlay()` As Boolean _(public)_
- `getAutoPlayDelay()` As Int _(public)_
- `getAutoPlayDisableOnInteraction()` As Boolean _(public)_
- `getAutoPlayPauseOnMouseEnter()` As Boolean _(public)_
- `getAutoPlayReverseDirection()` As Boolean _(public)_
- `getAutoPlayStopOnLastSlide()` As Boolean _(public)_
- `getAutoPlayWaitForTransition()` As Boolean _(public)_
- `getGrid()` As Boolean _(public)_
- `getGridFill()` As String _(public)_
- `getGridRows()` As Int _(public)_
- `getWidth()` As String _(public)_
- `getHeight()` As String _(public)_
- `getSlideName(pos As Int)` As String _(public)_
- `getParentID()` As String _(public)_
- `getParallax()` As Boolean _(public)_
- `getPaginationType()` As String _(public)_
- `getSlidesPerView()` As String _(public)_
- `getSpaceBetween()` As String _(public)_
- `getCenteredSlides()` As Boolean _(public)_
- `getDirection()` As String _(public)_
- `getEffect()` As String _(public)_
- `getHasNavigation()` As Boolean _(public)_
- `getHasPagination()` As Boolean _(public)_
- `getHasScrollbar()` As Boolean _(public)_
- `getSpeed()` As String _(public)_
- `getInit()` As Boolean _(public)_
- `getInitialSlide()` As String _(public)_
- `getTotalSlides()` As String _(public)_
- `getLoop()` As Boolean _(public)_
- `getDynamicBullets()` As Boolean _(public)_
- `getUpdateOnWindowResize()` As Boolean _(public)_
- `getLoops()` As Boolean _(public)_
- `getSlideImageStyle()` As String _(public)_
## Private Methods (1)
- `SetDefaults()` _(private)_
## Verified Demo Usage

Real syntax from [`pgSwiper.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgSwiper.bas) (verified demo). `swiper7` = a SDUI5Swiper.

```b4j
	swiper7.Initialize(Me, "swiper7", "swiper7")
	swiper7.ParentID = "SDUI5Column12"
	swiper7.Height = "300px"
	swiper7.HasPagination = True
	swiper7.HasNavigation = False
	swiper7.OwnNavigation = True
	swiper7.NextNavigation = "#btnNext7"
	swiper7.PrevNavigation = "#btnPrev7"
	swiper7.Rounded = "lg"
	swiper7.Shadow = "md"
	BANano.Await(swiper7.AddComponent)
```

Composite structure — children mount into sub-regions: a `slide11` inside `swiper1_slides`:

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
**Classes**: `swiper`
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim swiper As SDUI5Swiper
swiper.Initialize(Me, "SDUI5Swiper", "SDUI5Swiper")
swiper.ParentID = "placeholder"
BANano.Await(swiper.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.


