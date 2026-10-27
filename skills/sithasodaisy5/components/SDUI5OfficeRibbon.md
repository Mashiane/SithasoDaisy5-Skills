---
name: SDUI5OfficeRibbon
description: SithasoDaisy5 SDUI5OfficeRibbon component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5OfficeRibbon

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5OfficeRibbon.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5OfficeRibbon.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgOfficeRibbon.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgOfficeRibbon.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5OfficeRibbon is an Office-style ribbon toolbar. Children (tabs/groups) mount via ParentID. Use for rich toolbars.
_SDUI5OfficeRibbon is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `LicenseKey` | String | — | — | `setLicenseKey` | `getLicenseKey` |
| `FileMenuText` | String | File | — | `setFileMenuText` | `getFileMenuText` |
| `FileMenuVisible` | Boolean | True | — | `setFileMenuVisible` | `getFileMenuVisible` |
| `ShowItemOnClick` | Boolean | False | — | `setShowItemOnClick` | `getShowItemOnClick` |
| `ActiveLayout` | String | Simplified | Classic, Simplified | `setActiveLayout` | `getActiveLayout` |
| `CssClass` | String | — | — | `setCssClass` | `getCssClass` |
| `EnableKeyTips` | Boolean | False | — | `setEnableKeyTips` | `getEnableKeyTips` |
| `EnablePersistence` | Boolean | False | — | `setEnablePersistence` | `getEnablePersistence` |
| `EnableRtl` | Boolean | False | — | `setEnableRtl` | `getEnableRtl` |
| `HideLayoutSwitcher` | Boolean | False | — | `setHideLayoutSwitcher` | `getHideLayoutSwitcher` |
| `IsMinimized` | Boolean | False | — | `setIsMinimized` | `getIsMinimized` |
| `LauncherIconCss` | String | — | — | `setLauncherIconCss` | `getLauncherIconCss` |
| `LayoutSwitcherKeyTip` | String | — | — | `setLayoutSwitcherKeyTip` | `getLayoutSwitcherKeyTip` |
| `Locale` | String | — | — | `setLocale` | `getLocale` |
| `SelectedTab` | Int | 0 | — | `setSelectedTab` | `getSelectedTab` |
| `Width` | String | 100% | — | `setWidth` | `getWidth` |
| `Visible` | Boolean | True | — | `setVisible` | `getVisible` |
| `Enabled` | Boolean | True | — | `setEnabled` | `getEnabled` |

Setter and getter names are the actual source `Sub` names. `—` means this component has no named accessor for that side; designer-time values may still be consumed through `Props` in `DesignerCreateView`.
## Events
`ColorChange`, `ComboChange`, `CheckBoxChange`, `ButtonID`, `TabSelected`, `LauncherIconClick`, `FileMenu`, `Button`

Wire in parent: `Sub officeribbon_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (24)
- `AddButton(tabGroupColItem As String, iconCss As String, itemText As String)` As SDUI5OfficeRibbon _(public)_
- `AddButtonGroup(tabGroupColItem As String, selection As Int)` As SDUI5OfficeRibbon _(public)_
- `AddButtonGroupItem(tabGroupColItemChild As String, iconCss As String, bSelected As Boolean)` As SDUI5OfficeRibbon _(public)_
- `AddButtonIcon(tabGroupColItem As String, iconCss As String, itemText As String)` As SDUI5OfficeRibbon _(public)_
- `AddButtonLarge(tabGroupColItem As String, iconCss As String, itemText As String)` As SDUI5OfficeRibbon _(public)_
- `AddButtonMedium(tabGroupColItem As String, iconCss As String, itemText As String)` As SDUI5OfficeRibbon _(public)_
- `AddButtonSmall(tabGroupColItem As String, iconCss As String, itemText As String)` As SDUI5OfficeRibbon _(public)_
- `AddCheckBox(tabGroupColItem As String, itemLabel As String, checked As Boolean)` As SDUI5OfficeRibbon _(public)_
- `AddCollection(tabGroupCol As String, cssClass As String)` As SDUI5OfficeRibbon _(public)_
- `AddColorPicker(tabGroupColItem As String, itemValue As String)` As SDUI5OfficeRibbon _(public)_
- `AddComboBox(tabGroupColItem As String, dataSource As Object, selectedIndex As Int, allowFiltering As Boolean, width As String)` As SDUI5OfficeRibbon _(public)_
- `AddComponent()` _(public)_
- `AddFileMenuItem(id As String, text As String, iconCss As String)` As SDUI5OfficeRibbon _(public)_
- `AddFileMenuSeparator()` _(public)_
- `AddGroup(tabGroup As String, groupHeader As String, groupIconCss As String, showLauncherIcon As Boolean, rowOrientation As Boolean)` As SDUI5OfficeRibbon _(public)_
- `AddSplitButton(tabGroupColItem As String, iconCss As String, itemText As String, childItems As Map)` As SDUI5OfficeRibbon _(public)_
- `AddSplitButtonItem(tabGroupColItem As String, itemText As String)` As SDUI5OfficeRibbon _(public)_
- `AddTab(tabID As String, tabCaption As String, cssClass As String, keyTip As String)` As SDUI5OfficeRibbon _(public)_
- `Clear()` _(public)_
- `ClearFileItems()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `Refresh()` _(public)_
- `Remove()` _(public)_

## Key Setters (42)
- `setActiveLayout(s As String)` _(public)_
- `setAttributes(s As String)` _(public)_
- `SetButtonIsToggle(tabGroupColItem As String, isToggle As Boolean)` As SDUI5OfficeRibbon _(public)_
- `setClasses(s As String)` _(public)_
- `setCssClass(s As String)` _(public)_
- `setEnabled(b As Boolean)` _(public)_
- `setEnableKeyTips(b As Boolean)` _(public)_
- `setEnablePersistence(b As Boolean)` _(public)_
- `setEnableRtl(b As Boolean)` _(public)_
- `setFileMenuText(s As String)` _(public)_
- `setFileMenuVisible(b As Boolean)` _(public)_
- `SetGroupCollapsed(groupName As String, isCollapsed As Boolean)` As SDUI5OfficeRibbon _(public)_
- `SetGroupCollapsible(groupName As String, isCollapsible As Boolean)` As SDUI5OfficeRibbon _(public)_
- `SetGroupCssClass(groupName As String, cssClass As String)` As SDUI5OfficeRibbon _(public)_
- `SetGroupEnableGroupOverflow(groupName As String, enableGroupOverflow As Boolean)` As SDUI5OfficeRibbon _(public)_
- `SetGroupKeyTip(groupName As String, keyTip As String, launcherIconKeyTip As String)` As SDUI5OfficeRibbon _(public)_
- `SetGroupOrientation(groupName As String, orientation As String)` As SDUI5OfficeRibbon _(public)_
- `SetGroupOrientationColumn(groupName As String)` As SDUI5OfficeRibbon _(public)_
- `SetGroupOrientationRow(groupName As String)` As SDUI5OfficeRibbon _(public)_
- `SetGroupOverflowHeader(groupName As String, overflowHeader As Boolean)` As SDUI5OfficeRibbon _(public)_
- `SetGroupShowLauncherIcon(groupName As String, showLauncherIcon As Boolean)` As SDUI5OfficeRibbon _(public)_
- `setHideLayoutSwitcher(b As Boolean)` _(public)_
- `setIsMinimized(b As Boolean)` _(public)_
- `SetItemCssClass(tabGroupColItem As String, cssClass As String)` As SDUI5OfficeRibbon _(public)_
- `SetItemEnabled(tabGroupColItem As String, itemEnabled As Boolean)` As SDUI5OfficeRibbon _(public)_
- `SetItemSizeLarge(tabGroupColItem As String)` As SDUI5OfficeRibbon _(public)_
- `SetItemSizeMedium(tabGroupColItem As String)` As SDUI5OfficeRibbon _(public)_
- `SetItemSizeSmall(tabGroupColItem As String)` As SDUI5OfficeRibbon _(public)_
- `SetItemToolTip(tabGroupColItem As String, title As String, cssClass As String, iconCss As String, content As String)` As SDUI5OfficeRibbon _(public)_
- `setLauncherIconCss(s As String)` _(public)_
- `setLayoutSwitcherKeyTip(s As String)` _(public)_
- `setLicenseKey(s As String)` _(public)_
- `setLocale(s As String)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setParentID(s As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `setSelectedTab(i As Int)` _(public)_
- `setShowItemOnClick(b As Boolean)` _(public)_
- `setStyles(s As String)` _(public)_
- `setVisible(b As Boolean)` _(public)_
- `setWidth(s As String)` _(public)_

## Getters (30)
- `GetActionID(args As Map)` As String _(public)_
- `getActiveLayout()` _(public)_
- `getAttributes()` _(public)_
- `GetChecked(args As Map)` As Boolean _(public)_
- `getClasses()` _(public)_
- `GetColor(args As Map)` As String _(public)_
- `getCssClass()` _(public)_
- `getEnabled()` _(public)_
- `getEnableKeyTips()` _(public)_
- `getEnablePersistence()` _(public)_
- `getEnableRtl()` _(public)_
- `getFileMenuText()` _(public)_
- `getFileMenuVisible()` _(public)_
- `getHere()` As String _(public)_
- `getHideLayoutSwitcher()` _(public)_
- `getID()` As String _(public)_
- `getIsMinimized()` _(public)_
- `getLauncherIconCss()` _(public)_
- `getLayoutSwitcherKeyTip()` _(public)_
- `getLicenseKey()` _(public)_
- `getLocale()` _(public)_
- `getMarginAXYTBLR()` _(public)_
- `getPaddingAXYTBLR()` _(public)_
- `getParentID()` _(public)_
- `GetProperties()` _(public)_
- `getSelectedTab()` _(public)_
- `getShowItemOnClick()` _(public)_
- `getStyles()` _(public)_
- `getVisible()` _(public)_
- `getWidth()` _(public)_

## Private Methods (6)
- `ComboChange(args As Map)` _(private)_
- `GetCollections(tabID As String, groupID As String)` As List _(private)_
- `GetGroups(tabID As String)` As List _(private)_
- `GetItems(tabID As String, groupID As String, collectionID As String)` As List _(private)_
- `SearchList(lst As List, key As String, value As String)` As Int _(private)_
- `SetDefaults()` _(private)_

## Verified Demo Usage

Real syntax from [`pgOfficeRibbon.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgOfficeRibbon.bas) (verified demo):

```b4j
Private SDUI5OfficeRibbon1 As SDUI5OfficeRibbon		'ignore
BANano.Await(SDUI5Container1.AddComponent)
```

## Emits (daisyUI classes pushed in DesignerCreateView)
_(none emitted directly — relies on base/CustProps)_
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim officeribbon As SDUI5OfficeRibbon
officeribbon.Initialize(Me, "SDUI5OfficeRibbon", "SDUI5OfficeRibbon")
officeribbon.ParentID = "placeholder"
BANano.Await(officeribbon.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.
