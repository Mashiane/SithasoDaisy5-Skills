---
name: SDUI5Page
description: SithasoDaisy5 SDUI5Page component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5Page

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5Page.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5Page.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgFAB.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgFAB.bas)
  - [`pgGhostLogin.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgGhostLogin.bas)
  - [`pgHoverGallery.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgHoverGallery.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5Page is a page wrapper with title/header. Use as the top-level page container. **Color caveat:** the current `SDUI5Page.bas` stores `Color` in its setter and designer props but does not apply that value to the rendered element; do not rely on `SDUI5Page.Color` for visible text color. Use `TextColor`, `Styles`, or a child component color property as appropriate.
_SDUI5Page is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
## Skeleton Contract
Every SithasoDaisy5 component follows the same shape (see SDUI5Component base):
1. `Initialize(Callback, Name, EventName)` — sets `mCallBack`, `mName`, `mEventName`, calls `SetDefaults`.
2. `ParentID` (property / `setParentID(id)`) — attach point in the DOM.
3. `DesignerCreateView(Target, Props)` — INTERNAL (called by `AddComponent`, never from app code); reads `CustProps`, pushes daisyUI classes via `UI.AddClassDT/AddColorDT/AddRoundedDT/AddShadowDT`, appends `[BANCLEAN]<tag id="{name}">`, wires `UI.OnEvent`.
4. Live setters mutate the DOM via `UI.*ByID("{name}_child")`.

**Init signature**: `Initialize(CallBack As Object, Name As String, EventName As String)` | **Has DesignerCreateView**: Yes
## Designer Properties
| Key | Type | Default | List | Setter | Getter |
|---|---|---|---|---|---|
| `ParentID` | String | pageview | — | `setParentID` | `getParentID` |
| `ClearParent` | Boolean | False | — | `setClearParent` | `getClearParent` |
| `Active` | Boolean | True | — | `setActive` | `getActive` |
| `Title` | String | My SDUIPage | — | `setTitle` | `getTitle` |
| `Icon` | String | fa-solid fa-swatchbook | — | `setIcon` | `getIcon` |
| `Color` | String | #000000 | — | `setColor` | `getColor` |
| `RawDescription` | String | My SDUIPage | — | `setDescription` | `getDescription` |
| `RawKeywords` | String | page | — | `setKeywords` | `getKeywords` |
| `BackgroundImage` | String | — | — | `setBackGroundImage` | `getBackGroundImage` |
| `BackgroundColor` | String | base-100 | — | `setBackgroundColor` | `getBackgroundColor` |
| `FullPage` | Boolean | False | — | `setFullPage` | `getFullPage` |
| `FullScreen` | Boolean | False | — | `setFullScreen` | `getFullScreen` |
| `ResizePageView` | Boolean | True | — | `setResizePageView` | `getResizePageView` |
| `Container` | Boolean | True | — | `setContainer` | `getContainer` |
| `CenterChildren` | Boolean | False | — | `setCenterChildren` | `getCenterChildren` |
| `MxAuto` | Boolean | True | — | `setMxAuto` | `getMxAuto` |
| `Flex` | Boolean | True | — | `setFlex` | `getFlex` |
| `FlexCol` | Boolean | False | — | `setFlexCol` | `getFlexCol` |
| `Columns` | String | — | — | `setColumns` | `getColumns` |
| `FlexWrap` | Boolean | True | — | `setFlexWrap` | `getFlexWrap` |
| `Gap` | String | — | — | `setGap` | `getGap` |
| `Grid` | Boolean | False | — | `setGrid` | `getGrid` |
| `GridCols` | String | — | — | `setGridCols` | `getGridCols` |
| `DeviceGridCols` | String | xs=?; sm=?; md=?; lg=?; xl=? | — | `setDeviceGridCols` | `getDeviceGridCols` |
| `Glass` | Boolean | False | — | `setGlass` | `getGlass` |
| `TextColor` | String | — | — | `setTextColor` | `getTextColor` |
| `Width` | String | — | — | `setWidth` | `getWidth` |
| `MinW` | String | — | — | `setMinW` | `getMinW` |
| `MaxW` | String | — | — | `setMaxW` | `getMaxW` |
| `WFull` | Boolean | False | — | `setWFull` | `getWFull` |
| `Height` | String | — | — | `setHeight` | `getHeight` |
| `MinH` | String | — | — | `setMinH` | `getMinH` |
| `MaxH` | String | — | — | `setMaxH` | `getMaxH` |
| `HFull` | Boolean | False | — | `setHFull` | `getHFull` |
| `AsForm` | Boolean | False | — | `setAsForm` | `getAsForm` |
| `Rounded` | String | none | 0, 2xl, 3xl, full, lg, md, none, rounded, sm, xl | `setRounded` | `getRounded` |
| `Shadow` | String | none | 2xl, inner, lg, md, none, shadow, sm, xl | `setShadow` | `getShadow` |
| `Visible` | Boolean | True | — | `setVisible` | `getVisible` |
| `GradientActive` | Boolean | false | — | `setGradientActive` | `getGradientActive` |
| `Gradient` | String | — | bl_tr, bottom_top, br_tl, left_right, right_left, tl_br, top_bottom, tr_bl | `setGradient` | `getGradient` |
| `GradientColor1` | Color | #f86194, Gradient Color 1. | — | — | — |
| `GradientColor2` | Color | #968918, Gradient Color 2. | — | — | — |
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

Wire in parent: `Sub page_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (19)
- `AddComponent()` _(public)_
- `BuildGrid()` _(public)_
- `Cell(r As Int, c As Int)` As SDUI5Container _(public)_
- `CellHere(r As Int, c As Int)` As String _(public)_
- `CellID(r As Int, c As Int)` As String _(public)_
- `Clear()` _(public)_
- `ClearPageView()` _(public)_
- `Initialize(CallBack As Object, Name As String, EventName As String)` _(public)_
- `IsValid()` _(public)_
- `LinkExisting(xPage As String)` _(public)_
- `LoadComponentJson(designName As String)` _(public)_
- `On(event As String, CallBack As Object, MethodName As String)` _(public)_
- `Remove()` _(public)_
- `ResetValidation()` _(public)_
- `Row(r As Int)` As SDUI5Container _(public)_
- `ScrollToTop()` _(public)_
- `Validate(response As Boolean)` _(public)_
- `YesClickValidateEach()` _(public)_
- `YesClickValidateForm()` _(public)_

## Key Setters (55)
- `setActive(b As Boolean)` _(public)_
- `setAsForm(b As Boolean)` _(public)_
- `setAttributes(s As String)` _(public)_
- `setBackgroundColor(s As String)` _(public)_
- `setBackGroundImage(url As String)` _(public)_
- `setCenterChildren(b As Boolean)` _(public)_
- `setClasses(s As String)` _(public)_
- `setClearParent(b As Boolean)` _(public)_
- `setColor(s As String)` _(public)_
- `setColumns(s As String)` _(public)_
- `setContainer(b As Boolean)` _(public)_
- `setDescription(v As String)` _(public)_
- `setDeviceGridCols(s As String)` _(public)_
- `setFlex(b As Boolean)` _(public)_
- `setFlexCol(b As Boolean)` _(public)_
- `setFlexWrap(b As Boolean)` _(public)_
- `setFullPage(b As Boolean)` _(public)_
- `setFullScreen(b As Boolean)` _(public)_
- `setGap(s As String)` _(public)_
- `setGlass(b As Boolean)` _(public)_
- `setGradient(s As String)` _(public)_
- `setGradientActive(b As Boolean)` _(public)_
- `setGrid(b As Boolean)` _(public)_
- `setGridCols(s As String)` _(public)_
- `setHeight(s As String)` _(public)_
- `setHFull(b As Boolean)` _(public)_
- `setIcon(s As String)` _(public)_
- `setKeywords(v As String)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setMaxH(s As String)` _(public)_
- `setMaxW(s As String)` _(public)_
- `setMinH(s As String)` _(public)_
- `setMinW(s As String)` _(public)_
- `setMxAuto(b As Boolean)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setParentID(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setPositionStyle(s As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `SetRCClasses(r As Int, c As Int, classNames As List)` _(public)_
- `SetRCMargin(r As Int, c As Int, gma As String, gmt As String, gmb As String, gml As String, gmr As String, gmx As String, gmy As String)` _(public)_
- `SetRCPadding(r As Int, c As Int, gpa As String, gpt As String, gpb As String, gpl As String, gpr As String, gpx As String, gpy As String)` _(public)_
- `SetRCSizes(r As Int, c As Int, gxs As Int, gsm As Int, gmd As Int, glg As Int, gxl As Int)` _(public)_
- `SetRCStyles(r As Int, c As Int, styleNames As Map)` _(public)_
- `setResizePageView(b As Boolean)` _(public)_
- `setRounded(s As String)` _(public)_
- `SetRowClasses(r As Int, classNames As List)` _(public)_
- `SetRowStyles(r As Int, styleNames As Map)` _(public)_
- `setShadow(s As String)` _(public)_
- `setStyles(s As String)` _(public)_
- `setTextColor(s As String)` _(public)_
- `setTitle(v As String)` _(public)_
- `setVisible(b As Boolean)` _(public)_
- `setWFull(b As Boolean)` _(public)_
- `setWidth(s As String)` _(public)_

## Getters (50)
- `getActive()` _(public)_
- `getAsForm()` _(public)_
- `getAttributes()` _(public)_
- `getBackgroundColor()` _(public)_
- `getBackGroundImage()` _(public)_
- `getCenterChildren()` _(public)_
- `getClasses()` _(public)_
- `getClearParent()` _(public)_
- `getColor()` _(public)_
- `getColumns()` _(public)_
- `getContainer()` _(public)_
- `getDescription()` _(public)_
- `getDeviceGridCols()` _(public)_
- `getFlex()` _(public)_
- `getFlexCol()` _(public)_
- `getFlexWrap()` _(public)_
- `getFullPage()` As Boolean _(public)_
- `getFullScreen()` As Boolean _(public)_
- `getGap()` _(public)_
- `getGlass()` _(public)_
- `getGradient()` _(public)_
- `getGradientActive()` _(public)_
- `getGrid()` _(public)_
- `getGridCols()` _(public)_
- `getHeight()` _(public)_
- `getHere()` As String _(public)_
- `getHFull()` _(public)_
- `getIcon()` _(public)_
- `getID()` As String _(public)_
- `getKeywords()` _(public)_
- `getMarginAXYTBLR()` _(public)_
- `getMaxH()` _(public)_
- `getMaxW()` _(public)_
- `getMinH()` _(public)_
- `getMinW()` _(public)_
- `getMxAuto()` _(public)_
- `getPaddingAXYTBLR()` _(public)_
- `getParentID()` _(public)_
- `getPosition()` _(public)_
- `getPositionStyle()` _(public)_
- `GetProperties()` _(public)_
- `getResizePageView()` As Boolean _(public)_
- `getRounded()` _(public)_
- `getShadow()` _(public)_
- `getStyles()` _(public)_
- `getTextColor()` _(public)_
- `getTitle()` _(public)_
- `getVisible()` _(public)_
- `getWFull()` _(public)_
- `getWidth()` _(public)_

## Private Methods (2)
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(private)_
- `SetDefaults()` _(private)_

## Verified Demo Usage

Real syntax from [`pgFAB.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgFAB.bas) (verified demo):

```b4j
Private fabpage As SDUI5Page						'ignore
fabpage.Initialize(Me, "fabpage", "fabpage")
fabpage.ParentID = app.PageView
fabpage.Active = False
fabpage.BackgroundColor = ""
fabpage.Container = False
fabpage.Flex = False
fabpage.FlexWrap = False
'fabpage.Gradient = "bl_tr"
'fabpage.GradientActive = False
fabpage.MxAuto = False
fabpage.Description = "My SDUIPage"
fabpage.Keywords = "page"
fabpage.ResizePageView = False
fabpage.Title = "FAB Page"
BANano.Await(fabpage.AddComponent)
```

## Emits (daisyUI classes pushed in DesignerCreateView)
**Classes**: `glass`, `container`, `mx-auto`, `flex`, `flex-col`, `flex-wrap`, `grid`
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim page As SDUI5Page
page.Initialize(Me, "SDUI5Page", "SDUI5Page")
page.ParentID = "placeholder"
BANano.Await(page.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.
