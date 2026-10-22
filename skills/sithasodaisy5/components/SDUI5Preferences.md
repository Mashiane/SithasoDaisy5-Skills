---
name: SDUI5Preferences
description: SithasoDaisy5 SDUI5Preferences component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5Preferences

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5Preferences.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5Preferences.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pggridbuilder.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pggridbuilder.bas)
  - [`pgPreferences.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgPreferences.bas)
  - [`pgProvinces.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgProvinces.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5Preferences is a preferences/settings panel. Use for user settings.
_SDUI5Preferences is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
## Skeleton Contract
Every SithasoDaisy5 component follows the same shape (see SDUI5Component base):
1. `Initialize(Callback, Name, EventName)` — sets `mCallBack`, `mName`, `mEventName`, calls `SetDefaults`.
2. `ParentID` (property / `setParentID(id)`) — attach point in the DOM.
3. `DesignerCreateView(Target, Props)` — INTERNAL (called by `AddComponent`, never from app code); reads `CustProps`, pushes daisyUI classes via `UI.AddClassDT/AddColorDT/AddRoundedDT/AddShadowDT`, appends `[BANCLEAN]<tag id="{name}">`, wires `UI.OnEvent`.
4. Live setters mutate the DOM via `UI.*ByID("{name}_child")`.

**Init signature**: `Initialize(CallBack As Object, Name As String, EventName As String)` | **Has DesignerCreateView**: Yes
## Designer Properties
| Key | Type | Default | List | Setter | Getter |
|---|---|---|---|---|---|
| `ParentID` | String | — | — | `setParentID` | `getParentID` |
| `Title` | String | Property Bag | — | `setTitle` | `getTitle` |
| `Card` | Boolean | True | — | `setCard` | `getCard` |
| `CardBorder` | Boolean | True | — | `setCardBorder` | `getCardBorder` |
| `HasSearch` | Boolean | True | — | `setHasSearch` | `getHasSearch` |
| `HasActions` | Boolean | True | — | `setHasActions` | — |
| `SearchVisible` | Boolean | True | — | `setSearchVisible` | `getSearchVisible` |
| `SearchSize` | String | sm | lg, md, none, sm, xl, xs | `setSearchSize` | `getSearchSize` |
| `SearchWidth` | String | 300px | — | `setSearchWidth` | `getSearchWidth` |
| `ButtonSize` | String | sm | lg, md, none, sm, xs | `setButtonSize` | `getButtonSize` |
| `ButtonsOutlined` | Boolean | False | — | `setButtonsOutlined` | `getButtonsOutlined` |
| `HasAddNew` | Boolean | False | — | `setHasAddNew` | — |
| `AddNewTooltip` | String | — | — | `setAddNewTooltip` | `getAddNewTooltip` |
| `HasSave` | Boolean | False | — | `setHasSave` | — |
| `SaveTooltip` | String | — | — | `setSaveTooltip` | `getSaveTooltip` |
| `HasDelete` | Boolean | False | — | `setHasDelete` | — |
| `DeleteTooltip` | String | — | — | `setDeleteTooltip` | `getDeleteTooltip` |
| `HasRefresh` | Boolean | False | — | `setHasRefresh` | — |
| `RefreshTooltip` | String | — | — | `setRefreshTooltip` | `getRefreshTooltip` |
| `HasUpload` | Boolean | False | — | `setHasUpload` | — |
| `UploadTooltip` | String | — | — | `setUploadTooltip` | `getUploadTooltip` |
| `HasDownload` | Boolean | False | — | `setHasDownload` | `getHasDownload` |
| `DownloadTooltip` | String | — | — | — | `getDownloadTooltip` |
| `HasBack` | Boolean | False | — | `setHasBack` | — |
| `BackTooltip` | String | — | — | `setBackTooltip` | `getBackTooltip` |
| `ComponentSize` | String | sm | lg, md, none, sm, xl, xs | `setComponentSize` | `getComponentSize` |
| `IsZebra` | Boolean | False | — | `setIsZebra` | `getIsZebra` |
| `PropertyPadding` | String | py-1 | — | `setPropertyPadding` | `getPropertyPadding` |
| `TooltipColor` | String | none | accent, error, info, neutral, none, primary, secondary, success, warning | `setTooltipColor` | `getTooltipColor` |
| `TooltipPosition` | String | right | bottom, left, right, top | — | — |
| `TooltipAlignment` | String | none | start, center, end, none | `setTooltipAlignment` | `getTooltipAlignment` |
| `TopActionsVisible` | Boolean | True | — | `setTopActionsVisible` | `getTopActionsVisible` |
| `WrapActions` | Boolean | True | — | `setWrapActions` | `getWrapActions` |
| `ActionsVisible` | Boolean | True | — | `setActionsVisible` | `getActionsVisible` |
| `Shadow` | String | none | 2xl, inner, lg, md, none, shadow, sm, xl | `setShadow` | `getShadow` |
| `ActionType` | String | yes-no | cancel, no, yes, yes-no, yes-no-cancel | — | — |
| `YesVisible` | Boolean | True | — | `setYesVisible` | `getYesVisible` |
| `NoVisible` | Boolean | True | — | `setNoVisible` | `getNoVisible` |
| `CancelVisible` | Boolean | True | — | `setCancelVisible` | `getCancelVisible` |
| `BottonsWidth` | String | 22 | — | `setBottonsWidth` | `getBottonsWidth` |
| `ButtonsShadow` | String | md | 2xl, inner, lg, md, none, shadow, sm, xl | `setButtonsShadow` | `getButtonsShadow` |
| `ButtonsRounded` | String | md | none, rounded, 2xl, 3xl, full, lg, md, sm, xl, 0 | `setButtonsRounded` | `getButtonsRounded` |
| `YesCaption` | String | Yes | — | `setYesCaption` | `getYesCaption` |
| `YesColor` | String | success | — | `setYesColor` | `getYesColor` |
| `YesTextColor` | String | #ffffff | — | `setYesTextColor` | `getYesTextColor` |
| `YesLoading` | Boolean | False | — | `setYesLoading` | `getYesLoading` |
| `NoCaption` | String | No | — | `setNoCaption` | `getNoCaption` |
| `NoColor` | String | error | — | `setNoColor` | `getNoColor` |
| `NoTextColor` | String | #ffffff | — | `setNoTextColor` | `getNoTextColor` |
| `NoLoading` | Boolean | False | — | `setNoLoading` | `getNoLoading` |
| `CancelCaption` | String | Cancel | — | `setCancelCaption` | `getCancelCaption` |
| `CancelColor` | String | gray | — | `setCancelColor` | `getCancelColor` |
| `CancelTextColor` | String | #ffffff | — | `setCancelTextColor` | `getCancelTextColor` |
| `CancelLoading` | Boolean | False | — | `setCancelLoading` | `getCancelLoading` |
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
`PropertyChange`, `Change`, `SearchClick`, `SearchKeyUp`, `SearchClear`, `Property_Toggle`, `Property_AppendClick`, `Property_PrependClick`, `Property_FileChange`, `Property_Click`, `Button_Click`, `Button_FileChange`, `Yes_Click`, `No_Click`, `Cancel_Click`, `Download_Click`, `Add_Click`, `Save_Click`, `Delete_Click`, `Refresh_Click`, `Back_Click`, `FileChange`

Wire in parent: `Sub preferences_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (206)
- `Initialize(CallBack As Object, Name As String, EventName As String)` _(public)_
- `ClearDesigns()` _(public)_
- `LoadDesign(designName As String)` As Boolean _(public)_
- `GetDesign(designName As String)` As Map _(public)_
- `GetDesignComplete(designName As String)` As List _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `SetPropertyAlwaysVisible(lst As List)` _(public)_
- `ShowAlwaysVisible()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Nullify()` _(public)_
- `GetFiles()` As List _(public)_
- `GetFile()` As Map _(public)_
- `GetFileDataURL()` As String _(public)_
- `MoveBackButton()` As 'ignoredeadcode _(public)_
- `ShowSearch(b As Boolean)` _(public)_
- `ShowActions(b As Boolean)` _(public)_
- `PropertyConfig()` _(public)_
- `LoadFromJSONString(fContents As String)` _(public)_
- `Refresh()` _(public)_
- `ToString()` As String _(public)_
- `PropertyBagFromList(fContents As List)` _(public)_
- `HideAllProperties()` _(public)_
- `UpdatePropertyPadding(pClass As String)` _(public)_
- `PropertyBuilderMap(sb As StringBuilder, spropName As String, m As Map)` _(public)_
- `SetPropertyRequired(Key As String, status As Boolean)` _(public)_
- `ShowPropOnCondition()` _(public)_
- `AddProperty(options As Map)` _(public)_
- `SetSearchPlaceholder(s As String)` _(public)_
- `Clear()` _(public)_
- `ClearOverwrites()` _(public)_
- `AddPropertyDialer(Key As String, Title As String, DefaultValue As String, Required As Boolean, iMinValue As Int, iStepValue As Int, iMaxValue As Int)` _(public)_
- `OnEventByID(sID As String, event As String, CallBack As Object, MethodName As String)` _(public)_
- `OnEvent(xElement As BANanoElement, event As String, CallBack As Object, MethodName As String)` _(public)_
- `SetPropertyDialerIncrement(Key As String)` _(public)_
- `SetPropertyDialerDecrement(Key As String)` _(public)_
- `ClearAllGuides()` _(public)_
- `SetGuides(propKeys As List)` _(public)_
- `AddPropertyTextBox(Key As String, Title As String, DefaultValue As String, Required As Boolean)` _(public)_
- `AddPropertyPlusMinus(Key As String, Title As String, DefaultValue As String, Required As Boolean, MinValue As String, StepValue As String, MaxValue As String)` _(public)_
- `AddPropertyTextBoxGroup(Key As String, Title As String, DefaultValue As String, Required As Boolean)` _(public)_
- `AddPropertySelectGroup(Key As String, Title As String, DefaultValue As String, Required As Boolean, Options As Map)` _(public)_
- `AddPropertyPasswordGroup(Key As String, Title As String, DefaultValue As String, Required As Boolean)` _(public)_
- `SetPropertyPrependIcon(Key As String, picon As String)` _(public)_
- `SetPropertyTopLeftRadius(Key As String, v As String)` _(public)_
- `SetPropertyTopRightRadius(Key As String, v As String)` _(public)_
- `SetPropertyBottomLeftRadius(Key As String, v As String)` _(public)_
- `SetPropertyBottomRightRadius(Key As String, v As String)` _(public)_
- `SetPropertyPrependIconLoading(Key As String, bLoading As Boolean)` _(public)_
- `SetPropertyAppendIconLoading(Key As String, bLoading As Boolean)` _(public)_
- `SetPropertyAppendIconColor(Key As String, iColor As String)` _(public)_
- `SetPropertyPrependIconColor(Key As String, iColor As String)` _(public)_
- `SetPropertyAppendIcon(Key As String, picon As String)` _(public)_
- `SetPropertyPrefix(Key As String,l As String)` _(public)_
- `SetPropertySuffix(Key As String,l As String)` _(public)_
- `SetPropertyShowEyes(Key As String, b As Boolean)` _(public)_
- `SetPropertyToggleEyes(Key As String)` _(public)_
- `AddPropertyDatePicker(Key As String, Title As String, DefaultValue As String, Required As Boolean, DateFormat As String, DisplayDateFormat As String, locale As String)` _(public)_
- `AddPropertyColorWheel(Key As String, Title As String, DefaultValue As String, Required As Boolean, iHandleDiameter As Int, iWheelDiameter As Int, iWheelThickness As Int, sWheelPlacement As String)` _(public)_
- `AddPropertyDateTimePicker(Key As String, Title As String, DefaultValue As String, Required As Boolean, DateFormat As String, DisplayDateFormat As String, Time24Hours As Boolean, locale As String)` _(public)_
- `AddPropertyTimePicker(Key As String, Title As String, DefaultValue As String, Required As Boolean, TimeFormat As String, DisplayFormat As String, Time24Hours As Boolean, locale As String)` _(public)_
- `AddPropertyPassword(Key As String, Title As String, DefaultValue As String, Required As Boolean)` _(public)_
- `AddPropertyNumber(Key As String, Title As String, DefaultValue As String, Required As Boolean)` _(public)_
- `AddPropertyTelephone(Key As String, Title As String, DefaultValue As String, Required As Boolean)` _(public)_
- `AddPropertyEmail(Key As String, Title As String, DefaultValue As String, Color As String)` _(public)_
- `AddPropertyLabel(Key As String, Title As String, DefaultValue As String, Color As String)` _(public)_
- `AddPropertyLink(Key As String, Title As String, DefaultValue As String, Color As String)` _(public)_
- `AddPropertyPlaceHolder(Key As String, Title As String, DefaultValue As String)` _(public)_
- `SetPropertyHTML(Key As String, value As String)` _(public)_
- `SetPropertyTypePassword(Key As String, b As Boolean)` _(public)_
- `SetPropertyType(Key As String, typeOf As String)` _(public)_
- `SetPropertyNoArrows(Key As String)` _(public)_
- `SetPropertyEnabled(Key As String, xEnabled As Boolean)` _(public)_
- `SetPropertyAutoFocus(Key As String, p As Boolean)` _(public)_
- `SetPropertyFocus(Key As String)` _(public)_
- `SetPropertyEnsureVisible(Key As String)` _(public)_
- `PropertiesAreValid(props As List)` As Boolean _(public)_
- `PropertyIsMatch(fld1 As String, fld2 As String)` As Boolean _(public)_
- `AddPropertyTextArea(Key As String, Title As String, DefaultValue As String, Required As Boolean, sRows As String)` _(public)_
- `SetPropertyRangeText(Key As String, value As String)` _(public)_
- `SetPropertyProgressText(Key As String, value As String)` _(public)_
- `SetPropertyCaption(Key As String, value As String)` _(public)_
- `SetPropertyPlaceHolder(Key As String, value As String)` _(public)_
- `SetPropertyToolTip(Key As String, value As String)` _(public)_
- `SetPropertyAlignment(Key As String, value As String)` _(public)_
- `SetPropertyValue(Key As String, value As String)` _(public)_
- `GetPropertyHintID(Key As String)` As String _(public)_
- `GetPropertyValue(Key As String)` As String _(public)_
- `GetPropertyFile(Key As String)` As Object _(public)_
- `GetPropertyImage(Key As String)` As String _(public)_
- `SetPropertyBadge(Key As String, value As Object)` _(public)_
- `AddPropertySelect(Key As String, Title As String, DefaultValue As String, Required As Boolean, Options As Map)` _(public)_
- `SetPropertySelectMap(Key As String, Options As Map)` _(public)_
- `SetPropertySelectClear(Key As String)` _(public)_
- `SetPropertySelectAddItem(Key As String, itemValue As String, itemText As String)` _(public)_
- `SetPropertySelectItemsList(Key As String, Options As List)` _(public)_
- `SetPropertyAvatarGroupItems(Key As String, Images As List)` _(public)_
- `SetPropertySelectItemsListSort(Key As String, Options As List)` _(public)_
- `SetPropertySelectItemsOptions(Key As String, delim As String, bSort As Boolean, bAddNothingSelected As Boolean, sOptions As String)` _(public)_
- `SetPropertySelectItemsList1(Key As String, bAddNothingSelected As Boolean, Options As List)` _(public)_
- `AddPropertyFileInput(Key As String, Title As String, Required As Boolean, sAccept As String, bMultiple As Boolean)` _(public)_
- `AddPropertyFileInputProgress(Key As String, Title As String, xSize As String, xIcon As String, xIconSize As String, xColor As String, xTextColor As String)` _(public)_
- `AddPropertyCamCorder(Key As String, Title As String, xSize As String, xIconSize As String, xColor As String, xTextColor As String)` _(public)_
- `AddPropertyCamera(Key As String, Title As String, xSize As String, xIconSize As String, xColor As String, xTextColor As String)` _(public)_
- `AddPropertyMicrophone(Key As String, Title As String, xSize As String, xIconSize As String, xColor As String, xTextColor As String)` _(public)_
- `SetPropertyFileInputAccept(key As String, saccept As String)` _(public)_
- `SetPropertyFileInputProgressMicrophone(key As String)` _(public)_
- `SetPropertyFileInputMultiple(key As String, b As Boolean)` _(public)_
- `SetPropertyFileInputProgressLoading(key As String, Value As Int, Status As Boolean)` _(public)_
- `AddPropertyAvatar(Key As String, Title As String, sSize As String, Shape As String, Url As String)` _(public)_
- `SetPropertyAvatarRing(Key As String, bHasRing As Boolean, ringColor As String, ringOffset As String, ringOffsetColor As String)` _(public)_
- `AddPropertyAvatarPlaceholder(Key As String, Title As String, DefaultValue As String, sSize As String, Shape As String, Color As String, textColor As String, textSize As String)` _(public)_
- `AddPropertyAvatarGroup(Key As String, Title As String, sSize As String, Shape As String, Images As List)` _(public)_
- `SetPropertyAvatarOnline(Key As String, bOnlineStatus As Boolean, bStatus As Boolean)` _(public)_
- `SetPropertyAvatarMask(Key As String, Shape As String)` _(public)_
- `SetPropertyImageMask(Key As String, Shape As String)` _(public)_
- `AddPropertyImage(Key As String, Title As String, Width As String, Height As String, Shape As String, Url As String)` _(public)_
- `SetPropertyImage(Key As String, imgUrl As String)` _(public)_
- `AddPropertyProgress(Key As String, Title As String, DefaultValue As String, Color As String, StartValue As String, StepValue As String, MaxValue As String)` _(public)_
- `AddPropertyRange(Key As String, Title As String, DefaultValue As String, Color As String, StartValue As String, StepValue As String, MaxValue As String)` _(public)_
- `AddPropertyCheckBox(Key As String, Title As String, DefaultValue As Boolean, Color As String)` _(public)_
- `IsPropertyBlank(Key As String)` As Boolean _(public)_
- `PropertyOneIfBlankElseZero(Key As String)` As Int _(public)_
- `SetPropertyColor(Key As String, s As String)` _(public)_
- `SetPropertyChecked(Key As String, b As Boolean)` _(public)_
- `SetPropertyReadOnly(Key As String, b As Boolean)` _(public)_
- `SetPropertyAddClass(Key As String, className As String)` _(public)_
- `SetPropertyRemoveClass(Key As String, className As String)` _(public)_
- `SetPropertyStepValue(Key As String, v As Object)` _(public)_
- `SetPropertyMinValue(Key As String, v As Object)` _(public)_
- `SetPropertyMaxValue(Key As String, v As Object)` _(public)_
- `SetPropertyMaxLength(Key As String, v As String)` _(public)_
- `SetPropertyRows(Key As String, v As String)` _(public)_
- `AddPropertyToggle(Key As String, Title As String, DefaultValue As Boolean, Color As String)` _(public)_
- `AddPropertyRadialProgress(Key As String, Title As String, DefaultValue As Boolean, Color As String, sSize As String, sThickNess As String)` _(public)_
- `SetPropertyRadialProgress(Key As String, Value As Object)` _(public)_
- `AddPropertyRating(Key As String, Title As String, DefaultValue As String, Color As String, mask As String)` _(public)_
- `SetPropertyRating(Key As String, Value As Object)` _(public)_
- `SetPropertyRadioGroup(Key As String, Value As Object)` _(public)_
- `SetPropertyOneColumn(Key As String)` _(public)_
- `SetPropertyTwoColumn(Key As String)` _(public)_
- `HideProperty(Keys As List)` _(public)_
- `ShowProperty(Keys As List)` _(public)_
- `SetPropertyVisible(Key As String, bStatus As Boolean)` _(public)_
- `SetPropertyVisibleMultiple(bStatus As Boolean, props As List)` _(public)_
- `RequireProperty(status As Boolean, keys As List)` _(public)_
- `AddPropertyGroupSelect(Key As String, Title As String, DefaultValue As String, Color As String, bSingleSelect As Boolean, ActiveColor As String, Options As Map)` _(public)_
- `AddPropertyCheckBoxGroup(Key As String, Title As String, DefaultValue As String, Color As String, ActiveColor As String, Options As Map)` _(public)_
- `AddPropertyToggleGroup(Key As String, Title As String, DefaultValue As String, Color As String, ActiveColor As String, Options As Map)` _(public)_
- `AddPropertyRadioGroup(Key As String, Title As String, DefaultValue As String, Color As String, ActiveColor As String, Options As Map)` _(public)_
- `SetPropertyRadioGroupItems(Key As String, sColor As String, sActiveColor As String, items As Map)` _(public)_
- `SetPropertyToggleGroupItems(Key As String, sColor As String, sActiveColor As String, items As Map)` _(public)_
- `SetPropertyCheckBoxGroupItems(Key As String, sColor As String, sActiveColor As String, items As Map)` _(public)_
- `AddPropertyFilter(Key As String, Title As String, DefaultValue As String, Color As String, ActiveColor As String, Options As Map)` _(public)_
- `SetPropertyFilterItems(Key As String, sColor As String, sActiveColor As String, items As Map)` _(public)_
- `SetPropertyGroupSelectItems(Key As String, sColor As String, sActiveColor As String, bSingleSelect As Boolean, items As Map)` _(public)_
- `GetPropertyFileInput(e As BANanoEvent)` As Map _(public)_
- `GetPropertyFilesInput(e As BANanoEvent)` As List _(public)_
- `GetFileFromEvent(e As BANanoEvent)` As Map _(public)_
- `GetFilesFromEvent(e As BANanoEvent)` As List _(public)_
- `SetPropertyBagDefaults()` _(public)_
- `SetPropetyBag(item As Map)` _(public)_
- `ResetPropetyBag()` _(public)_
- `LoadFromJSON(fileURL As String)` _(public)_
- `SetPropertyOverwrite(Key As String, NewType As String)` _(public)_
- `LoadComponentFromJson(designName As String)` _(public)_
- `IsPropertyBagValid()` As Boolean _(public)_
- `SetPropertiesDefaultValues(props As List)` _(public)_
- `ExtractProperties(props As List)` As Map _(public)_
- `ExtractEvents(props As List)` As Map _(public)_
- `ExtractPropertyBag(props As List)` As Map _(public)_
- `SetPropertyComponentName(value As String)` _(public)_
- `SetPropertyComponentType(value As String)` _(public)_
- `SetPropertyComponentID(value As String)` _(public)_
- `SetPropertyParentComponent(value As String)` _(public)_
- `SetPropertyParentDevice(value As Boolean)` _(public)_
- `SetPropertyComponentActive(b As Boolean)` _(public)_
- `SetPropertyComponentIndex(b As Boolean)` _(public)_
- `SetPropertyComponentTemplate(b As Boolean)` _(public)_
- `SetPropertyCreateB4xLayout(b As Boolean)` _(public)_
- `HideComponentProperties()` _(public)_
- `ShowComponentProperties()` _(public)_
- `ShowDesign(compType As String)` _(public)_
- `AddToolbarActionButtonIcon(btnID As String, sIcon As String, btnColor As String, iconColor As String)` As SDUI5Button			'ignoredeadcode _(public)_
- `SetToolbarButtonBadge(btn As String, value As String)` _(public)_
- `SetToolbarButtonBadgeColor(btn As String, value As String)` _(public)_
- `SetToolbarButtonBadgeSize(btn As String, value As String)` _(public)_
- `SetToolbarButtonBadgeRound(btn As String)` _(public)_
- `SetToolbarButtonBadgeTextColor(btn As String, value As String)` _(public)_
- `AddToolbarActionButton(btnID As String, btnCaption As String, btnColor As String, textColor As String)` As SDUI5Button		'ignoredeadcode _(public)_
- `SetToolbarButtonToolTip(btnID As String, tooltip As String, color As String, position As String)` As 'ignoredeadcode _(public)_
- `AddToolbarFileUpload(btnID As String, sIcon As String, btnColor As String, bMultiple As Boolean)` As SDUI5Button		'ignoredeadcode _(public)_
- `SetToolbarButtonColor(btn As String, value As String)` _(public)_
- `SetToolbarButtonTextColor(btn As String, value As String)` As 'ignoredeadcode _(public)_
- `SetToolbarButtonIconColor(btn As String, value As String)` As 'ignoredeadcode _(public)_
- `SetToolbarButtonVisible(btn As String, value As Boolean)` _(public)_
- `SetToolbarButtonEnable(btn As String, b As Boolean)` _(public)_
- `SetToolbarButtonLoading(btn As String, b As Boolean)` _(public)_
- `SetPropertyValues(m As Map)` _(public)_
- `FileChangeSingle()` _(public)_
- `FileChangeMultiple()` _(public)_
- `FileChange()` _(public)_
- `PropertyBagFromAsset(fileURL As String)` _(public)_
- `PropertyBagFromJSON(fContents As String)` _(public)_
## Key Setters (68)
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
- `setHasSearch(b As Boolean)` As 'ignoredeadcode _(public)_
- `setHasActions(b As Boolean)` As 'ignoredeadcode _(public)_
- `setHasDownload(b As Boolean)` As 'ignoredeadcode _(public)_
- `setHasUpload(b As Boolean)` As 'ignoredeadcode _(public)_
- `setUploadTooltip(s As String)` As 'ignoredeadcode _(public)_
- `setHasRefresh(b As Boolean)` As 'ignoredeadcode _(public)_
- `setHasBack(b As Boolean)` As 'ignoredeadcode _(public)_
- `setHasDelete(b As Boolean)` As 'ignoredeadcode _(public)_
- `setHasSave(b As Boolean)` As 'ignoredeadcode _(public)_
- `setHasAddNew(b As Boolean)` As 'ignoredeadcode _(public)_
- `setAddNewTooltip(s As String)` As 'ignoredeadcode _(public)_
- `setBackTooltip(s As String)` As 'ignoredeadcode _(public)_
- `setDeleteTooltip(s As String)` As 'ignoredeadcode _(public)_
- `setRefreshTooltip(s As String)` As 'ignoredeadcode _(public)_
- `setSaveTooltip(s As String)` As 'ignoredeadcode _(public)_
- `setCard(b As Boolean)` _(public)_
- `setCardBorder(b As Boolean)` _(public)_
- `setButtonsRounded(s As String)` _(public)_
- `setBottonsWidth(s As String)` _(public)_
- `setButtonsShadow(s As String)` _(public)_
- `setCancelCaption(s As String)` _(public)_
- `setCancelColor(s As String)` _(public)_
- `setCancelLoading(b As Boolean)` _(public)_
- `setCancelTextColor(s As String)` _(public)_
- `setCancelVisible(b As Boolean)` _(public)_
- `setNoCaption(s As String)` _(public)_
- `setNoColor(s As String)` _(public)_
- `setNoLoading(b As Boolean)` _(public)_
- `setNoTextColor(s As String)` _(public)_
- `setNoVisible(b As Boolean)` _(public)_
- `setYesCaption(s As String)` _(public)_
- `setYesColor(s As String)` _(public)_
- `setYesLoading(b As Boolean)` _(public)_
- `setYesTextColor(s As String)` _(public)_
- `setYesVisible(b As Boolean)` _(public)_
- `setTopActionsVisible(b As Boolean)` As 'ignoredeadcode _(public)_
- `setActionsVisible(b As Boolean)` As 'ignoredeadcode _(public)_
- `setShadow(s As String)` _(public)_
- `setButtonSize(s As String)` _(public)_
- `setButtonsOutlined(b As Boolean)` _(public)_
- `setComponentSize(s As String)` _(public)_
- `setIsZebra(b As Boolean)` As 'ignoredeadcode _(public)_
- `setPropertyPadding(s As String)` _(public)_
- `setSearchSize(s As String)` As 'ignoredeadcode _(public)_
- `setSearchVisible(b As Boolean)` As 'ignoredeadcode _(public)_
- `setSearchWidth(s As String)` As 'ignoredeadcode _(public)_
- `setTitle(s As String)` As 'ignoredeadcode _(public)_
- `setTooltipColor(s As String)` _(public)_
- `setTooltipAlignment(s As String)` _(public)_
- `setWrapActions(b As Boolean)` As 'ignoredeadcode _(public)_
- `setSearchValue(s As String)` _(public)_
- `setPropertyBag(values As Map)` _(public)_
- `setBodyFontSize(s As String)` _(public)_
- `setHeaderFontSize(s As String)` _(public)_
- `setFooterFontSize(s As String)` _(public)_
- `setBodyFontFamily(s As String)` _(public)_
- `setHeaderFontFamily(s As String)` _(public)_
- `setFooterFontFamily(s As String)` _(public)_
## Getters (64)
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
- `getHasSearch()` As Boolean _(public)_
- `getHasDownload()` As Boolean _(public)_
- `getUploadTooltip()` As String _(public)_
- `getDownloadTooltip()` As String _(public)_
- `getAddNewTooltip()` As String _(public)_
- `getBackTooltip()` As String _(public)_
- `getDeleteTooltip()` As String _(public)_
- `getSaveTooltip()` As String _(public)_
- `getRefreshTooltip()` As String _(public)_
- `getCard()` As Boolean _(public)_
- `getCardBorder()` As Boolean _(public)_
- `getButtonsRounded()` As String _(public)_
- `getBottonsWidth()` As String _(public)_
- `getButtonsShadow()` As String _(public)_
- `getTopActionsVisible()` As Boolean _(public)_
- `getActionsVisible()` As Boolean _(public)_
- `getCancelCaption()` As String _(public)_
- `getCancelColor()` As String _(public)_
- `getCancelLoading()` As Boolean _(public)_
- `getCancelTextColor()` As String _(public)_
- `getCancelVisible()` As Boolean _(public)_
- `getNoCaption()` As String _(public)_
- `getNoColor()` As String _(public)_
- `getNoLoading()` As Boolean _(public)_
- `getNoTextColor()` As String _(public)_
- `getNoVisible()` As Boolean _(public)_
- `getYesCaption()` As String _(public)_
- `getYesColor()` As String _(public)_
- `getYesLoading()` As Boolean _(public)_
- `getYesTextColor()` As String _(public)_
- `getYesVisible()` As Boolean _(public)_
- `getShadow()` As String _(public)_
- `getTooltipAlignment()` As String _(public)_
- `getButtonSize()` As String _(public)_
- `getButtonsOutlined()` As Boolean _(public)_
- `getComponentSize()` As String _(public)_
- `getIsZebra()` As Boolean _(public)_
- `getPropertyPadding()` As String _(public)_
- `getSearchSize()` As String _(public)_
- `getSearchVisible()` As Boolean _(public)_
- `getSearchWidth()` As String _(public)_
- `getTitle()` As String _(public)_
- `getTooltipColor()` As String _(public)_
- `getWrapActions()` As Boolean _(public)_
- `getHeadingID()` As String _(public)_
- `getBodyID()` As String _(public)_
- `getFooterID()` As String _(public)_
- `getSearchValue()` As String _(public)_
- `getSearchID()` As String _(public)_
- `getToolBarButtonID(btnID As String)` As String _(public)_
- `getName()` As String _(public)_
- `getPropertyBag()` As Map _(public)_
## Private Methods (3)
- `Class_Globals()` _(private)_
- `ColorChange(color As BANanoObject)` As 'ignoredeadcode _(private)_
- `OnPropChangeInternal(e As BANanoEvent)` As 'ignoredeadcode _(private)_
## Verified Demo Usage

Real syntax from [`pgPreferences.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgPreferences.bas) (verified demo). `propbagx` = a SDUI5Preferences.

```b4j
	propbagx.Initialize(Me, "propbagx", "propbagx")
	propbagx.ParentID = "SDUI5Column1"
	propbagx.ButtonSize = "md"
	propbagx.CancelColor = "neutral"
	propbagx.CancelTextColor = ""
	propbagx.CancelVisible = False
	propbagx.NoCaption = "Cancel"
	propbagx.SearchWidth = "250px"
	propbagx.Shadow = "lg"
	propbagx.Title = "Input"
	propbagx.YesCaption = "Apply"
	BANano.Await(propbagx.AddComponent)
```

Builder methods, real call order (from `pgPreferences.bas`):

```b4j
	propbagx.AddPropertyDialer("dialer1", "Dialer", "10", True, 0, 5, 100)
	propbagx.AddPropertyPlusMinus("plusminus", "Plus Minus", "3", False, "0", "1", "12")
	propbagx.AddPropertyTextBox("textbox1", "TextBox", "Mashy", True)
	propbagx.AddPropertyTextBoxGroup("textboxgroup1", "TextBoxGroup", "TextBoxGroup", True)
	propbagx.SetPropertyAppendIcon("textboxgroup1", "./assets/fan-solid.svg")
	propbagx.AddPropertySelect("select1", "Select", "b4j", True, CreateMap("b4a": "Basic 4 Android", "b4i": "Basic 4 iPhone", "b4j": "Basic 4 Java", "b4r": "Basic 4 Arduino"))
	propbagx.AddPropertySelectGroup("selectgroup1", "SelectGroup", "b4a", True, _
	propbagx.SetPropertyAppendIcon("selectgroup1", "./assets/plus-solid.svg")
	propbagx.AddPropertyPassword("password0", "Password", "anythingcanhappen", True)
	propbagx.AddPropertyPasswordGroup("password1", "Password Group", "anythingcanhappen", True)
	propbagx.AddPropertyDatePicker("datepicker1", "Date Picker", "", True, "Y-m-d", "F j, Y", "en")
	propbagx.AddPropertyDatePicker("datepicker2", "Date Picker 2", "", True, "Y-m-d", "j F, Y", "ru")
	propbagx.AddPropertyDateTimePicker("datepicker3", "Date Picker 3", "", True, "Y-m-d H:i", "j F, Y H:i", True, "en")
	propbagx.AddPropertyTimePicker("timepicker1", "Time Picker", "", True, "H:i", "H:i", True, "en")
```

Demo-wired events: `Change`, `SearchClear`, `SearchClick`, `SearchKeyUp` — handlers named `propbagx_<Event>`.

Also used in: `pgProvinces`, `pggridbuilder`
## Emits (daisyUI classes pushed in DesignerCreateView)
**Classes**: `card`, `card-border`, `w-full bg-base-100`
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim preferences As SDUI5Preferences
preferences.Initialize(Me, "SDUI5Preferences", "SDUI5Preferences")
preferences.ParentID = "placeholder"
BANano.Await(preferences.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.


