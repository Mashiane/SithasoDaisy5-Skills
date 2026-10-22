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
| `BackgroundColor` | String | white | — | — | — |
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
## Public Methods (27)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `OnEvent(event As String, methodName As String)` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Refresh()` As 'ignoredeadcode _(public)_
- `Clear()` _(public)_
- `IsBlank()` As Boolean _(public)_
- `ResetValidation()` _(public)_
- `HintError(s As String)` As 'ignoredeadcode _(public)_
- `download()` _(public)_
- `fromData(data As Object)` _(public)_
- `fromDataURL(dataURL As String)` _(public)_
- `draw()` _(public)_
- `erase()` _(public)_
- `toData()` As Object _(public)_
- `undo()` _(public)_
- `toBlob()` As Object _(public)_
- `toFile(mFileName As String)` As BANanoObject _(public)_
- `toDataURL()` As String _(public)_
- `isEmpty()` As Boolean _(public)_
- `off()` _(public)_
- `on()` _(public)_
- `ClearEnabled(b As Boolean)` _(public)_
- `SaveEnabled(b As Boolean)` _(public)_
## Key Setters (33)
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
- `setSaveCaption(s As String)` As 'ignoredeadcode _(public)_
- `setButtonCaption(s As String)` As 'ignoredeadcode _(public)_
- `setCenterFieldSet(b As Boolean)` As 'ignoredeadcode _(public)_
- `setSaveColor(s As String)` As 'ignoredeadcode _(public)_
- `setSaveTextColor(s As String)` As 'ignoredeadcode _(public)_
- `setButtonColor(s As String)` As 'ignoredeadcode _(public)_
- `setButtonDisabled(b As Boolean)` As 'ignoredeadcode _(public)_
- `setButtonTextColor(s As String)` As 'ignoredeadcode _(public)_
- `setCaption(s As String)` _(public)_
- `setCaptionColor(s As String)` As 'ignoredeadcode _(public)_
- `setDotSize(s As Double)` _(public)_
- `setErrorMessage(s As String)` _(public)_
- `setHeight(s As String)` As 'ignoredeadcode _(public)_
- `setHint(s As String)` _(public)_
- `setImageType(s As String)` _(public)_
- `setMaxWidth(s As Double)` _(public)_
- `setMinDistance(s As Int)` _(public)_
- `setMinWidth(s As Double)` _(public)_
- `setPenColor(s As String)` _(public)_
- `setThrottle(s As Int)` _(public)_
- `setVelocityFilterWeight(s As Double)` _(public)_
- `setWidth(s As String)` As 'ignoredeadcode _(public)_
- `setValue(dataURL As String)` _(public)_
## Getters (35)
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
- `getSaveCaption()` As String _(public)_
- `getButtonCaption()` As String _(public)_
- `getCenterFieldSet()` As Boolean _(public)_
- `getSaveColor()` As String _(public)_
- `getSaveTextColor()` As String _(public)_
- `getButtonColor()` As String _(public)_
- `getButtonDisabled()` As Boolean _(public)_
- `getButtonTextColor()` As String _(public)_
- `getCaption()` As String _(public)_
- `getCaptionColor()` As String _(public)_
- `getDotSize()` As Double _(public)_
- `getErrorMessage()` As String _(public)_
- `getHeight()` As String _(public)_
- `getHint()` As String _(public)_
- `getImageType()` As String _(public)_
- `getMaxWidth()` As Double _(public)_
- `getMinDistance()` As Int _(public)_
- `getMinWidth()` As Double _(public)_
- `getPenColor()` As String _(public)_
- `getThrottle()` As Int _(public)_
- `getVelocityFilterWeight()` As Double _(public)_
- `getWidth()` As String _(public)_
- `getValue()` As String _(public)_
## Private Methods (0)
_(none)_
## Verified Demo Usage

Real syntax from [`pgSignaturePad.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgSignaturePad.bas) (verified demo). `SDUI5SignaturePad1` = a SDUI5SignaturePad.

```b4j
	SDUI5SignaturePad1.Initialize(Me, "SDUI5SignaturePad1", "SDUI5SignaturePad1")
	SDUI5SignaturePad1.ParentID = "SDUI5Column1"
	SDUI5SignaturePad1.ButtonColor = "error"
	SDUI5SignaturePad1.ButtonCaption = "Clear Signature"
	BANano.Await(SDUI5SignaturePad1.AddComponent)
```

Demo-wired events: `Save` — handlers named `SDUI5SignaturePad1_<Event>`.
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


