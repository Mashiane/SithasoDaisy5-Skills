---
name: SDUI5Card
description: SithasoDaisy5 SDUI5Card component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5Card

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5Card.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5Card.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgAura.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgAura.bas)
  - [`pgCard.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgCard.bas)
  - [`pgFieldSet.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgFieldSet.bas)
  - [`pgHoverGallery.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgHoverGallery.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5Card is a daisyUI `card` container with an optional image/figure, title, raw content, and an actions region. Children (buttons, text, inputs) mount into sub-regions `${name}_actions` (actions bar), `${name}_content`, `${name}_title`, `${name}_box` (body). Use `Content`/`RawContent`/`Title` for text, `Image` (with extension!) for the figure, `Side`/`SMSide`/`MDSide`/`LGSide`/`XLSide` for horizontal card layout. `ActionsVisible` toggles the actions bar. No events declared — wire child component events instead.
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
| `ReadMe` | String | Child Item _figure, _image, _figure1, _image1, _content, _title, _actions | — | — | — |
| `ParentID` | String | — | — | `setParentID` | `getParentID` |
| `Size` | String | none | lg, md, none, sm, xl, xs | `setSize` | `getSize` |
| `HoverGallery` | Boolean | False | — | `setHoverGallery` | — |
| `Image` | String | ./assets/mashy.jpg | — | `setImage` | `getImage` |
| `ImagePosition` | String | start | end, start | `setImagePosition` | `getImagePosition` |
| `ImageFull` | Boolean | False | — | `setImageFull` | `getImageFull` |
| `ImageHeight` | String | — | — | `setImageHeight` | `getImageHeight` |
| `ImageWidth` | String | — | — | `setImageWidth` | `getImageWidth` |
| `ImageRoundedBox` | Boolean | False | — | `setImageRoundedBox` | `getImageRoundedBox` |
| `ImageShadow` | String | none | 2xl, inner, lg, md, none, shadow, sm, xl | `setImageShadow` | `getImageShadow` |
| `ImageVisible` | Boolean | False | — | `setImageVisible` | `getImageVisible` |
| `ImageClasses` | String | — | — | `setImageClasses` | `getImageClasses` |
| `ImageCover` | Boolean | True | — | `setImageCover` | `getImageCover` |
| `ImageCenter` | Boolean | True | — | `setImageCenter` | `getImageCenter` |
| `ImageNoRepeat` | Boolean | True | — | `setImageNoRepeat` | `getImageNoRepeat` |
| `Side` | Boolean | False | — | `setSide` | `getSide` |
| `Title` | String | Card Title | — | `setTitle` | `getTitle` |
| `TitleVisible` | Boolean | True | — | `setTitleVisible` | `getTitleVisible` |
| `TitleClasses` | String | — | — | `setTitleClasses` | `getTitleClasses` |
| `RawContent` | String | Card Content | — | `setContent` | `getContent` |
| `BodyClasses` | String | — | — | `setBodyClasses` | `getBodyClasses` |
| `ContentClasses` | String | — | — | `setContentClasses` | `getContentClasses` |
| `Shrink` | String | none | 0, 1, none | `setShrink` | `getShrink` |
| `TextColor` | String | — | — | `setTextColor` | `getTextColor` |
| `BackgroundColor` | String | base-100 | — | `setBackgroundColor` | `getBackgroundColor` |
| `Border` | Boolean | True | — | `setBorder` | `getBorder` |
| `Dash` | Boolean | False | — | `setDash` | `getDash` |
| `Height` | String | — | — | `setHeight` | `getHeight` |
| `Width` | String | 96 | — | `setWidth` | `getWidth` |
| `SMSide` | Boolean | False | — | `setSMSide` | `getSMSide` |
| `MDSide` | Boolean | False | — | `setMDSide` | `getMDSide` |
| `LGSide` | Boolean | False | — | `setLGSide` | `getLGSide` |
| `XLSide` | Boolean | False | — | `setXLSide` | `getXLSide` |
| `Rounded` | String | none | 0, 2xl, 3xl, full, lg, md, none, rounded, sm, xl | `setRounded` | `getRounded` |
| `RoundedBox` | Boolean | False | — | `setRoundedBox` | `getRoundedBox` |
| `Shadow` | String | sm | 2xl, inner, lg, md, none, shadow, sm, xl | `setShadow` | `getShadow` |
| `ActionsVisible` | Boolean | True | — | `setActionsVisible` | `getActionsVisible` |
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

Wire in parent: `Sub card_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (7)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `ContentAt()` As String _(public)_
## Key Setters (46)
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
- `setImageCover(b As Boolean)` As 'ignoredeadcode _(public)_
- `setImageCenter(b As Boolean)` As 'ignoredeadcode _(public)_
- `setImageNoRepeat(b As Boolean)` As 'ignoredeadcode _(public)_
- `setTitleClasses(s As String)` As 'ignoredeadcode _(public)_
- `setHoverGallery(b As Boolean)` As 'ignoredeadcode _(public)_
- `setShrink(s As String)` _(public)_
- `setActionsVisible(b As Boolean)` As 'ignoredeadcode _(public)_
- `setBackgroundColor(s As String)` _(public)_
- `setBorder(b As Boolean)` _(public)_
- `setContentClasses(s As String)` As 'ignoredeadcode _(public)_
- `setBodyClasses(s As String)` As 'ignoredeadcode _(public)_
- `setImageClasses(s As String)` As 'ignoredeadcode _(public)_
- `setDash(b As Boolean)` _(public)_
- `setHeight(s As String)` _(public)_
- `setImage(s As String)` As 'ignoredeadcode _(public)_
- `setImageFull(b As Boolean)` _(public)_
- `setImageHeight(s As String)` As 'ignoredeadcode _(public)_
- `setImagePosition(s As String)` _(public)_
- `setImageRoundedBox(b As Boolean)` As 'ignoredeadcode _(public)_
- `setImageShadow(s As String)` As 'ignoredeadcode _(public)_
- `setImageVisible(b As Boolean)` As 'ignoredeadcode _(public)_
- `setImageWidth(s As String)` As 'ignoredeadcode _(public)_
- `setLGSide(b As Boolean)` _(public)_
- `setMDSide(b As Boolean)` _(public)_
- `setContent(s As String)` As 'ignoredeadcode _(public)_
- `setRounded(s As String)` _(public)_
- `setRoundedBox(b As Boolean)` _(public)_
- `setSMSide(b As Boolean)` _(public)_
- `setShadow(s As String)` _(public)_
- `setSide(b As Boolean)` _(public)_
- `setSize(s As String)` _(public)_
- `setTextColor(s As String)` _(public)_
- `setTitle(s As String)` As 'ignoredeadcode _(public)_
- `setTitleVisible(b As Boolean)` As 'ignoredeadcode _(public)_
- `setWidth(s As String)` _(public)_
- `setXLSide(b As Boolean)` _(public)_
## Getters (47)
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
- `getImageCover()` As Boolean _(public)_
- `getImageCenter()` As Boolean _(public)_
- `getImageNoRepeat()` As Boolean _(public)_
- `getTitleClasses()` As String _(public)_
- `getShrink()` As String _(public)_
- `getBodyClasses()` As String _(public)_
- `getImageClasses()` As String _(public)_
- `getActionsVisible()` As Boolean _(public)_
- `getBackgroundColor()` As String _(public)_
- `getBorder()` As Boolean _(public)_
- `getContentClasses()` As String _(public)_
- `getDash()` As Boolean _(public)_
- `getHeight()` As String _(public)_
- `getImage()` As String _(public)_
- `getImageFull()` As Boolean _(public)_
- `getImageHeight()` As String _(public)_
- `getImagePosition()` As String _(public)_
- `getImageRoundedBox()` As Boolean _(public)_
- `getImageShadow()` As String _(public)_
- `getImageVisible()` As Boolean _(public)_
- `getImageWidth()` As String _(public)_
- `getLGSide()` As Boolean _(public)_
- `getMDSide()` As Boolean _(public)_
- `getContent()` As String _(public)_
- `getRounded()` As String _(public)_
- `getRoundedBox()` As Boolean _(public)_
- `getSMSide()` As Boolean _(public)_
- `getShadow()` As String _(public)_
- `getSide()` As Boolean _(public)_
- `getSize()` As String _(public)_
- `getTextColor()` As String _(public)_
- `getTitle()` As String _(public)_
- `getTitleVisible()` As Boolean _(public)_
- `getWidth()` As String _(public)_
- `getXLSide()` As Boolean _(public)_
## Private Methods (1)
- `SetDefaults()` _(private)_
## Verified Demo Usage

Real syntax from [`pgHoverGallery.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgHoverGallery.bas) (verified demo). `hoverx` = a SDUI5Card.

```b4j
	hoverx.Initialize(Me, "hoverx", "hoverx")
	hoverx.ParentID = "SDUI5Column2"
	hoverx.ActionsVisible = False
	hoverx.Border = False
	hoverx.HoverGallery = True
	hoverx.Image = "https://img.daisyui.com/images/stock/daisyui-hat-1.webp"
	hoverx.ImageCenter = False
	hoverx.ImageCover = False
	hoverx.ImageNoRepeat = False
	hoverx.Content = "High Quality classic cap hat with stitch logo"
	hoverx.Size = "sm"
	hoverx.Title = "DaisyUI Hat"
	hoverx.TitleClasses = "flex justify-between"
	hoverx.Width = "60"
	BANano.Await(hoverx.AddComponent)
```

Composite structure — children mount into sub-regions: a `SDUI5Button1` inside `mycard_actions`:

```b4j
	SDUI5Button1.Initialize(Me, "SDUI5Button1", "SDUI5Button1")
	SDUI5Button1.ParentID = "mycard_actions"
	SDUI5Button1.Color = "primary"
	SDUI5Button1.IconSize = "none"
	SDUI5Button1.Size = "none"
	SDUI5Button1.Text = "Buy Now"
	BANano.Await(SDUI5Button1.AddComponent)
```

Also used in: `pgCard`, `pgFieldSet`
## Emits (daisyUI classes pushed in DesignerCreateView)
**Classes**: `card`, `card-border`, `card-dash`, `image-full`, `lg:card-side`, `md:card-side`, `rounded-box`, `sm:card-side`, `card-side`, `xl:card-side`, `shrink`
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim card As SDUI5Card
card.Initialize(Me, "SDUI5Card", "SDUI5Card")
card.ParentID = "placeholder"
BANano.Await(card.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.


