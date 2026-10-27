---
name: SDUI5SignaturePad
description: SithasoDaisy5 SDUI5SignaturePad component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5SignaturePad

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5SignaturePad.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5SignaturePad.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgSignaturePad.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgSignaturePad.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5SignaturePad is a signature capture canvas. Use for collecting signatures.
_SDUI5SignaturePad is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `Caption` | String | Signature | — | `setCaption` | `getCaption` |
| `CaptionColor` | String | none | — | `setCaptionColor` | `getCaptionColor` |
| `ButtonCaption` | String | Clear | — | `setButtonCaption` | `getButtonCaption` |
| `ButtonColor` | String | neutral | accent, error, info, neutral, none, primary, secondary, success, warning | `setButtonColor` | `getButtonColor` |
| `ButtonDisabled` | Boolean | False | — | `setButtonDisabled` | `getButtonDisabled` |
| `ButtonTextColor` | String | none | — | `setButtonTextColor` | `getButtonTextColor` |
| `SaveCaption` | String | Save | — | `setSaveCaption` | `getSaveCaption` |
| `SaveColor` | String | success | accent, error, info, neutral, none, primary, secondary, success, warning | `setSaveColor` | `getSaveColor` |
| `SaveTextColor` | String | none | — | `setSaveTextColor` | `getSaveTextColor` |
| `ErrorMessage` | String | The signature is required | — | `setErrorMessage` | `getErrorMessage` |
| `Hint` | String | Please sign within the box area | — | `setHint` | `getHint` |
| `DotSize` | String | 0 | — | `setDotSize` | `getDotSize` |
| `Height` | String | 200 | — | `setHeight` | `getHeight` |
| `Width` | String | 400 | — | `setWidth` | `getWidth` |
| `ImageType` | String | jpeg | jpeg, png, svg | `setImageType` | `getImageType` |
| `BackgroundColor` | String | white | — | `setBackgroundColor` | `getBackgroundColor` |
| `MaxWidth` | String | 2.5 | — | `setMaxWidth` | `getMaxWidth` |
| `MinDistance` | String | 5 | — | `setMinDistance` | `getMinDistance` |
| `MinWidth` | String | 0.5 | — | `setMinWidth` | `getMinWidth` |
| `PenColor` | String | black | — | `setPenColor` | `getPenColor` |
| `Throttle` | String | 16 | — | `setThrottle` | `getThrottle` |
| `VelocityFilterWeight` | String | 0.7 | — | `setVelocityFilterWeight` | `getVelocityFilterWeight` |
| `Visible` | Boolean | True | — | `setVisible` | `getVisible` |
| `CenterFieldSet` | Boolean | False | — | `setCenterFieldSet` | `getCenterFieldSet` |
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
`Save`

Wire in parent: `Sub signaturepad_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (25)
- `AddComponent()` _(public)_
- `Clear()` _(public)_
- `ClearEnabled(b As Boolean)` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `download()` _(public)_
- `draw()` _(public)_
- `erase()` _(public)_
- `fromData(data As Object)` _(public)_
- `fromDataURL(dataURL As String)` _(public)_
- `HintError(s As String)` _(public)_
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `IsBlank()` _(public)_
- `isEmpty()` _(public)_
- `off()` _(public)_
- `on()` _(public)_
- `OnEvent(event As String, methodName As String)` _(public)_
- `Refresh()` _(public)_
- `Remove()` _(public)_
- `ResetValidation()` _(public)_
- `SaveEnabled(b As Boolean)` _(public)_
- `toBlob()` _(public)_
- `toData()` _(public)_
- `toDataURL()` _(public)_
- `toFile(mFileName As String)` As BANanoObject _(public)_
- `undo()` _(public)_

## Key Setters (35)
- `setAttributes(s As String)` _(public)_
- `setBackgroundColor(s As String)` _(public)_
- `setButtonCaption(s As String)` _(public)_
- `setButtonColor(s As String)` _(public)_
- `setButtonDisabled(b As Boolean)` _(public)_
- `setButtonTextColor(s As String)` _(public)_
- `setCaption(s As String)` _(public)_
- `setCaptionColor(s As String)` _(public)_
- `setCenterFieldSet(b As Boolean)` _(public)_
- `setClasses(s As String)` _(public)_
- `setDotSize(s As Double)` _(public)_
- `setEnabled(b As Boolean)` _(public)_
- `setErrorMessage(s As String)` _(public)_
- `setHeight(s As String)` _(public)_
- `setHint(s As String)` _(public)_
- `setImageType(s As String)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setMaxWidth(s As Double)` _(public)_
- `setMinDistance(s As Int)` _(public)_
- `setMinWidth(s As Double)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setParentID(s As String)` _(public)_
- `setPenColor(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setPositionStyle(s As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `setSaveCaption(s As String)` _(public)_
- `setSaveColor(s As String)` _(public)_
- `setSaveTextColor(s As String)` _(public)_
- `setStyles(s As String)` _(public)_
- `setThrottle(s As Int)` _(public)_
- `setValue(dataURL As String)` _(public)_
- `setVelocityFilterWeight(s As Double)` _(public)_
- `setVisible(b As Boolean)` _(public)_
- `setWidth(s As String)` _(public)_

## Getters (37)
- `getAttributes()` _(public)_
- `getBackgroundColor()` _(public)_
- `getButtonCaption()` _(public)_
- `getButtonColor()` _(public)_
- `getButtonDisabled()` _(public)_
- `getButtonTextColor()` _(public)_
- `getCaption()` _(public)_
- `getCaptionColor()` _(public)_
- `getCenterFieldSet()` _(public)_
- `getClasses()` _(public)_
- `getDotSize()` _(public)_
- `getEnabled()` _(public)_
- `getErrorMessage()` _(public)_
- `getHeight()` _(public)_
- `getHere()` As String _(public)_
- `getHint()` _(public)_
- `getID()` As String _(public)_
- `getImageType()` _(public)_
- `getMarginAXYTBLR()` _(public)_
- `getMaxWidth()` _(public)_
- `getMinDistance()` _(public)_
- `getMinWidth()` _(public)_
- `getPaddingAXYTBLR()` _(public)_
- `getParentID()` _(public)_
- `getPenColor()` _(public)_
- `getPosition()` _(public)_
- `getPositionStyle()` _(public)_
- `GetProperties()` _(public)_
- `getSaveCaption()` _(public)_
- `getSaveColor()` _(public)_
- `getSaveTextColor()` _(public)_
- `getStyles()` _(public)_
- `getThrottle()` _(public)_
- `getValue()` _(public)_
- `getVelocityFilterWeight()` _(public)_
- `getVisible()` _(public)_
- `getWidth()` _(public)_

## Private Methods (3)
- `ClearSignature(e As BANanoEvent)` _(private)_
- `SaveSignature(e As BANanoEvent)` _(private)_
- `SetDefaults()` _(private)_

## Verified Demo Usage

Real syntax from [`pgSignaturePad.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgSignaturePad.bas) (verified demo):

```b4j
Private SDUI5SignaturePad1 As SDUI5SignaturePad		'ignore
BANano.Await(SDUI5Container1.AddComponent)
```

## Emits (daisyUI classes pushed in DesignerCreateView)
_(none emitted directly — relies on base/CustProps)_
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim signaturepad As SDUI5SignaturePad
signaturepad.Initialize(Me, "SDUI5SignaturePad", "SDUI5SignaturePad")
signaturepad.ParentID = "placeholder"
BANano.Await(signaturepad.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.
