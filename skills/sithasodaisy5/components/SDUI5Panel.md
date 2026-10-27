---
name: SDUI5Panel
description: SithasoDaisy5 SDUI5Panel component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5Panel

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5Panel.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5Panel.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgBrowser.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgBrowser.bas)
  - [`pgDivider.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgDivider.bas)
  - [`pggridbuilder.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pggridbuilder.bas)
  - [`pgIndex.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgIndex.bas)
  - [`pgIndicator.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgIndicator.bas)
  - [`pgPhone.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgPhone.bas)
  - [`pgSkeleton.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgSkeleton.bas)
  - [`pgStack.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgStack.bas)
  - [`pgWindow.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgWindow.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5Panel is a bordered panel container. Children mount via ParentID. Use for grouping content.
_SDUI5Panel is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `Flexbox` | Boolean | False | — | `setFlexbox` | `getFlexbox` |
| `Flex` | String | none | 1, auto, initial, none | `setFlex` | `getFlex` |
| `FlexBasis` | String | — | — | `setFlexBasis` | `getFlexBasis` |
| `FlexDirection` | String | none | col, col-reverse, none, row, row-reverse | `setFlexDirection` | `getFlexDirection` |
| `FlexGrow` | String | none | 0, 1, none | `setFlexGrow` | `getFlexGrow` |
| `FlexShrink` | String | none | 0, 1, none | `setFlexShrink` | `getFlexShrink` |
| `FlexWrap` | String | none | none, nowrap, wrap, wrap-reverse | `setFlexWrap` | `getFlexWrap` |
| `Text` | String | — | — | `setText` | `getText` |
| `TextAlign` | String | none | center, end, justify, left, none, right, start | `setTextAlign` | `getTextAlign` |
| `TextColor` | String | — | — | `setTextColor` | `getTextColor` |
| `BackgroundColor` | String | — | — | `setBackgroundColor` | `getBackgroundColor` |
| `BackgroundImage` | String | — | — | `setBackgroundImage` | `getBackgroundImage` |
| `CenterChildren` | Boolean | False | — | `setCenterChildren` | `getCenterChildren` |
| `Grid` | Boolean | False | — | `setGrid` | `getGrid` |
| `Gap` | String | — | — | `setGap` | `getGap` |
| `GapX` | String | — | — | `setGapX` | `getGapX` |
| `GapY` | String | — | — | `setGapY` | `getGapY` |
| `SMGap` | String | — | — | `setSMGap` | `getSMGap` |
| `MDGap` | String | — | — | `setMDGap` | `getMDGap` |
| `LGGap` | String | — | — | `setLGGap` | `getLGGap` |
| `XLGap` | String | — | — | `setXLGap` | `getXLGap` |
| `GridCols` | String | — | — | `setGridCols` | `getGridCols` |
| `GridFlow` | String | none | col, col-dense, dense, none, row, row-dense | `setGridFlow` | `getGridFlow` |
| `GridRows` | String | — | — | `setGridRows` | `getGridRows` |
| `ColSpan` | String | — | — | `setColSpan` | `getColSpan` |
| `ColSpanXs` | String | — | — | `setColSpanXs` | `getColSpanXs` |
| `ColSpanSm` | String | — | — | `setColSpanSm` | `getColSpanSm` |
| `ColSpanMd` | String | — | — | `setColSpanMd` | `getColSpanMd` |
| `ColSpanLg` | String | — | — | `setColSpanLg` | `getColSpanLg` |
| `ColSpanXl` | String | — | — | `setColSpanXl` | `getColSpanXl` |
| `Height` | String | — | — | `setHeight` | `getHeight` |
| `Width` | String | — | — | `setWidth` | `getWidth` |
| `Rounded` | String | none | none, rounded, 2xl, 3xl, full, lg, md, sm, xl, 0 | `setRounded` | `getRounded` |
| `RoundedBox` | Boolean | False | — | `setRoundedBox` | `getRoundedBox` |
| `RowSpan` | String | — | — | `setRowSpan` | `getRowSpan` |
| `Shadow` | String | none | 2xl, inner, lg, md, none, shadow, sm, xl | `setShadow` | `getShadow` |
| `AlignContent` | String | none | around, baseline, between, center, end, evenly, none, normal, start, stretch | `setAlignContent` | `getAlignContent` |
| `AlignItems` | String | none | baseline, center, end, none, start, stretch | `setAlignItems` | `getAlignItems` |
| `AlignSelf` | String | none | auto, baseline, center, end, none, start, stretch | `setAlignSelf` | `getAlignSelf` |
| `JustifyContent` | String | none | around, baseline, between, center, end, evenly, none, normal, start, stretch | `setJustifyContent` | `getJustifyContent` |
| `JustifyItems` | String | none | center, end, none, normal, start, stretch | `setJustifyItems` | `getJustifyItems` |
| `JustifySelf` | String | none | auto, center, end, none, start, stretch | `setJustifySelf` | `getJustifySelf` |
| `PlaceContent` | String | none | around, baseline, between, center, end, evenly, none, start, stretch | `setPlaceContent` | `getPlaceContent` |
| `PlaceItems` | String | none | baseline, center, end, none, start, stretch | `setPlaceItems` | `getPlaceItems` |
| `PlaceSelf` | String | none | auto, center, end, none, start, stretch | `setPlaceSelf` | `getPlaceSelf` |
| `Visible` | Boolean | True | — | `setVisible` | `getVisible` |
| `Enabled` | Boolean | True | — | `setEnabled` | `getEnabled` |
| `PositionStyle` | String | none | absolute, fixed, none, relative, static, sticky | `setPositionStyle` | `getPositionStyle` |
| `Position` | String | t=?; b=?; r=?; l=? | — | `setPosition` | `getPosition` |
| `RawBorderColor` | String | a=?; t=?; r=?; b=?; l=?; tl=?; tr=?; bl=?; br=?; x=?; y=? | — | `setBorderColor` | `getBorderColor` |
| `RawBorderStyle` | String | a=?; t=?; r=?; b=?; l=?; tl=?; tr=?; bl=?; br=?; x=?; y=? | — | `setBorderStyle` | `getBorderStyle` |
| `RawBorderWidth` | String | a=?; t=?; r=?; b=?; l=?; tl=?; tr=?; bl=?; br=?; x=?; y=? | — | `setBorderWidth` | `getBorderWidth` |
| `RawBorderRadius` | String | a=?; t=?; r=?; b=?; l=?; tl=?; tr=?; bl=?; br=?; x=?; y=? | — | `setBorderRadius` | `getBorderRadius` |
| `MarginAXYTBLR` | String | a=?; x=?; y=?; t=?; b=?; l=?; r=? | — | `setMarginAXYTBLR` | `getMarginAXYTBLR` |
| `PaddingAXYTBLR` | String | a=?; x=?; y=?; t=?; b=?; l=?; r=? | — | `setPaddingAXYTBLR` | `getPaddingAXYTBLR` |
| `RawClasses` | String | — | — | `setClasses` | `getClasses` |
| `RawStyles` | String | — | — | `setStyles` | `getStyles` |
| `RawAttributes` | String | — | — | `setAttributes` | `getAttributes` |

Setter and getter names are the actual source `Sub` names. `—` means this component has no named accessor for that side; designer-time values may still be consumed through `Props` in `DesignerCreateView`.
Where a designer key and method name differ, the method names shown are the source-verified mapping.
## Events
_(none declared)_

Wire in parent: `Sub panel_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (6)
- `AddComponent()` _(public)_
- `Append(s As String)` _(public)_
- `Clear()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `Remove()` _(public)_

## Key Setters (61)
- `setAlignContent(s As String)` _(public)_
- `setAlignItems(s As String)` _(public)_
- `setAlignSelf(s As String)` _(public)_
- `SetAttr(k As String, v As String)` _(public)_
- `setAttributes(s As String)` _(public)_
- `setBackgroundColor(s As String)` _(public)_
- `setBackgroundImage(s As String)` _(public)_
- `setBorderColor(s As String)` _(public)_
- `setBorderRadius(s As String)` _(public)_
- `setBorderStyle(s As String)` _(public)_
- `setBorderWidth(s As String)` _(public)_
- `setCenterChildren(b As Boolean)` _(public)_
- `setClasses(s As String)` _(public)_
- `setColSpan(s As String)` _(public)_
- `setColSpanLg(s As String)` _(public)_
- `setColSpanMd(s As String)` _(public)_
- `setColSpanSm(s As String)` _(public)_
- `setColSpanXl(s As String)` _(public)_
- `setColSpanXs(s As String)` _(public)_
- `setEnabled(b As Boolean)` _(public)_
- `setFlex(s As String)` _(public)_
- `setFlexBasis(s As String)` _(public)_
- `setFlexbox(b As Boolean)` _(public)_
- `setFlexDirection(s As String)` _(public)_
- `setFlexGrow(s As String)` _(public)_
- `setFlexShrink(s As String)` _(public)_
- `setFlexWrap(s As String)` _(public)_
- `setGap(s As String)` _(public)_
- `setGapX(s As String)` _(public)_
- `setGapY(s As String)` _(public)_
- `setGrid(b As Boolean)` _(public)_
- `setGridCols(s As String)` _(public)_
- `setGridFlow(s As String)` _(public)_
- `setGridRows(s As String)` _(public)_
- `setHeight(s As String)` _(public)_
- `setJustifyContent(s As String)` _(public)_
- `setJustifyItems(s As String)` _(public)_
- `setJustifySelf(s As String)` _(public)_
- `setLGGap(s As String)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setMDGap(s As String)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setParentID(s As String)` _(public)_
- `setPlaceContent(s As String)` _(public)_
- `setPlaceItems(s As String)` _(public)_
- `setPlaceSelf(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setPositionStyle(s As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `setRounded(s As String)` _(public)_
- `setRoundedBox(b As Boolean)` _(public)_
- `setRowSpan(s As String)` _(public)_
- `setShadow(s As String)` _(public)_
- `setSMGap(s As String)` _(public)_
- `setStyles(s As String)` _(public)_
- `setText(text As String)` _(public)_
- `setTextAlign(s As String)` _(public)_
- `setTextColor(s As String)` _(public)_
- `setVisible(b As Boolean)` _(public)_
- `setWidth(s As String)` _(public)_
- `setXLGap(s As String)` _(public)_

## Getters (63)
- `getAlignContent()` _(public)_
- `getAlignItems()` _(public)_
- `getAlignSelf()` _(public)_
- `GetAttr(attr As String)` As String _(public)_
- `getAttributes()` _(public)_
- `getBackgroundColor()` _(public)_
- `getBackgroundImage()` _(public)_
- `getBorderColor()` _(public)_
- `getBorderRadius()` _(public)_
- `getBorderStyle()` _(public)_
- `getBorderWidth()` _(public)_
- `getCenterChildren()` _(public)_
- `getClasses()` _(public)_
- `getColSpan()` _(public)_
- `getColSpanLg()` _(public)_
- `getColSpanMd()` _(public)_
- `getColSpanSm()` _(public)_
- `getColSpanXl()` _(public)_
- `getColSpanXs()` _(public)_
- `getEnabled()` _(public)_
- `getFlex()` _(public)_
- `getFlexBasis()` _(public)_
- `getFlexbox()` _(public)_
- `getFlexDirection()` _(public)_
- `getFlexGrow()` _(public)_
- `getFlexShrink()` _(public)_
- `getFlexWrap()` _(public)_
- `getGap()` _(public)_
- `getGapX()` _(public)_
- `getGapY()` _(public)_
- `getGrid()` _(public)_
- `getGridCols()` _(public)_
- `getGridFlow()` _(public)_
- `getGridRows()` _(public)_
- `getHeight()` _(public)_
- `getHere()` As String _(public)_
- `getID()` As String _(public)_
- `getJustifyContent()` _(public)_
- `getJustifyItems()` _(public)_
- `getJustifySelf()` _(public)_
- `getLGGap()` _(public)_
- `getMarginAXYTBLR()` _(public)_
- `getMDGap()` _(public)_
- `getPaddingAXYTBLR()` _(public)_
- `getParentID()` _(public)_
- `getPlaceContent()` _(public)_
- `getPlaceItems()` _(public)_
- `getPlaceSelf()` _(public)_
- `getPosition()` _(public)_
- `getPositionStyle()` _(public)_
- `GetProperties()` _(public)_
- `getRounded()` _(public)_
- `getRoundedBox()` _(public)_
- `getRowSpan()` _(public)_
- `getShadow()` _(public)_
- `getSMGap()` _(public)_
- `getStyles()` _(public)_
- `getText()` _(public)_
- `getTextAlign()` _(public)_
- `getTextColor()` _(public)_
- `getVisible()` _(public)_
- `getWidth()` _(public)_
- `getXLGap()` _(public)_

## Private Methods (1)
- `SetDefaults()` _(private)_

## Verified Demo Usage

Real syntax from [`pgBrowser.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgBrowser.bas) (verified demo):

```b4j
Private SDUI5Panel1 As SDUI5Panel		'ignore
BANano.Await(SDUI5Container1.AddComponent)
```

## Emits (daisyUI classes pushed in DesignerCreateView)
**Classes**: `grow`, `shrink`, `flex`, `grid`, `rounded-box`
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim panel As SDUI5Panel
panel.Initialize(Me, "SDUI5Panel", "SDUI5Panel")
panel.ParentID = "placeholder"
BANano.Await(panel.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.
