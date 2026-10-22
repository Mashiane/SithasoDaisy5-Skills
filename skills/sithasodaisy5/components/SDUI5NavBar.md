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
| `GradientActive` | Boolean | false | — | — | — |
| `Gradient` | String | — | bl_tr, bottom_top, br_tl, left_right, right_left, tl_br, top_bottom, tr_bl | — | — |
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
## Public Methods (35)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `GetFiles()` As List _(public)_
- `GetFile()` As Map _(public)_
- `GetFileDataURL()` As String _(public)_
- `Nullify()` _(public)_
- `RemoveSearch()` _(public)_
- `SetSearchPlaceholder(s As String)` _(public)_
- `AddToolbarButton(btnID As String, btnCaption As String, btnColor As String)` As SDUI5Button _(public)_
- `AddToolbarActionButton(btnID As String, btnCaption As String, btnColor As String)` As SDUI5Button		'ignoredeadcode _(public)_
- `SetToolbarButtonToolTip(btnID As String, tooltip As String, color As String, position As String)` As 'ignoredeadcode _(public)_
- `AddToolbarButtonIcon(btnID As String, sIcon As String, btnColor As String, iconColor As String)` As SDUI5Button			'ignoredeadcode _(public)_
- `SetToolbarButtonDisabled(btn As String, b As Boolean)` _(public)_
- `SetToolbarButtonEnable(btn As String, b As Boolean)` _(public)_
- `SetToolbarButtonLoading(btn As String, b As Boolean)` _(public)_
- `SetToolbarButtonBadge(btn As String, value As String)` _(public)_
- `SetToolbarButtonBadgeColor(btn As String, value As String)` _(public)_
- `SetToolbarButtonBadgeSize(btn As String, value As String)` _(public)_
- `SetToolbarButtonBadgeRound(btn As String)` _(public)_
- `SetToolbarButtonBadgeTextColor(btn As String, value As String)` _(public)_
- `SetToolbarButtonTextColor(btn As String, value As String)` As 'ignoredeadcode _(public)_
- `SetToolbarButtonVisible(btn As String, value As Boolean)` _(public)_
- `SetToolbarButtonColor(btn As String, value As String)` _(public)_
- `SetToolbarButtonTextColorWhite(id As String)` _(public)_
- `AddToolbarActionButtonIcon(btnID As String, sIcon As String, btnColor As String, iconColor As String)` As SDUI5Button			'ignoredeadcode _(public)_
- `AddToolbarFileUpload(btnID As String, sIcon As String, btnColor As String, bMultiple As Boolean)` As SDUI5Button		'ignoredeadcode _(public)_
- `HideOnSmall()` _(public)_
- `HideOnMedium()` _(public)_
- `HideOnLarge()` _(public)_
- `FileChangeSingle()` _(public)_
- `FileChangeMultiple()` _(public)_
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
- `setHideCenterOnSmallScreen(b As Boolean)` As 'ignoredeadcode _(public)_
- `setDrawerID(s As String)` _(public)_
- `setHasFile(b As Boolean)` As 'ignoredeadcode _(public)_
- `setSearchSize(s As String)` As 'ignoredeadcode _(public)_
- `setSearchWidth(s As String)` As 'ignoredeadcode _(public)_
- `setHasSearch(b As Boolean)` As 'ignoredeadcode _(public)_
- `setSearchValue(s As String)` _(public)_
- `setHideLogo(b As Boolean)` As 'ignoredeadcode _(public)_
- `setHideTitle(b As Boolean)` As 'ignoredeadcode _(public)_
- `setHideHamburger(b As Boolean)` As 'ignoredeadcode _(public)_
- `setHideHamburgerOnLargeScreen(b As Boolean)` As 'ignoredeadcode _(public)_
- `setHideLogoOnLargeScreen(b As Boolean)` As 'ignoredeadcode _(public)_
- `setHideTitleOnLargeScreen(b As Boolean)` As 'ignoredeadcode _(public)_
- `setSticky(b As Boolean)` _(public)_
- `setTop(s As String)` _(public)_
- `setZIndex(s As String)` _(public)_
- `setHasBurger(b As Boolean)` As 'ignoredeadcode _(public)_
- `setHasBackButton(b As Boolean)` As 'ignoredeadcode _(public)_
- `setBackLabel(s As String)` As 'ignoredeadcode _(public)_
- `setBackLabelVisible(b As Boolean)` As 'ignoredeadcode _(public)_
- `setHasLogo(b As Boolean)` As 'ignoredeadcode _(public)_
- `setLogoHeight(s As String)` As 'ignoredeadcode _(public)_
- `setLogoImage(s As String)` As 'ignoredeadcode _(public)_
- `setLogoMask(s As String)` As 'ignoredeadcode _(public)_
- `setLogoWidth(s As String)` As 'ignoredeadcode _(public)_
- `setTitle(s As String)` As 'ignoredeadcode _(public)_
- `setTitlePosition(s As String)` As 'ignoredeadcode _(public)_
- `setBackgroundColor(s As String)` _(public)_
- `setGlass(b As Boolean)` _(public)_
- `setHeight(s As String)` _(public)_
- `setTextColor(s As String)` As 'ignoredeadcode _(public)_
- `setWidth(s As String)` _(public)_
- `setRounded(s As String)` _(public)_
- `setShadow(s As String)` _(public)_
- `setButtonsOutlined(b As Boolean)` _(public)_
- `setButtonSize(s As String)` _(public)_
## Getters (49)
- `getID()` As String _(public)_
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
- `getHideCenterOnSmallScreen()` As Boolean _(public)_
- `getDrawerID()` As String _(public)_
- `getHasFile()` As Boolean _(public)_
- `getSearchSize()` As String _(public)_
- `getSearchWidth()` As String _(public)_
- `getHasSearch()` As Boolean _(public)_
- `getSearchValue()` As String _(public)_
- `getSearchID()` As String _(public)_
- `getToolBarButtonID(btnID As String)` As String _(public)_
- `getHideLogo()` As Boolean _(public)_
- `getHideTitle()` As Boolean _(public)_
- `getHideHamburger()` As Boolean _(public)_
- `getHideHamburgerOnLargeScreen()` As Boolean _(public)_
- `getHideLogoOnLargeScreen()` As Boolean _(public)_
- `getHideTitleOnLargeScreen()` As Boolean _(public)_
- `getSticky()` As Boolean _(public)_
- `getTop()` As String _(public)_
- `getZIndex()` As String _(public)_
- `getHasBackButton()` As Boolean _(public)_
- `getBackLabel()` As String _(public)_
- `getBackLabelVisible()` As Boolean _(public)_
- `getLogoHeight()` As String _(public)_
- `getLogoImage()` As String _(public)_
- `getLogoMask()` As String _(public)_
- `getLogoWidth()` As String _(public)_
- `getHasLogo()` As Boolean _(public)_
- `getHasBurger()` As Boolean _(public)_
- `getTitle()` As String _(public)_
- `getTitlePosition()` As String _(public)_
- `getBackgroundColor()` As String _(public)_
- `getGlass()` As Boolean _(public)_
- `getHeight()` As String _(public)_
- `getTextColor()` As String _(public)_
- `getWidth()` As String _(public)_
- `getRounded()` As String _(public)_
- `getShadow()` As String _(public)_
- `getButtonsOutlined()` As Boolean _(public)_
- `getButtonSize()` As String _(public)_
## Private Methods (0)
_(none)_
## Verified Demo Usage

Real syntax from [`pgIndex.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgIndex.bas) (verified demo). `appnavbar` = a SDUI5NavBar.

```b4j
	appnavbar.Initialize(Me, "appnavbar", "appnavbar")
	appnavbar.ParentID = "appdrawer_content"
	appnavbar.BackgroundColor = "base-200"
	appnavbar.HasLogo = True
	appnavbar.HideHamburgerOnLargeScreen = True
	appnavbar.LogoHeight = "40px"
	appnavbar.LogoMask = "squircle"
	appnavbar.LogoWidth = "40px"
	appnavbar.Shadow = "lg"
	appnavbar.Title = "Welcome to SithasoDaisy5 Beta 9"
	appnavbar.Width = "full"
	BANano.Await(appnavbar.AddComponent)
```

Composite structure — children mount into sub-regions: a `lblName` inside `appnavbar_right`:

```b4j
	lblName.Initialize(Me, "lblName", "lblName")
	lblName.ParentID = "appnavbar_right"
	lblName.ApplyDefaults = False
	lblName.Italic = True
	lblName.MarginAXYTBLR = "a=?; x=2; y=?; t=?; b=?; l=?; r=?"
	lblName.Text = "Created with love by Mashy"
	lblName.TextTag = "small"
	BANano.Await(lblName.AddComponent)
```

Demo-wired events: `BurgerClick`, `SearchClear`, `SearchClick`, `SearchKeyUp`, `TitleClick` — handlers named `appnavbar_<Event>`.

Also used in: `pgNavBar`
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


