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
## Public Methods (8)
- `AddComponent()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `OnEvent(event As String, methodName As String)` _(public)_
- `Refresh()` _(public)_
- `Remove()` _(public)_
- `toBlob()` _(public)_
- `ToDataURL()` _(public)_

## Key Setters (32)
- `setAttributes(s As String)` _(public)_
- `setBackground(s As String)` _(public)_
- `setClasses(s As String)` _(public)_
- `setDisplayValue(b As Boolean)` _(public)_
- `setEnabled(b As Boolean)` _(public)_
- `setFlat(b As Boolean)` _(public)_
- `setFont(s As String)` _(public)_
- `setFontBold(b As Boolean)` _(public)_
- `setFontItalic(b As Boolean)` _(public)_
- `setFontSize(i As Int)` _(public)_
- `setFormat(s As String)` _(public)_
- `setHeight(i As Int)` _(public)_
- `setLineColor(s As String)` _(public)_
- `setMargin(i As Int)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setMarginBottom(i As Int)` _(public)_
- `setMarginLeft(i As Int)` _(public)_
- `setMarginRight(i As Int)` _(public)_
- `setMarginTop(i As Int)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setParentID(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setPositionStyle(s As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `setStyles(s As String)` _(public)_
- `setText(s As String)` _(public)_
- `setTextAlign(s As String)` _(public)_
- `setTextMargin(i As Int)` _(public)_
- `setTextPosition(s As String)` _(public)_
- `setValue(text As String)` _(public)_
- `setVisible(b As Boolean)` _(public)_
- `setWidth(i As Int)` _(public)_

## Getters (34)
- `getAttributes()` _(public)_
- `getBackground()` _(public)_
- `getClasses()` _(public)_
- `getDisplayValue()` _(public)_
- `getEnabled()` _(public)_
- `getFlat()` _(public)_
- `getFont()` _(public)_
- `getFontBold()` _(public)_
- `getFontItalic()` _(public)_
- `getFontSize()` _(public)_
- `getFormat()` _(public)_
- `getHeight()` _(public)_
- `getHere()` As String _(public)_
- `getID()` As String _(public)_
- `getLineColor()` _(public)_
- `getMargin()` _(public)_
- `getMarginAXYTBLR()` _(public)_
- `getMarginBottom()` _(public)_
- `getMarginLeft()` _(public)_
- `getMarginRight()` _(public)_
- `getMarginTop()` _(public)_
- `getPaddingAXYTBLR()` _(public)_
- `getParentID()` _(public)_
- `getPosition()` _(public)_
- `getPositionStyle()` _(public)_
- `GetProperties()` _(public)_
- `getStyles()` _(public)_
- `getText()` _(public)_
- `getTextAlign()` _(public)_
- `getTextMargin()` _(public)_
- `getTextPosition()` _(public)_
- `getValue()` _(public)_
- `getVisible()` _(public)_
- `getWidth()` _(public)_

## Private Methods (1)
- `SetDefaults()` _(private)_

## Verified Demo Usage

Real syntax from [`pgBarCode.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgBarCode.bas) (verified demo):

```b4j
Private SDUI5BarCode1 As SDUI5BarCode		'ignore
BANano.Await(SDUI5Container1.AddComponent)
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
