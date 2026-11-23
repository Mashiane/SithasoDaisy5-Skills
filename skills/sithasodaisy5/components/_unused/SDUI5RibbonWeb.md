---
name: SDUI5RibbonWeb
description: SithasoDaisy5 SDUI5RibbonWeb component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5RibbonWeb

## Core Idea
<!-- 1-2 sentences: what this component is and when to reach for it. Auto-stub: fill for high-value components. -->
_SDUI5RibbonWeb is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._

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
| `Width` | String | 100% | — | `setWidth` | `getWidth` |
| `Theme` | String | system | system, light, dark | `setTheme` | `getTheme` |
| `Layout` | String | classic | classic, simplified | `setLayout` | `getLayout` |
| `ActiveLayout` | String | Classic | Classic, Simplified | `setActiveLayout` | `getActiveLayout` |
| `SelectedTab` | String | — | — | `setSelectedTab` | `getSelectedTab` |
| `EnablePersistence` | Boolean | False | — | `setEnablePersistence` | `getEnablePersistence` |
| `StorageKey` | String | — | — | `setStorageKey` | `getStorageKey` |
| `EnableRtl` | Boolean | False | — | `setEnableRtl` | `getEnableRtl` |
| `Visible` | Boolean | True | — | `setVisible` | `getVisible` |
| `Enabled` | Boolean | True | — | `setEnabled` | `getEnabled` |

Setter and getter names are the actual source `Sub` names. `—` means this component has no named accessor for that side; designer-time values may still be consumed through `Props` in `DesignerCreateView`.
## Events
`ButtonID`, `Change`, `TabSelected`, `LauncherClick`, `RibbonError`, `Preview`, `PreviewEnd`, `ContextChange`, `BackstageChange`, `CustomizationChange`, `FileMenu`, `ComboChange`, `CheckBoxChange`, `ColorChange`, `LauncherIconClick`

Wire in parent: `Sub ribbonweb_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.

## Public Methods (79)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Clear()` As SDUI5RibbonWeb _(public)_
- `AddTab(tabID As String, tabCaption As String, cssClass As String, keyTip As String)` As SDUI5RibbonWeb _(public)_
- `AddContextualTab(tabID As String, tabCaption As String, contextualGroup As String, contextColor As String, keyTip As String)` As SDUI5RibbonWeb _(public)_
- `AddQuickAccessItem(id As String, icon As String, caption As String)` As SDUI5RibbonWeb _(public)_
- `SetQuickAccessToolbar(items As List)` As SDUI5RibbonWeb _(public)_
- `ClearQuickAccessToolbar()` As SDUI5RibbonWeb _(public)_
- `SetFileLabel(label As String)` As SDUI5RibbonWeb _(public)_
- `AddBackstageItem(id As String, caption As String, icon As String)` As SDUI5RibbonWeb _(public)_
- `SetBackstage(items As List)` As SDUI5RibbonWeb _(public)_
- `ClearBackstage()` As SDUI5RibbonWeb _(public)_
- `AddFileMenuItem(id As String, text As String, iconCss As String)` As SDUI5RibbonWeb _(public)_
- `AddFileMenuSeparator()` As SDUI5RibbonWeb _(public)_
- `ClearFileItems()` As SDUI5RibbonWeb _(public)_
- `AddGroup(tabGroup As String, groupHeader As String, groupIconCss As String, showLauncherIcon As Boolean, rowOrientation As Boolean)` As SDUI5RibbonWeb _(public)_
- `AddCollection(tabGroupCol As String, cssClass As String)` As SDUI5RibbonWeb _(public)_
- `AddButton(path As String, icon As String, caption As String)` As SDUI5RibbonWeb _(public)_
- `AddButtonSmall(path As String, icon As String, caption As String)` As SDUI5RibbonWeb _(public)_
- `AddButtonMedium(path As String, icon As String, caption As String)` As SDUI5RibbonWeb _(public)_
- `AddButtonLarge(path As String, icon As String, caption As String)` As SDUI5RibbonWeb _(public)_
- `AddButtonIcon(path As String, icon As String, caption As String)` As SDUI5RibbonWeb _(public)_
- `AddToggleButton(path As String, icon As String, caption As String, checked As Boolean)` As SDUI5RibbonWeb _(public)_
- `AddCheckBox(path As String, caption As String, checked As Boolean)` As SDUI5RibbonWeb _(public)_
- `AddSplitButton(path As String, icon As String, caption As String, childItems As Map)` As SDUI5RibbonWeb _(public)_
- `AddSplitButtonItem(path As String, caption As String)` As SDUI5RibbonWeb _(public)_
- `AddColorPicker(path As String, value As String)` As SDUI5RibbonWeb _(public)_
- `AddComboBox(path As String, dataSource As Object, selectedIndex As Int, allowFiltering As Boolean, width As String)` As SDUI5RibbonWeb _(public)_
- `AddSelect(path As String, dataSource As Object, selectedIndex As Int, width As String)` As SDUI5RibbonWeb _(public)_
- `AddDropDown(path As String, dataSource As List, value As String)` As SDUI5RibbonWeb _(public)_
- `AddTextBox(path As String, caption As String, value As String, placeholder As String)` As SDUI5RibbonWeb _(public)_
- `AddSlider(path As String, caption As String, value As Int, MinValue As Int, MaxValue As Int, StepValue As Int)` As SDUI5RibbonWeb _(public)_
- `AddRadioButton(path As String, caption As String, groupName As String, checked As Boolean)` As SDUI5RibbonWeb _(public)_
- `AddSpinner(path As String, caption As String, value As Int, MinValue As Int, MaxValue As Int, StepValue As Int)` As SDUI5RibbonWeb _(public)_
- `AddGallery(path As String, caption As String, items As List, inlineCount As Int, columns As Int)` As SDUI5RibbonWeb _(public)_
- `AddSeparator(path As String)` As SDUI5RibbonWeb _(public)_
- `AddLabel(path As String, caption As String)` As SDUI5RibbonWeb _(public)_
- `AddMenuButton(path As String, icon As String, caption As String, childItems As List)` As SDUI5RibbonWeb _(public)_
- `AddCustomControl(path As String, slotName As String)` As SDUI5RibbonWeb _(public)_
- `AddButtonGroup(tabGroupColItem As String, selection As Int)` As SDUI5RibbonWeb _(public)_
- `AddButtonGroupItem(tabGroupColItemChild As String, iconCss As String, bSelected As Boolean)` As SDUI5RibbonWeb _(public)_
- `SetButtonIsToggle(path As String, isToggle As Boolean)` As SDUI5RibbonWeb _(public)_
- `SetItemEnabled(path As String, enabled As Boolean)` As SDUI5RibbonWeb _(public)_
- `SetItemVisible(path As String, visible As Boolean)` As SDUI5RibbonWeb _(public)_
- `SetItemChecked(path As String, checked As Boolean)` As SDUI5RibbonWeb _(public)_
- `SetItemKeyTip(path As String, keyTip As String)` As SDUI5RibbonWeb _(public)_
- `SetItemToolTip(path As String, title As String, cssClass As String, icon As String, content As String)` As SDUI5RibbonWeb _(public)_
- `SetItemSizeLarge(path As String)` As SDUI5RibbonWeb _(public)_
- `SetItemSizeMedium(path As String)` As SDUI5RibbonWeb _(public)_
- `SetItemSizeSmall(path As String)` As SDUI5RibbonWeb _(public)_
- `SetItemCssClass(path As String, cssClass As String)` As SDUI5RibbonWeb _(public)_
- `SetGroupKeyTip(path As String, keyTip As String, launcherIconKeyTip As String)` As SDUI5RibbonWeb _(public)_
- `SetGroupCssClass(path As String, cssClass As String)` As SDUI5RibbonWeb _(public)_
- `SetGroupShowLauncherIcon(path As String, show As Boolean)` As SDUI5RibbonWeb _(public)_
- `SetGroupOrientation(path As String, orientation As String)` As SDUI5RibbonWeb _(public)_
- `SetGroupOrientationRow(path As String)` As SDUI5RibbonWeb _(public)_
- `SetGroupOrientationColumn(path As String)` As SDUI5RibbonWeb _(public)_
- `SetGroupCollapsed(path As String, collapsed As Boolean)` As SDUI5RibbonWeb _(public)_
- `SetGroupCollapsible(path As String, isCollapsible As Boolean)` As SDUI5RibbonWeb _(public)_
- `SetGroupEnableGroupOverflow(path As String, enableGroupOverflow As Boolean)` As SDUI5RibbonWeb _(public)_
- `SetGroupOverflowHeader(path As String, overflowHeader As Boolean)` As SDUI5RibbonWeb _(public)_
- `Refresh()` _(public)_
- `SelectTab(tabID As String)` As Boolean _(public)_
- `SetContext(contextName As String, active As Boolean)` As SDUI5RibbonWeb _(public)_
- `SetMinimized(minimized As Boolean)` As SDUI5RibbonWeb _(public)_
- `OpenBackstage(pageID As String)` As SDUI5RibbonWeb _(public)_
- `CloseBackstage()` As SDUI5RibbonWeb _(public)_
- `OpenSearch()` As SDUI5RibbonWeb _(public)_
- `ExportCustomization()` As String _(public)_
- `ImportCustomization(customizationJson As String)` As Boolean _(public)_
- `ResetCustomization()` As SDUI5RibbonWeb _(public)_
- `ExecuteCommand(controlID As String, value As String)` As SDUI5RibbonWeb _(public)_
- `GetActionID(args As Map)` As String _(public)_
- `GetColor(args As Map)` As String _(public)_
- `GetChecked(args As Map)` As Boolean _(public)_

## Key Setters (27)
- `setParentID(value As String)` _(public)_
- `setWidth(value As String)` _(public)_
- `setTheme(value As String)` _(public)_
- `setLayout(value As String)` _(public)_
- `setSelectedTab(value As String)` _(public)_
- `setEnablePersistence(value As Boolean)` _(public)_
- `setStorageKey(value As String)` _(public)_
- `setEnableRtl(value As Boolean)` _(public)_
- `setVisible(value As Boolean)` _(public)_
- `setEnabled(value As Boolean)` _(public)_
- `setActiveLayout(value As String)` _(public)_
- `setLicenseKey(value As String)` _(public)_
- `setFileMenuVisible(value As Boolean)` _(public)_
- `setFileMenuText(value As String)` _(public)_
- `setShowItemOnClick(value As Boolean)` _(public)_
- `setEnableKeyTips(value As Boolean)` _(public)_
- `setHideLayoutSwitcher(value As Boolean)` _(public)_
- `setIsMinimized(value As Boolean)` _(public)_
- `setLauncherIconCss(value As String)` _(public)_
- `setLayoutSwitcherKeyTip(value As String)` _(public)_
- `setLocale(value As String)` _(public)_
- `setCssClass(value As String)` _(public)_
- `setAttributes(value As String)` _(public)_
- `setStyles(value As String)` _(public)_
- `setClasses(value As String)` _(public)_
- `setPaddingAXYTBLR(value As String)` _(public)_
- `setMarginAXYTBLR(value As String)` _(public)_

## Getters (31)
- `getID()` As String _(public)_
- `getHere()` As String _(public)_
- `getMinimized()` As Boolean _(public)_
- `getParentID()` As String _(public)_
- `getWidth()` As String _(public)_
- `getTheme()` As String _(public)_
- `getLayout()` As String _(public)_
- `getSelectedTab()` As String _(public)_
- `getEnablePersistence()` As Boolean _(public)_
- `getStorageKey()` As String _(public)_
- `getEnableRtl()` As Boolean _(public)_
- `getVisible()` As Boolean _(public)_
- `getEnabled()` As Boolean _(public)_
- `getFileLabel()` As String _(public)_
- `getActiveLayout()` As String _(public)_
- `getLicenseKey()` As String _(public)_
- `getFileMenuVisible()` As Boolean _(public)_
- `getFileMenuText()` As String _(public)_
- `getShowItemOnClick()` As Boolean _(public)_
- `getEnableKeyTips()` As Boolean _(public)_
- `getHideLayoutSwitcher()` As Boolean _(public)_
- `getIsMinimized()` As Boolean _(public)_
- `getLauncherIconCss()` As String _(public)_
- `getLayoutSwitcherKeyTip()` As String _(public)_
- `getLocale()` As String _(public)_
- `getCssClass()` As String _(public)_
- `getAttributes()` As String _(public)_
- `getStyles()` As String _(public)_
- `getClasses()` As String _(public)_
- `getPaddingAXYTBLR()` As String _(public)_
- `getMarginAXYTBLR()` As String _(public)_

## Private Methods (16)
- `SetDefaults()` _(private)_
- `NormalizeItems(source As List)` As List _(private)_
- `AddControl(path As String, controlType As String, icon As String, caption As String, size As String)` As SDUI5RibbonWeb _(private)_
- `NewControl(path As String, controlType As String, icon As String, caption As String, size As String)` As Map _(private)_
- `NormalizeIcon(icon As String)` As String _(private)_
- `SetItemSize(path As String, size As String)` As SDUI5RibbonWeb _(private)_
- `ApplyItemChanges(path As String, changes As Map)` _(private)_
- `HandleRibbonEvent(eventData As Map)` _(private)_
- `IsBackstageItem(checkID As String)` As Boolean _(private)_
- `Field(path As String, position As Int)` As String _(private)_
- `LastField(path As String)` As String _(private)_
- `ParentPath(path As String)` As String _(private)_
- `SplitPath(path As String)` As List _(private)_
- `GetGroup(tabID As String, groupID As String)` As Map _(private)_
- `FindGroupByPath(path As String)` As Map _(private)_
- `FindItem(path As String)` As Map _(private)_

## Emits (daisyUI classes pushed in DesignerCreateView)
_(none emitted directly — relies on base/CustProps)_

## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. Never call DesignerCreateView from app code — AddComponent runs it internally. -->
```vb
Dim ribbonweb As SDUI5RibbonWeb
ribbonweb.Initialize(Me, "SDUI5RibbonWeb", "SDUI5RibbonWeb")
ribbonweb.ParentID = "placeholder"
BANano.Await(ribbonweb.AddComponent)
```

## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.
