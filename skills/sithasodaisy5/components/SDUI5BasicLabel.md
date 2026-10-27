---
name: SDUI5BasicLabel
description: SithasoDaisy5 SDUI5BasicLabel component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5BasicLabel

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5BasicLabel.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5BasicLabel.bas)
- **Demo References**: No direct `As`/`New` type reference was detected in the audited `pg*.bas` demo snapshot.
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5BasicLabel is a simple text label with color, size, and alignment. Use for static captions/labels; no input.
_SDUI5BasicLabel is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `TagType` | String | div | — | `setTagType` | `getTagType` |
| `HorizontalAnchor` | String | left | left, left-right, right | `setHorizontalAnchor` | `getHorizontalAnchor` |
| `VerticalAnchor` | String | top | bottom, top, top-bottom | `setVerticalAnchor` | `getVerticalAnchor` |
| `PositionStyle` | String | none | absolute, fixed, none, relative, static, sticky | `setPositionStyle` | `getPositionStyle` |
| `BoxSizing` | String | border-box | border-box, none | `setBoxSizing` | `getBoxSizing` |
| `LineHeight` | String | — | — | `setLineHeight` | `getLineHeight` |
| `Left` | String | — | — | `setLeft` | `getLeft` |
| `Right` | String | — | — | `setRight` | `getRight` |
| `Top` | String | — | — | `setTop` | `getTop` |
| `Bottom` | String | — | — | `setBottom` | `getBottom` |
| `Width` | String | 100px | — | `setWidth` | `getWidth` |
| `Height` | String | 60px | — | `setHeight` | `getHeight` |
| `Enabled` | Boolean | True | — | `setEnabled` | `getEnabled` |
| `Visible` | Boolean | True | — | `setVisible` | `getVisible` |
| `BorderSet` | Boolean | False | — | `setBorderSet` | `getBorderSet` |
| `BorderColor` | Color | #000000 | — | `setBorderColor` | `getBorderColor` |
| `BorderWidth` | String | 0px | — | `setBorderWidth` | `getBorderWidth` |
| `BorderRadius` | String | 0px | — | `setBorderRadius` | `getBorderRadius` |
| `BorderStyle` | String | solid | dashed, dotted, double, groove, hidden, inherit, initial, inset, none, outset, ridge, solid | `setBorderStyle` | `getBorderStyle` |
| `Text` | String | Text | — | `setText` | `getText` |
| `WrapText` | Boolean | False | — | `setWrapText` | `getWrapText` |
| `TextColor` | Color | #000000 | — | `setTextColor` | `getTextColor` |
| `Alignment` | String | center | bottom, center, left, right, top, none | `setAlignment` | `getAlignment` |
| `BackgroundColor` | String | transparent | — | `setBackgroundColor` | `getBackgroundColor` |
| `FontAwesomeIcon` | String | — | — | `setFontAwesomeIcon` | `getFontAwesomeIcon` |
| `MaterialIcon` | String | — | — | `setMaterialIcon` | `getMaterialIcon` |
| `FontName` | String | — | — | `setFontName` | `getFontName` |
| `FontBold` | Boolean | False | — | `setFontBold` | `getFontBold` |
| `FontSize` | String | 15 | — | `setFontSize` | `getFontSize` |
| `FontItalic` | Boolean | False | — | `setFontItalic` | `getFontItalic` |
| `GradientActive` | Boolean | false | — | `setGradientActive` | `getGradientActive` |
| `Gradient` | String | — | bl_tr, bottom_top, br_tl, left_right, right_left, tl_br, top_bottom, tr_bl | `setGradient` | `getGradient` |
| `GradientColor1` | Color | #f86194, Gradient Color 1. | — | — | — |
| `GradientColor2` | Color | #968918, Gradient Color 2. | — | — | — |
| `MarginLeft` | String | — | — | `setMarginLeft` | `getMarginLeft` |
| `MarginRight` | String | — | — | `setMarginRight` | `getMarginRight` |
| `MarginTop` | String | — | — | `setMarginTop` | `getMarginTop` |
| `MarginBottom` | String | — | — | `setMarginBottom` | `getMarginBottom` |
| `PaddingLeft` | String | — | — | `setPaddingLeft` | `getPaddingLeft` |
| `PaddingRight` | String | — | — | `setPaddingRight` | `getPaddingRight` |
| `PaddingTop` | String | — | — | `setPaddingTop` | `getPaddingTop` |
| `PaddingBottom` | String | — | — | `setPaddingBottom` | `getPaddingBottom` |
| `RawClasses` | String | — | — | `setClasses` | `getClasses` |
| `RawStyles` | String | — | — | `setStyles` | `getStyles` |
| `RawAttributes` | String | — | — | `setAttributes` | `getAttributes` |

Setter and getter names are the actual source `Sub` names. `—` means this component has no named accessor for that side; designer-time values may still be consumed through `Props` in `DesignerCreateView`.
Where a designer key and method name differ, the method names shown are the source-verified mapping.
## Events
_(none declared)_

Wire in parent: `Sub basiclabel_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (5)
- `AddComponent()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `OnEvent(event As String, methodName As String)` _(public)_
- `Remove()` _(public)_

## Key Setters (45)
- `setAlignment(s As String)` _(public)_
- `setAttributes(s As String)` _(public)_
- `setBackgroundColor(s As String)` _(public)_
- `setBorderColor(c As String)` _(public)_
- `setBorderRadius(s As String)` _(public)_
- `setBorderSet(b As Boolean)` _(public)_
- `setBorderStyle(s As String)` _(public)_
- `setBorderWidth(s As String)` _(public)_
- `setBottom(s As String)` _(public)_
- `setBoxSizing(s As String)` _(public)_
- `setClasses(s As String)` _(public)_
- `setEnabled(b As Boolean)` _(public)_
- `setFontAwesomeIcon(s As String)` _(public)_
- `setFontBold(b As Boolean)` _(public)_
- `setFontItalic(b As Boolean)` _(public)_
- `setFontName(s As String)` _(public)_
- `setFontSize(s As String)` _(public)_
- `setGradient(s As String)` _(public)_
- `setGradientActive(b As Boolean)` _(public)_
- `setHeight(s As String)` _(public)_
- `setHorizontalAnchor(s As String)` _(public)_
- `setLeft(s As String)` _(public)_
- `setLineHeight(s As String)` _(public)_
- `setMarginBottom(s As String)` _(public)_
- `setMarginLeft(s As String)` _(public)_
- `setMarginRight(s As String)` _(public)_
- `setMarginTop(s As String)` _(public)_
- `setMaterialIcon(s As String)` _(public)_
- `setPaddingBottom(s As String)` _(public)_
- `setPaddingLeft(s As String)` _(public)_
- `setPaddingRight(s As String)` _(public)_
- `setPaddingTop(s As String)` _(public)_
- `setParentID(s As String)` _(public)_
- `setPositionStyle(s As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `setRight(s As String)` _(public)_
- `setStyles(s As String)` _(public)_
- `setTagType(s As String)` _(public)_
- `setText(s As String)` _(public)_
- `setTextColor(c As String)` _(public)_
- `setTop(s As String)` _(public)_
- `setVerticalAnchor(s As String)` _(public)_
- `setVisible(b As Boolean)` _(public)_
- `setWidth(s As String)` _(public)_
- `setWrapText(b As Boolean)` _(public)_

## Getters (47)
- `getAlignment()` _(public)_
- `getAttributes()` _(public)_
- `getBackgroundColor()` _(public)_
- `getBorderColor()` _(public)_
- `getBorderRadius()` _(public)_
- `getBorderSet()` _(public)_
- `getBorderStyle()` _(public)_
- `getBorderWidth()` _(public)_
- `getBottom()` _(public)_
- `getBoxSizing()` _(public)_
- `getClasses()` _(public)_
- `getEnabled()` _(public)_
- `getFontAwesomeIcon()` _(public)_
- `getFontBold()` _(public)_
- `getFontItalic()` _(public)_
- `getFontName()` _(public)_
- `getFontSize()` _(public)_
- `getGradient()` _(public)_
- `getGradientActive()` _(public)_
- `getHeight()` _(public)_
- `getHere()` As String _(public)_
- `getHorizontalAnchor()` _(public)_
- `getID()` As String _(public)_
- `getLeft()` _(public)_
- `getLineHeight()` _(public)_
- `getMarginBottom()` _(public)_
- `getMarginLeft()` _(public)_
- `getMarginRight()` _(public)_
- `getMarginTop()` _(public)_
- `getMaterialIcon()` _(public)_
- `getPaddingBottom()` _(public)_
- `getPaddingLeft()` _(public)_
- `getPaddingRight()` _(public)_
- `getPaddingTop()` _(public)_
- `getParentID()` _(public)_
- `getPositionStyle()` _(public)_
- `GetProperties()` _(public)_
- `getRight()` _(public)_
- `getStyles()` _(public)_
- `getTagType()` _(public)_
- `getText()` _(public)_
- `getTextColor()` _(public)_
- `getTop()` _(public)_
- `getVerticalAnchor()` _(public)_
- `getVisible()` _(public)_
- `getWidth()` _(public)_
- `getWrapText()` _(public)_

## Private Methods (1)
- `SetDefaults()` _(private)_

## Emits (daisyUI classes pushed in DesignerCreateView)
_(none emitted directly — relies on base/CustProps)_
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim basiclabel As SDUI5BasicLabel
basiclabel.Initialize(Me, "SDUI5BasicLabel", "SDUI5BasicLabel")
basiclabel.ParentID = "placeholder"
BANano.Await(basiclabel.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.
