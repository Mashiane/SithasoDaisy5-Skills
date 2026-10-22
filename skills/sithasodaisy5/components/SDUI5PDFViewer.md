---
name: SDUI5PDFViewer
description: SithasoDaisy5 SDUI5PDFViewer component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5PDFViewer

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5PDFViewer.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5PDFViewer.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgPDFView.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgPDFView.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5PDFViewer displays a PDF document. Use for in-app PDF viewing.
_SDUI5PDFViewer is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `FileName` | String | — | — | `setFileName` | `getFileName` |
| `Height` | String | 100% | — | `setHeight` | `getHeight` |
| `Width` | String | 100% | — | `setWidth` | `getWidth` |
| `RoundedBox` | Boolean | False | — | `setRoundedBox` | `getRoundedBox` |
| `Shadow` | String | none | 2xl, inner, lg, md, none, shadow, sm, xl | `setShadow` | `getShadow` |
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
`Load`

Wire in parent: `Sub pdfviewer_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (7)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `OnEvent(event As String, methodName As String)` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
## Key Setters (15)
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
- `setFileName(s As String)` As 'ignoredeadcode _(public)_
- `setHeight(s As String)` _(public)_
- `setRoundedBox(b As Boolean)` _(public)_
- `setShadow(s As String)` _(public)_
- `setWidth(s As String)` _(public)_
## Getters (17)
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
- `getFileName()` As String _(public)_
- `getHeight()` As String _(public)_
- `getRoundedBox()` As Boolean _(public)_
- `getShadow()` As String _(public)_
- `getWidth()` As String _(public)_
## Private Methods (0)
_(none)_
## Verified Demo Usage

Real syntax from [`pgPDFView.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgPDFView.bas) (verified demo). `SDUI5PDFViewer1` = a SDUI5PDFViewer.

```b4j
	SDUI5PDFViewer1.Initialize(Me, "SDUI5PDFViewer1", "SDUI5PDFViewer1")
	SDUI5PDFViewer1.ParentID = "SDUI5Column1"
	SDUI5PDFViewer1.FileName = "compressed.tracemonkey-pldi-09.pdf"
	SDUI5PDFViewer1.Height = "800px"
	SDUI5PDFViewer1.Width = "1000px"
	BANano.Await(SDUI5PDFViewer1.AddComponent)
```
## Emits (daisyUI classes pushed in DesignerCreateView)
_(none emitted directly — relies on base/CustProps)_
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim pdfviewer As SDUI5PDFViewer
pdfviewer.Initialize(Me, "SDUI5PDFViewer", "SDUI5PDFViewer")
pdfviewer.ParentID = "placeholder"
BANano.Await(pdfviewer.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.


