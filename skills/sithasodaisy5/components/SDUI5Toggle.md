---
name: SDUI5Toggle
description: SithasoDaisy5 SDUI5Toggle component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5Toggle

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5Toggle.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5Toggle.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgIndex.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgIndex.bas)
  - [`pgToggle.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgToggle.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5Toggle is a daisyUI toggle (switch) input with label, hint, legend (group), Checked/CheckedColor/UncheckedColor, Indeterminate, Required, Validator/ValidatorHint, Size. **ToggleType controls label placement: `normal` renders the toggle with no label, `legend` renders the `Label` as a group legend, `left-label`/`right-label` render the `Label` to the left/right of the toggle.** Set `ToggleType` to one of the label modes (`legend`, `left-label`, `right-label`) for the `Label` to display; `normal` shows no label. Use GetValue/SetValue and Validate/IsValid; Checked state persists via Checked prop.
_SDUI5Toggle is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `ToggleType` | String | normal | legend, normal, left-label, right-label | `setToggleType` | `getToggleType` |
| `Legend` | String | Toggle | — | `setLegend` | `getLegend` |
| `LegendColor` | String | — | — | `setLegendColor` | `getLegendColor` |
| `Label` | String | Turn On | — | `setLabel` | `getLabel` |
| `LabelColor` | String | — | — | `setLabelColor` | `getLabelColor` |
| `Checked` | Boolean | False | — | `setChecked` | `getChecked` |
| `Value` | String | — | — | `setValue` | `getValue` |
| `Color` | String | none | accent, error, info, neutral, none, primary, secondary, success, warning | `setColor` | `getColor` |
| `CheckedColor` | String | — | — | `setCheckedColor` | `getCheckedColor` |
| `Size` | String | none | lg, md, none, sm, xl, xs | `setSize` | `getSize` |
| `Hint` | String | — | — | `setHint` | `getHint` |
| `Indeterminate` | Boolean | False | — | `setIndeterminate` | `getIndeterminate` |
| `Required` | Boolean | False | — | `setRequired` | `getRequired` |
| `ThemeController` | Boolean | False | — | `setThemeController` | `getThemeController` |
| `Validator` | Boolean | False | — | `setValidator` | `getValidator` |
| `ValidatorHint` | String | — | — | `setValidatorHint` | `getValidatorHint` |
| `BackgroundColor` | String | base-200 | — | `setBackgroundColor` | `getBackgroundColor` |
| `Border` | Boolean | True | — | `setBorder` | `getBorder` |
| `BorderColor` | String | base-300 | — | `setBorderColor` | `getBorderColor` |
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
`Change`

Wire in parent: `Sub toggle_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (10)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Focus()` _(public)_
- `HintError(s As String)` As 'ignoredeadcode _(public)_
- `IsBlank()` As Boolean _(public)_
- `ResetValidation()` _(public)_
## Key Setters (32)
- `setParentID(s As String)` _(public)_
- `setLegendColor(s As String)` As 'ignoredeadcode _(public)_
- `setVisible(b As Boolean)` _(public)_
- `setEnabled(b As Boolean)` As 'ignoredeadcode _(public)_
- `setPositionStyle(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setAttributes(s As String)` _(public)_
- `setStyles(s As String)` _(public)_
- `setClasses(s As String)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setValue(s As String)` As 'ignoredeadcode _(public)_
- `setThemeController(b As Boolean)` As 'ignoredeadcode _(public)_
- `setLabelColor(s As String)` As 'ignoredeadcode _(public)_
- `setBackgroundColor(s As String)` As 'ignoredeadcode _(public)_
- `setBorder(b As Boolean)` As 'ignoredeadcode _(public)_
- `setBorderColor(s As String)` As 'ignoredeadcode _(public)_
- `setRoundedBox(b As Boolean)` As 'ignoredeadcode _(public)_
- `setShadow(s As String)` As 'ignoredeadcode _(public)_
- `setToggleType(s As String)` _(public)_
- `setChecked(b As Boolean)` As 'ignoredeadcode _(public)_
- `setCheckedColor(s As String)` As 'ignoredeadcode _(public)_
- `setColor(s As String)` As 'ignoredeadcode _(public)_
- `setHint(s As String)` _(public)_
- `setIndeterminate(b As Boolean)` As 'ignoredeadcode _(public)_
- `setLabel(s As String)` _(public)_
- `setLegend(s As String)` _(public)_
- `setRequired(b As Boolean)` As 'ignoredeadcode _(public)_
- `setSize(s As String)` As 'ignoredeadcode _(public)_
- `setUncheckedColor(s As String)` As 'ignoredeadcode _(public)_
- `setValidator(b As Boolean)` _(public)_
- `setValidatorHint(s As String)` _(public)_
## Getters (34)
- `getID()` As String _(public)_
- `getParentID()` As String _(public)_
- `getHere()` As String _(public)_
- `getLegendColor()` As String _(public)_
- `getVisible()` As Boolean _(public)_
- `getEnabled()` As Boolean _(public)_
- `getPositionStyle()` As String _(public)_
- `getPosition()` As String _(public)_
- `getAttributes()` As String _(public)_
- `getStyles()` As String _(public)_
- `getClasses()` As String _(public)_
- `getPaddingAXYTBLR()` As String _(public)_
- `getMarginAXYTBLR()` As String _(public)_
- `getValue()` As String _(public)_
- `getThemeController()` As Boolean _(public)_
- `getLabelColor()` As String _(public)_
- `getLegend()` As String _(public)_
- `getBackgroundColor()` As String _(public)_
- `getBorder()` As Boolean _(public)_
- `getBorderColor()` As String _(public)_
- `getRoundedBox()` As Boolean _(public)_
- `getShadow()` As String _(public)_
- `getToggleType()` As String _(public)_
- `getChecked()` As Boolean _(public)_
- `getCheckedColor()` As String _(public)_
- `getColor()` As String _(public)_
- `getHint()` As String _(public)_
- `getIndeterminate()` As Boolean _(public)_
- `getLabel()` As String _(public)_
- `getRequired()` As Boolean _(public)_
- `getSize()` As String _(public)_
- `getUncheckedColor()` As String _(public)_
- `getValidator()` As Boolean _(public)_
- `getValidatorHint()` As String _(public)_
## Private Methods (1)
- `SetDefaults()` _(private)_
## Verified Demo Usage

Real syntax from [`pgToggle.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgToggle.bas) (verified demo). `SDUI5Toggle1` = a SDUI5Toggle.

```b4j
	SDUI5Toggle1.Initialize(Me, "SDUI5Toggle1", "SDUI5Toggle1")
	SDUI5Toggle1.ParentID = "SDUI5Column1"
	SDUI5Toggle1.Checked = False
	SDUI5Toggle1.CheckedColor = ""
	SDUI5Toggle1.Color = "none"
	SDUI5Toggle1.Enabled = True
	SDUI5Toggle1.Hint = ""
	SDUI5Toggle1.Indeterminate = False
	SDUI5Toggle1.Label = "Turn On"
	SDUI5Toggle1.Legend = "Toggle"
	SDUI5Toggle1.MarginAXYTBLR = "a=?; x=?; y=?; t=?; b=?; l=?; r=?"
	SDUI5Toggle1.PaddingAXYTBLR = "a=?; x=?; y=?; t=?; b=?; l=?; r=?"
	SDUI5Toggle1.Position = "t=?; b=?; r=?; l=?"
	SDUI5Toggle1.PositionStyle = "none"
	SDUI5Toggle1.Attributes = ""
	SDUI5Toggle1.Classes = ""
	SDUI5Toggle1.Styles = ""
	SDUI5Toggle1.Required = False
	SDUI5Toggle1.Size = "none"
	SDUI5Toggle1.ToggleType = "normal"
	SDUI5Toggle1.Validator = False
	SDUI5Toggle1.ValidatorHint = ""
	SDUI5Toggle1.Visible = True
	BANano.Await(SDUI5Toggle1.AddComponent)
```

Demo-wired events: `Change` — handlers named `SDUI5Toggle1_<Event>`.

Also used in: `pgIndex`
## Emits (daisyUI classes pushed in DesignerCreateView)
_(none emitted directly — relies on base/CustProps)_
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim toggle As SDUI5Toggle
toggle.Initialize(Me, "SDUI5Toggle", "SDUI5Toggle")
toggle.ParentID = "placeholder"
BANano.Await(toggle.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Shared helpers: Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/TextSize/BackgroundImage. Dimensions are component-specific: this component exposes neither Width nor Height; use `Classes` utilities for sizing when needed.
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.


