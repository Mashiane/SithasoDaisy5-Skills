---
name: SDUI5FileInput
description: SithasoDaisy5 SDUI5FileInput component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5FileInput

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5FileInput.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5FileInput.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgFileInput.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgFileInput.bas)
  - [`pgModal.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgModal.bas)
  - [`pgValidation.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgValidation.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5FileInput is a daisyUI file input with drag-and-drop, preview, multiple files, camera/microphone/progress affordances, validation, and sizing. **InputType controls label rendering: `normal` renders a bare input (no label), `legend`/`label-input` render the `Label` above the input, `buttons`/`buttons-floating` add prepend/append buttons, `microphone`/`progress`/`camera`/`camcorder` and their `legend-*` variants add those affordances.** Set `InputType = "legend"` (or `"label-input"`) for the label to display. Use GetValue/SetValue and Validate/IsValid for form handling.
_SDUI5FileInput is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `InputType` | String | normal | normal, legend, buttons, label-input, microphone, progress, camera, camcorder, legend-microphone, legend-progress, legend-camera, legend-camcorder | `setInputType` | `getInputType` |
| `Label` | String | Please select a file | — | `setLabel` | `getLabel` |
| `LegendColor` | String | — | — | `setLegendColor` | `getLegendColor` |
| `Color` | String | none | — | `setColor` | `getColor` |
| `Ghost` | Boolean | False | — | `setGhost` | `getGhost` |
| `HideSelectorButton` | Boolean | False | — | `setHideSelectorButton` | `getHideSelectorButton` |
| `Hint` | String | — | — | `setHint` | `getHint` |
| `Required` | Boolean | False | — | `setRequired` | `getRequired` |
| `Size` | String | none | lg, md, none, sm, xl, xs | `setSize` | `getSize` |
| `Width` | String | full | — | `setWidth` | `getWidth` |
| `Validator` | Boolean | False | — | `setValidator` | `getValidator` |
| `ValidatorHint` | String | — | — | `setValidatorHint` | `getValidatorHint` |
| `BackgroundColor` | String | base-200 | — | `setBackgroundColor` | `getBackgroundColor` |
| `Border` | Boolean | True | — | `setBorder` | `getBorder` |
| `BorderColor` | String | base-300 | — | `setBorderColor` | `getBorderColor` |
| `RoundedBox` | Boolean | False | — | `setRoundedBox` | `getRoundedBox` |
| `Shadow` | String | none | 2xl, inner, lg, md, none, shadow, sm, xl | `setShadow` | `getShadow` |
| `Accept` | String | — | — | `setAccept` | `getAccept` |
| `Capture` | String | none | environment, none, user | `setCapture` | `getCapture` |
| `Multiple` | Boolean | False | — | `setMultiple` | `getMultiple` |
| `ButtonSize` | String | 80px | — | `setButtonSize` | `getButtonSize` |
| `Icon` | String | — | — | `setIcon` | `getIcon` |
| `IconColor` | String | #ffffff | — | `setIconColor` | `getIconColor` |
| `IconSize` | String | 42px | — | `setIconSize` | `getIconSize` |
| `ProgressValue` | String | — | — | `setProgressValue` | `getProgressValue` |
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
`Change`

Wire in parent: `Sub fileinput_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (22)
- `AccectWord()` _(public)_
- `AcceptExcel()` _(public)_
- `AcceptImagesOnly()` _(public)_
- `AcceptJSON()` _(public)_
- `AcceptPDF()` _(public)_
- `AcceptVideosOnly()` _(public)_
- `AddComponent()` _(public)_
- `BackCamera()` _(public)_
- `CamCorder()` _(public)_
- `ChangeMultiple()` _(public)_
- `ChangeSingle()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Focus()` _(public)_
- `FrontCamera()` _(public)_
- `HintError(s As String)` _(public)_
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `IsBlank()` _(public)_
- `Microphone()` _(public)_
- `Nullify()` _(public)_
- `Remove()` _(public)_
- `ResetValidation()` _(public)_
- `TriggerClick()` _(public)_

## Key Setters (37)
- `setAccept(s As String)` _(public)_
- `setAttributes(s As String)` _(public)_
- `setBackgroundColor(s As String)` _(public)_
- `setBorder(b As Boolean)` _(public)_
- `setBorderColor(s As String)` _(public)_
- `setButtonSize(s As String)` _(public)_
- `setCapture(s As String)` _(public)_
- `setClasses(s As String)` _(public)_
- `setColor(s As String)` _(public)_
- `setEnabled(b As Boolean)` _(public)_
- `setGhost(b As Boolean)` _(public)_
- `setHideSelectorButton(b As Boolean)` _(public)_
- `setHint(s As String)` _(public)_
- `setIcon(s As String)` _(public)_
- `setIconColor(s As String)` _(public)_
- `setIconSize(s As String)` _(public)_
- `setInputType(s As String)` _(public)_
- `setLabel(s As String)` _(public)_
- `setLegendColor(s As String)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setMultiple(b As Boolean)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setParentID(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setPositionStyle(s As String)` _(public)_
- `setProgressValue(s As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `setRequired(b As Boolean)` _(public)_
- `setRoundedBox(b As Boolean)` _(public)_
- `setShadow(s As String)` _(public)_
- `setSize(s As String)` _(public)_
- `setStyles(s As String)` _(public)_
- `setValidator(b As Boolean)` _(public)_
- `setValidatorHint(s As String)` _(public)_
- `setValue(v As Object)` _(public)_
- `setVisible(b As Boolean)` _(public)_
- `setWidth(s As String)` _(public)_

## Getters (42)
- `getAccept()` _(public)_
- `getAttributes()` _(public)_
- `getBackgroundColor()` _(public)_
- `getBorder()` _(public)_
- `getBorderColor()` _(public)_
- `getButtonSize()` _(public)_
- `getCapture()` _(public)_
- `getClasses()` _(public)_
- `getColor()` _(public)_
- `getEnabled()` _(public)_
- `GetFile()` _(public)_
- `GetFileDataURL()` _(public)_
- `GetFiles()` _(public)_
- `getGhost()` _(public)_
- `getHere()` As String _(public)_
- `getHideSelectorButton()` _(public)_
- `getHint()` _(public)_
- `getIcon()` _(public)_
- `getIconColor()` _(public)_
- `getIconSize()` _(public)_
- `getID()` As String _(public)_
- `getInputType()` _(public)_
- `getLabel()` _(public)_
- `getLegendColor()` _(public)_
- `getMarginAXYTBLR()` _(public)_
- `getMultiple()` _(public)_
- `getPaddingAXYTBLR()` _(public)_
- `getParentID()` _(public)_
- `getPosition()` _(public)_
- `getPositionStyle()` _(public)_
- `getProgressValue()` _(public)_
- `GetProperties()` _(public)_
- `getRequired()` _(public)_
- `getRoundedBox()` _(public)_
- `getShadow()` _(public)_
- `getSize()` _(public)_
- `getStyles()` _(public)_
- `getValidator()` _(public)_
- `getValidatorHint()` _(public)_
- `getValue()` _(public)_
- `getVisible()` _(public)_
- `getWidth()` _(public)_

## Private Methods (2)
- `FileButtonClick(event As BANanoEvent)` _(private)_
- `SetDefaults()` _(private)_

## Verified Demo Usage

Real syntax from [`pgFileInput.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgFileInput.bas) (verified demo):

```b4j
Private SDUI5FileInput1 As SDUI5FileInput		'ignore
Private SDUI5FileInput10 As SDUI5FileInput		'ignore
Private SDUI5FileInput11 As SDUI5FileInput		'ignore
Private SDUI5FileInput12 As SDUI5FileInput		'ignore
Private SDUI5FileInput13 As SDUI5FileInput		'ignore
Private SDUI5FileInput14 As SDUI5FileInput		'ignore
Private SDUI5FileInput15 As SDUI5FileInput		'ignore
Private SDUI5FileInput16 As SDUI5FileInput		'ignore
Private SDUI5FileInput17 As SDUI5FileInput		'ignore
Private SDUI5FileInput18 As SDUI5FileInput		'ignore
Private SDUI5FileInput19 As SDUI5FileInput		'ignore
BANano.Await(SDUI5Container1.AddComponent)
```

## Emits (daisyUI classes pushed in DesignerCreateView)
_(none emitted directly — relies on base/CustProps)_
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim fileinput As SDUI5FileInput
fileinput.Initialize(Me, "SDUI5FileInput", "SDUI5FileInput")
fileinput.ParentID = "placeholder"
BANano.Await(fileinput.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Shared helpers: Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/TextSize/BackgroundImage. Dimensions are component-specific: this component exposes Width, but not Height; use only dimensions listed in this component's properties and methods above.
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.
