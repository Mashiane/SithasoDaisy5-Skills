---
name: SDUI5Select
description: SithasoDaisy5 SDUI5Select component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5Select

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5Select.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5Select.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgContacts.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgContacts.bas)
  - [`pgModal.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgModal.bas)
  - [`pgSelect.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgSelect.bas)
  - [`pgValidation.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgValidation.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5Select is a daisyUI select dropdown with options, search, multiple, and validation. **InputType controls label rendering: `normal` renders a bare select (no label), `legend`/`label-input` render the `Label` above the select, `buttons`/`buttons-floating` add prepend/append buttons.** Set `InputType = "legend"` (or `"label-input"`) for the label to display. Use GetValue/SetValue, AddItem/AddItems, and Validate/IsValid for form handling.
_SDUI5Select is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `InputType` | String | normal | normal, legend, buttons, label-input, buttons-floating | `setInputType` | `getInputType` |
| `Label` | String | Select | — | `setLabel` | `getLabel` |
| `LegendColor` | String | — | — | `setLegendColor` | `getLegendColor` |
| `Placeholder` | String | Select an element | — | `setPlaceholder` | `getPlaceholder` |
| `RawOptions` | String | b4a=b4a; b4j=b4j; b4i=b4i; b4r=b4r | — | `setOptions` | `getOptions` |
| `Value` | String | — | — | `setValue` | `getValue` |
| `AllowBlank` | Boolean | True | — | `setAllowBlank` | `getAllowBlank` |
| `ValuesAsIs` | Boolean | False | — | `setValuesAsIs` | `getValuesAsIs` |
| `Color` | String | none | accent, error, info, neutral, none, primary, secondary, success, warning | `setColor` | `getColor` |
| `Size` | String | md | lg, md, none, sm, xl, xs | `setSize` | `getSize` |
| `Width` | String | full | — | `setWidth` | `getWidth` |
| `Ghost` | Boolean | False | — | `setGhost` | `getGhost` |
| `Grow` | Boolean | False | — | `setGrow` | `getGrow` |
| `Hint` | String | — | — | `setHint` | `getHint` |
| `Required` | Boolean | False | — | `setRequired` | `getRequired` |
| `Validator` | Boolean | False | — | `setValidator` | `getValidator` |
| `ValidatorHint` | String | — | — | `setValidatorHint` | `getValidatorHint` |
| `PrependColor` | String | none | — | `setPrependColor` | `getPrependColor` |
| `PrependImage` | String | — | — | `setPrependImage` | `getPrependImage` |
| `PrependIcon` | String | — | — | `setPrependIcon` | `getPrependIcon` |
| `PrependIconColor` | String | none | — | `setPrependIconColor` | `getPrependIconColor` |
| `PrependVisible` | Boolean | False | — | `setPrependVisible` | `getPrependVisible` |
| `AppendColor` | String | none | — | `setAppendColor` | `getAppendColor` |
| `AppendImage` | String | — | — | `setAppendImage` | `getAppendImage` |
| `AppendIcon` | String | — | — | `setAppendIcon` | `getAppendIcon` |
| `AppendIconColor` | String | none | — | `setAppendIconColor` | `getAppendIconColor` |
| `AppendVisible` | Boolean | False | — | `setAppendVisible` | `getAppendVisible` |
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
`Change`, `Prepend`, `Append`

Wire in parent: `Sub select_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (18)
- `AddComponent()` _(public)_
- `AddOption(iKey As String, iValue As String)` _(public)_
- `AddOptionSelected(iKey As String, iValue As String)` _(public)_
- `Clear()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `findIndexByValue(value As String)` As Int _(public)_
- `findValueByText(text As String)` As String _(public)_
- `Focus()` _(public)_
- `HintError(s As String)` _(public)_
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `IsBlank()` _(public)_
- `MoveNext()` _(public)_
- `MovePrevious()` _(public)_
- `Remove()` _(public)_
- `removeByIndex(idx As Int)` _(public)_
- `removeByValue(value As String)` _(public)_
- `removeSelected()` _(public)_
- `ResetValidation()` _(public)_

## Key Setters (53)
- `setAllowBlank(b As Boolean)` _(public)_
- `setAppendColor(s As String)` _(public)_
- `setAppendIcon(s As String)` _(public)_
- `setAppendIconColor(s As String)` _(public)_
- `setAppendImage(s As String)` _(public)_
- `setAppendVisible(b As Boolean)` _(public)_
- `setAttributes(s As String)` _(public)_
- `setBackgroundColor(s As String)` _(public)_
- `setBorder(b As Boolean)` _(public)_
- `setBorderColor(s As String)` _(public)_
- `setClasses(s As String)` _(public)_
- `setColor(s As String)` _(public)_
- `SetCountries()` _(public)_
- `SetDays()` _(public)_
- `setEnabled(b As Boolean)` _(public)_
- `setGhost(b As Boolean)` _(public)_
- `setGrow(b As Boolean)` _(public)_
- `setHint(s As String)` _(public)_
- `setInputType(s As String)` _(public)_
- `setLabel(s As String)` _(public)_
- `SetLanguages()` _(public)_
- `setLegendColor(s As String)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `SetMonths()` _(public)_
- `setOptions(s As String)` _(public)_
- `SetOptionsFromList(m As List)` _(public)_
- `SetOptionsFromMap(m As Map)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setParentID(s As String)` _(public)_
- `setPlaceholder(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setPositionStyle(s As String)` _(public)_
- `setPrependColor(s As String)` _(public)_
- `setPrependIcon(s As String)` _(public)_
- `setPrependIconColor(s As String)` _(public)_
- `setPrependImage(s As String)` _(public)_
- `setPrependVisible(b As Boolean)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `setRequired(b As Boolean)` _(public)_
- `setRoundedBox(b As Boolean)` _(public)_
- `setSelectedIndex(i As Int)` _(public)_
- `setShadow(s As String)` _(public)_
- `setSize(s As String)` _(public)_
- `setStyles(s As String)` _(public)_
- `SetThemes()` _(public)_
- `setValidator(b As Boolean)` _(public)_
- `setValidatorHint(s As String)` _(public)_
- `setValue(s As String)` _(public)_
- `SetValueByText(stext As String)` _(public)_
- `setValuesAsIs(b As Boolean)` _(public)_
- `setVisible(b As Boolean)` _(public)_
- `setWidth(s As String)` _(public)_
- `SetYears(yearsIntoPast As Int, yearsIntoFuture As Int)` _(public)_

## Getters (48)
- `getAllowBlank()` _(public)_
- `getAppendColor()` _(public)_
- `getAppendIcon()` _(public)_
- `getAppendIconColor()` _(public)_
- `getAppendImage()` _(public)_
- `getAppendVisible()` _(public)_
- `getAttributes()` _(public)_
- `getBackgroundColor()` _(public)_
- `getBorder()` _(public)_
- `getBorderColor()` _(public)_
- `getClasses()` _(public)_
- `getColor()` _(public)_
- `getEnabled()` _(public)_
- `getGhost()` _(public)_
- `getGrow()` _(public)_
- `getHere()` As String _(public)_
- `getHint()` _(public)_
- `getID()` As String _(public)_
- `getInputType()` _(public)_
- `getItemCount()` _(public)_
- `getLabel()` _(public)_
- `getLegendColor()` _(public)_
- `getMarginAXYTBLR()` _(public)_
- `getOptions()` _(public)_
- `getPaddingAXYTBLR()` _(public)_
- `getParentID()` _(public)_
- `getPlaceholder()` _(public)_
- `getPosition()` _(public)_
- `getPositionStyle()` _(public)_
- `getPrependColor()` _(public)_
- `getPrependIcon()` _(public)_
- `getPrependIconColor()` _(public)_
- `getPrependImage()` _(public)_
- `getPrependVisible()` _(public)_
- `GetProperties()` _(public)_
- `getRequired()` _(public)_
- `getRoundedBox()` _(public)_
- `getSelectedIndex()` _(public)_
- `getShadow()` _(public)_
- `getSize()` _(public)_
- `getStyles()` _(public)_
- `getText()` _(public)_
- `getValidator()` _(public)_
- `getValidatorHint()` _(public)_
- `getValue()` _(public)_
- `getValuesAsIs()` _(public)_
- `getVisible()` _(public)_
- `getWidth()` _(public)_

## Private Methods (2)
- `changed(e As BANanoEvent)` _(private)_
- `SetDefaults()` _(private)_

## Verified Demo Usage

Real syntax from [`pgSelect.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgSelect.bas) (verified demo):

```b4j
Private SDUI5Select1 As SDUI5Select		'ignore
Private SDUI5Select10 As SDUI5Select		'ignore
Private SDUI5Select11 As SDUI5Select		'ignore
Private SDUI5Select12 As SDUI5Select		'ignore
Private SDUI5Select13 As SDUI5Select		'ignore
Private SDUI5Select14 As SDUI5Select		'ignore
Private SDUI5Select15 As SDUI5Select		'ignore
Private SDUI5Select16 As SDUI5Select		'ignore
BANano.Await(SDUI5Container1.AddComponent)
```

## Emits (daisyUI classes pushed in DesignerCreateView)
_(none emitted directly — relies on base/CustProps)_
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim select As SDUI5Select
select.Initialize(Me, "SDUI5Select", "SDUI5Select")
select.ParentID = "placeholder"
BANano.Await(select.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Shared helpers: Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/TextSize/BackgroundImage. Dimensions are component-specific: this component exposes Width, but not Height; use only dimensions listed in this component's properties and methods above.
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.
