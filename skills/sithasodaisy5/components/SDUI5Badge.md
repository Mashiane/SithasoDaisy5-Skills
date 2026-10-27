---
name: SDUI5Badge
description: SithasoDaisy5 SDUI5Badge component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5Badge

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5Badge.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5Badge.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgBadge.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgBadge.bas)
  - [`pgCard.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgCard.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5Badge is a small badge/label with color, size, and outline. Use for status labels, counts, tags.
_SDUI5Badge is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `UseSpan` | Boolean | False | — | `setUseSpan` | `getUseSpan` |
| `Text` | String | Badge | — | `setText` | `getText` |
| `Color` | String | primary | accent, error, info, neutral, primary, secondary, success, warning, none | `setColor` | `getColor` |
| `Size` | String | none | lg, md, none, sm, xl, xs | `setSize` | `getSize` |
| `TextColor` | String | — | — | `setTextColor` | `getTextColor` |
| `TextSize` | String | none | 2xl, 3xl, 4xl, 5xl, 6xl, 7xl, 8xl, 9xl, base, lg, md, none, sm, xl, xs | `setTextSize` | `getTextSize` |
| `BackgroundColor` | String | — | — | `setBackgroundColor` | `getBackgroundColor` |
| `Dash` | Boolean | False | — | `setDash` | `getDash` |
| `Ghost` | Boolean | False | — | `setGhost` | `getGhost` |
| `Outline` | Boolean | False | — | `setOutline` | `getOutline` |
| `Height` | String | — | — | `setHeight` | `getHeight` |
| `Width` | String | — | — | `setWidth` | `getWidth` |
| `LeftIcon` | String | — | — | `setLeftIcon` | `getLeftIcon` |
| `LeftIconColor` | String | — | — | `setLeftIconColor` | `getLeftIconColor` |
| `LeftIconSize` | String | 16px | — | `setLeftIconSize` | `getLeftIconSize` |
| `LeftImage` | String | — | — | `setLeftImage` | `getLeftImage` |
| `LeftImageSize` | String | 16px | — | `setLeftImageSize` | `getLeftImageSize` |
| `RightIcon` | String | — | — | `setRightIcon` | `getRightIcon` |
| `RightIconColor` | String | — | — | `setRightIconColor` | `getRightIconColor` |
| `RightIconSize` | String | 16px | — | `setRightIconSize` | `getRightIconSize` |
| `RightImage` | String | — | — | `setRightImage` | `getRightImage` |
| `RightImageSize` | String | 16px | — | `setRightImageSize` | `getRightImageSize` |
| `Rounded` | String | full | none, rounded, 2xl, 3xl, full, lg, md, sm, xl, 0 | `setRounded` | `getRounded` |
| `Shadow` | String | none | 2xl, inner, lg, md, none, shadow, sm, xl | `setShadow` | `getShadow` |
| `HasLeftIcon` | Boolean | True | — | `setHasLeftIcon` | `getHasLeftIcon` |
| `HasLeftImage` | Boolean | True | — | `setHasLeftImage` | `getHasLeftImage` |
| `HasRightIcon` | Boolean | True | — | `setHasRightIcon` | `getHasRightIcon` |
| `HasRightImage` | Boolean | True | — | `setHasRightImage` | `getHasRightImage` |
| `Soft` | Boolean | False | — | `setSoft` | `getSoft` |
| `IndicatorItem` | Boolean | False | — | `setIndicatorItem` | `getIndicatorItem` |
| `IndicatorPosition` | String | top-start | bottom-center, middle-center, bottom-end, bottom-start, middle-end, middle-start, top-center, top-end, top-start | `setIndicatorPosition` | `getIndicatorPosition` |
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
`Click`, `LeftClick`, `RightClick`

Wire in parent: `Sub badge_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (4)
- `AddComponent()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `Remove()` _(public)_

## Key Setters (42)
- `setAttributes(s As String)` _(public)_
- `setBackgroundColor(s As String)` _(public)_
- `setClasses(s As String)` _(public)_
- `setColor(s As String)` _(public)_
- `setDash(b As Boolean)` _(public)_
- `setEnabled(b As Boolean)` _(public)_
- `setGhost(b As Boolean)` _(public)_
- `setHasLeftIcon(b As Boolean)` _(public)_
- `setHasLeftImage(b As Boolean)` _(public)_
- `setHasRightIcon(b As Boolean)` _(public)_
- `setHasRightImage(b As Boolean)` _(public)_
- `setHeight(s As String)` _(public)_
- `setIndicatorItem(b As Boolean)` _(public)_
- `setIndicatorPosition(s As String)` _(public)_
- `setLeftIcon(s As String)` _(public)_
- `setLeftIconColor(s As String)` _(public)_
- `setLeftIconSize(s As String)` _(public)_
- `setLeftImage(s As String)` _(public)_
- `setLeftImageSize(s As String)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setOutline(b As Boolean)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setParentID(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setPositionStyle(s As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `setRightIcon(s As String)` _(public)_
- `setRightIconColor(s As String)` _(public)_
- `setRightIconSize(s As String)` _(public)_
- `setRightImage(s As String)` _(public)_
- `setRightImageSize(s As String)` _(public)_
- `setRounded(s As String)` _(public)_
- `setShadow(s As String)` _(public)_
- `setSize(s As String)` _(public)_
- `setSoft(b As Boolean)` _(public)_
- `setStyles(s As String)` _(public)_
- `setText(text As String)` _(public)_
- `setTextColor(s As String)` _(public)_
- `setTextSize(s As String)` _(public)_
- `setUseSpan(b As Boolean)` _(public)_
- `setVisible(b As Boolean)` _(public)_
- `setWidth(s As String)` _(public)_

## Getters (44)
- `getAttributes()` _(public)_
- `getBackgroundColor()` _(public)_
- `getClasses()` _(public)_
- `getColor()` _(public)_
- `getDash()` _(public)_
- `getEnabled()` _(public)_
- `getGhost()` _(public)_
- `getHasLeftIcon()` _(public)_
- `getHasLeftImage()` _(public)_
- `getHasRightIcon()` _(public)_
- `getHasRightImage()` _(public)_
- `getHeight()` _(public)_
- `getHere()` As String _(public)_
- `getID()` As String _(public)_
- `getIndicatorItem()` _(public)_
- `getIndicatorPosition()` _(public)_
- `getLeftIcon()` _(public)_
- `getLeftIconColor()` _(public)_
- `getLeftIconSize()` _(public)_
- `getLeftImage()` _(public)_
- `getLeftImageSize()` _(public)_
- `getMarginAXYTBLR()` _(public)_
- `getOutline()` _(public)_
- `getPaddingAXYTBLR()` _(public)_
- `getParentID()` As String _(public)_
- `getPosition()` _(public)_
- `getPositionStyle()` _(public)_
- `GetProperties()` _(public)_
- `getRightIcon()` _(public)_
- `getRightIconColor()` _(public)_
- `getRightIconSize()` _(public)_
- `getRightImage()` _(public)_
- `getRightImageSize()` _(public)_
- `getRounded()` _(public)_
- `getShadow()` _(public)_
- `getSize()` _(public)_
- `getSoft()` _(public)_
- `getStyles()` _(public)_
- `getText()` _(public)_
- `getTextColor()` _(public)_
- `getTextSize()` _(public)_
- `getUseSpan()` _(public)_
- `getVisible()` _(public)_
- `getWidth()` _(public)_

## Private Methods (1)
- `SetDefaults()` _(private)_

## Verified Demo Usage

Real syntax from [`pgBadge.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgBadge.bas) (verified demo):

```b4j
Private SDUI5Badge1 As SDUI5Badge		'ignore
Private SDUI5Badge10 As SDUI5Badge		'ignore
Private SDUI5Badge11 As SDUI5Badge		'ignore
Private SDUI5Badge12 As SDUI5Badge		'ignore
Private SDUI5Badge13 As SDUI5Badge		'ignore
Private SDUI5Badge14 As SDUI5Badge		'ignore
Private SDUI5Badge15 As SDUI5Badge		'ignore
Private SDUI5Badge16 As SDUI5Badge		'ignore
Private SDUI5Badge17 As SDUI5Badge		'ignore
Private SDUI5Badge18 As SDUI5Badge		'ignore
Private SDUI5Badge19 As SDUI5Badge		'ignore
BANano.Await(SDUI5Container1.AddComponent)
```

## Emits (daisyUI classes pushed in DesignerCreateView)
**Classes**: `badge flex-nowrap inline-flex items-center`, `badge-dash`, `badge-ghost`, `badge-outline`, `badge-soft`, `indicator-item`
**Colors**: `badge:sColor`
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim badge As SDUI5Badge
badge.Initialize(Me, "SDUI5Badge", "SDUI5Badge")
badge.ParentID = "placeholder"
BANano.Await(badge.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.