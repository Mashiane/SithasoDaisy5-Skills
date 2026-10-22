---
name: SDUI5BarcodeReader
description: SithasoDaisy5 SDUI5BarcodeReader component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5BarcodeReader

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5BarcodeReader.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5BarcodeReader.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgBarcodeReader.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgBarcodeReader.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5BarcodeReader reads barcodes via camera. Use for scanning products/assets.
_SDUI5BarcodeReader is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `Camera` | String | environment | environment, user | `setCamera` | `getCamera` |
| `Fps` | Int | 5 | — | `setFps` | `getFps` |
| `Torch` | Boolean | False | — | `setTorch` | `getTorch` |
| `RememberLastUsedCamera` | Boolean | False | — | `setRememberLastUsedCamera` | `getRememberLastUsedCamera` |
| `Height` | String | 500px | — | `setHeight` | `getHeight` |
| `Width` | String | 500px | — | `setWidth` | `getWidth` |
| `QrboxHeight` | Int | 250 | — | `setQrboxHeight` | `getQrboxHeight` |
| `QrboxWidth` | Int | 250 | — | `setQrboxWidth` | `getQrboxWidth` |
| `Rounded` | String | none | none, rounded, 2xl, 3xl, full, lg, md, sm, xl, 0 | `setRounded` | `getRounded` |
| `RoundedBox` | Boolean | True | — | `setRoundedBox` | `getRoundedBox` |
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
`Click`, `ScanFailure`, `ScanSuccess`

Wire in parent: `Sub barcodereader_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (12)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `OnEvent(event As String, methodName As String)` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Restart()` _(public)_
- `StopScanWait()` As Boolean _(public)_
- `Pause(shouldPauseVideo As Boolean)` _(public)_
- `Resume()` _(public)_
- `StartScanWait()` As Boolean _(public)_
## Key Setters (21)
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
- `setCamera(s As String)` _(public)_
- `setFps(i As Int)` _(public)_
- `setHeight(s As String)` _(public)_
- `setQrboxHeight(i As Int)` _(public)_
- `setQrboxWidth(i As Int)` _(public)_
- `setRememberLastUsedCamera(b As Boolean)` _(public)_
- `setRounded(s As String)` _(public)_
- `setRoundedBox(b As Boolean)` _(public)_
- `setShadow(s As String)` _(public)_
- `setTorch(b As Boolean)` _(public)_
- `setWidth(s As String)` _(public)_
## Getters (23)
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
- `getCamera()` As String _(public)_
- `getFps()` As Int _(public)_
- `getHeight()` As String _(public)_
- `getQrboxHeight()` As Int _(public)_
- `getQrboxWidth()` As Int _(public)_
- `getRememberLastUsedCamera()` As Boolean _(public)_
- `getRounded()` As String _(public)_
- `getRoundedBox()` As Boolean _(public)_
- `getShadow()` As String _(public)_
- `getTorch()` As Boolean _(public)_
- `getWidth()` As String _(public)_
## Private Methods (0)
_(none)_
## Verified Demo Usage

Real syntax from [`pgBarcodeReader.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgBarcodeReader.bas) (verified demo). `bcr1` = a SDUI5BarcodeReader.

```b4j
	bcr1.Initialize(Me, "bcr1", "bcr1")
	bcr1.ParentID = "SDUI5Column1"
	bcr1.Fps = 10
	bcr1.Rounded = "md"
	bcr1.Shadow = "shadow"
	BANano.Await(bcr1.AddComponent)
```

Demo-wired events: `ScanFailure`, `ScanSuccess` — handlers named `bcr1_<Event>`.
## Emits (daisyUI classes pushed in DesignerCreateView)
_(none emitted directly — relies on base/CustProps)_
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim barcodereader As SDUI5BarcodeReader
barcodereader.Initialize(Me, "SDUI5BarcodeReader", "SDUI5BarcodeReader")
barcodereader.ParentID = "placeholder"
BANano.Await(barcodereader.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.


