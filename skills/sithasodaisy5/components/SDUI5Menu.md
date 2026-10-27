---
name: SDUI5Menu
description: SithasoDaisy5 SDUI5Menu component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5Menu

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5Menu.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5Menu.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgDropDown.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgDropDown.bas)
  - [`pgIndex.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgIndex.bas)
  - [`pgMenu.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgMenu.bas)
  - [`pgMenu1.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgMenu1.bas)
  - [`pgMenuTree.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgMenuTree.bas)
  - [`pgSpeedDial.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgSpeedDial.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5Menu is a vertical/horizontal menu. Items (SDUI5MenuItem) mount via `ParentID = menuName`. Use for navigation menus.
_SDUI5Menu is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `TextColor` | String | — | — | `setTextColor` | `getTextColor` |
| `Size` | String | none | lg, md, none, sm, xl, xs | `setSize` | `getSize` |
| `BackgroundColor` | String | base-200 | — | `setBackgroundColor` | `getBackgroundColor` |
| `Direction` | String | vertical | horizontal, vertical | `setDirection` | `getDirection` |
| `HasCheckBox` | Boolean | False | — | `setHasCheckBox` | `getHasCheckBox` |
| `HasIcon` | Boolean | True | — | `setHasIcon` | `getHasIcon` |
| `HasAvatar` | Boolean | True | — | `setHasAvatar` | `getHasAvatar` |
| `HasBadge` | Boolean | True | — | `setHasBadge` | `getHasBadge` |
| `NoWrap` | Boolean | True | — | `setNoWrap` | `getNoWrap` |
| `OverflowYAuto` | Boolean | True | — | `setOverflowYAuto` | `getOverflowYAuto` |
| `CheckedColor` | String | success | — | `setCheckedColor` | `getCheckedColor` |
| `ItemColor` | String | — | — | `setItemColor` | `getItemColor` |
| `ItemActiveColor` | String | — | — | `setItemActiveColor` | `getItemActiveColor` |
| `ItemActiveTextColor` | String | — | — | `setItemActiveTextColor` | `getItemActiveTextColor` |
| `ItemFocusColor` | String | — | — | `setItemFocusColor` | `getItemFocusColor` |
| `ItemHoverColor` | String | — | — | `setItemHoverColor` | `getItemHoverColor` |
| `Height` | String | — | — | `setHeight` | `getHeight` |
| `Width` | String | 56 | — | `setWidth` | `getWidth` |
| `Rounded` | String | none | none, rounded, 2xl, 3xl, full, lg, md, sm, xl, 0 | `setRounded` | `getRounded` |
| `RoundedBox` | Boolean | True | — | `setRoundedBox` | `getRoundedBox` |
| `RoundedItems` | Boolean | True | — | `setRoundedItems` | `getRoundedItems` |
| `Shadow` | String | none | 2xl, inner, lg, md, none, shadow, sm, xl | `setShadow` | `getShadow` |
| `MaxHeight` | String | — | — | `setMaxHeight` | `getMaxHeight` |
| `MaxWidth` | String | — | — | `setMaxWidth` | `getMaxWidth` |
| `MinHeight` | String | full | — | `setMinHeight` | `getMinHeight` |
| `MinWidth` | String | — | — | `setMinWidth` | `getMinWidth` |
| `SmDirection` | String | none | horizontal, none, vertical | `setSmDirection` | `getSmDirection` |
| `MdDirection` | String | none | horizontal, none, vertical | `setMdDirection` | `getMdDirection` |
| `LgDirection` | String | none | horizontal, none, vertical | `setLgDirection` | `getLgDirection` |
| `XlDirection` | String | none | horizontal, none, vertical | `setXlDirection` | `getXlDirection` |
| `PopOver` | Boolean | False | — | `setPopOver` | `getPopOver` |
| `ClosePopupOnClick` | Boolean | False | — | `setClosePopupOnClick` | `getClosePopupOnClick` |
| `Card` | Boolean | False | — | `setCard` | `getCard` |
| `Dropdown` | Boolean | False | — | `setDropdown` | `getDropdown` |
| `DropdownOpen` | Boolean | False | — | `setDropdownOpen` | `getDropdownOpen` |
| `DropDownHover` | Boolean | False | — | `setDropDownHover` | `getDropDownHover` |
| `DropdownPlacement` | String | bottom | bottom, bottom-center, bottom-end, center, end, left, left-center, left-end, right, right-center, right-end, start, top, top-center, top-end, none | `setDropdownPlacement` | `getDropdownPlacement` |
| `DropdownContent` | Boolean | False | — | `setDropdownContent` | `getDropdownContent` |
| `DropDownId` | String | — | — | `setDropDownId` | `getDropDownId` |
| `CloseDropdownOnClick` | Boolean | False | — | `setCloseDropdownOnClick` | `getCloseDropdownOnClick` |
| `RawItemClasses` | String | — | — | `setItemClasses` | `getItemClasses` |
| `RawItemStyles` | String | — | — | `setItemStyles` | `getItemStyles` |
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
`ItemClick`, `Change`

Wire in parent: `Sub menu_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (21)
- `AddComponent()` _(public)_
- `AddItemChild(parentID As String, itemKey As String, itemIcon As String, itemText As String)` As SDUI5MenuItem _(public)_
- `AddItemParent(parentID As String, itemKey As String, itemIcon As String, itemText As String)` As SDUI5MenuItem _(public)_
- `AddMenuItem(itemKey As String, itemText As String, itemParent As Boolean)` As SDUI5MenuItem _(public)_
- `AddMenuItemAvatarText(parentID As String, itemKey As String, itemAvatar As String, itemAvatarShape As String, itemAvatarSize As String, itemText As String, itemParent As Boolean)` As SDUI5MenuItem _(public)_
- `AddMenuItemChild(itemKey As String, itemIcon As String, itemText As String)` As SDUI5MenuItem _(public)_
- `AddMenuItemIcon(itemKey As String, itemIcon As String, iconSize As String)` As SDUI5MenuItem _(public)_
- `AddMenuItemIconColor(itemKey As String, itemIcon As String, iconSize As String, iconColor As String)` As SDUI5MenuItem _(public)_
- `AddMenuItemIconText(itemKey As String, itemIcon As String, itemText As String, itemParent As Boolean)` As SDUI5MenuItem _(public)_
- `AddMenuItemParent(itemKey As String, itemIcon As String, itemText As String)` As SDUI5MenuItem _(public)_
- `AddMenuItemTitle(itemKey As String, itemText As String)` As SDUI5MenuItem _(public)_
- `Clear()` _(public)_
- `CloseParents()` _(public)_
- `ClosePopover()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `HidePopover()` _(public)_
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `LinkExisting()` _(public)_
- `Remove()` _(public)_
- `ShowPopOver()` _(public)_
- `TogglePopover()` _(public)_

## Key Setters (63)
- `setAnchorName(s As String)` _(public)_
- `setAttributes(s As String)` _(public)_
- `setBackgroundColor(s As String)` _(public)_
- `setCard(b As Boolean)` _(public)_
- `setCheckedColor(s As String)` _(public)_
- `setClasses(s As String)` _(public)_
- `setCloseDropdownOnClick(b As Boolean)` _(public)_
- `setClosePopupOnClick(b As Boolean)` _(public)_
- `setDirection(s As String)` _(public)_
- `setDropdown(b As Boolean)` _(public)_
- `setDropdownContent(b As Boolean)` _(public)_
- `setDropDownHover(b As Boolean)` _(public)_
- `setDropDownId(s As String)` _(public)_
- `setDropdownOpen(b As Boolean)` _(public)_
- `setDropdownPlacement(s As String)` _(public)_
- `setEnabled(b As Boolean)` _(public)_
- `setHasAvatar(b As Boolean)` _(public)_
- `setHasBadge(b As Boolean)` _(public)_
- `setHasCheckBox(b As Boolean)` _(public)_
- `setHasIcon(b As Boolean)` _(public)_
- `setHeight(s As String)` _(public)_
- `SetIconFillByID(item As String, s As String)` _(public)_
- `SetItemActive(itemKey As String)` _(public)_
- `setItemActiveColor(s As String)` _(public)_
- `setItemActiveTextColor(s As String)` _(public)_
- `SetItemBadge(item As String, sText As String, sColor As String)` _(public)_
- `SetItemBadgeVisible(item As String, b As Boolean)` _(public)_
- `SetItemChecked(item As String, b As Boolean)` _(public)_
- `setItemClasses(s As String)` _(public)_
- `setItemColor(s As String)` _(public)_
- `setItemFocusColor(s As String)` _(public)_
- `setItemHoverColor(s As String)` _(public)_
- `SetItemHref(itemKey As String, shref As String, starget As String)` _(public)_
- `SetItemOpen(item As String, b As Boolean)` _(public)_
- `setItemStyles(s As String)` _(public)_
- `SetItemVisible(item As String, b As Boolean)` _(public)_
- `setLgDirection(s As String)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setMaxHeight(s As String)` _(public)_
- `setMaxWidth(s As String)` _(public)_
- `setMdDirection(s As String)` _(public)_
- `setMinHeight(s As String)` _(public)_
- `setMinWidth(s As String)` _(public)_
- `setNoWrap(b As Boolean)` _(public)_
- `setOverflowYAuto(b As Boolean)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setParentID(s As String)` _(public)_
- `setPopOver(b As Boolean)` _(public)_
- `setPosition(s As String)` _(public)_
- `setPositionStyle(s As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `setRounded(s As String)` _(public)_
- `setRoundedBox(b As Boolean)` _(public)_
- `setRoundedItems(b As Boolean)` _(public)_
- `SetSelected(s As String)` _(public)_
- `setShadow(s As String)` _(public)_
- `setSize(s As String)` _(public)_
- `setSmDirection(s As String)` _(public)_
- `setStyles(s As String)` _(public)_
- `setTextColor(s As String)` _(public)_
- `setVisible(b As Boolean)` _(public)_
- `setWidth(s As String)` _(public)_
- `setXlDirection(s As String)` _(public)_

## Getters (57)
- `getAnchorName()` _(public)_
- `getAttributes()` _(public)_
- `getBackgroundColor()` _(public)_
- `getCard()` _(public)_
- `getCheckedColor()` _(public)_
- `getClasses()` _(public)_
- `getCloseDropdownOnClick()` _(public)_
- `getClosePopupOnClick()` _(public)_
- `getDirection()` _(public)_
- `getDropdown()` _(public)_
- `getDropdownContent()` _(public)_
- `getDropDownHover()` _(public)_
- `getDropDownId()` _(public)_
- `getDropdownOpen()` _(public)_
- `getDropdownPlacement()` _(public)_
- `getEnabled()` _(public)_
- `getHasAvatar()` _(public)_
- `getHasBadge()` _(public)_
- `getHasCheckBox()` _(public)_
- `getHasIcon()` _(public)_
- `getHeight()` _(public)_
- `getHere()` As String _(public)_
- `getID()` As String _(public)_
- `getItemActiveColor()` _(public)_
- `getItemActiveTextColor()` _(public)_
- `getItemClasses()` _(public)_
- `getItemColor()` _(public)_
- `getItemFocusColor()` _(public)_
- `getItemHoverColor()` _(public)_
- `getItemStyles()` _(public)_
- `getLgDirection()` _(public)_
- `getMarginAXYTBLR()` _(public)_
- `getMaxHeight()` _(public)_
- `getMaxWidth()` _(public)_
- `getMdDirection()` _(public)_
- `getMinHeight()` _(public)_
- `getMinWidth()` _(public)_
- `getNoWrap()` _(public)_
- `getOverflowYAuto()` _(public)_
- `getPaddingAXYTBLR()` _(public)_
- `getParentID()` _(public)_
- `getPopOver()` _(public)_
- `getPosition()` _(public)_
- `getPositionStyle()` _(public)_
- `GetProperties()` _(public)_
- `getRounded()` _(public)_
- `getRoundedBox()` _(public)_
- `getRoundedItems()` _(public)_
- `GetSelected()` _(public)_
- `getShadow()` _(public)_
- `getSize()` _(public)_
- `getSmDirection()` _(public)_
- `getStyles()` _(public)_
- `getTextColor()` _(public)_
- `getVisible()` _(public)_
- `getWidth()` _(public)_
- `getXlDirection()` _(public)_

## Private Methods (2)
- `changed(e As BANanoEvent)` _(private)_
- `SetDefaults()` _(private)_

## Verified Demo Usage

Real syntax from [`pgMenu.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgMenu.bas) (verified demo):

```b4j
Private menu1 As SDUI5Menu		'ignore
Private menu13 As SDUI5Menu		'ignore
Private menu10 As SDUI5Menu		'ignore
Private menu11 As SDUI5Menu		'ignore
Private menu12 As SDUI5Menu		'ignore
BANano.Await(SDUI5Container1.AddComponent)
```

## Emits (daisyUI classes pushed in DesignerCreateView)
**Classes**: `menu`, `flex-nowrap`, `overflow-y-auto`, `dropdown`, `dropdown-open`, `dropdown-hover`, `dropdown-content`, `z-1`, `[&_li>*]:rounded-none`, `rounded-box`
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim menu As SDUI5Menu
menu.Initialize(Me, "SDUI5Menu", "SDUI5Menu")
menu.ParentID = "placeholder"
BANano.Await(menu.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.
