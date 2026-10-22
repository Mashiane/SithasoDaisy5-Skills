---
name: SDUI5MultiSelect
description: SithasoDaisy5 SDUI5MultiSelect component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5MultiSelect

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5MultiSelect.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5MultiSelect.bas)
- **Demo References**: No direct `As`/`New` type reference was detected in the audited `pg*.bas` demo snapshot.
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5MultiSelect is a multi-select dropdown with search, chips, select-all, max selection, and validation. **InputType controls label rendering: `normal` renders a bare select (no label), `legend`/`label-input` render the `Label` above the select, `buttons`/`buttons-floating` add prepend/append buttons.** Set `InputType = "legend"` (or `"label-input"`) for the label to display. Use GetValue/SetValue and Validate/IsValid for form handling.
_SDUI5MultiSelect is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `InputType` | String | normal | normal, legend, buttons, label-input | `setInputType` | `getInputType` |
| `Label` | String | Select | — | `setLabel` | `getLabel` |
| `LegendColor` | String | — | — | `setLegendColor` | `getLegendColor` |
| `Placeholder` | String | Select an element | — | `setPlaceholder` | `getPlaceholder` |
| `RawOptions` | String | b4a=b4a; b4j=b4j; b4i=b4i; b4r=b4r | — | `setOptions` | `getOptions` |
| `Value` | String | — | — | `setValue` | `getValue` |
| `ValuesAsIs` | Boolean | False | — | `setValuesAsIs` | `getValuesAsIs` |
| `InputColor` | String | none | accent, error, info, neutral, none, primary, secondary, success, warning | `setInputColor` | `getInputColor` |
| `Size` | String | md | lg, md, none, sm, xl, xs | `setSize` | `getSize` |
| `Width` | String | full | — | `setWidth` | `getWidth` |
| `Ghost` | Boolean | False | — | `setGhost` | `getGhost` |
| `Grow` | Boolean | False | — | `setGrow` | `getGrow` |
| `CheckedColor` | String | — | — | `setCheckedColor` | `getCheckedColor` |
| `ChipTextColor` | String | — | — | `setChipTextColor` | `getChipTextColor` |
| `Delimiter` | String | ; | — | `setDelimiter` | `getDelimiter` |
| `ValueField` | String | — | — | `setValueField` | `getValueField` |
| `TextField` | String | — | — | `setTextField` | `getTextField` |
| `SelectedField` | String | — | — | `setSelectedField` | `getSelectedField` |
| `DisabledField` | String | — | — | `setDisabledField` | `getDisabledField` |
| `ExtraDataFields` | String | — | — | `setExtraDataFields` | `getExtraDataFields` |
| `Highlight` | Boolean | False | — | `setHighlight` | `getHighlight` |
| `MaxSelections` | Int | 0, MinRange: 0, MaxRange: 100 | — | `setMaxSelections` | `getMaxSelections` |
| `Searchable` | Boolean | False | — | `setSearchable` | `getSearchable` |
| `ShowSelectAll` | Boolean | False | — | `setShowSelectAll` | `getShowSelectAll` |
| `SingleSelect` | Boolean | False | — | `setSingleSelect` | `getSingleSelect` |
| `VirtualScroll` | Boolean | False | — | `setVirtualScroll` | `getVirtualScroll` |
| `VirtualScrollThreshold` | String | 50 | — | `setVirtualScrollThreshold` | `getVirtualScrollThreshold` |
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
`Change`, `Prepend`, `Append`, `Renderer`

Wire in parent: `Sub multiselect_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (32)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `RefreshConfiguration()` _(public)_
- `SelectAll()` _(public)_
- `GetSelectedValues()` As List _(public)_
- `GetSelectedTexts()` As List _(public)_
- `Focus()` _(public)_
- `SetOptionsFromMap(m As Map)` As 'ignoredeadcode _(public)_
- `SetOptionsFromList(m As List)` _(public)_
- `Clear()` As 'ignoredeadcode _(public)_
- `AddOption(iKey As String, iValue As String)` _(public)_
- `AddOptions(lst As List)` _(public)_
- `HasOption(iKey As String)` As Boolean _(public)_
- `SelectByIndex(idx As Int)` _(public)_
- `DeselectByIndex(idx As Int)` _(public)_
- `SelectByValue(iKey As String)` _(public)_
- `EnableItem(iKey As Boolean, bValue As Boolean)` _(public)_
- `DeselectByValue(iKey As String)` _(public)_
- `RemoveOption(iKey As String)` _(public)_
- `ClearSelected()` _(public)_
- `HintError(s As String)` As 'ignoredeadcode _(public)_
- `IsBlank()` As Boolean _(public)_
- `ResetValidation()` _(public)_
- `SetLanguages()` _(public)_
- `SetCountries()` _(public)_
- `SetYears(yearsIntoPast As Int, yearsIntoFuture As Int)` _(public)_
- `SetMonths()` _(public)_
- `SetDays()` _(public)_
## Key Setters (56)
- `setParentID(s As String)` _(public)_
- `setVisible(b As Boolean)` _(public)_
- `setLegendColor(s As String)` As 'ignoredeadcode _(public)_
- `setEnabled(b As Boolean)` As 'ignoredeadcode _(public)_
- `setPositionStyle(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setAttributes(s As String)` _(public)_
- `setStyles(s As String)` _(public)_
- `setClasses(s As String)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setDisabledField(s As String)` _(public)_
- `setSelectedField(s As String)` _(public)_
- `setTextField(s As String)` _(public)_
- `setValueField(s As String)` _(public)_
- `setAppendColor(s As String)` As 'ignoredeadcode _(public)_
- `setAppendIconColor(s As String)` As 'ignoredeadcode _(public)_
- `setPrependColor(s As String)` As 'ignoredeadcode _(public)_
- `setPrependIconColor(s As String)` As 'ignoredeadcode _(public)_
- `setBackgroundColor(s As String)` As 'ignoredeadcode _(public)_
- `setBorder(b As Boolean)` As 'ignoredeadcode _(public)_
- `setBorderColor(s As String)` As 'ignoredeadcode _(public)_
- `setRoundedBox(b As Boolean)` As 'ignoredeadcode _(public)_
- `setShadow(s As String)` As 'ignoredeadcode _(public)_
- `setWidth(s As String)` As 'ignoredeadcode _(public)_
- `setInputType(s As String)` _(public)_
- `setPrependVisible(b As Boolean)` As 'ignoredeadcode _(public)_
- `setAppendVisible(b As Boolean)` As 'ignoredeadcode _(public)_
- `setOptions(s As String)` As 'ignoredeadcode _(public)_
- `setValuesAsIs(b As Boolean)` _(public)_
- `setInputColor(s As String)` As 'ignoredeadcode _(public)_
- `setGhost(b As Boolean)` As 'ignoredeadcode _(public)_
- `setGrow(b As Boolean)` As 'ignoredeadcode _(public)_
- `setHint(s As String)` _(public)_
- `setLabel(s As String)` _(public)_
- `setPlaceholder(s As String)` As 'ignoredeadcode _(public)_
- `setRequired(b As Boolean)` As 'ignoredeadcode _(public)_
- `setAppendImage(s As String)` As 'ignoredeadcode _(public)_
- `setAppendIcon(s As String)` As 'ignoredeadcode _(public)_
- `setPrependImage(s As String)` As 'ignoredeadcode _(public)_
- `setPrependIcon(s As String)` As 'ignoredeadcode _(public)_
- `setSize(s As String)` As 'ignoredeadcode _(public)_
- `setValidator(b As Boolean)` _(public)_
- `setValidatorHint(s As String)` _(public)_
- `setValue(s As String)` As 'ignoredeadcode _(public)_
- `setCheckedColor(s As String)` _(public)_
- `setChipTextColor(s As String)` _(public)_
- `setDelimiter(s As String)` _(public)_
- `setExtraDataFields(s As String)` As 'ignoredeadcode _(public)_
- `setHighlight(b As Boolean)` _(public)_
- `setMaxSelections(i As Int)` _(public)_
- `setSearchable(b As Boolean)` _(public)_
- `setShowSelectAll(b As Boolean)` _(public)_
- `setSingleSelect(b As Boolean)` _(public)_
- `setVirtualScroll(b As Boolean)` _(public)_
- `setVirtualScrollThreshold(s As String)` _(public)_
## Getters (58)
- `getID()` As String _(public)_
- `getParentID()` As String _(public)_
- `getHere()` As String _(public)_
- `getVisible()` As Boolean _(public)_
- `getLegendColor()` As String _(public)_
- `getEnabled()` As Boolean _(public)_
- `getPositionStyle()` As String _(public)_
- `getPosition()` As String _(public)_
- `getAttributes()` As String _(public)_
- `getStyles()` As String _(public)_
- `getClasses()` As String _(public)_
- `getPaddingAXYTBLR()` As String _(public)_
- `getMarginAXYTBLR()` As String _(public)_
- `getDisabledField()` As String _(public)_
- `getSelectedField()` As String _(public)_
- `getTextField()` As String _(public)_
- `getValueField()` As String _(public)_
- `getAppendColor()` As String _(public)_
- `getAppendIconColor()` As String _(public)_
- `getPrependColor()` As String _(public)_
- `getPrependIconColor()` As String _(public)_
- `getBackgroundColor()` As String _(public)_
- `getBorder()` As Boolean _(public)_
- `getBorderColor()` As String _(public)_
- `getRoundedBox()` As Boolean _(public)_
- `getShadow()` As String _(public)_
- `getWidth()` As String _(public)_
- `getInputType()` As String _(public)_
- `getAppendIcon()` As String _(public)_
- `getAppendVisible()` As Boolean _(public)_
- `getPrependIcon()` As String _(public)_
- `getPrependVisible()` As Boolean _(public)_
- `getOptions()` As String _(public)_
- `getValuesAsIs()` As Boolean _(public)_
- `getAppendImage()` As String _(public)_
- `getPrependImage()` As String _(public)_
- `getInputColor()` As String _(public)_
- `getGhost()` As Boolean _(public)_
- `getGrow()` As Boolean _(public)_
- `getHint()` As String _(public)_
- `getLabel()` As String _(public)_
- `getPlaceholder()` As String _(public)_
- `getRequired()` As Boolean _(public)_
- `getSize()` As String _(public)_
- `getValidator()` As Boolean _(public)_
- `getValidatorHint()` As String _(public)_
- `getValue()` As String _(public)_
- `getCheckedColor()` As String _(public)_
- `getChipTextColor()` As String _(public)_
- `getDelimiter()` As String _(public)_
- `getExtraDataFields()` As String _(public)_
- `getHighlight()` As Boolean _(public)_
- `getMaxSelections()` As Int _(public)_
- `getSearchable()` As Boolean _(public)_
- `getShowSelectAll()` As Boolean _(public)_
- `getSingleSelect()` As Boolean _(public)_
- `getVirtualScroll()` As Boolean _(public)_
- `getVirtualScrollThreshold()` As String _(public)_
## Private Methods (0)
_(none)_
## Emits (daisyUI classes pushed in DesignerCreateView)
_(none emitted directly — relies on base/CustProps)_
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim multiselect As SDUI5MultiSelect
multiselect.Initialize(Me, "SDUI5MultiSelect", "SDUI5MultiSelect")
multiselect.ParentID = "placeholder"
BANano.Await(multiselect.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Shared helpers: Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/TextSize/BackgroundImage. Dimensions are component-specific: this component exposes Width, but not Height; use only dimensions listed in this component's properties and methods above.
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.


