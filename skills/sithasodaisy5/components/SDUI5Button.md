---
name: SDUI5Button
description: SithasoDaisy5 SDUI5Button component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5Button

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5Button.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5Button.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgAlert.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgAlert.bas)
  - [`pgAura.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgAura.bas)
  - [`pgBarcodeReader.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgBarcodeReader.bas)
  - [`pgButtons.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgButtons.bas)
  - [`pgCard.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgCard.bas)
  - [`pgDock.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgDock.bas)
  - [`pgDockColor.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgDockColor.bas)
  - [`pgDockXS.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgDockXS.bas)
  - [`pgDropDown.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgDropDown.bas)
  - [`pgFieldSet.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgFieldSet.bas)
  - [`pgHero.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgHero.bas)
  - [`pgIndicator.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgIndicator.bas)
  - [`pgJoin.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgJoin.bas)
  - [`pgLeafLet.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgLeafLet.bas)
  - [`pgLIst.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgLIst.bas)
  - [`pgModal.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgModal.bas)
  - [`pgPagination.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgPagination.bas)
  - [`pgProgress.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgProgress.bas)
  - [`pgSelect.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgSelect.bas)
  - [`pgSpeedDial.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgSpeedDial.bas)
  - [`pgSwiper.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgSwiper.bas)
  - [`pgToast.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgToast.bas)
  - [`pgToolTip.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgToolTip.bas)
  - [`pgValidation.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgValidation.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5Button is a daisyUI `btn` with Color/Size/Shape, Outline/Ghost/Dash/Active/Block/Link styles, Loading spinner, LeftIcon/RightImage/Image (with extension), ImageWidth/ImageHeight. Loading toggles spinner state; LeftIcon/RightImage paths must include extension (see P0). Emits Click. Use SetLoading for async feedback.
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
| `DockItem` | Boolean | False | — | `setDockItem` | `getDockItem` |
| `ButtonIcon` | Boolean | False | — | `setButtonIcon` | `getButtonIcon` |
| `Text` | String | Button | — | `setText` | `getText` |
| `TextVisible` | Boolean | True | — | `setTextVisible` | `getTextVisible` |
| `TextSize` | String | — | lg, md, none, sm, xl, xs | `setTextSize` | `getTextSize` |
| `TextColor` | String | — | — | `setTextColor` | `getTextColor` |
| `Color` | String | none | primary, secondary, accent, neutral, info, success, warning, error, none | `setColor` | `getColor` |
| `Badge` | String | — | — | `setBadge` | `getBadge` |
| `BadgeColor` | String | — | danger, dark, light, medium, none, primary, secondary, success, tertiary, warning | `setBadgeColor` | `getBadgeColor` |
| `BadgeSize` | String | sm | lg, md, none, sm, xl, xs | `setBadgeSize` | `getBadgeSize` |
| `Active` | Boolean | False | — | `setActive` | `getActive` |
| `Tooltip` | String | — | — | `setTooltip` | `getTooltip` |
| `TooltipColor` | String | none | accent, error, info, neutral, none, primary, secondary, success, warning | `setTooltipColor` | `getTooltipColor` |
| `TooltipOpen` | Boolean | False | — | `setTooltipOpen` | `getTooltipOpen` |
| `TooltipPosition` | String | none | bottom, left, right, top, none | `setTooltipPosition` | `getTooltipPosition` |
| `TooltipAlignment` | String | none | start, center, end, none | `setTooltipAlignment` | `getTooltipAlignment` |
| `BackgroundColor` | String | — | — | `setBackgroundColor` | `getBackgroundColor` |
| `Shape` | String | none | square, circle, none, rounded, 2xl, 3xl, full, lg, md, sm, xl, 0, rounded-full | `setShape` | `getShape` |
| `Block` | Boolean | False | — | `setBlock` | `getBlock` |
| `Wide` | Boolean | False | — | `setWide` | `getWide` |
| `Dash` | Boolean | False | — | `setDash` | `getDash` |
| `Ghost` | Boolean | False | — | `setGhost` | `getGhost` |
| `JoinItem` | Boolean | False | — | `setJoinItem` | `getJoinItem` |
| `Activator` | Boolean | False | — | `setActivator` | `getActivator` |
| `PopOverTarget` | String | — | — | `setPopOverTarget` | `getPopOverTarget` |
| `RoundedField` | Boolean | False | — | `setRoundedField` | `getRoundedField` |
| `Link` | Boolean | False | — | `setLink` | `getLink` |
| `Loading` | Boolean | False | — | `setLoading` | `getLoading` |
| `Outline` | Boolean | False | — | `setOutline` | `getOutline` |
| `LeftIcon` | String | — | — | `setLeftIcon` | `getLeftIcon` |
| `LeftIconColor` | String | — | — | `setLeftIconColor` | `getLeftIconColor` |
| `IconSize` | String | 50 | — | `setIconSize` | `getIconSize` |
| `ResizeIconSize` | Boolean | True | — | `setResizeIconSize` | `getResizeIconSize` |
| `RightIcon` | String | — | — | `setRightIcon` | `getRightIcon` |
| `RightIconColor` | String | — | — | `setRightIconColor` | `getRightIconColor` |
| `Image` | String | — | — | `setImage` | `getImage` |
| `ImageHeight` | String | 32px | — | `setImageHeight` | `getImageHeight` |
| `ImageWidth` | String | 32px | — | `setImageWidth` | `getImageWidth` |
| `RightImage` | String | — | — | `setRightImage` | `getRightImage` |
| `RightImageHeight` | String | 32px | — | `setRightImageHeight` | `getRightImageHeight` |
| `RightImageWidth` | String | 32px | — | `setRightImageWidth` | `getRightImageWidth` |
| `Size` | String | md | lg, md, none, sm, xs | `setSize` | `getSize` |
| `SizeLarge` | String | none | lg, md, none, sm, xs | `setSizeLarge` | `getSizeLarge` |
| `SizeMedium` | String | none | lg, md, none, sm, xs | `setSizeMedium` | `getSizeMedium` |
| `SizeSmall` | String | none | lg, md, none, sm, xs | `setSizeSmall` | `getSizeSmall` |
| `SizeXLarge` | String | none | lg, md, none, sm, xs | `setSizeXLarge` | `getSizeXLarge` |
| `Soft` | Boolean | False | — | `setSoft` | `getSoft` |
| `Height` | String | — | — | `setHeight` | `getHeight` |
| `Width` | String | — | — | `setWidth` | `getWidth` |
| `Shadow` | String | md | 2xl, inner, lg, md, none, shadow, sm, xl | `setShadow` | `getShadow` |
| `IndicatorVisible` | Boolean | False | — | `setIndicatorVisible` | `getIndicatorVisible` |
| `IndicatorValue` | String | — | — | `setIndicatorValue` | `getIndicatorValue` |
| `IndicatorColor` | String | error | — | `setIndicatorColor` | `getIndicatorColor` |
| `IndicatorTextColor` | String | none | — | `setIndicatorTextColor` | `getIndicatorTextColor` |
| `IndicatorPosition` | String | top-end | bottom-center, bottom-end, bottom-start, middle-center, middle-end, middle-start, top-center, top-end, top-start | `setIndicatorPosition` | `getIndicatorPosition` |
| `IndicatorSize` | String | 6 | — | `setIndicatorSize` | `getIndicatorSize` |
| `NoBadge` | Boolean | False | — | `setNoBadge` | `getNoBadge` |
| `NoIndicator` | Boolean | False | — | `setNoIndicator` | `getNoIndicator` |
| `NoLeftIcon` | Boolean | False | — | `setNoLeftIcon` | `getNoLeftIcon` |
| `NoLeftImage` | Boolean | False | — | `setNoLeftImage` | `getNoLeftImage` |
| `NoLoading` | Boolean | False | — | `setNoLoading` | `getNoLoading` |
| `NoRightIcon` | Boolean | False | — | `setNoRightIcon` | `getNoRightIcon` |
| `NoRightImage` | Boolean | False | — | `setNoRightImage` | `getNoRightImage` |
| `NoText` | Boolean | False | — | `setNoText` | `getNoText` |
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
## Icon sizing and alignment

- `ResizeIconSize` defaults to `True`. In this mode, `IconSize` is treated as a percentage of the button element. `Size` also overrides the percentage: `xs` = 50%, `sm` = 60%, `md` = 65%, and `lg` = 70%.
- The icon renderer is a flex child. On a `Block=True` full-width button, that percentage reserves a large part of the button width even when the SVG artwork itself looks small. The label can consequently appear far to the right.
- To use a fixed CSS dimension, set `ResizeIconSize = False` and then set `IconSize` to a CSS size such as `24px` or `1.5rem`. In this mode the value is applied directly to the icon renderer's width and height. The Designer description calls this a percentage, but direct CSS dimensions are supported when automatic resizing is disabled.
- Buttons center their children as one flex group. A fixed-size icon greatly reduces the label offset; the label itself remains slightly right of the button center by roughly half the icon and its gap. Exact text centering with an icon requires separate positioning for the icon and label.

Example for a full-width button:

```vb
SignInButton.ResizeIconSize = False
SignInButton.IconSize = "24px"
```

## Events
`Click`

Wire in parent: `Sub button_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (15)
- `AddAttr(k As String, v As String)` _(public)_
- `AddClass(className As String)` _(public)_
- `AddComponent()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Focus()` _(public)_
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `OnEvent(event As String, MethodName As String)` _(public)_
- `Remove()` _(public)_
- `RemoveBadge()` _(public)_
- `RemoveIndicator()` _(public)_
- `RemoveLeftIcon()` _(public)_
- `RemoveLeftImage()` _(public)_
- `RemoveRightIcon()` _(public)_
- `RemoveRightImage()` _(public)_
- `RemoveText()` _(public)_

## Key Setters (83)
- `setActivator(b As Boolean)` _(public)_
- `setActive(b As Boolean)` _(public)_
- `setAttributes(s As String)` _(public)_
- `setBackgroundColor(s As String)` _(public)_
- `setBadge(s As String)` _(public)_
- `setBadgeColor(s As String)` _(public)_
- `setBadgeSize(s As String)` _(public)_
- `setBadgeVisible(b As Boolean)` _(public)_
- `setBlock(b As Boolean)` _(public)_
- `setButtonIcon(b As Boolean)` _(public)_
- `setClasses(s As String)` _(public)_
- `setColor(s As String)` _(public)_
- `setDash(b As Boolean)` _(public)_
- `setDockItem(b As Boolean)` _(public)_
- `setEnabled(b As Boolean)` _(public)_
- `setGhost(b As Boolean)` _(public)_
- `setHeight(s As String)` _(public)_
- `setIconSize(s As String)` _(public)_
- `setImage(s As String)` _(public)_
- `setImageHeight(s As String)` _(public)_
- `setImageWidth(s As String)` _(public)_
- `setIndicatorColor(s As String)` _(public)_
- `setIndicatorPosition(s As String)` _(public)_
- `setIndicatorSize(s As String)` _(public)_
- `setIndicatorTextColor(s As String)` _(public)_
- `setIndicatorValue(s As String)` _(public)_
- `setIndicatorVisible(b As Boolean)` _(public)_
- `setJoinItem(b As Boolean)` _(public)_
- `setLeftIcon(s As String)` _(public)_
- `setLeftIconColor(s As String)` _(public)_
- `setLeftIconVisible(b As Boolean)` _(public)_
- `setLeftImage(s As String)` _(public)_
- `setLeftImageHeight(s As String)` _(public)_
- `setLeftImageVisible(b As Boolean)` _(public)_
- `setLeftImageWidth(s As String)` _(public)_
- `setLink(b As Boolean)` _(public)_
- `setLoading(b As Boolean)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setNoBadge(b As Boolean)` _(public)_
- `setNoIndicator(b As Boolean)` _(public)_
- `setNoLeftIcon(b As Boolean)` _(public)_
- `setNoLeftImage(b As Boolean)` _(public)_
- `setNoLoading(b As Boolean)` _(public)_
- `setNoRightIcon(b As Boolean)` _(public)_
- `setNoRightImage(b As Boolean)` _(public)_
- `setNoText(b As Boolean)` _(public)_
- `setOutline(b As Boolean)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setParentID(s As String)` _(public)_
- `setPopOverTarget(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setPositionStyle(s As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `setResizeIconSize(b As Boolean)` _(public)_
- `setRightIcon(s As String)` _(public)_
- `setRightIconColor(s As String)` _(public)_
- `setRightIconVisible(b As Boolean)` _(public)_
- `setRightImage(s As String)` _(public)_
- `setRightImageHeight(s As String)` _(public)_
- `setRightImageVisible(b As Boolean)` _(public)_
- `setRightImageWidth(s As String)` _(public)_
- `setRoundedField(b As Boolean)` _(public)_
- `setShadow(s As String)` _(public)_
- `setShape(s As String)` _(public)_
- `setSize(s As String)` _(public)_
- `setSizeLarge(s As String)` _(public)_
- `setSizeMedium(s As String)` _(public)_
- `setSizeSmall(s As String)` _(public)_
- `setSizeXLarge(s As String)` _(public)_
- `setSoft(b As Boolean)` _(public)_
- `setStyles(s As String)` _(public)_
- `setText(text As String)` _(public)_
- `setTextColor(s As String)` _(public)_
- `setTextSize(s As String)` _(public)_
- `setTextVisible(b As Boolean)` _(public)_
- `setTooltip(s As String)` _(public)_
- `setTooltipAlignment(s As String)` _(public)_
- `setTooltipColor(s As String)` _(public)_
- `setTooltipOpen(b As Boolean)` _(public)_
- `setTooltipPosition(s As String)` _(public)_
- `setVisible(b As Boolean)` _(public)_
- `setWide(b As Boolean)` _(public)_
- `setWidth(s As String)` _(public)_

## Getters (80)
- `getActivator()` _(public)_
- `getActive()` _(public)_
- `getAttributes()` _(public)_
- `getBackgroundColor()` _(public)_
- `getBadge()` _(public)_
- `getBadgeColor()` _(public)_
- `getBadgeSize()` _(public)_
- `getBadgeVisible()` _(public)_
- `getBlock()` _(public)_
- `getButtonIcon()` _(public)_
- `getClasses()` _(public)_
- `getColor()` _(public)_
- `getDash()` _(public)_
- `getDockItem()` _(public)_
- `getEnabled()` _(public)_
- `getGhost()` _(public)_
- `getHeight()` _(public)_
- `getHere()` As String _(public)_
- `getIconSize()` _(public)_
- `getID()` As String _(public)_
- `getImage()` _(public)_
- `getImageHeight()` _(public)_
- `getImageWidth()` _(public)_
- `getIndicatorColor()` _(public)_
- `getIndicatorPosition()` _(public)_
- `getIndicatorSize()` _(public)_
- `getIndicatorTextColor()` _(public)_
- `getIndicatorValue()` _(public)_
- `getIndicatorVisible()` _(public)_
- `getJoinItem()` _(public)_
- `getLeftIcon()` _(public)_
- `getLeftIconColor()` _(public)_
- `getLeftIconVisible()` _(public)_
- `getLink()` _(public)_
- `getLoading()` _(public)_
- `getMarginAXYTBLR()` _(public)_
- `getNoBadge()` _(public)_
- `getNoIndicator()` _(public)_
- `getNoLeftIcon()` _(public)_
- `getNoLeftImage()` _(public)_
- `getNoLoading()` _(public)_
- `getNoRightIcon()` _(public)_
- `getNoRightImage()` _(public)_
- `getNoText()` _(public)_
- `getOutline()` _(public)_
- `getPaddingAXYTBLR()` _(public)_
- `getParentID()` As String _(public)_
- `getPopOverTarget()` _(public)_
- `getPosition()` _(public)_
- `getPositionStyle()` _(public)_
- `GetProperties()` _(public)_
- `getResizeIconSize()` _(public)_
- `getRightIcon()` _(public)_
- `getRightIconColor()` _(public)_
- `getRightIconVisible()` _(public)_
- `getRightImage()` _(public)_
- `getRightImageHeight()` _(public)_
- `getRightImageWidth()` _(public)_
- `getRoundedField()` _(public)_
- `getShadow()` _(public)_
- `getShape()` _(public)_
- `getSize()` _(public)_
- `getSizeLarge()` _(public)_
- `getSizeMedium()` _(public)_
- `getSizeSmall()` _(public)_
- `getSizeXLarge()` _(public)_
- `getSoft()` _(public)_
- `getStyles()` _(public)_
- `getText()` _(public)_
- `getTextColor()` _(public)_
- `getTextSize()` _(public)_
- `getTextVisible()` _(public)_
- `getTooltip()` _(public)_
- `getTooltipAlignment()` _(public)_
- `getTooltipColor()` _(public)_
- `getTooltipOpen()` _(public)_
- `getTooltipPosition()` _(public)_
- `getVisible()` _(public)_
- `getWide()` _(public)_
- `getWidth()` _(public)_

## Private Methods (1)
- `SetDefaults()` _(private)_

## Verified Demo Usage

Real syntax from [`pgButtons.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgButtons.bas) (verified demo):

```b4j
Private SDUI5Button1 As SDUI5Button		'ignore
Private SDUI5Button10 As SDUI5Button		'ignore
Private SDUI5Button11 As SDUI5Button		'ignore
Private SDUI5Button12 As SDUI5Button		'ignore
Private SDUI5Button13 As SDUI5Button		'ignore
Private SDUI5Button14 As SDUI5Button		'ignore
Private SDUI5Button15 As SDUI5Button		'ignore
Private SDUI5Button16 As SDUI5Button		'ignore
Private SDUI5Button17 As SDUI5Button		'ignore
Private SDUI5Button18 As SDUI5Button		'ignore
Private SDUI5Button19 As SDUI5Button		'ignore
BANano.Await(SDUI5Container1.AddComponent)
```

## Emits (daisyUI classes pushed in DesignerCreateView)
**Classes**: `join-item`, `dock-active`, `btn-active`, `rounded-field`, `btn-block`, `btn-square`, `btn-circle`, `btn-dash`, `btn-ghost`, `btn-link`, `btn-outline`, `btn-soft`, `btn-wide`, `inline-flex !items-center !justify-center text-center`
**Colors**: `btn:sColor`
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim button As SDUI5Button
button.Initialize(Me, "SDUI5Button", "SDUI5Button")
button.ParentID = "placeholder"
BANano.Await(button.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.
