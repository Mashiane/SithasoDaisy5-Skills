---
name: SDUI5NavBar
description: SithasoDaisy5 SDUI5NavBar component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5NavBar

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5NavBar.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5NavBar.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgIndex.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgIndex.bas)
  - [`pgNavBar.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgNavBar.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5NavBar is a top navigation bar. Children (brand, links, menu) mount via `ParentID = navbarName` or sub-regions. Use for app/site header.
_SDUI5NavBar is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `ReadMe` | String | Child Items - _left, _logo, _burger, _center, _right | — | — | — |
| `ParentID` | String | — | — | `setParentID` | `getParentID` |
| `HasBackButton` | Boolean | False | — | `setHasBackButton` | `getHasBackButton` |
| `BackLabel` | String | Back | — | `setBackLabel` | `getBackLabel` |
| `BackLabelVisible` | Boolean | False | — | `setBackLabelVisible` | `getBackLabelVisible` |
| `Sticky` | Boolean | True | — | `setSticky` | `getSticky` |
| `Top` | String | 0 | — | `setTop` | `getTop` |
| `ZIndex` | String | 30 | — | `setZIndex` | `getZIndex` |
| `HasBurger` | Boolean | True | — | `setHasBurger` | `getHasBurger` |
| `DrawerID` | String | — | — | `setDrawerID` | `getDrawerID` |
| `HideHamburger` | Boolean | False | — | `setHideHamburger` | `getHideHamburger` |
| `HideHamburgerOnLargeScreen` | Boolean | False | — | `setHideHamburgerOnLargeScreen` | `getHideHamburgerOnLargeScreen` |
| `HasLogo` | Boolean | False | — | `setHasLogo` | `getHasLogo` |
| `HideLogo` | Boolean | False | — | `setHideLogo` | `getHideLogo` |
| `HideLogoOnLargeScreen` | Boolean | False | — | `setHideLogoOnLargeScreen` | `getHideLogoOnLargeScreen` |
| `LogoImage` | String | ./assets/mashy.jpg | — | `setLogoImage` | `getLogoImage` |
| `LogoMask` | String | none | circle, decagon, diamond, heart, hexagon, hexagon-2, none, pentagon, rounded, rounded-2xl, rounded-3xl, rounded-lg, rounded-md, rounded-sm, rounded-xl, square, squircle, star, star-2, triangle, triangle-2, triangle-3, triangle-4 | `setLogoMask` | `getLogoMask` |
| `LogoWidth` | String | 10 | — | `setLogoWidth` | `getLogoWidth` |
| `LogoHeight` | String | 10 | — | `setLogoHeight` | `getLogoHeight` |
| `Title` | String | NavBar | — | `setTitle` | `getTitle` |
| `HideTitle` | Boolean | False | — | `setHideTitle` | `getHideTitle` |
| `HideTitleOnLargeScreen` | Boolean | False | — | `setHideTitleOnLargeScreen` | `getHideTitleOnLargeScreen` |
| `TitlePosition` | String | left | center, left, right | `setTitlePosition` | `getTitlePosition` |
| `HideCenterOnSmallScreen` | Boolean | False | — | `setHideCenterOnSmallScreen` | `getHideCenterOnSmallScreen` |
| `TextColor` | String | — | — | `setTextColor` | `getTextColor` |
| `BackgroundColor` | String | base-100 | — | `setBackgroundColor` | `getBackgroundColor` |
| `HasFile` | Boolean | False | — | `setHasFile` | `getHasFile` |
| `HasSearch` | Boolean | False | — | `setHasSearch` | `getHasSearch` |
| `SearchSize` | String | md | lg, md, sm, xs, none | `setSearchSize` | `getSearchSize` |
| `SearchWidth` | String | 300px | — | `setSearchWidth` | `getSearchWidth` |
| `ButtonSize` | String | md | lg, md, sm, xs, none | `setButtonSize` | `getButtonSize` |
| `ButtonsOutlined` | Boolean | False | — | `setButtonsOutlined` | `getButtonsOutlined` |
| `Glass` | Boolean | False | — | `setGlass` | `getGlass` |
| `Height` | String | 16 | — | `setHeight` | `getHeight` |
| `Width` | String | — | — | `setWidth` | `getWidth` |
| `Rounded` | String | none | none, rounded, 2xl, 3xl, full, lg, md, sm, xl, 0 | `setRounded` | `getRounded` |
| `Shadow` | String | sm | 2xl, inner, lg, md, none, shadow, sm, xl | `setShadow` | `getShadow` |
| `GradientActive` | Boolean | false | — | `setGradientActive` | `getGradientActive` |
| `Gradient` | String | — | bl_tr, bottom_top, br_tl, left_right, right_left, tl_br, top_bottom, tr_bl | `setGradient` | `getGradient` |
| `GradientColor1` | Color | #f86194, Gradient Color 1. | — | — | — |
| `GradientColor2` | Color | #968918, Gradient Color 2. | — | — | — |
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
`TitleClick`, `BurgerClick`, `Back`, `FileChange`, `SearchClick`, `SearchKeyUp`, `SearchClear`, `CustomButton`, `Custom_FileChange`

Wire in parent: `Sub navbar_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (16)
- `AddComponent()` _(public)_
- `AddToolbarActionButton(btnID As String, btnCaption As String, btnColor As String)` As SDUI5Button _(public)_
- `AddToolbarActionButtonIcon(btnID As String, sIcon As String, btnColor As String, iconColor As String)` As SDUI5Button _(public)_
- `AddToolbarButton(btnID As String, btnCaption As String, btnColor As String)` As SDUI5Button _(public)_
- `AddToolbarButtonIcon(btnID As String, sIcon As String, btnColor As String, iconColor As String)` As SDUI5Button _(public)_
- `AddToolbarFileUpload(btnID As String, sIcon As String, btnColor As String, bMultiple As Boolean)` As SDUI5Button _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `FileChangeMultiple()` _(public)_
- `FileChangeSingle()` _(public)_
- `HideOnLarge()` _(public)_
- `HideOnMedium()` _(public)_
- `HideOnSmall()` _(public)_
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `Nullify()` _(public)_
- `Remove()` _(public)_
- `RemoveSearch()` _(public)_

## Key Setters (63)
- `setAttributes(s As String)` _(public)_
- `setBackgroundColor(s As String)` _(public)_
- `setBackLabel(s As String)` _(public)_
- `setBackLabelVisible(b As Boolean)` _(public)_
- `setButtonSize(s As String)` _(public)_
- `setButtonsOutlined(b As Boolean)` _(public)_
- `setClasses(s As String)` _(public)_
- `setDrawerID(s As String)` _(public)_
- `setEnabled(b As Boolean)` _(public)_
- `setGlass(b As Boolean)` _(public)_
- `setGradient(s As String)` _(public)_
- `setGradientActive(b As Boolean)` _(public)_
- `setHasBackButton(b As Boolean)` _(public)_
- `setHasBurger(b As Boolean)` _(public)_
- `setHasFile(b As Boolean)` _(public)_
- `setHasLogo(b As Boolean)` _(public)_
- `setHasSearch(b As Boolean)` _(public)_
- `setHeight(s As String)` _(public)_
- `setHideCenterOnSmallScreen(b As Boolean)` _(public)_
- `setHideHamburger(b As Boolean)` _(public)_
- `setHideHamburgerOnLargeScreen(b As Boolean)` _(public)_
- `setHideLogo(b As Boolean)` _(public)_
- `setHideLogoOnLargeScreen(b As Boolean)` _(public)_
- `setHideTitle(b As Boolean)` _(public)_
- `setHideTitleOnLargeScreen(b As Boolean)` _(public)_
- `setLogoHeight(s As String)` _(public)_
- `setLogoImage(s As String)` _(public)_
- `setLogoMask(s As String)` _(public)_
- `setLogoWidth(s As String)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setParentID(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setPositionStyle(s As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `setRounded(s As String)` _(public)_
- `SetSearchPlaceholder(s As String)` _(public)_
- `setSearchSize(s As String)` _(public)_
- `setSearchValue(s As String)` _(public)_
- `setSearchWidth(s As String)` _(public)_
- `setShadow(s As String)` _(public)_
- `setSticky(b As Boolean)` _(public)_
- `setStyles(s As String)` _(public)_
- `setTextColor(s As String)` _(public)_
- `setTitle(s As String)` _(public)_
- `setTitlePosition(s As String)` _(public)_
- `SetToolbarButtonBadge(btn As String, value As String)` _(public)_
- `SetToolbarButtonBadgeColor(btn As String, value As String)` _(public)_
- `SetToolbarButtonBadgeRound(btn As String)` _(public)_
- `SetToolbarButtonBadgeSize(btn As String, value As String)` _(public)_
- `SetToolbarButtonBadgeTextColor(btn As String, value As String)` _(public)_
- `SetToolbarButtonColor(btn As String, value As String)` _(public)_
- `SetToolbarButtonDisabled(btn As String, b As Boolean)` _(public)_
- `SetToolbarButtonEnable(btn As String, b As Boolean)` _(public)_
- `SetToolbarButtonLoading(btn As String, b As Boolean)` _(public)_
- `SetToolbarButtonTextColor(btn As String, value As String)` _(public)_
- `SetToolbarButtonTextColorWhite(id As String)` _(public)_
- `SetToolbarButtonToolTip(btnID As String, tooltip As String, color As String, position As String)` _(public)_
- `SetToolbarButtonVisible(btn As String, value As Boolean)` _(public)_
- `setTop(s As String)` _(public)_
- `setVisible(b As Boolean)` _(public)_
- `setWidth(s As String)` _(public)_
- `setZIndex(s As String)` _(public)_

## Getters (56)
- `getAttributes()` _(public)_
- `getBackgroundColor()` _(public)_
- `getBackLabel()` _(public)_
- `getBackLabelVisible()` _(public)_
- `getButtonSize()` _(public)_
- `getButtonsOutlined()` _(public)_
- `getClasses()` _(public)_
- `getDrawerID()` _(public)_
- `getEnabled()` _(public)_
- `GetFile()` _(public)_
- `GetFileDataURL()` _(public)_
- `GetFiles()` _(public)_
- `getGlass()` _(public)_
- `getGradient()` _(public)_
- `getGradientActive()` _(public)_
- `getHasBackButton()` _(public)_
- `getHasBurger()` _(public)_
- `getHasFile()` _(public)_
- `getHasLogo()` _(public)_
- `getHasSearch()` _(public)_
- `getHeight()` _(public)_
- `getHere()` As String _(public)_
- `getHideCenterOnSmallScreen()` _(public)_
- `getHideHamburger()` _(public)_
- `getHideHamburgerOnLargeScreen()` _(public)_
- `getHideLogo()` _(public)_
- `getHideLogoOnLargeScreen()` _(public)_
- `getHideTitle()` _(public)_
- `getHideTitleOnLargeScreen()` _(public)_
- `getID()` As String _(public)_
- `getLogoHeight()` _(public)_
- `getLogoImage()` _(public)_
- `getLogoMask()` _(public)_
- `getLogoWidth()` _(public)_
- `getMarginAXYTBLR()` _(public)_
- `getPaddingAXYTBLR()` _(public)_
- `getParentID()` As String _(public)_
- `getPosition()` _(public)_
- `getPositionStyle()` _(public)_
- `GetProperties()` _(public)_
- `getRounded()` _(public)_
- `getSearchID()` _(public)_
- `getSearchSize()` _(public)_
- `getSearchValue()` _(public)_
- `getSearchWidth()` _(public)_
- `getShadow()` _(public)_
- `getSticky()` _(public)_
- `getStyles()` _(public)_
- `getTextColor()` _(public)_
- `getTitle()` _(public)_
- `getTitlePosition()` _(public)_
- `getToolBarButtonID(btnID As String)` As String _(public)_
- `getTop()` _(public)_
- `getVisible()` _(public)_
- `getWidth()` _(public)_
- `getZIndex()` _(public)_

## Private Methods (6)
- `FileUploadHandler(e As BANanoEvent)` _(private)_
- `SearchClear(e As BANanoEvent)` _(private)_
- `SearchClick(e As BANanoEvent)` _(private)_
- `SearchInternal(e As BANanoEvent)` _(private)_
- `SetDefaults()` _(private)_
- `swapchange(e As BANanoEvent)` _(private)_

## Verified Demo Usage

Real syntax from [`pgNavBar.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgNavBar.bas) (verified demo):

```b4j
Private navbar As SDUI5NavBar		'ignore
Private SDUI5NavBar2 As SDUI5NavBar		'ignore
Private SDUI5NavBar3 As SDUI5NavBar		'ignore
Private SDUI5NavBar4 As SDUI5NavBar		'ignore
Private SDUI5NavBar5 As SDUI5NavBar		'ignore
BANano.Await(SDUI5Container1.AddComponent)
```

## Emits (daisyUI classes pushed in DesignerCreateView)
**Classes**: `navbar justify-center`, `glass`, `sticky`
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim navbar As SDUI5NavBar
navbar.Initialize(Me, "SDUI5NavBar", "SDUI5NavBar")
navbar.ParentID = "placeholder"
BANano.Await(navbar.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.
