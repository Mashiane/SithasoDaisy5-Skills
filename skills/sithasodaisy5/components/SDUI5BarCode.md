---
name: SDUI5BarCode
description: SithasoDaisy5 SDUI5BarCode component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5BarCode

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5BarCode.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5BarCode.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgBarCode.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgBarCode.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5BarCode generates a barcode (1D) from a value. Use for product/asset labels.
_SDUI5BarCode is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `Format` | String | auto | auto, codabar, CODE128, CODE128A, CODE128AUTO, CODE128B, CODE128C, CODE39, EAN13, EAN2, EAN5, EAN8, GenericBarcode, ITF, ITF14, MSI, MSI10, MSI1010, MSI11, MSI1110, pharmacode, UPC, UPCE | `setFormat` | `getFormat` |
| `Value` | String | 123456789012 | — | `setValue` | `getValue` |
| `Text` | String | JsBarCode | — | `setText` | `getText` |
| `Background` | String | #ffffff | — | `setBackground` | `getBackground` |
| `DisplayValue` | Boolean | True | — | `setDisplayValue` | `getDisplayValue` |
| `Flat` | Boolean | False | — | `setFlat` | `getFlat` |
| `Font` | String | monospace | — | `setFont` | `getFont` |
| `FontBold` | Boolean | False | — | `setFontBold` | `getFontBold` |
| `FontItalic` | Boolean | False | — | `setFontItalic` | `getFontItalic` |
| `FontSize` | Int | 20 | — | `setFontSize` | `getFontSize` |
| `Height` | Int | 100 | — | `setHeight` | `getHeight` |
| `Width` | Int | 2 | — | `setWidth` | `getWidth` |
| `LineColor` | String | #000000 | — | `setLineColor` | `getLineColor` |
| `Margin` | Int | 10 | — | `setMargin` | `getMargin` |
| `MarginBottom` | Int | -1 | — | `setMarginBottom` | `getMarginBottom` |
| `MarginLeft` | Int | -1 | — | `setMarginLeft` | `getMarginLeft` |
| `MarginRight` | Int | -1 | — | `setMarginRight` | `getMarginRight` |
| `MarginTop` | Int | -1 | — | `setMarginTop` | `getMarginTop` |
| `TextAlign` | String | center | center, left, right | `setTextAlign` | `getTextAlign` |
| `TextMargin` | Int | 2 | — | `setTextMargin` | `getTextMargin` |
| `TextPosition` | String | bottom | bottom, top | `setTextPosition` | `getTextPosition` |
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
`Valid`

Wire in parent: `Sub barcode_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (10)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `OnEvent(event As String, methodName As String)` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Refresh()` As 'ignoredeadcode _(public)_
- `toBlob()` As Object _(public)_
- `ToDataURL()` As String _(public)_
## Key Setters (31)
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
- `setText(s As String)` _(public)_
- `setValue(text As String)` _(public)_
- `setBackground(s As String)` _(public)_
- `setDisplayValue(b As Boolean)` _(public)_
- `setFlat(b As Boolean)` _(public)_
- `setFont(s As String)` _(public)_
- `setFontBold(b As Boolean)` _(public)_
- `setFontItalic(b As Boolean)` _(public)_
- `setFontSize(i As Int)` _(public)_
- `setFormat(s As String)` _(public)_
- `setHeight(i As Int)` _(public)_
- `setLineColor(s As String)` _(public)_
- `setMargin(i As Int)` _(public)_
- `setMarginBottom(i As Int)` _(public)_
- `setMarginLeft(i As Int)` _(public)_
- `setMarginRight(i As Int)` _(public)_
- `setMarginTop(i As Int)` _(public)_
- `setTextAlign(s As String)` _(public)_
- `setTextMargin(i As Int)` _(public)_
- `setTextPosition(s As String)` _(public)_
- `setWidth(i As Int)` _(public)_
## Getters (33)
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
- `getText()` As String _(public)_
- `getValue()` As String _(public)_
- `getBackground()` As String _(public)_
- `getDisplayValue()` As Boolean _(public)_
- `getFlat()` As Boolean _(public)_
- `getFont()` As String _(public)_
- `getFontBold()` As Boolean _(public)_
- `getFontItalic()` As Boolean _(public)_
- `getFontSize()` As Int _(public)_
- `getFormat()` As String _(public)_
- `getHeight()` As Int _(public)_
- `getLineColor()` As String _(public)_
- `getMargin()` As Int _(public)_
- `getMarginBottom()` As Int _(public)_
- `getMarginLeft()` As Int _(public)_
- `getMarginRight()` As Int _(public)_
- `getMarginTop()` As Int _(public)_
- `getTextAlign()` As String _(public)_
- `getTextMargin()` As Int _(public)_
- `getTextPosition()` As String _(public)_
- `getWidth()` As Int _(public)_
## Private Methods (0)
_(none)_
## Verified Demo Usage

Real syntax from [`pgBarCode.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgBarCode.bas) (verified demo). `SDUI5BarCode2` = a SDUI5BarCode.

```b4j
	SDUI5BarCode2.Initialize(Me, "SDUI5BarCode2", "SDUI5BarCode2")
	SDUI5BarCode2.ParentID = "SDUI5Column2"
	SDUI5BarCode2.Format = "CODE128A"
	SDUI5BarCode2.Text = "Code 128A"
	SDUI5BarCode2.Width = 3
	BANano.Await(SDUI5BarCode2.AddComponent)
```
## Emits (daisyUI classes pushed in DesignerCreateView)
_(none emitted directly — relies on base/CustProps)_
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim barcode As SDUI5BarCode
barcode.Initialize(Me, "SDUI5BarCode", "SDUI5BarCode")
barcode.ParentID = "placeholder"
BANano.Await(barcode.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.


