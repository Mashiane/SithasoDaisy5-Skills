---
name: SDUI5Radio
description: SithasoDaisy5 SDUI5Radio component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5Radio

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5Radio.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5Radio.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgRadio.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgRadio.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5Radio is a daisyUI radio input with label, hint, legend (group), Checked/CheckedColor/UncheckedColor, Indeterminate, Required, Validator/ValidatorHint, Size. **RadioType controls label placement: `normal` renders the radio with no label, `legend` renders the `Label` as a group legend, `left-label`/`right-label` render the `Label` to the left/right of the radio.** Set `RadioType` to one of the label modes (`legend`, `left-label`, `right-label`) for the `Label` to display; `normal` shows no label. Use GetValue/SetValue and Validate/IsValid; Checked state persists via Checked prop.
_SDUI5Radio is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `RadioType` | String | normal | legend, normal, left-label, right-label | `setRadioType` | `getRadioType` |
| `Legend` | String | Toggle | — | `setLegend` | `getLegend` |
| `LegendColor` | String | — | — | `setLegendColor` | `getLegendColor` |
| `Label` | String | Radio | — | `setLabel` | `getLabel` |
| `LabelColor` | String | — | — | `setLabelColor` | `getLabelColor` |
| `Value` | String | — | — | `setValue` | `getValue` |
| `Color` | String | none | accent, error, info, neutral, none, primary, secondary, success, warning | `setColor` | `getColor` |
| `Size` | String | none | lg, md, none, sm, xl, xs | `setSize` | — |
| `AriaLabel` | String | — | — | `setAriaLabel` | `getAriaLabel` |
| `GroupName` | String | — | — | `setGroupName` | `getGroupName` |
| `BackgroundColor` | String | — | — | `setBackgroundColor` | `getBackgroundColor` |
| `Checked` | Boolean | False | — | `setChecked` | `getChecked` |
| `CheckedColor` | String | — | — | `setCheckedColor` | `getCheckedColor` |
| `ThemeController` | Boolean | False | — | `setThemeController` | `getThemeController` |
| `Hint` | String | — | — | `setHint` | `getHint` |
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

Wire in parent: `Sub radio_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (8)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Focus()` _(public)_
- `HintError(s As String)` As 'ignoredeadcode _(public)_
## Key Setters (25)
- `setLegendColor(s As String)` As 'ignoredeadcode _(public)_
- `setParentID(s As String)` _(public)_
- `setVisible(b As Boolean)` _(public)_
- `setEnabled(b As Boolean)` As 'ignoredeadcode _(public)_
- `setPositionStyle(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setAttributes(s As String)` _(public)_
- `setStyles(s As String)` _(public)_
- `setClasses(s As String)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setThemeController(b As Boolean)` As 'ignoredeadcode _(public)_
- `setLabelColor(s As String)` As 'ignoredeadcode _(public)_
- `setRadioType(s As String)` _(public)_
- `setLegend(s As String)` _(public)_
- `setAriaLabel(s As String)` As 'ignoredeadcode _(public)_
- `setBackgroundColor(s As String)` As 'ignoredeadcode _(public)_
- `setChecked(b As Boolean)` As 'ignoredeadcode _(public)_
- `setCheckedColor(s As String)` As 'ignoredeadcode _(public)_
- `setColor(s As String)` As 'ignoredeadcode _(public)_
- `setGroupName(s As String)` As 'ignoredeadcode _(public)_
- `setHint(s As String)` _(public)_
- `setLabel(s As String)` _(public)_
- `setSize(s As String)` As 'ignoredeadcode _(public)_
- `setValue(s As String)` As 'ignoredeadcode _(public)_
## Getters (26)
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
- `getThemeController()` As Boolean _(public)_
- `getLabelColor()` As String _(public)_
- `getRadioType()` As String _(public)_
- `getLegend()` As String _(public)_
- `getAriaLabel()` As String _(public)_
- `getBackgroundColor()` As String _(public)_
- `getChecked()` As Boolean _(public)_
- `getCheckedColor()` As String _(public)_
- `getColor()` As String _(public)_
- `getGroupName()` As String _(public)_
- `getHint()` As String _(public)_
- `getLabel()` As String _(public)_
- `getValue()` As String _(public)_
## Private Methods (0)
_(none)_
## Verified Demo Usage

Real syntax from [`pgRadio.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgRadio.bas) (verified demo). `SDUI5Radio3` = a SDUI5Radio.

```b4j
	SDUI5Radio3.Initialize(Me, "SDUI5Radio3", "SDUI5Radio3")
	SDUI5Radio3.ParentID = "SDUI5Column4"
	SDUI5Radio3.Checked = True
	SDUI5Radio3.Color = "accent"
	SDUI5Radio3.GroupName = "radio1"
	SDUI5Radio3.Label = ""
	SDUI5Radio3.MarginAXYTBLR = "a=10px; x=?; y=?; t=?; b=?; l=?; r=?"
	BANano.Await(SDUI5Radio3.AddComponent)
```
## Emits (daisyUI classes pushed in DesignerCreateView)
_(none emitted directly — relies on base/CustProps)_
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim radio As SDUI5Radio
radio.Initialize(Me, "SDUI5Radio", "SDUI5Radio")
radio.ParentID = "placeholder"
BANano.Await(radio.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.


