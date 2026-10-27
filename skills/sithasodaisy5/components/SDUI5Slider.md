---
name: SDUI5Slider
description: SithasoDaisy5 SDUI5Slider component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5Slider

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5Slider.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5Slider.bas)
- **Demo References**: No direct `As`/`New` type reference was detected in the audited `pg*.bas` demo snapshot.
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5Slider is an image/content slider (carousel). Slides (SliderItem) mount into the slider via ParentID. Use for image galleries/carousels.
_SDUI5Slider is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `Orientation` | String | horizontal | horizontal, vertical | `setOrientation` | `getOrientation` |
| `ShowButtons` | Boolean | False | — | `setShowButtons` | `getShowButtons` |
| `ShowIndicators` | Boolean | True | — | `setShowIndicators` | `getShowIndicators` |
| `Loop` | Boolean | False | — | `setLoop` | `getLoop` |
| `Autoplay` | Boolean | True | — | `setAutoplay` | `getAutoplay` |
| `AutoplayInterval` | Int | 3000 | — | `setAutoplayInterval` | `getAutoplayInterval` |
| `AllowNext` | Boolean | True | — | `setAllowNext` | `getAllowNext` |
| `AllowBack` | Boolean | True | — | `setAllowBack` | `getAllowBack` |
| `LazyLoading` | Boolean | False | — | `setLazyLoading` | `getLazyLoading` |
| `Height` | String | 500px | — | `setHeight` | `getHeight` |
| `Width` | String | 900px | — | `setWidth` | `getWidth` |
| `Shadow` | String | none | 2xl, inner, lg, md, none, shadow, sm, xl | `setShadow` | `getShadow` |
| `Rounded` | String | none | 0, 2xl, 3xl, full, lg, md, none, rounded, sm, xl | `setRounded` | `getRounded` |
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
`PageChanged`, `ItemClicked`

Wire in parent: `Sub slider_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (13)
- `AddComponent()` _(public)_
- `AddItem(ItemID As String, Src As String)` _(public)_
- `AddPage(PageElement As BANanoElement, Value As String)` _(public)_
- `AddPageAt(PageElement As BANanoElement, Index As Int, Value As String)` _(public)_
- `Clear()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `NextPage()` _(public)_
- `PreviousPage()` _(public)_
- `Remove()` _(public)_
- `RemovePageAt(Index As Int)` _(public)_
- `StartAutoplay()` _(public)_
- `StopAutoplay()` _(public)_

## Key Setters (27)
- `setAllowBack(b As Boolean)` _(public)_
- `setAllowNext(b As Boolean)` _(public)_
- `setAttributes(s As String)` _(public)_
- `setAutoplay(b As Boolean)` _(public)_
- `setAutoplayInterval(i As Int)` _(public)_
- `setClasses(s As String)` _(public)_
- `setEnabled(b As Boolean)` _(public)_
- `setHeight(s As String)` _(public)_
- `SetIndex(index As Int)` _(public)_
- `setLazyLoading(b As Boolean)` _(public)_
- `SetLazyLoadingAddContent(Handler As Object)` _(public)_
- `SetLazyLoadingExtraSize(Size As Int)` _(public)_
- `setLoop(b As Boolean)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setOrientation(s As String)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setParentID(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setPositionStyle(s As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `setRounded(value As String)` _(public)_
- `setShadow(value As String)` _(public)_
- `setShowButtons(b As Boolean)` _(public)_
- `setShowIndicators(b As Boolean)` _(public)_
- `setStyles(s As String)` _(public)_
- `setVisible(b As Boolean)` _(public)_
- `setWidth(s As String)` _(public)_

## Getters (30)
- `getAllowBack()` _(public)_
- `getAllowNext()` _(public)_
- `getAttributes()` _(public)_
- `getAutoplay()` _(public)_
- `getAutoplayInterval()` _(public)_
- `getClasses()` _(public)_
- `getEnabled()` _(public)_
- `getHeight()` _(public)_
- `getHere()` As String _(public)_
- `getID()` As String _(public)_
- `GetIndex()` _(public)_
- `getLazyLoading()` _(public)_
- `getLoop()` _(public)_
- `getMarginAXYTBLR()` _(public)_
- `getOrientation()` _(public)_
- `getPaddingAXYTBLR()` _(public)_
- `GetPanel(Index As Int)` As BANanoObject _(public)_
- `getParentID()` _(public)_
- `getPosition()` _(public)_
- `getPositionStyle()` _(public)_
- `GetProperties()` _(public)_
- `getRounded()` _(public)_
- `getShadow()` _(public)_
- `getShowButtons()` _(public)_
- `getShowIndicators()` _(public)_
- `GetSize()` _(public)_
- `getStyles()` _(public)_
- `GetValue(Index As Int)` As String _(public)_
- `getVisible()` _(public)_
- `getWidth()` _(public)_

## Private Methods (5)
- `ItemClicked_Event(e As BANanoEvent)` _(private)_
- `MouseEnter_Event(e As BANanoEvent)` _(private)_
- `MouseLeave_Event(e As BANanoEvent)` _(private)_
- `PageChanged(e As BANanoEvent)` _(private)_
- `SetDefaults()` _(private)_

## Emits (daisyUI classes pushed in DesignerCreateView)
_(none emitted directly — relies on base/CustProps)_
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim slider As SDUI5Slider
slider.Initialize(Me, "SDUI5Slider", "SDUI5Slider")
slider.ParentID = "placeholder"
BANano.Await(slider.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.
