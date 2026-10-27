# SithasoDaisy5 Component Default Properties & Setters Reference

## Overview: The Prompt-to-Setter Alignment Protocol

When building applications from an AI prompt or design specification, **never rely on component defaults blindly**.
Every SithasoDaisy5 component executes `SetDefaults` during `Initialize`, assigning built-in values originally designed for standalone Visual Designer canvas drops.
If code is generated without explicitly auditing these defaults, the resulting UI will diverge from the user's prompt or conflict with parent container geometry.

### The 4-Step Prompt-to-Setter Alignment Flow:

1. **Analyze Prompt Specifications**: Extract all visual style requirements: layout direction, colors, borders, shadows, roundedness, sizing, placeholders, and media.
2. **Inspect Component Defaults**: Check the target component in this catalog or its per-component `.md` file to see what defaults `SetDefaults` assigns.
3. **Identify Divergence**: Note every property where the prompt differs from the default (e.g. prompt asks for borderless, but component defaults to `Border = True`; prompt asks for horizontal layout, but component defaults to `Direction = "vertical"`).
4. **Call Explicit Setters**: Invoke the corresponding setter method (`.Width = ...`, `.Border = ...`, `.Direction = ...`) during component instantiation before `AddComponent`.

---

## 1. High-Impact Defaults by Semantic Category

### A. Sizing & Layout Defaults

| Component | Property | Default | Setter | Conflict / Prompt Alignment Rule |
|---|---|---|---|---|
| `SDUI5Card` | `Width` | `"96"` ($384\text{px}$) | `setWidth` | **Mandatory override**: Inside `SDUI5Column`, always set `.Width = "full"`. |
| `SDUI5Wizard` | `Width` | `"96"` ($384\text{px}$) | `setWidth` | Set `.Width = "full"` unless a fixed modal popover is explicitly desired. |
| `SDUI5Menu` | `Width` | `"56"` ($224\text{px}$) | `setWidth` | Set `.Width = "full"` when used in a sidebar drawer or column. |
| `SDUI5Image` | `Width`, `Height` | `"12"`, `"12"` ($48\text{px}$) | `setWidth`, `setHeight` | Overwrite for hero banners or card illustrations (`w-full`, `h-48`, etc.). |
| `SDUI5Hero` | `MinHeight` | `"56"` ($224\text{px}$) | `setMinHeight` | For full-screen hero banners, set `.MinHeight = "screen"` or desired Tailwind height. |
| `SDUI5Column` | `Size` | `"12"` | `setSize` | Default is full 12-column width on mobile. Set `.SizeMd`, `.SizeLg` for responsive desktop grids. |
| `SDUI5Row` | `GridCols` | `"12"` | `setGridCols` | Keep `"12"` when using 12-column span children (`SizeMd = "4"`). |
| `SDUI5TextBox` | `Width` | `"full"` | `setWidth` | Defaults to 100% width. Safe in forms. |
| `SDUI5Button` | `Block` | `False` | `setBlock` | Set `.Block = True` if the prompt requires a full-width block button. |


### B. Direction & Orientation Defaults

| Component | Property | Default | Setter | Prompt Alignment Rule |
|---|---|---|---|---|
| `SDUI5Stat` | `Direction` | `"vertical"` | `setDirection` | Default stacks stats vertically. If prompt asks for a horizontal banner, set `.Direction = "horizontal"` or `.LGDirection = "horizontal"`. |
| `SDUI5Card` | `Side` | `False` | `setSide` | Default stacks image on top. If prompt asks for horizontal card, set `.Side = True` (or `.MDSide = True`). |
| `SDUI5Divider` | `Direction` | `"vertical"` | `setDirection` | In standard page layouts between rows, set `.Direction = "horizontal"` if separating vertical sections. |
| `SDUI5Steps` | `Direction` | `"horizontal"` | `setDirection` | If used in a vertical sidebar or checkout step list, set `.Direction = "vertical"`. |
| `SDUI5Timeline` | `Direction` | `"vertical"` | `setDirection` | Set `.Direction = "horizontal"` if designing a horizontal process flow. |
| `SDUI5Menu` | `Direction` | `"vertical"` | `setDirection` | In top navbars, set `.Direction = "horizontal"`. |
| `SDUI5Carousel` | `Direction` | `"horizontal"` | `setDirection` | Standard horizontal slider. |


### C. Visual Styling, Borders, Shadows & Backgrounds

| Component | Property | Default | Setter | Prompt Alignment Rule |
|---|---|---|---|---|
| `SDUI5Card` | `Border` | `True` | `setBorder` | If prompt asks for borderless/flat cards, set `.Border = False`. |
| `SDUI5Card` | `Shadow` | `"sm"` | `setShadow` | Set `.Shadow = "md"`, `"xl"`, or `"none"` according to prompt. |
| `SDUI5Card` | `BackgroundColor` | `"base-100"` | `setBackgroundColor` | Override with `"primary"`, `"base-200"`, or `"transparent"` per prompt theme. |
| `SDUI5Button` | `Color` | `"none"` | `setColor` | Defaults uncolored. If prompt says "primary button", explicitly set `.Color = "primary"`. |
| `SDUI5Button` | `Outline` | `False` | `setOutline` | Set `.Outline = True` if prompt asks for outlined / ghost buttons. |
| `SDUI5Button` | `Soft` | `False` | `setSoft` | Set `.Soft = True` for modern soft pastel daisyUI v5 buttons. |
| `SDUI5Button` | `Ghost` | `False` | `setGhost` | Set `.Ghost = True` for transparent toolbar buttons. |
| `SDUI5Button` | `Shadow` | `"md"` | `setShadow` | Defaults to medium shadow. |
| `SDUI5TextBox` | `Border` | `True` | `setBorder` | Defaults to bordered. Set `.Border = False` for ghost inputs. |
| `SDUI5TextBox` | `BorderColor` | `"base-300"` | `setBorderColor` | Set to semantic color (e.g. `"primary"`, `"error"`) if highlighted. |
| `SDUI5TextBox` | `BackgroundColor` | `"base-200"` | `setBackgroundColor` | Defaults to base-200 contrast background. |
| `SDUI5Badge` | `Color` | `"primary"` | `setColor` | Defaults to primary. Override if neutral, accent, success, or warning. |
| `SDUI5Badge` | `Rounded` | `"full"` | `setRounded` | Defaults to pill badge (`rounded-full`). |
| `SDUI5Hero` | `Overlay` | `False` | `setOverlay` | Set `.Overlay = True` for image background heros with dark readability scrim. |
| `SDUI5Footer` | `PositionStyle` | `"sticky"` | `setPositionStyle` | Defaults to sticky bottom (`b=0`). If placed inside scrolling body, set `.PositionStyle = "static"`. |


### D. Form Controls & Inputs Defaults

| Component | Property | Default | Setter | Prompt Alignment Rule |
|---|---|---|---|---|
| `SDUI5TextBox` | `TypeOf` | `"text"` | `setTypeOf` | If password prompt: set `.TypeOf = "password"` and `.ShowEyes = True`. If email: `.TypeOf = "email"`. If number: `.TypeOf = "number"`. |
| `SDUI5TextBox` | `InputType` | `"normal"` | `setInputType` | Options: `normal`, `legend`, `floating`. If prompt asks for floating label, set `.InputType = "floating"`. |
| `SDUI5TextBox` | `Required` | `False` | `setRequired` | Set `.Required = True` if input is mandatory. |
| `SDUI5Select` | `RawOptions` | `"b4a=b4a; ..."` | `setOptions` | **Mandatory override**: Default has placeholder demo options. Always call `.Options = ...` with real data. |
| `SDUI5RadioGroup` | `RawOptions` | `"b4a=b4a; ..."` | `setOptions` | **Mandatory override**: Always call `.Options = ...` with real prompt choices. |
| `SDUI5Rating` | `Mask` | `"star"` | `setMask` | Defaults to stars. Can be overridden to `"heart"`, `"circle"`, etc. |
| `SDUI5Rating` | `Color` | `"primary"` | `setColor` | Defaults to primary. |
| `SDUI5Rating` | `Value` | `2` | `setValue` | Defaults to 2 stars. Set initial value per prompt. |
| `SDUI5Range` | `Value` | `10` | `setValue` | Defaults to 10 ($0-100$). Set `.MinValue`, `.MaxValue`, `.Value` per spec. |


### E. Media & Asset Defaults

| Component | Property | Default | Setter | Prompt Alignment Rule |
|---|---|---|---|---|
| `SDUI5Card` | `Image` | `"./assets/mashy.jpg"` | `setImage` | **Mandatory override**: If no image is needed, set `.Image = ""` and `.ImageVisible = False`. If custom image, set path with extension. |
| `SDUI5Avatar` | `Size` | `"12"` ($48\text{px}$) | `setSize` | Set `.Size = "16"`, `"24"`, `"32"` for larger profile images. |
| `SDUI5Avatar` | `BackgroundColor` | `"primary"` | `setBackgroundColor` | Defaults to primary. Override if neutral or base-300. |

---

## 2. Comprehensive Component Index: Active Defaults & Setters

Below is the reference of all components that initialize non-trivial properties:

### SDUI5Accordion
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `Width` | `full` | `setWidth` | — |
| `RawOptions` | `btn1=Button 1; btn2=Button 2; btn3=Button 3` | `setOptions` | — |
| `Active` | `btn1` | `setActive` | — |
| `BackgroundColor` | `base-100` | `setBackgroundColor` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5AdvancedCheckGroup
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `TypeOf` | `checkbox` | `setTypeOf` | radio, checkbox, toggle |
| `LegendLabel` | `Checkbox Group` | `setLegendLabel` | — |
| `Columns` | `3` | `setColumns` | — |
| `RawOptions` | `b4a=b4a; b4j=b4j; b4i=b4i; b4r=b4r` | `setOptions` | — |
| `BackgroundColor` | `base-200` | `setBackgroundColor` | — |
| `BorderColor` | `base-300` | `setBorderColor` | — |
| `Rounded` | `lg` | `setRounded` | none, rounded, 2xl, 3xl, full, lg, md, sm, xl, 0 |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Alert
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `Title` | `Alert Title` | `setTitle` | — |
| `Text` | `Alert Text` | `setText` | — |
| `IconSize` | `16px` | `setIconSize` | — |
| `Width` | `96` | `setWidth` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Aura
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Avatar
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `AvatarType` | `image` | `setAvatarType` | image, placeholder |
| `Image` | `./assets/600by600.jpg` | `setImage` | — |
| `Mask` | `circle` | `setMask` | circle, decagon, diamond, heart, hexagon, hexagon-2, none, pentagon, square, squircle, star, star-2, triangle, triangle-2, triangle-3, triangle-4, rounded-2xl, rounded-3xl, rounded, rounded-lg, rounded-md, rounded-sm, rounded-xl |
| `Placeholder` | `S` | `setPlaceholder` | — |
| `HasBadge` | `True` | `setHasBadge` | — |
| `BadgeColor` | `secondary` | `setBadgeColor` | — |
| `BadgePosition` | `top-end` | `setBadgePosition` | bottom-center, middle-center, bottom-end, bottom-start, middle-end, middle-start, top-center, top-end, top-start |
| `BadgeSize` | `sm` | `setBadgeSize` | lg, md, none, sm, xl, xs |
| `BackgroundColor` | `primary` | `setBackgroundColor` | — |
| `Size` | `12` | `setSize` | — |
| `RingColor` | `primary` | `setRingColor` | — |
| `RingOffset` | `2` | `setRingOffset` | — |
| `RingOffsetColor` | `base-100` | `setRingOffsetColor` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5AvatarGroup
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `RawImages` | `one=./assets/1.jpg; two=./assets/2.jpg; three=./assets/3.jpg; four=./assets/4.jpg; five=./assets/5.jpg` | `setImages` | — |
| `Mask` | `circle` | `setMask` | circle, decagon, diamond, heart, hexagon, hexagon-2, none, pentagon, square, squircle, star, star-2, triangle, triangle-2, triangle-3, triangle-4, rounded-2xl, rounded-3xl, rounded, rounded-lg, rounded-md, rounded-sm, rounded-xl |
| `Size` | `6` | `setSize` | — |
| `Space` | `6` | `setSpace` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Badge
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `Text` | `Badge` | `setText` | — |
| `Color` | `primary` | `setColor` | accent, error, info, neutral, primary, secondary, success, warning, none |
| `LeftIconSize` | `16px` | `setLeftIconSize` | — |
| `LeftImageSize` | `16px` | `setLeftImageSize` | — |
| `RightIconSize` | `16px` | `setRightIconSize` | — |
| `RightImageSize` | `16px` | `setRightImageSize` | — |
| `Rounded` | `full` | `setRounded` | none, rounded, 2xl, 3xl, full, lg, md, sm, xl, 0 |
| `HasLeftIcon` | `True` | `setHasLeftIcon` | — |
| `HasLeftImage` | `True` | `setHasLeftImage` | — |
| `HasRightIcon` | `True` | `setHasRightIcon` | — |
| `HasRightImage` | `True` | `setHasRightImage` | — |
| `IndicatorPosition` | `top-start` | `setIndicatorPosition` | bottom-center, middle-center, bottom-end, bottom-start, middle-end, middle-start, top-center, top-end, top-start |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5BankCard
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `BankName` | `BANK OF LATVERIA` | `setBankName` | — |
| `CardNumber` | `0210 8820 1150 0222` | `setCardNumber` | — |
| `CardHolder` | `CARD HOLDER` | `setCardHolder` | — |
| `ExpiresMonth` | `29` | `setExpiresMonth` | — |
| `ExpiresYear` | `08` | `setExpiresYear` | — |
| `CardBrand` | `❁` | `setCardBrand` | — |
| `TextColor` | `#FFFFFFFF` | `setTextColor` | — |
| `GradientActive` | `True` | `setGradientActive` | — |
| `Gradient` | `bl_tr` | `setGradient` | bl_tr, bottom_top, br_tl, left_right, right_left, tl_br, top_bottom, tr_bl |
| `Width` | `100` | `setWidth` | — |
| `Rounded` | `2xl` | `setRounded` | 0, 2xl, 3xl, full, lg, md, none, rounded, sm, xl |
| `Shadow` | `2xl` | `setShadow` | 2xl, inner, lg, md, none, shadow, sm, xl |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5BarCode
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `Format` | `auto` | `setFormat` | auto, codabar, CODE128, CODE128A, CODE128AUTO, CODE128B, CODE128C, CODE39, EAN13, EAN2, EAN5, EAN8, GenericBarcode, ITF, ITF14, MSI, MSI10, MSI1010, MSI11, MSI1110, pharmacode, UPC, UPCE |
| `Value` | `123456789012` | `setValue` | — |
| `Text` | `JsBarCode` | `setText` | — |
| `Background` | `#ffffff` | `setBackground` | — |
| `DisplayValue` | `True` | `setDisplayValue` | — |
| `Font` | `monospace` | `setFont` | — |
| `FontSize` | `20` | `setFontSize` | — |
| `Height` | `100` | `setHeight` | — |
| `Width` | `2` | `setWidth` | — |
| `LineColor` | `#000000` | `setLineColor` | — |
| `Margin` | `10` | `setMargin` | — |
| `MarginBottom` | `-1` | `setMarginBottom` | — |
| `MarginLeft` | `-1` | `setMarginLeft` | — |
| `MarginRight` | `-1` | `setMarginRight` | — |
| `MarginTop` | `-1` | `setMarginTop` | — |
| `TextAlign` | `center` | `setTextAlign` | center, left, right |
| `TextMargin` | `2` | `setTextMargin` | — |
| `TextPosition` | `bottom` | `setTextPosition` | bottom, top |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5BarcodeReader
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `Camera` | `environment` | `setCamera` | environment, user |
| `Fps` | `5` | `setFps` | — |
| `Height` | `500px` | `setHeight` | — |
| `Width` | `500px` | `setWidth` | — |
| `QrboxHeight` | `250` | `setQrboxHeight` | — |
| `QrboxWidth` | `250` | `setQrboxWidth` | — |
| `RoundedBox` | `True` | `setRoundedBox` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5BasicLabel
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `TagType` | `div` | `setTagType` | — |
| `HorizontalAnchor` | `left` | `setHorizontalAnchor` | left, left-right, right |
| `VerticalAnchor` | `top` | `setVerticalAnchor` | bottom, top, top-bottom |
| `BoxSizing` | `border-box` | `setBoxSizing` | border-box, none |
| `Width` | `100px` | `setWidth` | — |
| `Height` | `60px` | `setHeight` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Visible` | `True` | `setVisible` | — |
| `BorderColor` | `#000000` | `setBorderColor` | — |
| `BorderWidth` | `0px` | `setBorderWidth` | — |
| `BorderRadius` | `0px` | `setBorderRadius` | — |
| `BorderStyle` | `solid` | `setBorderStyle` | dashed, dotted, double, groove, hidden, inherit, initial, inset, none, outset, ridge, solid |
| `Text` | `Text` | `setText` | — |
| `TextColor` | `#000000` | `setTextColor` | — |
| `Alignment` | `center` | `setAlignment` | bottom, center, left, right, top, none |
| `BackgroundColor` | `transparent` | `setBackgroundColor` | — |
| `FontSize` | `15` | `setFontSize` | — |
| `GradientActive` | `false` | `setGradientActive` | — |


### SDUI5BottomDrawer
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `BackgroundColor` | `bg-base-200` | `setBackgroundColor` | — |
| `Breakpoints` | `0;0.1;0.2;0.3;0.4;0.5;0.7;0.8;1` | `setBreakpoints` | — |
| `InitialBreakpoint` | `0.5` | `setInitialBreakpoint` | — |
| `Duration` | `300` | `setDuration` | — |
| `ShowHandle` | `True` | `setShowHandle` | — |
| `HandleBg` | `bg-base-300` | `setHandleBg` | — |
| `HandleShadow` | `md` | `setHandleShadow` | 2xl, inner, lg, md, none, shadow, sm, xl |
| `MaxWidth` | `100%` | `setMaxWidth` | — |
| `Width` | `100%` | `setWidth` | — |
| `Showbackdrop` | `True` | `setShowbackdrop` | — |
| `BackdropColor` | `#00000052` | `setBackdropColor` | — |
| `Backdropdismiss` | `True` | `setBackdropdismiss` | — |


### SDUI5BottomNavigation
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `ForegroundColor` | `#42A5F5` | `setForegroundColor` | — |
| `BackgroundColor` | `#FFFFFF` | `setBackgroundColor` | — |
| `BadgeColor` | `#FBC02D` | `setBadgeColor` | — |
| `IconColor` | `#0000008A` | `setIconColor` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5BreadCrumbs
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `RawOptions` | `b4a=b4a; b4j=b4j; b4i=b4i; b4r=b4r` | `setOptions` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Browser
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `URL` | `https://b4x.com` | `setURL` | — |
| `Height` | `56` | `setHeight` | — |
| `Width` | `full` | `setWidth` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Button
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `Text` | `Button` | `setText` | — |
| `TextVisible` | `True` | `setTextVisible` | — |
| `BadgeSize` | `sm` | `setBadgeSize` | lg, md, none, sm, xl, xs |
| `IconSize` | `50` | `setIconSize` | — |
| `ResizeIconSize` | `True` | `setResizeIconSize` | — |
| `ImageHeight` | `32px` | `setImageHeight` | — |
| `ImageWidth` | `32px` | `setImageWidth` | — |
| `RightImageHeight` | `32px` | `setRightImageHeight` | — |
| `RightImageWidth` | `32px` | `setRightImageWidth` | — |
| `Size` | `md` | `setSize` | lg, md, none, sm, xs |
| `Shadow` | `md` | `setShadow` | 2xl, inner, lg, md, none, shadow, sm, xl |
| `IndicatorColor` | `error` | `setIndicatorColor` | — |
| `IndicatorPosition` | `top-end` | `setIndicatorPosition` | bottom-center, bottom-end, bottom-start, middle-center, middle-end, middle-start, top-center, top-end, top-start |
| `IndicatorSize` | `6` | `setIndicatorSize` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Calendar
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `Text` | `Calendar` | `setText` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Card
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `Image` | `./assets/mashy.jpg` | `setImage` | — |
| `ImagePosition` | `start` | `setImagePosition` | end, start |
| `ImageCover` | `True` | `setImageCover` | — |
| `ImageCenter` | `True` | `setImageCenter` | — |
| `ImageNoRepeat` | `True` | `setImageNoRepeat` | — |
| `Title` | `Card Title` | `setTitle` | — |
| `TitleVisible` | `True` | `setTitleVisible` | — |
| `RawContent` | `Card Content` | `setContent` | — |
| `BackgroundColor` | `base-100` | `setBackgroundColor` | — |
| `Border` | `True` | `setBorder` | — |
| `Width` | `96` | `setWidth` | — |
| `Shadow` | `sm` | `setShadow` | 2xl, inner, lg, md, none, shadow, sm, xl |
| `ActionsVisible` | `True` | `setActionsVisible` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Carousel
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `Direction` | `horizontal` | `setDirection` | horizontal, none, vertical |
| `SnapItems` | `start` | `setSnapItems` | center, end, start |
| `SpaceX` | `4` | `setSpaceX` | — |
| `BackgroundColor` | `neutral` | `setBackgroundColor` | — |
| `Height` | `500px` | `setHeight` | — |
| `Width` | `900px` | `setWidth` | — |
| `RoundedBox` | `True` | `setRoundedBox` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5CarouselItem
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `TypeOf` | `image` | `setTypeOf` | custom, image |
| `Image` | `./assets/mashy.jpg` | `setImage` | — |
| `Height` | `80` | `setHeight` | — |
| `Width` | `80` | `setWidth` | — |
| `ImageHeight` | `80` | `setImageHeight` | — |
| `ImageWidth` | `80` | `setImageWidth` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5ChatBubble
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `Placement` | `start` | `setPlacement` | end, start |
| `MessageFrom` | `Mashy` | `setMessageFrom` | — |
| `MessageTime` | `17:20` | `setMessageTime` | — |
| `Image` | `./assets/mashy.jpg` | `setImage` | — |
| `ImageSize` | `10` | `setImageSize` | — |
| `Message` | `Welcome to SithasoDaisy5` | `setMessage` | — |
| `Footer` | `Delivered` | `setFooter` | — |
| `HeaderVisible` | `True` | `setHeaderVisible` | — |
| `ImageVisible` | `True` | `setImageVisible` | — |
| `FooterVisible` | `True` | `setFooterVisible` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5ChatItem
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `FromAvatar` | `./assets/mashy.jpg` | `setFromAvatar` | — |
| `FromName` | `From Name` | `setFromName` | — |
| `Message` | `Message` | `setMessage` | — |
| `DeliveryTime` | `10:00 AM` | `setDeliveryTime` | — |
| `TimeAgo` | `True` | `setTimeAgo` | — |
| `Unread` | `2` | `setUnread` | — |
| `UnreadColor` | `primary` | `setUnreadColor` | — |
| `UnreadVisible` | `True` | `setUnreadVisible` | — |
| `HelpAvatar` | `./assets/mashy.jpg` | `setHelpAvatar` | — |
| `AvatarShape` | `circle` | `setAvatarShape` | circle, decagon, diamond, heart, hexagon, hexagon-2, none, pentagon, rounded, rounded-2xl, rounded-3xl, rounded-lg, rounded-md, rounded-sm, rounded-xl, square, squircle, star, star-2, triangle, triangle-2, triangle-3, triangle-4 |
| `AvatarSize` | `12` | `setAvatarSize` | — |
| `BackgroundColor` | `base-100` | `setBackgroundColor` | — |
| `RoundedBox` | `True` | `setRoundedBox` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5CheckBox
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `CheckBoxType` | `normal` | `setCheckBoxType` | legend, normal, left-label, right-label |
| `Legend` | `Options` | `setLegend` | — |
| `Label` | `CheckBox` | `setLabel` | — |
| `BackgroundColor` | `base-200` | `setBackgroundColor` | — |
| `Border` | `True` | `setBorder` | — |
| `BorderColor` | `base-300` | `setBorderColor` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5CheckBoxGroup
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `TypeOf` | `checkbox` | `setTypeOf` | checkbox, toggle |
| `Label` | `CheckBox Group` | `setLabel` | — |
| `RawOptions` | `b4a=b4a; b4j=b4j; b4i=b4i; b4r=b4r` | `setOptions` | — |
| `LabelPosition` | `right` | `setLabelPosition` | left, right |
| `BackgroundColor` | `base-200` | `setBackgroundColor` | — |
| `Border` | `True` | `setBorder` | — |
| `BorderColor` | `base-300` | `setBorderColor` | — |
| `RoundedBox` | `True` | `setRoundedBox` | — |
| `Width` | `full` | `setWidth` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=4; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Code
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `Caption` | `Source Code` | `setCaption` | — |
| `Language` | `vb` | `setLanguage` | css, html, js, vb, json |
| `CodeType` | `default` | `setCodeType` | card, default |
| `ButtonSize` | `md` | `setButtonSize` | lg, md, sm, xs, none |
| `FileName` | `code.bas` | `setFileName` | — |
| `Height` | `800px` | `setHeight` | — |
| `Width` | `full` | `setWidth` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Shadow` | `xl` | `setShadow` | 2xl, inner, lg, md, none, shadow, sm, xl |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Collapse
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `IconSize` | `32px` | `setIconSize` | — |
| `Title` | `Collapse` | `setTitle` | — |
| `TitleClass` | `font-semibold` | `setTitleClass` | — |
| `RawContent` | `Collapse Content` | `setContent` | — |
| `ContentBackgroundColor` | `base-100` | `setContentBackgroundColor` | — |
| `ContentTextSize` | `sm` | `setContentTextSize` | 2xl, 3xl, 4xl, 5xl, 6xl, 7xl, 8xl, 9xl, base, lg, md, none, sm, xl, xs |
| `RightIcon` | `arrow` | `setRightIcon` | arrow, plus |
| `BackgroundColor` | `base-100` | `setBackgroundColor` | — |
| `Border` | `True` | `setBorder` | — |
| `BorderColor` | `base-300` | `setBorderColor` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Column
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `Size` | `12` | `setSize` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `RawBorderColor` | `a=?; t=?; r=?; b=?; l=?; tl=?; tr=?; bl=?; br=?; x=?; y=?` | `setBorderColor` | — |
| `RawBorderStyle` | `a=?; t=?; r=?; b=?; l=?; tl=?; tr=?; bl=?; br=?; x=?; y=?` | `setBorderStyle` | — |
| `RawBorderWidth` | `a=?; t=?; r=?; b=?; l=?; tl=?; tr=?; bl=?; br=?; x=?; y=?` | `setBorderWidth` | — |
| `RawBorderRadius` | `a=?; t=?; r=?; b=?; l=?; tl=?; tr=?; bl=?; br=?; x=?; y=?` | `setBorderRadius` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=2; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Component
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `TagName` | `div` | `setTagName` | — |
| `Text` | `Component` | `setText` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Container
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `Container` | `True` | `setContainer` | — |
| `Visible` | `True` | `setVisible` | — |
| `GradientActive` | `false` | `setGradientActive` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `RawBorderColor` | `a=?; t=?; r=?; b=?; l=?; tl=?; tr=?; bl=?; br=?; x=?; y=?` | `setBorderColor` | — |
| `RawBorderStyle` | `a=?; t=?; r=?; b=?; l=?; tl=?; tr=?; bl=?; br=?; x=?; y=?` | `setBorderStyle` | — |
| `RawBorderWidth` | `a=?; t=?; r=?; b=?; l=?; tl=?; tr=?; bl=?; br=?; x=?; y=?` | `setBorderWidth` | — |
| `RawBorderRadius` | `a=?; t=?; r=?; b=?; l=?; tl=?; tr=?; bl=?; br=?; x=?; y=?` | `setBorderRadius` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5ContextMenu
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `Size` | `md` | `setSize` | lg, md, none, sm, xl, xs |
| `Width` | `56` | `setWidth` | — |
| `BackgroundColor` | `base-200` | `setBackgroundColor` | — |
| `IconHeight` | `16px` | `setIconHeight` | — |
| `IconWidth` | `16px` | `setIconWidth` | — |
| `ItemColor` | `primary` | `setItemColor` | — |
| `RoundedBox` | `True` | `setRoundedBox` | — |
| `Shadow` | `lg` | `setShadow` | 2xl, inner, lg, md, none, shadow, sm, xl |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Conversation
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `ConversationType` | `T` | `setConversationType` | T, V, D, I, A |
| `FontSize` | `14px` | `setFontSize` | — |
| `Incoming` | `True` | `setIncoming` | — |
| `SenderImage` | `./assets/mashy.jpg` | `setSenderImage` | — |
| `ImageSize` | `12` | `setImageSize` | — |
| `Visible` | `True` | `setVisible` | — |


### SDUI5CountDown
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `Value` | `5` | `setValue` | — |
| `Font` | `mono` | `setFont` | — |
| `Visible` | `True` | `setVisible` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5DatePickerTimeLine
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `InitialSelectedDate` | `2025-01-01` | `setInitialSelectedDate` | — |
| `DaysCount` | `31` | `setDaysCount` | — |
| `ItemWidth` | `80px` | `setItemWidth` | — |
| `ItemHeight` | `80px` | `setItemHeight` | — |
| `MonthColor` | `#000000` | `setMonthColor` | — |
| `MonthFontSize` | `11px` | `setMonthFontSize` | — |
| `MonthFontWeight` | `medium` | `setMonthFontWeight` | — |
| `DateColor` | `#000000` | `setDateColor` | — |
| `DateFontSize` | `24px` | `setDateFontSize` | — |
| `DateFontWeight` | `medium` | `setDateFontWeight` | — |
| `DayColor` | `#000000` | `setDayColor` | — |
| `DayFontSize` | `11px` | `setDayFontSize` | — |
| `DayFontWeight` | `medium` | `setDayFontWeight` | — |
| `SelectionColor` | `#30000000` | `setSelectionColor` | — |
| `DeActivatedColor` | `#666666` | `setDeActivatedColor` | accent, error, info, neutral, none, primary, secondary, success, warning |
| `Direction` | `horizontal` | `setDirection` | horizontal, vertical |
| `Height` | `content` | `setHeight` | — |
| `Width` | `full` | `setWidth` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Device
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `DeviceType` | `iphone-8` | `setDeviceType` | apple-watch-s8, apple-watch-ultra, galaxy-s8, google-pixel, google-pixel-2-xl, google-pixel-6-pro, homepod, imac, imac-pro, ipad-pro, ipad-pro-2017, iphone-14, iphone-14-pro, iphone-8, iphone-x, macbook, macbook-pro, macbook-pro-2018, pro-display-xdr, surface-book, surface-pro-2017, surface-studio, the-iphone |
| `Text` | `Text` | `setText` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Diff
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `DiffType` | `image` | `setDiffType` | image, text |
| `Height` | `80` | `setHeight` | — |
| `Width` | `80` | `setWidth` | — |
| `Image1` | `./assets/13.jpg` | `setImage1` | — |
| `Image2` | `./assets/13.jpg` | `setImage2` | — |
| `Text1` | `SITHASODAISY5` | `setText1` | — |
| `TextSize` | `9xl` | `setTextSize` | 2xl, 3xl, 4xl, 5xl, 6xl, 7xl, 8xl, 9xl, base, lg, md, none, sm, xl, xs |
| `Text1TextColor` | `primary-content` | `setText1TextColor` | — |
| `Text1BackgroundColor` | `primary` | `setText1BackgroundColor` | — |
| `Text2` | `SITHASODAISY5` | `setText2` | — |
| `Text2BackgroundColor` | `base-200` | `setText2BackgroundColor` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Divider
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `Text` | `Divider` | `setText` | — |
| `Direction` | `vertical` | `setDirection` | horizontal, vertical |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Dock
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Drawer
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `Overlay` | `True` | `setOverlay` | — |
| `BackgroundColor` | `base-100` | `setBackgroundColor` | — |
| `MinHeight` | `screen` | `setMinHeight` | — |
| `Width` | `80` | `setWidth` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5DrawerUser
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `AvatarShape` | `circle` | `setAvatarShape` | circle, decagon, diamond, heart, hexagon, hexagon-2, none, pentagon, square, squircle, star, star-2, triangle, triangle-2, triangle-3, triangle-4, rounded-2xl, rounded-3xl, rounded, rounded-lg, rounded-md, rounded-sm, rounded-xl |
| `AvatarSize` | `8` | `setAvatarSize` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5DropDown
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `Placement` | `bottom` | `setPlacement` | bottom, bottom-center, bottom-end, center, end, left, left-center, left-end, right, right-center, right-end, start, top, top-center, top-end |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5DropZone
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `Url` | `./assets/upload.php` | `setUrl` | — |
| `ParamName` | `upload` | `setParamName` | — |
| `AutoProcessQueue` | `True` | `setAutoProcessQueue` | — |
| `AddRemoveLinks` | `True` | `setAddRemoveLinks` | — |
| `Height` | `500px` | `setHeight` | — |
| `Width` | `500px` | `setWidth` | — |
| `MaxFilesize` | `2` | `setMaxFilesize` | — |
| `ParallelUploads` | `2` | `setParallelUploads` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5EasyMDE
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `Height` | `500px` | `setHeight` | — |
| `Width` | `100%` | `setWidth` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5EmojiMart
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `EmojiButtonSize` | `36` | `setEmojiButtonSize` | lg, md, none, sm, xl, xs |
| `EmojiButtonsRadius` | `100%` | `setEmojiButtonsRadius` | — |
| `EmojiSize` | `24` | `setEmojiSize` | lg, md, none, sm, xl, xs |
| `EmojiVersion` | `15` | `setEmojiVersion` | — |
| `Icons` | `auto` | `setIcons` | auto, outline, solid |
| `Locale` | `en` | `setLocale` | — |
| `MaxFrequentRows` | `4` | `setMaxFrequentRows` | — |
| `NavPosition` | `top` | `setNavPosition` | bottom, none, top |
| `NoResultsEmoji` | `cry` | `setNoResultsEmoji` | — |
| `PerLine` | `9` | `setPerLine` | — |
| `PreviewEmoji` | `point_up` | `setPreviewEmoji` | — |
| `PreviewPosition` | `bottom` | `setPreviewPosition` | bottom, none, top |
| `SearchPosition` | `sticky` | `setSearchPosition` | none, static, sticky |
| `SetOf` | `apple` | `setSetOf` | apple, facebook, google, native, twitter |
| `Skin` | `1, MinRange: 1, MaxRange: 6` | `setSkin` | — |
| `SkinTonePosition` | `preview` | `setSkinTonePosition` | none, preview, search |
| `Theme` | `auto` | `setTheme` | auto, dark, light |


### SDUI5FAIconPicker
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `DataUrl` | `./assets/icons.min.json` | `setDataUrl` | — |
| `Height` | `full` | `setHeight` | — |
| `Width` | `full` | `setWidth` | — |
| `BackgroundColor` | `base-200` | `setBackgroundColor` | — |
| `IconsPerPage` | `20` | `setIconsPerPage` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Fab
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `OnIcon` | `fas fa-times` | `setOnIcon` | — |
| `OffIcon` | `fas fa-plus` | `setOffIcon` | — |
| `ToastPlacement` | `bottom-end` | `setToastPlacement` | bottom-center, bottom-end, bottom-start, middle-center, middle-end, middle-start, top-center, top-end, top-start |
| `IconSize` | `2xl` | `setIconSize` | — |
| `Size` | `lg` | `setSize` | lg, md, none, sm, xl, xs |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5FieldSet
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `Legend` | `Legend` | `setLegend` | — |
| `LegendVisible` | `True` | `setLegendVisible` | — |
| `Label` | `Label` | `setLabel` | — |
| `LabelVisible` | `True` | `setLabelVisible` | — |
| `BackgroundColor` | `base-200` | `setBackgroundColor` | — |
| `Border` | `True` | `setBorder` | — |
| `BorderColor` | `base-300` | `setBorderColor` | — |
| `RoundedBox` | `True` | `setRoundedBox` | — |
| `Width` | `xs` | `setWidth` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=4; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5FileInput
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `InputType` | `normal` | `setInputType` | normal, legend, buttons, label-input, microphone, progress, camera, camcorder, legend-microphone, legend-progress, legend-camera, legend-camcorder |
| `Label` | `Please select a file` | `setLabel` | — |
| `Width` | `full` | `setWidth` | — |
| `BackgroundColor` | `base-200` | `setBackgroundColor` | — |
| `Border` | `True` | `setBorder` | — |
| `BorderColor` | `base-300` | `setBorderColor` | — |
| `ButtonSize` | `80px` | `setButtonSize` | — |
| `IconColor` | `#ffffff` | `setIconColor` | — |
| `IconSize` | `42px` | `setIconSize` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Filter
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `TypeOf` | `default` | `setTypeOf` | legend, default |
| `Label` | `CheckBox Group` | `setLabel` | — |
| `RawOptions` | `b4a=b4a; b4j=b4j; b4i=b4i; b4r=b4r` | `setOptions` | — |
| `Color` | `primary` | `setColor` | — |
| `ActiveColor` | `#00ff00` | `setActiveColor` | — |
| `Shape` | `full` | `setShape` | square, circle, none, rounded, 2xl, 3xl, full, lg, md, sm, xl, 0 |
| `BackgroundColor` | `base-200` | `setBackgroundColor` | — |
| `Border` | `True` | `setBorder` | — |
| `BorderColor` | `base-300` | `setBorderColor` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Footer
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `DirectionOnSmall` | `horizontal` | `setDirectionOnSmall` | horizontal, none, vertical |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `PositionStyle` | `sticky` | `setPositionStyle` | absolute, fixed, none, relative, static, sticky |
| `Position` | `t=?; b=0; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=4; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5FooterTitle
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `Text` | `Footer Title` | `setText` | — |
| `Visible` | `True` | `setVisible` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Form
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `AcceptCharset` | `utf-8` | `setAcceptCharset` | — |
| `Autocomplete` | `off` | `setAutocomplete` | off, on |
| `Enctype` | `application/x-www-form-urlencoded` | `setEnctype` | application/x-www-form-urlencoded, multipart/form-data, text/plain |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5FullCalendar
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `InitialDate` | `now` | `setInitialDate` | — |
| `InitialView` | `dayGridMonth` | `setInitialView` | dayGridMonth, dayGridWeek, listMonth, listWeek, timeGridDay, timeGridWeek, multiMonthYear |
| `Height` | `auto` | `setHeight` | — |
| `MonthText` | `month` | `setMonthText` | — |
| `DayText` | `day` | `setDayText` | — |
| `ToDayText` | `today` | `setToDayText` | — |
| `WeekText` | `week` | `setWeekText` | — |
| `AspectRatio` | `3` | `setAspectRatio` | — |
| `ButtonIcons` | `True` | `setButtonIcons` | — |
| `ContentHeight` | `auto` | `setContentHeight` | — |
| `DayMaxEvents` | `True` | `setDayMaxEvents` | — |
| `Droppable` | `True` | `setDroppable` | — |
| `Editable` | `True` | `setEditable` | — |
| `HeaderToolbarCenter` | `title` | `setHeaderToolbarCenter` | — |
| `HeaderToolbarLeft` | `prevYear;prev;next;nextYear today` | `setHeaderToolbarLeft` | — |
| `HeaderToolbarRight` | `dayGridMonth;timeGridWeek;timeGridDay;listMonth;multiMonthYear` | `setHeaderToolbarRight` | — |
| `HeaderToolbarVisible` | `True` | `setHeaderToolbarVisible` | — |
| `ListText` | `list` | `setListText` | — |
| `Locale` | `en` | `setLocale` | — |
| `NavLinks` | `True` | `setNavLinks` | — |
| `NowIndicator` | `True` | `setNowIndicator` | — |
| `ScrollTime` | `06:00:00` | `setScrollTime` | — |
| `ScrollTimeReset` | `True` | `setScrollTimeReset` | — |
| `SelectMirror` | `True` | `setSelectMirror` | — |
| `Selectable` | `True` | `setSelectable` | — |
| `SlotDuration` | `00:30:00` | `setSlotDuration` | — |
| `SlotMaxTime` | `24:00:00` | `setSlotMaxTime` | — |
| `SlotMinTime` | `00:00:00` | `setSlotMinTime` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5GenderChart
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `DataType` | `numbers` | `setDataType` | numbers, percentages |
| `FemaleLabel` | `Female` | `setFemaleLabel` | — |
| `FemaleValue` | `0` | `setFemaleValue` | — |
| `FemaleTarget` | `0` | `setFemaleTarget` | — |
| `FemaleColor` | `#FF1493` | `setFemaleColor` | — |
| `MaleLabel` | `Male` | `setMaleLabel` | — |
| `MaleValue` | `0` | `setMaleValue` | — |
| `MaleTarget` | `0` | `setMaleTarget` | — |
| `MaleColor` | `#0000FF` | `setMaleColor` | — |
| `Width` | `100%` | `setWidth` | — |
| `Height` | `400px` | `setHeight` | — |
| `Duration` | `5000` | `setDuration` | — |
| `Waves` | `True` | `setWaves` | — |
| `WaveSpeed` | `0.09` | `setWaveSpeed` | — |
| `Autoplay` | `True` | `setAutoplay` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5GoogleAdSense
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `AdFormat` | `auto` | `setAdFormat` | auto, horizontal, vertical, rectangle |
| `FullWidthResponsive` | `True` | `setFullWidthResponsive` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5GroupSelect
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `Label` | `Group Select` | `setLabel` | — |
| `GroupName` | `group1` | `setGroupName` | — |
| `RawOptions` | `b4a=b4a; b4i=b4i; b4j=b4j; b4r=b4r` | `setOptions` | — |
| `ChipColor` | `neutral` | `setChipColor` | — |
| `ActiveColor` | `#22c55e` | `setActiveColor` | — |
| `TextColor` | `#ffffff` | `setTextColor` | — |
| `Size` | `xs` | `setSize` | lg, md, none, sm, xl, xs |
| `BackgroundColor` | `base-200` | `setBackgroundColor` | — |
| `Border` | `True` | `setBorder` | — |
| `BorderColor` | `base-300` | `setBorderColor` | — |
| `Width` | `full` | `setWidth` | — |
| `RoundedBox` | `True` | `setRoundedBox` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=4; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Hero
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `ContentFlexDirection` | `flex-col` | `setContentFlexDirection` | flex-col, flex-col-reverse, flex-row, flex-row-reverse |
| `LgContentFlexDirection` | `flex-row` | `setLgContentFlexDirection` | flex-col, flex-col-reverse, flex-row, flex-row-reverse |
| `MinHeight` | `56` | `setMinHeight` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Hover3D
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `Width` | `100` | `setWidth` | — |
| `Rounded` | `2xl` | `setRounded` | 0, 2xl, 3xl, full, lg, md, none, rounded, sm, xl |
| `Shadow` | `2xl` | `setShadow` | 2xl, inner, lg, md, none, shadow, sm, xl |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5HoverGallery
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `TypeOf` | `figure` | `setTypeOf` | div, figure |
| `Height` | `300px` | `setHeight` | — |
| `Width` | `600px` | `setWidth` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Image
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `TypeOf` | `normal` | `setTypeOf` | legend, normal |
| `Src` | `./assets/mashy.jpg` | `setSrc` | — |
| `Alt` | `Image` | `setAlt` | — |
| `Height` | `12` | `setHeight` | — |
| `Width` | `12` | `setWidth` | — |
| `CenterFieldSet` | `True` | `setCenterFieldSet` | — |
| `Cover` | `True` | `setCover` | — |
| `Center` | `True` | `setCenter` | — |
| `NoRepeat` | `True` | `setNoRepeat` | — |
| `Mask` | `rounded` | `setMask` | circle, decagon, diamond, heart, hexagon, hexagon-2, none, pentagon, rounded, rounded-2xl, rounded-3xl, rounded-lg, rounded-md, rounded-sm, rounded-xl, square, squircle, star, star-2, triangle, triangle-2, triangle-3, triangle-4 |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Indicator
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `TypeOf` | `badge` | `setTypeOf` | badge, status, text |
| `Text` | `Text` | `setText` | — |
| `Position` | `top-start` | `setPosition` | bottom-center, middle-center, bottom-end, bottom-start, middle-end, middle-start, top-center, top-end, top-start |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |


### SDUI5InfoCard
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `InforType` | `1` | `setInforType` | 1, 2, 3, 4, 5, 6 |
| `Icon` | `fa-solid fa-user` | `setIcon` | — |
| `IconColor` | `#7cfc00` | `setIconColor` | — |
| `IconTextColor` | `#FFFFFF` | `setIconTextColor` | — |
| `Title` | `Employees` | `setTitle` | — |
| `Notes` | `Last 24 Hours` | `setNotes` | — |
| `StartFrom` | `0` | `setStartFrom` | — |
| `Value` | `1000` | `setValue` | — |
| `AnimateCounter` | `True` | `setAnimateCounter` | — |
| `Decimal` | `.` | `setDecimal` | — |
| `Duration` | `2` | `setDuration` | — |
| `DecimalPlaces` | `0` | `setDecimalPlaces` | — |
| `UseGrouping` | `True` | `setUseGrouping` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Visible` | `True` | `setVisible` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Join
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |


### SDUI5JsonEditor
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `Mode` | `view` | `setMode` | code, form, preview, text, tree, view |
| `Height` | `500px` | `setHeight` | — |
| `Width` | `500px` | `setWidth` | — |
| `ButtonSize` | `md` | `setButtonSize` | lg, md, sm, xs, none |
| `HasUpload` | `True` | `setHasUpload` | — |
| `HasSave` | `True` | `setHasSave` | — |
| `HasDownload` | `True` | `setHasDownload` | — |
| `HasBack` | `True` | `setHasBack` | — |
| `Shadow` | `lg` | `setShadow` | 2xl, inner, lg, md, none, shadow, sm, xl |
| `Rounded` | `lg` | `setRounded` | square, circle, none, rounded, 2xl, 3xl, full, lg, md, sm, xl, 0 |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5JsonTree
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `ArrowColor` | `#475872` | `setArrowColor` | — |
| `FontSize` | `12` | `setFontSize` | — |
| `Height` | `500px` | `setHeight` | — |
| `LineHeight` | `18` | `setLineHeight` | — |
| `NodeBackgroundColor` | `#f6f8fa` | `setNodeBackgroundColor` | — |
| `NodeBorderColor` | `#475872` | `setNodeBorderColor` | — |
| `Padding` | `10` | `setPadding` | — |
| `ValueColor` | `#008000` | `setValueColor` | — |
| `Width` | `500px` | `setWidth` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5KanBan
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `DragBoards` | `true` | `setDragBoards` | — |
| `DragItems` | `true` | `setDragItems` | — |
| `Gutter` | `15px` | `setGutter` | — |
| `WidthBoard` | `250px` | `setWidthBoard` | — |
| `ResponsivePercentage` | `true` | `setResponsivePercentage` | — |
| `Visible` | `True` | `setVisible` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Kbd
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `Text` | `A` | `setText` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Label
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `InputType` | `input` | `setInputType` | select, input, email, password, tel, url, number, file |
| `Label` | `Label` | `setLabel` | — |
| `RawOptions` | `b4a=b4a; b4j=b4j; b4i=b4i; b4r=b4r` | `setOptions` | — |
| `Width` | `full` | `setWidth` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Leaflet
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `TypeOf` | `normal` | `setTypeOf` | legend, normal |
| `LayerType` | `openstreetmap` | `setLayerType` | openstreetmap, google-roadmap, google-satellite, google-hybrid, google-terrain, other |
| `Height` | `500px` | `setHeight` | — |
| `Width` | `500px` | `setWidth` | — |
| `Lat` | `0` | `setLat` | — |
| `Lng` | `0` | `setLng` | — |
| `MaxZoom` | `19` | `setMaxZoom` | — |
| `Zoom` | `5` | `setZoom` | — |
| `CenterFieldSet` | `True` | `setCenterFieldSet` | — |
| `CurrentCaption` | `Current Location` | `setCurrentCaption` | — |
| `CurrentColor` | `primary` | `setCurrentColor` | — |
| `CurrentTextColor` | `white` | `setCurrentTextColor` | — |
| `StartTrackingCaption` | `Start Tracking` | `setStartTrackingCaption` | — |
| `StartTrackingColor` | `success` | `setStartTrackingColor` | — |
| `StartTrackingTextColor` | `white` | `setStartTrackingTextColor` | — |
| `StopTrackingCaption` | `Stop Tracking` | `setStopTrackingCaption` | — |
| `StopTrackingColor` | `error` | `setStopTrackingColor` | — |
| `StopTrackingTextColor` | `white` | `setStopTrackingTextColor` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Link
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `Text` | `Link` | `setText` | — |
| `Href` | `#` | `setHref` | — |
| `IconSize` | `24px` | `setIconSize` | — |
| `IconPosition` | `left` | `setIconPosition` | left, right |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5List
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `BackgroundColor` | `base-100` | `setBackgroundColor` | — |
| `RoundedBox` | `True` | `setRoundedBox` | — |
| `Shadow` | `md` | `setShadow` | 2xl, inner, lg, md, none, shadow, sm, xl |
| `Height` | `full` | `setHeight` | — |
| `Width` | `full` | `setWidth` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5ListItem
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `Text` | `Text` | `setText` | — |
| `CursorPointer` | `True` | `setCursorPointer` | — |
| `ListRow` | `True` | `setListRow` | — |
| `Opacity` | `100, MinRange: 0, MaxRange: 100` | `setOpacity` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Loading
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `TypeOf` | `spinner` | `setTypeOf` | ball, bars, dots, infinity, ring, spinner |
| `Size` | `md` | `setSize` | lg, md, none, sm, xl, xs |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5LottiePlayer
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `AutoPlay` | `True` | `setAutoPlay` | — |
| `Height` | `300px` | `setHeight` | — |
| `Width` | `300px` | `setWidth` | — |
| `Mode` | `normal` | `setMode` | bounce, normal, bounce-reverse, reverse |
| `Speed` | `1` | `setSpeed` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5MegaMenu
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Menu
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `BackgroundColor` | `base-200` | `setBackgroundColor` | — |
| `Direction` | `vertical` | `setDirection` | horizontal, vertical |
| `HasIcon` | `True` | `setHasIcon` | — |
| `HasAvatar` | `True` | `setHasAvatar` | — |
| `HasBadge` | `True` | `setHasBadge` | — |
| `NoWrap` | `True` | `setNoWrap` | — |
| `OverflowYAuto` | `True` | `setOverflowYAuto` | — |
| `CheckedColor` | `success` | `setCheckedColor` | — |
| `Width` | `56` | `setWidth` | — |
| `RoundedBox` | `True` | `setRoundedBox` | — |
| `RoundedItems` | `True` | `setRoundedItems` | — |
| `MinHeight` | `full` | `setMinHeight` | — |
| `DropdownPlacement` | `bottom` | `setDropdownPlacement` | bottom, bottom-center, bottom-end, center, end, left, left-center, left-end, right, right-center, right-end, start, top, top-center, top-end, none |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5MenuItem
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `MenuName` | `menu1` | `setMenuName` | — |
| `ItemType` | `normal` | `setItemType` | icon, icon-text, normal, title, collapse-item, avatar-text |
| `Text` | `Text` | `setText` | — |
| `HasIcon` | `True` | `setHasIcon` | — |
| `HasAvatar` | `True` | `setHasAvatar` | — |
| `HasBadge` | `True` | `setHasBadge` | — |
| `CheckedColor` | `success` | `setCheckedColor` | — |
| `AvatarSize` | `16` | `setAvatarSize` | — |
| `AvatarShape` | `circle` | `setAvatarShape` | circle, decagon, diamond, heart, hexagon, hexagon-2, none, pentagon, square, squircle, star, star-2, triangle, triangle-2, triangle-3, triangle-4, rounded-2xl, rounded-3xl, rounded, rounded-lg, rounded-md, rounded-sm, rounded-xl |
| `IconSize` | `20px` | `setIconSize` | — |
| `BadgeColor` | `secondary` | `setBadgeColor` | — |
| `BadgeSize` | `xs` | `setBadgeSize` | lg, md, none, sm, xl, xs |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Modal
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `Size` | `lg` | `setSize` | lg, md, none, sm, xl, xs |
| `Title` | `Modal Dialog` | `setTitle` | — |
| `TitleVisible` | `True` | `setTitleVisible` | — |
| `IconSize` | `32px` | `setIconSize` | — |
| `Closable` | `True` | `setClosable` | — |
| `Backdrop` | `True` | `setBackdrop` | — |
| `ActionsVisible` | `True` | `setActionsVisible` | — |
| `ActionType` | `yes-no` | `setActionType` | cancel, no, yes, yes-no, yes-no-cancel, ok-cancel, retry-cancel, abort-retry-ignore |
| `BottonsWidth` | `22` | `setBottonsWidth` | — |
| `ButtonsShadow` | `md` | `setButtonsShadow` | 2xl, inner, lg, md, none, shadow, sm, xl |
| `ButtonsRounded` | `md` | `setButtonsRounded` | none, rounded, 2xl, 3xl, full, lg, md, sm, xl, 0 |
| `YesCaption` | `Yes` | `setYesCaption` | — |
| `YesTextColor` | `#ffffff` | `setYesTextColor` | — |
| `YesColor` | `success` | `setYesColor` | — |
| `YesVisible` | `True` | `setYesVisible` | — |
| `NoCaption` | `No` | `setNoCaption` | — |
| `NoTextColor` | `#ffffff` | `setNoTextColor` | — |
| `NoColor` | `error` | `setNoColor` | — |
| `NoVisible` | `True` | `setNoVisible` | — |
| `CancelCaption` | `Cancel` | `setCancelCaption` | — |
| `CancelTextColor` | `#ffffff` | `setCancelTextColor` | — |
| `CancelColor` | `gray` | `setCancelColor` | — |
| `CancelVisible` | `True` | `setCancelVisible` | — |
| `Height` | `fit` | `setHeight` | — |
| `Width` | `700px` | `setWidth` | — |
| `BackgroundColor` | `base-100` | `setBackgroundColor` | — |
| `Border` | `True` | `setBorder` | — |
| `Shadow` | `sm` | `setShadow` | 2xl, inner, lg, md, none, shadow, sm, xl |
| `MoveFrom` | `middle` | `setMoveFrom` | bottom, end, middle, start, top |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5MultiSelect
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `InputType` | `normal` | `setInputType` | normal, legend, buttons, label-input |
| `Label` | `Select` | `setLabel` | — |
| `Placeholder` | `Select an element` | `setPlaceholder` | — |
| `RawOptions` | `b4a=b4a; b4j=b4j; b4i=b4i; b4r=b4r` | `setOptions` | — |
| `Size` | `md` | `setSize` | lg, md, none, sm, xl, xs |
| `Width` | `full` | `setWidth` | — |
| `Delimiter` | `;` | `setDelimiter` | — |
| `MaxSelections` | `0, MinRange: 0, MaxRange: 100` | `setMaxSelections` | — |
| `VirtualScrollThreshold` | `50` | `setVirtualScrollThreshold` | — |
| `BackgroundColor` | `base-200` | `setBackgroundColor` | — |
| `Border` | `True` | `setBorder` | — |
| `BorderColor` | `base-300` | `setBorderColor` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5NavBar
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `BackLabel` | `Back` | `setBackLabel` | — |
| `Sticky` | `True` | `setSticky` | — |
| `Top` | `0` | `setTop` | — |
| `ZIndex` | `30` | `setZIndex` | — |
| `HasBurger` | `True` | `setHasBurger` | — |
| `LogoImage` | `./assets/mashy.jpg` | `setLogoImage` | — |
| `LogoWidth` | `10` | `setLogoWidth` | — |
| `LogoHeight` | `10` | `setLogoHeight` | — |
| `Title` | `NavBar` | `setTitle` | — |
| `TitlePosition` | `left` | `setTitlePosition` | center, left, right |
| `BackgroundColor` | `base-100` | `setBackgroundColor` | — |
| `SearchSize` | `md` | `setSearchSize` | lg, md, sm, xs, none |
| `SearchWidth` | `300px` | `setSearchWidth` | — |
| `ButtonSize` | `md` | `setButtonSize` | lg, md, sm, xs, none |
| `Height` | `16` | `setHeight` | — |
| `Shadow` | `sm` | `setShadow` | 2xl, inner, lg, md, none, shadow, sm, xl |
| `GradientActive` | `false` | `setGradientActive` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5NoUISlider
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `SliderType` | `default` | `setSliderType` | default, legend |
| `Label` | `NoUISlider` | `setLabel` | — |
| `BackgroundColor` | `base-200` | `setBackgroundColor` | — |
| `Border` | `True` | `setBorder` | — |
| `BorderColor` | `base-300` | `setBorderColor` | — |
| `RoundedBox` | `True` | `setRoundedBox` | — |
| `StartValues` | `20,80` | `setStartValues` | — |
| `RangeMin` | `0` | `setRangeMin` | — |
| `RangeMax` | `100` | `setRangeMax` | — |
| `StepValue` | `1` | `setStepValue` | — |
| `Connect` | `true` | `setConnect` | — |
| `Margin` | `0` | `setMargin` | — |
| `Limit` | `0` | `setLimit` | — |
| `FormatterDecimals` | `0` | `setFormatterDecimals` | — |
| `FormatterMark` | `.` | `setFormatterMark` | — |
| `Color` | `primary` | `setColor` | accent, error, info, neutral, none, primary, secondary, success, warning |
| `Size` | `md` | `setSize` | xs, sm, md, lg, xl, none |
| `Width` | `full` | `setWidth` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=4; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5OTP
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `Value` | `otp` | `setValue` | — |
| `MaxLen` | `6, MinRange: 3, MaxRange: 10` | `setMaxLen` | — |
| `TypeOf` | `text` | `setTypeOf` | number, password, text |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5OfficeRibbon
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `FileMenuText` | `File` | `setFileMenuText` | — |
| `FileMenuVisible` | `True` | `setFileMenuVisible` | — |
| `ActiveLayout` | `Simplified` | `setActiveLayout` | Classic, Simplified |
| `SelectedTab` | `0` | `setSelectedTab` | — |
| `Width` | `100%` | `setWidth` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |


### SDUI5PDFViewer
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `Height` | `100%` | `setHeight` | — |
| `Width` | `100%` | `setWidth` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Page
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `ParentID` | `pageview` | `setParentID` | — |
| `Active` | `True` | `setActive` | — |
| `Title` | `My SDUIPage` | `setTitle` | — |
| `Icon` | `fa-solid fa-swatchbook` | `setIcon` | — |
| `Color` | `#000000` | `setColor` | — |
| `RawDescription` | `My SDUIPage` | `setDescription` | — |
| `BackgroundColor` | `base-100` | `setBackgroundColor` | — |
| `ResizePageView` | `True` | `setResizePageView` | — |
| `Container` | `True` | `setContainer` | — |
| `MxAuto` | `True` | `setMxAuto` | — |
| `Flex` | `True` | `setFlex` | — |
| `FlexWrap` | `True` | `setFlexWrap` | — |
| `DeviceGridCols` | `xs=?; sm=?; md=?; lg=?; xl=?` | `setDeviceGridCols` | — |
| `Visible` | `True` | `setVisible` | — |
| `GradientActive` | `false` | `setGradientActive` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Panel
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `RawBorderColor` | `a=?; t=?; r=?; b=?; l=?; tl=?; tr=?; bl=?; br=?; x=?; y=?` | `setBorderColor` | — |
| `RawBorderStyle` | `a=?; t=?; r=?; b=?; l=?; tl=?; tr=?; bl=?; br=?; x=?; y=?` | `setBorderStyle` | — |
| `RawBorderWidth` | `a=?; t=?; r=?; b=?; l=?; tl=?; tr=?; bl=?; br=?; x=?; y=?` | `setBorderWidth` | — |
| `RawBorderRadius` | `a=?; t=?; r=?; b=?; l=?; tl=?; tr=?; bl=?; br=?; x=?; y=?` | `setBorderRadius` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Phone
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `Artboard` | `0, MinRange: 0, MaxRange: 6` | `setArtboard` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Pivot
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `Toolbar` | `True` | `setToolbar` | — |
| `Height` | `600` | `setHeight` | — |
| `Width` | `100%` | `setWidth` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Preferences
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `Title` | `Property Bag` | `setTitle` | — |
| `Card` | `True` | `setCard` | — |
| `CardBorder` | `True` | `setCardBorder` | — |
| `HasSearch` | `True` | `setHasSearch` | — |
| `HasActions` | `True` | `setHasActions` | — |
| `SearchVisible` | `True` | `setSearchVisible` | — |
| `SearchSize` | `sm` | `setSearchSize` | lg, md, none, sm, xl, xs |
| `SearchWidth` | `300px` | `setSearchWidth` | — |
| `ButtonSize` | `sm` | `setButtonSize` | lg, md, none, sm, xs |
| `ComponentSize` | `sm` | `setComponentSize` | lg, md, none, sm, xl, xs |
| `PropertyPadding` | `py-1` | `setPropertyPadding` | — |
| `TooltipPosition` | `right` | `setTooltipPosition` | bottom, left, right, top |
| `TopActionsVisible` | `True` | `setTopActionsVisible` | — |
| `WrapActions` | `True` | `setWrapActions` | — |
| `ActionsVisible` | `True` | `setActionsVisible` | — |
| `ActionType` | `yes-no` | `setActionType` | cancel, no, yes, yes-no, yes-no-cancel |
| `YesVisible` | `True` | `setYesVisible` | — |
| `NoVisible` | `True` | `setNoVisible` | — |
| `CancelVisible` | `True` | `setCancelVisible` | — |
| `BottonsWidth` | `22` | `setBottonsWidth` | — |
| `ButtonsShadow` | `md` | `setButtonsShadow` | 2xl, inner, lg, md, none, shadow, sm, xl |
| `ButtonsRounded` | `md` | `setButtonsRounded` | none, rounded, 2xl, 3xl, full, lg, md, sm, xl, 0 |
| `YesCaption` | `Yes` | `setYesCaption` | — |
| `YesColor` | `success` | `setYesColor` | — |
| `YesTextColor` | `#ffffff` | `setYesTextColor` | — |
| `NoCaption` | `No` | `setNoCaption` | — |
| `NoColor` | `error` | `setNoColor` | — |
| `NoTextColor` | `#ffffff` | `setNoTextColor` | — |
| `CancelCaption` | `Cancel` | `setCancelCaption` | — |
| `CancelColor` | `gray` | `setCancelColor` | — |
| `CancelTextColor` | `#ffffff` | `setCancelTextColor` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Progress
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `ProgressType` | `normal` | `setProgressType` | legend, normal, tooltip, normal-text |
| `Label` | `Range` | `setLabel` | — |
| `Width` | `full` | `setWidth` | — |
| `Value` | `0, MinRange: 0, MaxRange: 100` | `setValue` | — |
| `TextColor` | `#ffffff` | `setTextColor` | — |
| `TextSize` | `xs` | `setTextSize` | 2xl, 3xl, 4xl, 5xl, 6xl, 7xl, 8xl, 9xl, base, lg, md, none, sm, xl, xs |
| `Size` | `md` | `setSize` | lg, md, none, sm, xl, xs |
| `MinValue` | `0, MinRange: 0, MaxRange: 100` | `setMinValue` | — |
| `StepValue` | `1, MinRange: 0, MaxRange: 100` | `setStepValue` | — |
| `MaxValue` | `100, MinRange: 0, MaxRange: 100` | `setMaxValue` | — |
| `BackgroundColor` | `base-200` | `setBackgroundColor` | — |
| `Border` | `True` | `setBorder` | — |
| `BorderColor` | `base-300` | `setBorderColor` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5QRCode
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `TypeOf` | `normal` | `setTypeOf` | legend, normal |
| `Text` | `SithasoDaisy5` | `setText` | — |
| `ColorDark` | `#000000` | `setColorDark` | — |
| `ColorLight` | `#ffffff` | `setColorLight` | — |
| `CorrectLevel` | `H` | `setCorrectLevel` | H, L, M, Q |
| `Size` | `200` | `setSize` | 100, 200, 300, 400, 500, 600, 700 |
| `CenterFieldSet` | `True` | `setCenterFieldSet` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5QuillEditor
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `Height` | `600px` | `setHeight` | — |
| `Width` | `100%` | `setWidth` | — |
| `MaxStack` | `1000` | `setMaxStack` | — |
| `Placeholder` | `Start typing...` | `setPlaceholder` | — |
| `Visible` | `True` | `setVisible` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5RadialProgress
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `Value` | `10` | `setValue` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Radio
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `RadioType` | `normal` | `setRadioType` | legend, normal, left-label, right-label |
| `Legend` | `Toggle` | `setLegend` | — |
| `Label` | `Radio` | `setLabel` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5RadioGroup
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `Label` | `Radio Group` | `setLabel` | — |
| `RawOptions` | `b4a=b4a; b4j=b4j; b4i=b4i; b4r=b4r` | `setOptions` | — |
| `LabelPosition` | `right` | `setLabelPosition` | left, right |
| `BackgroundColor` | `base-200` | `setBackgroundColor` | — |
| `Border` | `True` | `setBorder` | — |
| `BorderColor` | `base-300` | `setBorderColor` | — |
| `RoundedBox` | `True` | `setRoundedBox` | — |
| `Width` | `full` | `setWidth` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=4; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Range
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `RangeType` | `normal` | `setRangeType` | legend, normal, tooltip |
| `Label` | `Range` | `setLabel` | — |
| `Value` | `10` | `setValue` | — |
| `MinValue` | `0` | `setMinValue` | — |
| `StepValue` | `1` | `setStepValue` | — |
| `MaxValue` | `100` | `setMaxValue` | — |
| `Width` | `full` | `setWidth` | — |
| `BackgroundColor` | `base-200` | `setBackgroundColor` | — |
| `Border` | `True` | `setBorder` | — |
| `BorderColor` | `base-300` | `setBorderColor` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Rating
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `InputType` | `normal` | `setInputType` | normal, legend |
| `Label` | `Rating` | `setLabel` | — |
| `Mask` | `star` | `setMask` | circle, decagon, diamond, heart, hexagon, hexagon-2, pentagon, rounded, rounded-2xl, rounded-3xl, rounded-lg, rounded-md, rounded-sm, rounded-xl, square, squircle, star, star-2, triangle, triangle-2, triangle-3, triangle-4 |
| `Color` | `primary` | `setColor` | accent, error, info, neutral, primary, secondary, success, warning, none |
| `Size` | `md` | `setSize` | lg, md, sm, xl, xs |
| `Count` | `5, MinRange: 0, MaxRange: 10` | `setCount` | — |
| `Value` | `2` | `setValue` | — |
| `FirstHidden` | `True` | `setFirstHidden` | — |
| `Gap` | `2` | `setGap` | — |
| `BackgroundColor` | `base-200` | `setBackgroundColor` | — |
| `Border` | `True` | `setBorder` | — |
| `BorderColor` | `base-300` | `setBorderColor` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Row
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `GridCols` | `12` | `setGridCols` | — |
| `Gap` | `2` | `setGap` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `RawBorderColor` | `a=?; t=?; r=?; b=?; l=?; tl=?; tr=?; bl=?; br=?; x=?; y=?` | `setBorderColor` | — |
| `RawBorderStyle` | `a=?; t=?; r=?; b=?; l=?; tl=?; tr=?; bl=?; br=?; x=?; y=?` | `setBorderStyle` | — |
| `RawBorderWidth` | `a=?; t=?; r=?; b=?; l=?; tl=?; tr=?; bl=?; br=?; x=?; y=?` | `setBorderWidth` | — |
| `RawBorderRadius` | `a=?; t=?; r=?; b=?; l=?; tl=?; tr=?; bl=?; br=?; x=?; y=?` | `setBorderRadius` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Segment
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `Size` | `md` | `setSize` | lg, md, none, sm, xl, xs |
| `Height` | `fit` | `setHeight` | — |
| `Width` | `fit` | `setWidth` | — |
| `RawOptions` | `btn1=Button 1; btn2=Button 2; btn3=Button 3` | `setOptions` | — |
| `IconSize` | `20px` | `setIconSize` | — |
| `BadgeSize` | `md` | `setBadgeSize` | lg, md, none, sm, xl, xs |
| `ActiveColor` | `#0000ff` | `setActiveColor` | — |
| `ActiveTextColor` | `#ffffff` | `setActiveTextColor` | — |
| `OptionWidth` | `32` | `setOptionWidth` | — |
| `Active` | `btn1` | `setActive` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Select
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `InputType` | `normal` | `setInputType` | normal, legend, buttons, label-input, buttons-floating |
| `Label` | `Select` | `setLabel` | — |
| `Placeholder` | `Select an element` | `setPlaceholder` | — |
| `RawOptions` | `b4a=b4a; b4j=b4j; b4i=b4i; b4r=b4r` | `setOptions` | — |
| `AllowBlank` | `True` | `setAllowBlank` | — |
| `Size` | `md` | `setSize` | lg, md, none, sm, xl, xs |
| `Width` | `full` | `setWidth` | — |
| `BackgroundColor` | `base-200` | `setBackgroundColor` | — |
| `Border` | `True` | `setBorder` | — |
| `BorderColor` | `base-300` | `setBorderColor` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5SignaturePad
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `Caption` | `Signature` | `setCaption` | — |
| `ButtonCaption` | `Clear` | `setButtonCaption` | — |
| `ButtonColor` | `neutral` | `setButtonColor` | accent, error, info, neutral, none, primary, secondary, success, warning |
| `SaveCaption` | `Save` | `setSaveCaption` | — |
| `SaveColor` | `success` | `setSaveColor` | accent, error, info, neutral, none, primary, secondary, success, warning |
| `ErrorMessage` | `The signature is required` | `setErrorMessage` | — |
| `Hint` | `Please sign within the box area` | `setHint` | — |
| `DotSize` | `0` | `setDotSize` | — |
| `Height` | `200` | `setHeight` | — |
| `Width` | `400` | `setWidth` | — |
| `ImageType` | `jpeg` | `setImageType` | jpeg, png, svg |
| `BackgroundColor` | `white` | `setBackgroundColor` | — |
| `MaxWidth` | `2.5` | `setMaxWidth` | — |
| `MinDistance` | `5` | `setMinDistance` | — |
| `MinWidth` | `0.5` | `setMinWidth` | — |
| `PenColor` | `black` | `setPenColor` | — |
| `Throttle` | `16` | `setThrottle` | — |
| `VelocityFilterWeight` | `0.7` | `setVelocityFilterWeight` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Skeleton
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `Height` | `12` | `setHeight` | — |
| `Width` | `12` | `setWidth` | — |
| `Visible` | `True` | `setVisible` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Slider
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `Orientation` | `horizontal` | `setOrientation` | horizontal, vertical |
| `ShowIndicators` | `True` | `setShowIndicators` | — |
| `Autoplay` | `True` | `setAutoplay` | — |
| `AutoplayInterval` | `3000` | `setAutoplayInterval` | — |
| `AllowNext` | `True` | `setAllowNext` | — |
| `AllowBack` | `True` | `setAllowBack` | — |
| `Height` | `500px` | `setHeight` | — |
| `Width` | `900px` | `setWidth` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5SliderItem
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `TypeOf` | `image` | `setTypeOf` | custom, image |
| `Image` | `./assets/mashy.jpg` | `setImage` | — |
| `ImageHeight` | `full` | `setImageHeight` | — |
| `ImageWidth` | `full` | `setImageWidth` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5SpeedDial
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `TypeOf` | `icon` | `setTypeOf` | icon, text |
| `TextColor` | `#ffffff` | `setTextColor` | — |
| `Size` | `lg` | `setSize` | lg, md, none, sm, xl, xs |
| `Icon` | `./assets/plus-solid.svg` | `setIcon` | — |
| `IconSize` | `60%` | `setIconSize` | — |
| `MainButtonTextColor` | `#ffffff` | `setMainButtonTextColor` | — |
| `ChildSize` | `md` | `setChildSize` | lg, md, none, sm, xl, xs |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Stack
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `Alignment` | `bottom` | `setAlignment` | bottom, end, start, top |
| `Height` | `48` | `setHeight` | — |
| `Width` | `48` | `setWidth` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Stat
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `BorderColor` | `base-300` | `setBorderColor` | — |
| `BackgroundColor` | `base-100` | `setBackgroundColor` | — |
| `Shadow` | `shadow` | `setShadow` | 2xl, inner, lg, md, none, shadow, sm, xl |
| `Direction` | `vertical` | `setDirection` | horizontal, vertical |
| `MDDirection` | `horizontal` | `setMDDirection` | horizontal, vertical, none |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5StatItem
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `AvatarShape` | `circle` | `setAvatarShape` | circle, decagon, diamond, heart, hexagon, hexagon-2, none, pentagon, square, squircle, star, star-2, triangle, triangle-2, triangle-3, triangle-4, rounded-2xl, rounded-3xl, rounded, rounded-lg, rounded-md, rounded-sm, rounded-xl |
| `Title` | `Total Page Views` | `setTitle` | — |
| `Value` | `89 400` | `setValue` | — |
| `Desc` | `21% more than last month` | `setDesc` | — |
| `IconHeight` | `32px` | `setIconHeight` | — |
| `IconWidth` | `32px` | `setIconWidth` | — |
| `RadialValue` | `60` | `setRadialValue` | — |
| `RadialSize` | `3rem` | `setRadialSize` | — |
| `RadialThickness` | `5px` | `setRadialThickness` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Status
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `IndicatorPosition` | `top-start` | `setIndicatorPosition` | bottom-center, middle-center, bottom-end, bottom-start, middle-end, middle-start, top-center, top-end, top-start |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Steps
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `Direction` | `horizontal` | `setDirection` | horizontal, vertical |
| `TextSize` | `sm` | `setTextSize` | 2xl, 3xl, 4xl, 5xl, 6xl, 7xl, 8xl, 9xl, base, lg, md, none, sm, xl, xs |
| `RawSteps` | `Register;Choose Plan;Purchase;Receive Product` | `setSteps` | — |
| `ActiveStep` | `1` | `setActiveStep` | — |
| `StepsColor` | `primary` | `setStepsColor` | accent, error, info, neutral, none, primary, secondary, success, warning |
| `Width` | `full` | `setWidth` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5StepsItem
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `Text` | `Text` | `setText` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Svg
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `Replace` | `True` | `setReplace` | — |
| `Fit` | `True` | `setFit` | — |
| `FillColor` | `currentColor` | `setFillColor` | — |
| `CacheDisabled` | `True` | `setCacheDisabled` | — |
| `Visible` | `True` | `setVisible` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Swap
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `SwapType` | `text` | `setSwapType` | icon, text, svg |
| `TypeOf` | `flip` | `setTypeOf` | flip, rotate |
| `Height` | `32px` | `setHeight` | — |
| `Width` | `32px` | `setWidth` | — |
| `OnText` | `ON` | `setOnText` | — |
| `OffText` | `OFF` | `setOffText` | — |
| `IndeterminateText` | `NA` | `setIndeterminateText` | — |
| `TextSize` | `9xl` | `setTextSize` | 2xl, 3xl, 4xl, 5xl, 6xl, 7xl, 8xl, 9xl, base, lg, md, none, sm, xl, xs |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Swiper
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `PaginationType` | `bullets` | `setPaginationType` | bullets, fraction, progressbar |
| `SlidesPerView` | `1` | `setSlidesPerView` | — |
| `SpaceBetween` | `0` | `setSpaceBetween` | — |
| `Direction` | `horizontal` | `setDirection` | horizontal, vertical |
| `Effect` | `slide` | `setEffect` | slide, fade, cube, coverflow, flip, creative, cards |
| `HasPagination` | `True` | `setHasPagination` | — |
| `Height` | `300px` | `setHeight` | — |
| `Width` | `100%` | `setWidth` | — |
| `Speed` | `300` | `setSpeed` | — |
| `Init` | `True` | `setInit` | — |
| `InitialSlide` | `0` | `setInitialSlide` | — |
| `UpdateOnWindowResize` | `True` | `setUpdateOnWindowResize` | — |
| `AutoPlayDelay` | `3000` | `setAutoPlayDelay` | — |
| `AutoPlayDisableOnInteraction` | `True` | `setAutoPlayDisableOnInteraction` | — |
| `AutoPlayWaitForTransition` | `True` | `setAutoPlayWaitForTransition` | — |
| `GridFill` | `column` | `setGridFill` | column, row |
| `GridRows` | `1` | `setGridRows` | — |
| `CardEffectPerSlideOffset` | `8` | `setCardEffectPerSlideOffset` | — |
| `CardEffectPerSlideRotate` | `2` | `setCardEffectPerSlideRotate` | — |
| `CardEffectRotate` | `True` | `setCardEffectRotate` | — |
| `CardEffectSlideShadows` | `True` | `setCardEffectSlideShadows` | — |
| `CoverFlowDepth` | `100` | `setCoverFlowDepth` | — |
| `CoverFlowModifier` | `1` | `setCoverFlowModifier` | — |
| `CoverFlowRotate` | `50` | `setCoverFlowRotate` | — |
| `CoverFlowScale` | `1` | `setCoverFlowScale` | — |
| `CoverFlowSlideShadows` | `True` | `setCoverFlowSlideShadows` | — |
| `CoverFlowStretch` | `0` | `setCoverFlowStretch` | — |
| `CubeEffectShadow` | `True` | `setCubeEffectShadow` | — |
| `CubeEffectShadowOffset` | `20` | `setCubeEffectShadowOffset` | — |
| `CubeEffectShadowScale` | `0.94` | `setCubeEffectShadowScale` | — |
| `CubeEffectSlideShadows` | `True` | `setCubeEffectSlideShadows` | — |
| `RawSlideImageStyle` | `width=auto;max-width=100%;height=auto;max-height=100%;object-fit=cover` | `setSlideImageStyle` | — |
| `RawSlideStyle` | `display=flex;position=relative;flex-direction=column;flex-shrink=0;align-items=center;justify-content=center;width=100%;height=100%;font-size=18px;text-align=center;box-sizing=border-box` | `setSlideStyle` | — |
| `Visible` | `True` | `setVisible` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |


### SDUI5SwiperSlide
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `Image` | `./assets/600by600.jpg` | `setImage` | — |
| `ImageCover` | `True` | `setImageCover` | — |
| `Visible` | `True` | `setVisible` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Table
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `Title` | `Table` | `setTitle` | — |
| `TitleVisible` | `True` | `setTitleVisible` | — |
| `IconSize` | `32px` | `setIconSize` | — |
| `ExcelTitle` | `Table` | `setExcelTitle` | — |
| `PageSize` | `a4` | `setPageSize` | a0, a1, a10, a10, a2, a3, a4, a5, a6, a7, a8, a9, b0, b1, b10, b10, b2, b3, b4, b5, b6, b7, b8, b9, c0, c1, c10, c10, c2, c3, c4, c5, c6, c7, c8, c9, credit-card, dl, government-letter, junior-legal, ledger, legal, letter, tabloid |
| `FontSize` | `11` | `setFontSize` | — |
| `Unit` | `pt` | `setUnit` | cm, in, m, mm, pt, px |
| `Orientation` | `landscape` | `setOrientation` | landscape, potrait |
| `PdfTheme` | `striped` | `setPdfTheme` | css, grid, none, plain, striped |
| `ItemsPerPage` | `10` | `setItemsPerPage` | — |
| `TableSize` | `md` | `setTableSize` | lg, md, sm, xs, none, xl |
| `Pagination` | `True` | `setPagination` | — |
| `BadgesSize` | `md` | `setBadgesSize` | lg, md, sm, xs, none |
| `ButtonSize` | `md` | `setButtonSize` | lg, md, sm, xs, none |
| `ComponentSize` | `sm` | `setComponentSize` | lg, md, sm, xs, none |
| `TooltipColor` | `primary` | `setTooltipColor` | — |
| `SearchSize` | `md` | `setSearchSize` | lg, md, sm, xs, none |
| `SearchWidth` | `300px` | `setSearchWidth` | — |
| `HasAddnew` | `True` | `setHasAddNew` | — |
| `HasRefresh` | `True` | `setHasRefresh` | — |
| `HasBack` | `True` | `setHasBack` | — |
| `HasAlphaChooser` | `True` | `setHasAlphaChooser` | — |
| `AlphaChooserTextColor` | `#ffffff` | `setAlphaChooserTextColor` | — |
| `AlphaChooserColumn` | `name` | `setAlphaChooserColumn` | — |
| `AlphaChooserHeight` | `8` | `setAlphaChooserHeight` | — |
| `HasColumnChooser` | `True` | `setHasColumnChooser` | — |
| `ColumnChooserTextColor` | `#ffffff` | `setColumnChooserTextColor` | — |
| `ColumnChooserHeight` | `8` | `setColumnChooserHeight` | — |
| `ColumnChooserColor` | `primary` | `setColumnChooserColor` | — |
| `ShowTotalRecords` | `True` | `setShowTotalRecords` | — |
| `HasEdit` | `True` | `setHasEdit` | — |
| `HasDelete` | `True` | `setHasDelete` | — |
| `Visible` | `True` | `setVisible` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Tabs
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `Placement` | `top` | `setPlacement` | bottom, top |
| `Style` | `lift` | `setStyle` | border, box, lift |
| `RawOptions` | `btn1=Button 1; btn2=Button 2; btn3=Button 3` | `setOptions` | — |
| `Active` | `btn1` | `setActive` | — |
| `IconSize` | `20px` | `setIconSize` | — |
| `BadgeSize` | `md` | `setBadgeSize` | lg, md, none, sm, xl, xs |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5TabsItem
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `IconSize` | `20px` | `setIconSize` | — |
| `Text` | `Text` | `setText` | — |
| `BadgeSize` | `md` | `setBadgeSize` | lg, md, none, sm, xl, xs |
| `HasIcon` | `True` | `setHasIcon` | — |
| `HasBadge` | `True` | `setHasBadge` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Text
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `TextTag` | `p` | `setTextTag` | a, abbr, blockquote, del, em, h1, h2, h3, h4, h5, h6, ins, mark, p, s, small, span, strong, u, aside, figcaption, figure, ol, ul, li, div, section, nav, input, label, br, hr, footer |
| `Text` | `Text` | `setText` | — |
| `Opacity` | `100, MinRange: 0, MaxRange: 100` | `setOpacity` | — |
| `ApplyDefaults` | `True` | `setApplyDefaults` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5TextArea
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `InputType` | `normal` | `setInputType` | normal, legend, buttons, label-input, buttons-floating |
| `Label` | `Text Area` | `setLabel` | — |
| `Size` | `md` | `setSize` | lg, md, none, sm, xl, xs |
| `Rows` | `4` | `setRows` | — |
| `Height` | `12` | `setHeight` | — |
| `Width` | `full` | `setWidth` | — |
| `Visible` | `True` | `setVisible` | — |
| `BackgroundColor` | `base-200` | `setBackgroundColor` | — |
| `Border` | `True` | `setBorder` | — |
| `BorderColor` | `base-300` | `setBorderColor` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5TextBox
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `InputType` | `normal` | `setInputType` | normal, legend, buttons, label-input, buttons-floating, searchbox, hidden |
| `TypeOf` | `text` | `setTypeOf` | dialer, date-picker, date-time-picker, time-picker, email, number, password, search, tel, text, time, url, color-wheel |
| `Size` | `md` | `setSize` | lg, md, none, sm, xl, xs |
| `Width` | `full` | `setWidth` | — |
| `DPMode` | `single` | `setDPMode` | multiple, range, single, time |
| `DPDateFormat` | `Y-m-d` | `setDPDateFormat` | — |
| `DPAltFormat` | `D, d M Y` | `setDPAltFormat` | — |
| `DPAltInput` | `True` | `setDPAltInput` | — |
| `DPShowMonths` | `1` | `setDPShowMonths` | — |
| `DPTwentyFour` | `True` | `setDPTwentyFour` | — |
| `DPLocale` | `en` | `setDPLocale` | — |
| `DPPosition` | `auto` | `setDPPosition` | auto, above, below, auto left, auto center, auto right, above left, above center, above right, below left, below center, below right |
| `HandleDiameter` | `16` | `setHandleDiameter` | — |
| `WheelDiameter` | `200` | `setWheelDiameter` | — |
| `WheelThickness` | `20` | `setWheelThickness` | — |
| `WheelPlacement` | `top-end` | `setWheelPlacement` | bottom, bottom-center, bottom-end, center, end, left, left-center, left-end, right, right-center, right-end, start, top, top-center, top-end |
| `BackgroundColor` | `base-200` | `setBackgroundColor` | — |
| `Border` | `True` | `setBorder` | — |
| `BorderColor` | `base-300` | `setBorderColor` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5TextRotate
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `Text` | `Text Rotate` | `setText` | — |
| `Duration` | `10000` | `setDuration` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Timeline
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `Direction` | `vertical` | `setDirection` | horizontal, vertical |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5TimelineItem
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `Start` | `True` | `setStart` | — |
| `Middle` | `True` | `setMiddle` | — |
| `MiddleIcon` | `./assets/checkblack.svg` | `setMiddleIcon` | — |
| `MiddleIconSize` | `16px` | `setMiddleIconSize` | — |
| `End` | `True` | `setEnd` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Toast
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `HorizontalPosition` | `end` | `setHorizontalPosition` | center, end, start |
| `VerticalPosition` | `bottom` | `setVerticalPosition` | bottom, middle, top |


### SDUI5ToastChart
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `TitleText` | `Chart` | `setTitleText` | — |
| `TitleAlign` | `left` | `setTitleAlign` | center, left, right |
| `ChartType` | `bar` | `setChartType` | area, bar, column, line, pie, radial-bar, gauge |
| `XAxisTitle` | `X Axis` | `setXAxisTitle` | — |
| `YAxisTitle` | `Y Axis` | `setYAxisTitle` | — |
| `ExportMenuVisible` | `True` | `setExportMenuVisible` | — |
| `Height` | `400px` | `setHeight` | — |
| `Width` | `100%` | `setWidth` | — |
| `LegendVisible` | `True` | `setLegendVisible` | — |
| `LegendPosition` | `right` | `setLegendPosition` | bottom, left, right, top |
| `LegendShowCheckbox` | `True` | `setLegendShowCheckbox` | — |
| `SeriesDataLabelsPieSeriesNameVisible` | `True` | `setSeriesDataLabelsPieSeriesNameVisible` | — |
| `Shadow` | `sm` | `setShadow` | 2xl, inner, lg, md, none, shadow, sm, xl |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Toggle
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `ToggleType` | `normal` | `setToggleType` | legend, normal, left-label, right-label |
| `Legend` | `Toggle` | `setLegend` | — |
| `Label` | `Turn On` | `setLabel` | — |
| `BackgroundColor` | `base-200` | `setBackgroundColor` | — |
| `Border` | `True` | `setBorder` | — |
| `BorderColor` | `base-300` | `setBorderColor` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5ToolTip
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `Tip` | `Tooltip` | `setTip` | — |
| `TooltipPosition` | `top` | `setTooltipPosition` | bottom, left, right, top |


### SDUI5TreeSpider
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `AnimationRotationInterval` | `1` | `setAnimationRotationInterval` | — |
| `AnimationRotationSpeed` | `10` | `setAnimationRotationSpeed` | — |
| `AutoInitialize` | `True` | `setAutoInitialize` | — |
| `BackgroundPattern` | `default` | `setBackgroundPattern` | blurry, chaos, default, flurry, flux, gyrrate, leaves, none, quad, replicate, scribble, spiral, spot, squiggly, whirling |
| `ChartHeadType` | `default` | `setChartHeadType` | default, landscape, rounded |
| `ChartHeadBg` | `#ffffff` | `setChartHeadBg` | — |
| `HeadImageShape` | `symbolCircle` | `setHeadImageShape` | symbolCircle, symbolCross, symbolDiamond, symbolDiamond2, symbolSquare, symbolSquare2, symbolStar, symbolTriangle, symbolTriangle2, symbolWye |
| `HeadLinkerThumbCircleRadius` | `8` | `setHeadLinkerThumbCircleRadius` | — |
| `LinkerThumbShape` | `symbolCircle` | `setLinkerThumbShape` | symbolAsterisk, symbolCircle, symbolCross, symbolDiamond, symbolDiamond2, symbolPlus, symbolSquare, symbolSquare2, symbolStar, symbolTriangle, symbolTriangle2, symbolWye, symbolX |
| `ShowChartHeadBorder` | `True` | `setShowChartHeadBorder` | — |
| `ShowTools` | `True` | `setShowTools` | — |
| `TreeType` | `default` | `setTreeType` | cellar, default, goldenRod, hSpider, hSpiderWalk, radialSpiderLeg, vSpiderWalk |
| `VerticalSpace` | `120px` | `setVerticalSpace` | — |
| `Width` | `900px` | `setWidth` | — |
| `Height` | `500px` | `setHeight` | — |
| `ZoomInDistance` | `1.5` | `setZoomInDistance` | — |
| `ZoomOutDistance` | `0.5` | `setZoomOutDistance` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5TreeView
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `ItemColor` | `primary` | `setItemColor` | — |
| `Height` | `full` | `setHeight` | — |
| `Width` | `200px` | `setWidth` | — |
| `CollapseIconUrl` | `./assets/chevron-right-solid.svg` | `setCollapseIconUrl` | — |
| `ExpandIconUrl` | `./assets/chevron-down-solid.svg` | `setExpandIconUrl` | — |
| `DragNDrop` | `True` | `setDragNDrop` | — |
| `IconHeight` | `16px` | `setIconHeight` | — |
| `IconWidth` | `16px` | `setIconWidth` | — |
| `Size` | `md` | `setSize` | lg, md, none, sm, xl, xs |
| `CheckBoxSize` | `md` | `setCheckBoxSize` | lg, md, none, sm, xl, xs |
| `TextBoxSize` | `sm` | `setTextBoxSize` | lg, md, none, sm, xl, xs |
| `UseLocalstorage` | `True` | `setUseLocalstorage` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5TrendChart
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `ChartType` | `bar` | `setChartType` | bar, line, pie, stack |
| `MinValue` | `0` | `setMinValue` | — |
| `MaxValue` | `0` | `setMaxValue` | — |
| `Gap` | `2` | `setGap` | — |
| `Radius` | `2` | `setRadius` | — |
| `Rotate` | `0` | `setRotate` | — |
| `TooltipFormat` | `@L @V` | `setTooltipFormat` | — |
| `Weight` | `2` | `setWeight` | — |
| `Height` | `400px` | `setHeight` | — |
| `Width` | `400px` | `setWidth` | — |
| `ShapeColor` | `#597BFC` | `setShapeColor` | — |
| `ShapeOpacity` | `1` | `setShapeOpacity` | — |
| `ResidualColor` | `black` | `setResidualColor` | — |
| `ResidualOpacity` | `0` | `setResidualOpacity` | — |
| `TooltipFontColor` | `white` | `setTooltipFontColor` | — |
| `TooltipFontSize` | `0.875em` | `setTooltipFontSize` | — |
| `TooltipFontWeight` | `bold` | `setTooltipFontWeight` | — |
| `TooltipRadius` | `3px` | `setTooltipRadius` | — |
| `TooltipPadding` | `3px 4px` | `setTooltipPadding` | — |
| `TooltipBackground` | `black` | `setTooltipBackground` | — |
| `AreaOpacity` | `0` | `setAreaOpacity` | — |
| `PointOpacity` | `0` | `setPointOpacity` | — |
| `PointOpacityActive` | `1` | `setPointOpacityActive` | — |
| `ShapeOpacityActive` | `0.5` | `setShapeOpacityActive` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5VideoPlayer
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `TypeOf` | `video` | `setTypeOf` | audio, video |
| `Provider` | `youtube` | `setProvider` | vimeo, youtube, none |
| `Width` | `500px` | `setWidth` | — |
| `Height` | `500px` | `setHeight` | — |
| `Controls` | `True` | `setControls` | — |
| `Crossorigin` | `True` | `setCrossOrigin` | — |
| `IconUrl` | `./assets/plyr.svg` | `setIconUrl` | — |
| `Playsinline` | `True` | `setPlaysInline` | — |
| `Captions` | `True` | `setCaptions` | — |
| `Tooltips` | `True` | `setTooltips` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5WhatsApp
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `ButtonSize` | `md` | `setButtonSize` | lg, md, none, sm, xl, xs |
| `SideVisible` | `True` | `setSideVisible` | — |
| `SideHeaderVisible` | `True` | `setSideHeaderVisible` | — |
| `SideAvatarVisible` | `True` | `setSideAvatarVisible` | — |
| `SideAvatar` | `./assets/avatar.png` | `setSideAvatar` | — |
| `RightHeaderVisible` | `True` | `setRightHeaderVisible` | — |
| `RightAvatarVisible` | `True` | `setRightAvatarVisible` | — |
| `RightAvatar` | `./assets/avatar.png` | `setRightAvatar` | — |
| `RightName` | `Anele Mbanga (Mashy)` | `setRightName` | — |
| `RightStatus` | `Online` | `setRightStatus` | — |
| `AllowAttachments` | `True` | `setAllowAttachments` | — |
| `Camera` | `True` | `setCamera` | — |
| `Emojis` | `True` | `setEmojis` | — |
| `Voice` | `True` | `setVoice` | — |
| `FontSize` | `14px` | `setFontSize` | — |
| `ImageShape` | `circle` | `setImageShape` | circle, decagon, diamond, heart, hexagon, hexagon-2, none, pentagon, square, squircle, star, star-2, triangle, triangle-2, triangle-3, triangle-4, rounded-2xl, rounded-3xl, rounded, rounded-lg, rounded-md, rounded-sm, rounded-xl |
| `ImageSize` | `12` | `setImageSize` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Window
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `Height` | `56` | `setHeight` | — |
| `Width` | `full` | `setWidth` | — |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |


### SDUI5Wizard
| Property Key | Default Value | Setter Method | Accepted / Allowed Options |
|---|---|---|---|
| `Title` | `Subscription` | `setTitle` | — |
| `TitleVisible` | `True` | `setTitleVisible` | — |
| `Width` | `96` | `setWidth` | — |
| `RawSteps` | `Register;Choose Plan;Purchase;Receive Product` | `setSteps` | — |
| `ActiveStep` | `1` | `setActiveStep` | — |
| `StepsColor` | `primary` | `setStepsColor` | accent, error, info, neutral, none, primary, secondary, success, warning |
| `StepsTextSize` | `sm` | `setStepsTextSize` | 2xl, 3xl, 4xl, 5xl, 6xl, 7xl, 8xl, 9xl, base, lg, md, none, sm, xl, xs |
| `BackgroundColor` | `base-100` | `setBackgroundColor` | — |
| `PreviousText` | `Previous` | `setPreviousText` | — |
| `NextText` | `Next` | `setNextText` | — |
| `ButtonsShadow` | `md` | `setButtonsShadow` | 2xl, inner, lg, md, none, shadow, sm, xl |
| `ButtonsWidth` | `22` | `setButtonsWidth` | — |
| `ButtonsRounded` | `md` | `setButtonsRounded` | none, rounded, 2xl, 3xl, full, lg, md, sm, xl, 0 |
| `Shadow` | `sm` | `setShadow` | 2xl, inner, lg, md, none, shadow, sm, xl |
| `Visible` | `True` | `setVisible` | — |
| `Enabled` | `True` | `setEnabled` | — |
| `Position` | `t=?; b=?; r=?; l=?` | `setPosition` | — |
| `MarginAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setMarginAXYTBLR` | — |
| `PaddingAXYTBLR` | `a=?; x=?; y=?; t=?; b=?; l=?; r=?` | `setPaddingAXYTBLR` | — |

