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
## Public Methods (8)
- `AddComponent()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Focus()` _(public)_
- `HintError(s As String)` _(public)_
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `IsBlank()` _(public)_
- `Remove()` _(public)_
- `ResetValidation()` _(public)_

## Key Setters (33)
- `setAttributes(s As String)` _(public)_
- `setBackgroundColor(s As String)` _(public)_
- `setBorder(b As Boolean)` _(public)_
- `setBorderColor(s As String)` _(public)_
- `setChecked(b As Boolean)` _(public)_
- `setCheckedColor(s As String)` _(public)_
- `setClasses(s As String)` _(public)_
- `setColor(s As String)` _(public)_
- `setEnabled(b As Boolean)` _(public)_
- `setHint(s As String)` _(public)_
- `setIndeterminate(b As Boolean)` _(public)_
- `setLabel(s As String)` _(public)_
- `setLabelColor(s As String)` _(public)_
- `setLegend(s As String)` _(public)_
- `setLegendColor(s As String)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setParentID(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setPositionStyle(s As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `setRequired(b As Boolean)` _(public)_
- `setRoundedBox(b As Boolean)` _(public)_
- `setShadow(s As String)` _(public)_
- `setSize(s As String)` _(public)_
- `setStyles(s As String)` _(public)_
- `setThemeController(b As Boolean)` _(public)_
- `setToggleType(s As String)` _(public)_
- `setUncheckedColor(s As String)` _(public)_
- `setValidator(b As Boolean)` _(public)_
- `setValidatorHint(s As String)` _(public)_
- `setValue(s As String)` _(public)_
- `setVisible(b As Boolean)` _(public)_

## Getters (35)
- `getAttributes()` _(public)_
- `getBackgroundColor()` _(public)_
- `getBorder()` _(public)_
- `getBorderColor()` _(public)_
- `getChecked()` _(public)_
- `getCheckedColor()` _(public)_
- `getClasses()` _(public)_
- `getColor()` _(public)_
- `getEnabled()` _(public)_
- `getHere()` As String _(public)_
- `getHint()` _(public)_
- `getID()` As String _(public)_
- `getIndeterminate()` _(public)_
- `getLabel()` _(public)_
- `getLabelColor()` _(public)_
- `getLegend()` _(public)_
- `getLegendColor()` _(public)_
- `getMarginAXYTBLR()` _(public)_
- `getPaddingAXYTBLR()` _(public)_
- `getParentID()` _(public)_
- `getPosition()` _(public)_
- `getPositionStyle()` _(public)_
- `GetProperties()` _(public)_
- `getRequired()` _(public)_
- `getRoundedBox()` _(public)_
- `getShadow()` _(public)_
- `getSize()` _(public)_
- `getStyles()` _(public)_
- `getThemeController()` _(public)_
- `getToggleType()` _(public)_
- `getUncheckedColor()` _(public)_
- `getValidator()` _(public)_
- `getValidatorHint()` _(public)_
- `getValue()` _(public)_
- `getVisible()` _(public)_

## Private Methods (2)
- `changed(e As BANanoEvent)` _(private)_
- `SetDefaults()` _(private)_

## Verified Demo Usage

Real syntax from [`pgToggle.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgToggle.bas) (verified demo):

```b4j
Private SDUI5Toggle1 As SDUI5Toggle		'ignore
Private SDUI5Toggle16 As SDUI5Toggle		'ignore
Private SDUI5Toggle17 As SDUI5Toggle		'ignore
Private SDUI5Toggle10 As SDUI5Toggle		'ignore
Private SDUI5Toggle11 As SDUI5Toggle		'ignore
Private SDUI5Toggle12 As SDUI5Toggle		'ignore
Private SDUI5Toggle13 As SDUI5Toggle		'ignore
Private SDUI5Toggle14 As SDUI5Toggle		'ignore
Private SDUI5Toggle15 As SDUI5Toggle		'ignore
BANano.Await(SDUI5Container1.AddComponent)
```

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
