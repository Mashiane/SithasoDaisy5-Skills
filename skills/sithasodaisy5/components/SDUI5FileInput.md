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
## Public Methods (26)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Focus()` _(public)_
- `HintError(s As String)` As 'ignoredeadcode _(public)_
- `ChangeSingle()` _(public)_
- `ChangeMultiple()` _(public)_
- `GetFiles()` As List _(public)_
- `GetFile()` As Map _(public)_
- `GetFileDataURL()` As String _(public)_
- `Nullify()` _(public)_
- `IsBlank()` As Boolean _(public)_
- `ResetValidation()` _(public)_
- `CamCorder()` _(public)_
- `Microphone()` _(public)_
- `BackCamera()` _(public)_
- `FrontCamera()` _(public)_
- `AcceptVideosOnly()` _(public)_
- `AcceptImagesOnly()` _(public)_
- `AcceptJSON()` _(public)_
- `AcceptExcel()` _(public)_
- `AcceptPDF()` _(public)_
- `AccectWord()` _(public)_
## Key Setters (36)
- `setLegendColor(s As String)` As 'ignoredeadcode _(public)_
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
- `setCapture(s As String)` As 'ignoredeadcode _(public)_
- `setAccept(s As String)` As 'ignoredeadcode _(public)_
- `setButtonSize(s As String)` As 'ignoredeadcode _(public)_
- `setIcon(s As String)` As 'ignoredeadcode _(public)_
- `setIconColor(s As String)` As 'ignoredeadcode _(public)_
- `setIconSize(s As String)` As 'ignoredeadcode _(public)_
- `setMultiple(b As Boolean)` As 'ignoredeadcode _(public)_
- `setProgressValue(s As String)` As 'ignoredeadcode _(public)_
- `setBackgroundColor(s As String)` As 'ignoredeadcode _(public)_
- `setBorder(b As Boolean)` As 'ignoredeadcode _(public)_
- `setBorderColor(s As String)` As 'ignoredeadcode _(public)_
- `setRoundedBox(b As Boolean)` As 'ignoredeadcode _(public)_
- `setShadow(s As String)` As 'ignoredeadcode _(public)_
- `setHideSelectorButton(b As Boolean)` As 'ignoredeadcode _(public)_
- `setWidth(s As String)` As 'ignoredeadcode _(public)_
- `setInputType(s As String)` _(public)_
- `setColor(s As String)` As 'ignoredeadcode _(public)_
- `setGhost(b As Boolean)` As 'ignoredeadcode _(public)_
- `setHint(s As String)` _(public)_
- `setLabel(s As String)` _(public)_
- `setRequired(b As Boolean)` As 'ignoredeadcode _(public)_
- `setSize(s As String)` As 'ignoredeadcode _(public)_
- `setValidator(b As Boolean)` _(public)_
- `setValidatorHint(s As String)` _(public)_
- `setValue(v As Object)` _(public)_
## Getters (38)
- `getID()` As String _(public)_
- `getLegendColor()` As String _(public)_
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
- `getCapture()` As String _(public)_
- `getAccept()` As String _(public)_
- `getButtonSize()` As String _(public)_
- `getIcon()` As String _(public)_
- `getIconColor()` As String _(public)_
- `getIconSize()` As String _(public)_
- `getMultiple()` As Boolean _(public)_
- `getProgressValue()` As String _(public)_
- `getBackgroundColor()` As String _(public)_
- `getBorder()` As Boolean _(public)_
- `getBorderColor()` As String _(public)_
- `getRoundedBox()` As Boolean _(public)_
- `getShadow()` As String _(public)_
- `getHideSelectorButton()` As Boolean _(public)_
- `getWidth()` As String _(public)_
- `getInputType()` As String _(public)_
- `getColor()` As String _(public)_
- `getGhost()` As Boolean _(public)_
- `getHint()` As String _(public)_
- `getLabel()` As String _(public)_
- `getRequired()` As Boolean _(public)_
- `getSize()` As String _(public)_
- `getValidator()` As Boolean _(public)_
- `getValidatorHint()` As String _(public)_
- `getValue()` As Object _(public)_
## Private Methods (0)
_(none)_
## Verified Demo Usage

Real syntax from [`pgFileInput.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgFileInput.bas) (verified demo). `SDUI5FileInput23` = a SDUI5FileInput.

```b4j
	SDUI5FileInput23.Initialize(Me, "SDUI5FileInput23", "SDUI5FileInput23")
	SDUI5FileInput23.ParentID = "SDUI5Column10"
	SDUI5FileInput23.Color = "info"
	SDUI5FileInput23.Hint = "Max size 2MB"
	SDUI5FileInput23.InputType = "progress"
	SDUI5FileInput23.Label = "Legend File"
	SDUI5FileInput23.PaddingAXYTBLR = "a=4; x=?; y=?; t=?; b=?; l=?; r=?"
	SDUI5FileInput23.ProgressValue = "65"
	SDUI5FileInput23.Required = True
	SDUI5FileInput23.RoundedBox = True
	SDUI5FileInput23.Shadow = "lg"
	BANano.Await(SDUI5FileInput23.AddComponent)
```

Demo-wired events: `Change` — handlers named `SDUI5FileInput23_<Event>`.

Also used in: `pgModal`, `pgValidation`
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


