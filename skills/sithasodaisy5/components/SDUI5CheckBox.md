---
name: SDUI5CheckBox
description: SithasoDaisy5 SDUI5CheckBox component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5CheckBox

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5CheckBox.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5CheckBox.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgCheckBox.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgCheckBox.bas)
  - [`pgGhostLogin.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgGhostLogin.bas)
  - [`pgModal.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgModal.bas)
  - [`pgValidation.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgValidation.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5CheckBox is a daisyUI `checkbox` input with label, hint, legend (group), Checked/CheckedColor/UncheckedColor/CheckedMarkColor, Indeterminate, Required, Validator/ValidatorHint, Size. **CheckBoxType controls label placement: `normal` renders the checkbox with no label, `legend` renders the `Label` as a group legend, `left-label`/`right-label` render the `Label` to the left/right of the checkbox.** Set `CheckBoxType` to one of the label modes (`legend`, `left-label`, `right-label`) for the `Label` to display; `normal` shows no label. Use GetValue/SetValue and Validate/IsValid; Checked state persists via Checked prop.
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
| `CheckBoxType` | String | normal | legend, normal, left-label, right-label | `setCheckBoxType` | `getCheckBoxType` |
| `Legend` | String | Options | — | `setLegend` | `getLegend` |
| `LegendColor` | String | — | — | `setLegendColor` | `getLegendColor` |
| `Label` | String | CheckBox | — | `setLabel` | `getLabel` |
| `LabelColor` | String | — | — | `setLabelColor` | `getLabelColor` |
| `TermsConditionsCaption` | String | — | — | `setTermsConditionsCaption` | `getTermsConditionsCaption` |
| `TermsConditionsUrl` | String | — | — | `setTermsConditionsUrl` | `getTermsConditionsUrl` |
| `PrivacyPolicyCaption` | String | — | — | `setPrivacyPolicyCaption` | `getPrivacyPolicyCaption` |
| `PrivacyPolicyUrl` | String | — | — | `setPrivacyPolicyUrl` | `getPrivacyPolicyUrl` |
| `Color` | String | none | accent, error, info, neutral, none, primary, secondary, success, warning | `setColor` | `getColor` |
| `Size` | String | none | lg, md, none, sm, xl, xs | `setSize` | `getSize` |
| `Checked` | Boolean | False | — | `setChecked` | `getChecked` |
| `Value` | String | — | — | `setValue` | `getValue` |
| `CheckedColor` | String | — | — | `setCheckedColor` | `getCheckedColor` |
| `CheckedMarkColor` | String | — | — | `setCheckedMarkColor` | `getCheckedMarkColor` |
| `UncheckedColor` | String | — | — | `setUncheckedColor` | `getUncheckedColor` |
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

Wire in parent: `Sub checkbox_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (8)
- `AddComponent()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Focus()` _(public)_
- `HintError(s As String)` _(public)_
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `IsBlank()` _(public)_
- `Remove()` _(public)_
- `ResetValidation()` _(public)_

## Key Setters (38)
- `setAttributes(s As String)` _(public)_
- `setBackgroundColor(s As String)` _(public)_
- `setBorder(b As Boolean)` _(public)_
- `setBorderColor(s As String)` _(public)_
- `setCheckBoxType(s As String)` _(public)_
- `setChecked(b As Boolean)` _(public)_
- `setCheckedColor(s As String)` _(public)_
- `setCheckedMarkColor(s As String)` _(public)_
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
- `setPrivacyPolicyCaption(s As String)` _(public)_
- `setPrivacyPolicyUrl(s As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `setRequired(b As Boolean)` _(public)_
- `setRoundedBox(b As Boolean)` _(public)_
- `setShadow(s As String)` _(public)_
- `setSize(s As String)` _(public)_
- `setStyles(s As String)` _(public)_
- `setTermsConditionsCaption(s As String)` _(public)_
- `setTermsConditionsUrl(s As String)` _(public)_
- `setThemeController(b As Boolean)` _(public)_
- `setUncheckedColor(s As String)` _(public)_
- `setValidator(b As Boolean)` _(public)_
- `setValidatorHint(s As String)` _(public)_
- `setValue(s As String)` _(public)_
- `setVisible(b As Boolean)` _(public)_

## Getters (40)
- `getAttributes()` _(public)_
- `getBackgroundColor()` _(public)_
- `getBorder()` _(public)_
- `getBorderColor()` _(public)_
- `getCheckBoxType()` _(public)_
- `getChecked()` _(public)_
- `getCheckedColor()` _(public)_
- `getCheckedMarkColor()` _(public)_
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
- `getPrivacyPolicyCaption()` _(public)_
- `getPrivacyPolicyUrl()` _(public)_
- `GetProperties()` _(public)_
- `getRequired()` _(public)_
- `getRoundedBox()` _(public)_
- `getShadow()` _(public)_
- `getSize()` _(public)_
- `getStyles()` _(public)_
- `getTermsConditionsCaption()` _(public)_
- `getTermsConditionsUrl()` _(public)_
- `getThemeController()` _(public)_
- `getUncheckedColor()` _(public)_
- `getValidator()` _(public)_
- `getValidatorHint()` _(public)_
- `getValue()` _(public)_
- `getVisible()` _(public)_

## Private Methods (2)
- `changed(e As BANanoEvent)` _(private)_
- `SetDefaults()` _(private)_

## Verified Demo Usage

Real syntax from [`pgCheckBox.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgCheckBox.bas) (verified demo):

```b4j
Private SDUI5CheckBox1 As SDUI5CheckBox		'ignore
Private SDUI5CheckBox19 As SDUI5CheckBox		'ignore
Private SDUI5CheckBox10 As SDUI5CheckBox		'ignore
Private SDUI5CheckBox11 As SDUI5CheckBox		'ignore
Private SDUI5CheckBox12 As SDUI5CheckBox		'ignore
Private SDUI5CheckBox13 As SDUI5CheckBox		'ignore
Private SDUI5CheckBox14 As SDUI5CheckBox		'ignore
Private SDUI5CheckBox15 As SDUI5CheckBox		'ignore
Private SDUI5CheckBox16 As SDUI5CheckBox		'ignore
Private SDUI5CheckBox17 As SDUI5CheckBox		'ignore
Private SDUI5CheckBox18 As SDUI5CheckBox		'ignore
BANano.Await(SDUI5Container1.AddComponent)
```

## Emits (daisyUI classes pushed in DesignerCreateView)
_(none emitted directly — relies on base/CustProps)_
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim checkbox As SDUI5CheckBox
checkbox.Initialize(Me, "SDUI5CheckBox", "SDUI5CheckBox")
checkbox.ParentID = "placeholder"
BANano.Await(checkbox.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Shared helpers: Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/TextSize/BackgroundImage. Dimensions are component-specific: this component exposes neither Width nor Height; use `Classes` utilities for sizing when needed.
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.
