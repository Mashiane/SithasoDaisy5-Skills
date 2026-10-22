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
## Public Methods (17)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `OnEvent(event As String, MethodName As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `AddClass(className As String)` _(public)_
- `AddAttr(k As String, v As String)` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `RemoveIndicator()` As 'ignoredeadcode _(public)_
- `RemoveBadge()` As 'ignoredeadcode _(public)_
- `RemoveRightImage()` As 'ignoredeadcode _(public)_
- `RemoveLeftIcon()` As 'ignoredeadcode _(public)_
- `RemoveRightIcon()` As 'ignoredeadcode _(public)_
- `RemoveText()` As 'ignoredeadcode _(public)_
- `RemoveLeftImage()` As 'ignoredeadcode _(public)_
- `Focus()` _(public)_
## Key Setters (82)
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
- `setTextVisible(b As Boolean)` As 'ignoredeadcode _(public)_
- `setTextSize(s As String)` _(public)_
- `setText(text As String)` As 'ignoredeadcode _(public)_
- `setNoBadge(b As Boolean)` As 'ignoredeadcode _(public)_
- `setNoIndicator(b As Boolean)` As 'ignoredeadcode _(public)_
- `setNoLeftIcon(b As Boolean)` As 'ignoredeadcode _(public)_
- `setNoLeftImage(b As Boolean)` As 'ignoredeadcode _(public)_
- `setNoLoading(b As Boolean)` As 'ignoredeadcode _(public)_
- `setNoRightIcon(b As Boolean)` As 'ignoredeadcode _(public)_
- `setNoRightImage(b As Boolean)` As 'ignoredeadcode _(public)_
- `setNoText(b As Boolean)` As 'ignoredeadcode _(public)_
- `setButtonIcon(b As Boolean)` As 'ignore _(public)_
- `setIndicatorVisible(b As Boolean)` As 'ignoredeadcode _(public)_
- `setIndicatorColor(s As String)` As 'ignoredeadcode _(public)_
- `setIndicatorPosition(s As String)` As 'ignoredeadcode _(public)_
- `setIndicatorSize(s As String)` As 'ignoredeadcode _(public)_
- `setIndicatorTextColor(s As String)` As 'ignoredeadcode _(public)_
- `setIndicatorValue(s As String)` As 'ignoredeadcode _(public)_
- `setPopOverTarget(s As String)` As 'ignoredeadcode _(public)_
- `setShadow(s As String)` _(public)_
- `setIconSize(s As String)` As 'ignoredeadcode _(public)_
- `setResizeIconSize(b As Boolean)` As 'ignoredeadcode _(public)_
- `setLeftIcon(s As String)` As 'ignoredeadcode _(public)_
- `setLeftIconColor(s As String)` As 'ignoredeadcode _(public)_
- `setRightIcon(s As String)` As 'ignoredeadcode _(public)_
- `setRightIconColor(s As String)` As 'ignoredeadcode _(public)_
- `setTooltip(s As String)` As 'ignoredeadcode _(public)_
- `setTooltipColor(s As String)` As 'ignoredeadcode _(public)_
- `setTooltipOpen(b As Boolean)` As 'ignoredeadcode _(public)_
- `setTooltipPosition(s As String)` As 'ignoredeadcode _(public)_
- `setTooltipAlignment(s As String)` As 'ignoredeadcode _(public)_
- `setBadgeSize(s As String)` As 'ignoredeadcode _(public)_
- `setActive(b As Boolean)` _(public)_
- `setBackgroundColor(s As String)` _(public)_
- `setBlock(b As Boolean)` _(public)_
- `setShape(s As String)` As 'ignoredeadcode _(public)_
- `setColor(s As String)` _(public)_
- `setDash(b As Boolean)` _(public)_
- `setGhost(b As Boolean)` _(public)_
- `setLeftImage(s As String)` As 'ignoredeadcode _(public)_
- `setLeftImageHeight(s As String)` As 'ignoredeadcode _(public)_
- `setLeftImageWidth(s As String)` As 'ignoredeadcode _(public)_
- `setImage(s As String)` As 'ignoredeadcode _(public)_
- `setImageHeight(s As String)` As 'ignoredeadcode _(public)_
- `setImageWidth(s As String)` As 'ignoredeadcode _(public)_
- `setLink(b As Boolean)` _(public)_
- `setLoading(b As Boolean)` As 'ignoredeadcode _(public)_
- `setOutline(b As Boolean)` _(public)_
- `setRightImage(s As String)` As 'ignoredeadcode _(public)_
- `setSize(s As String)` _(public)_
- `setSizeLarge(s As String)` _(public)_
- `setSizeMedium(s As String)` _(public)_
- `setSizeSmall(s As String)` _(public)_
- `setSizeXLarge(s As String)` _(public)_
- `setSoft(b As Boolean)` _(public)_
- `setTextColor(s As String)` As 'ignoredeadcode _(public)_
- `setWide(b As Boolean)` _(public)_
- `setLeftImageVisible(b As Boolean)` _(public)_
- `setRightImageVisible(b As Boolean)` _(public)_
- `setRightImageHeight(s As String)` As 'ignoredeadcode _(public)_
- `setRightImageWidth(s As String)` As 'ignoredeadcode _(public)_
- `setBadge(s As String)` As 'ignoredeadcode _(public)_
- `setBadgeColor(s As String)` As 'ignoredeadcode _(public)_
- `setBadgeVisible(b As Boolean)` _(public)_
- `setHeight(s As String)` _(public)_
- `setWidth(s As String)` _(public)_
- `setJoinItem(b As Boolean)` _(public)_
- `setDockItem(b As Boolean)` As 'ignoredeadcode _(public)_
- `setActivator(b As Boolean)` _(public)_
- `setRoundedField(b As Boolean)` _(public)_
- `setLeftIconVisible(b As Boolean)` _(public)_
- `setRightIconVisible(b As Boolean)` _(public)_
## Getters (78)
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
- `getTextSize()` As String _(public)_
- `getTextVisible()` As Boolean _(public)_
- `getText()` As String _(public)_
- `getNoBadge()` As Boolean _(public)_
- `getNoIndicator()` As Boolean _(public)_
- `getNoLeftIcon()` As Boolean _(public)_
- `getNoLeftImage()` As Boolean _(public)_
- `getNoLoading()` As Boolean _(public)_
- `getNoRightIcon()` As Boolean _(public)_
- `getNoRightImage()` As Boolean _(public)_
- `getNoText()` As Boolean _(public)_
- `getButtonIcon()` As Boolean _(public)_
- `getIndicatorVisible()` As Boolean _(public)_
- `getIndicatorColor()` As String _(public)_
- `getIndicatorPosition()` As String _(public)_
- `getIndicatorSize()` As String _(public)_
- `getIndicatorTextColor()` As String _(public)_
- `getIndicatorValue()` As String _(public)_
- `getPopOverTarget()` As String					'ignoredeadcode _(public)_
- `getShadow()` As String _(public)_
- `getIconSize()` As String _(public)_
- `getResizeIconSize()` As Boolean _(public)_
- `getLeftIcon()` As String _(public)_
- `getLeftIconColor()` As String _(public)_
- `getRightIcon()` As String _(public)_
- `getRightIconColor()` As String _(public)_
- `getTooltip()` As String _(public)_
- `getTooltipColor()` As String _(public)_
- `getTooltipOpen()` As Boolean _(public)_
- `getTooltipPosition()` As String _(public)_
- `getTooltipAlignment()` As String _(public)_
- `getBadgeSize()` As String _(public)_
- `getShape()` As String _(public)_
- `getActive()` As Boolean _(public)_
- `getBackgroundColor()` As String _(public)_
- `getBlock()` As Boolean _(public)_
- `getColor()` As String _(public)_
- `getDash()` As Boolean _(public)_
- `getGhost()` As Boolean _(public)_
- `getImage()` As String _(public)_
- `getImageHeight()` As String _(public)_
- `getImageWidth()` As String _(public)_
- `getLink()` As Boolean _(public)_
- `getLoading()` As Boolean _(public)_
- `getOutline()` As Boolean _(public)_
- `getRightImage()` As String _(public)_
- `getSize()` As String _(public)_
- `getSizeLarge()` As String _(public)_
- `getSizeMedium()` As String _(public)_
- `getSizeSmall()` As String _(public)_
- `getSizeXLarge()` As String _(public)_
- `getSoft()` As Boolean _(public)_
- `getTextColor()` As String _(public)_
- `getWide()` As Boolean _(public)_
- `getRightImageHeight()` As String _(public)_
- `getRightImageWidth()` As String _(public)_
- `getBadge()` As String _(public)_
- `getBadgeColor()` As String _(public)_
- `getBadgeVisible()` As Boolean _(public)_
- `getHeight()` As String _(public)_
- `getWidth()` As String _(public)_
- `getJoinItem()` As Boolean _(public)_
- `getDockItem()` As Boolean _(public)_
- `getActivator()` As Boolean _(public)_
- `getRoundedField()` As Boolean _(public)_
- `getLeftIconVisible()` As Boolean _(public)_
- `getRightIconVisible()` As Boolean _(public)_
## Private Methods (1)
- `SetDefaults()` _(private)_
## Verified Demo Usage

Real syntax from [`pgToast.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgToast.bas) (verified demo). `toast2` = a SDUI5Button.

```b4j
	toast2.Initialize(Me, "toast2", "toast2")
	toast2.ParentID = "SDUI5Toast3"
	toast2.Activator = False
	toast2.Active = False
	toast2.BackgroundColor = ""
	toast2.Badge = ""
	toast2.BadgeColor = ""
	toast2.BadgeSize = "sm"
	toast2.Block = False
	toast2.Color = "none"
	toast2.Dash = False
	toast2.DockItem = False
	toast2.Enabled = True
	toast2.Ghost = False
	toast2.Height = ""
	toast2.IconSize = "none"
    toast2.Image = "./assets/addfolder.svg"
	toast2.IndicatorColor = "error"
	toast2.IndicatorPosition = "top-end"
	toast2.IndicatorSize = "xs"
	toast2.IndicatorTextColor = "none"
	toast2.IndicatorValue = ""
	toast2.IndicatorVisible = False
	toast2.JoinItem = False
	toast2.LeftIcon = ""
	toast2.LeftIconColor = ""
	toast2.Link = False
	toast2.Loading = False
	'   ... (see demo source for the rest)
```

Demo-wired events: `Click` — handlers named `toast2_<Event>`.

Also used in: `pgAlert`, `pgBarcodeReader`, `pgButtons`, `pgCard`, `pgDock`, `pgDockColor`, `pgDockXS`, `pgDropDown`…
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


