---
name: SDUI5MenuItem
description: SithasoDaisy5 SDUI5MenuItem component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5MenuItem

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5MenuItem.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5MenuItem.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgDropDown.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgDropDown.bas)
  - [`pgMenu.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgMenu.bas)
  - [`pgMenu1.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgMenu1.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5MenuItem is a single menu entry. Mount into the menu via `ParentID = menuName`. Supports nested submenus.
_SDUI5MenuItem is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `MenuName` | String | menu1 | — | `setMenuName` | `getMenuName` |
| `ItemType` | String | normal | icon, icon-text, normal, title, collapse-item, avatar-text | `setItemType` | `getItemType` |
| `Text` | String | Text | — | `setText` | `getText` |
| `HasCheckBox` | Boolean | False | — | `setHasCheckBox` | `getHasCheckBox` |
| `HasIcon` | Boolean | True | — | `setHasIcon` | `getHasIcon` |
| `HasAvatar` | Boolean | True | — | `setHasAvatar` | `getHasAvatar` |
| `HasBadge` | Boolean | True | — | `setHasBadge` | `getHasBadge` |
| `Checked` | Boolean | False | — | `setChecked` | `getChecked` |
| `CheckedColor` | String | success | — | `setCheckedColor` | `getCheckedColor` |
| `ItemColor` | String | — | — | `setItemColor` | `getItemColor` |
| `ItemActiveColor` | String | — | — | `setItemActiveColor` | `getItemActiveColor` |
| `ItemFocusColor` | String | — | — | `setItemFocusColor` | `getItemFocusColor` |
| `ItemHoverColor` | String | — | — | `setItemHoverColor` | `getItemHoverColor` |
| `Open` | Boolean | False | — | `setOpen` | `getOpen` |
| `Avatar` | String | — | — | `setAvatar` | `getAvatar` |
| `AvatarSize` | String | 16 | — | `setAvatarSize` | `getAvatarSize` |
| `AvatarShape` | String | circle | circle, decagon, diamond, heart, hexagon, hexagon-2, none, pentagon, square, squircle, star, star-2, triangle, triangle-2, triangle-3, triangle-4, rounded-2xl, rounded-3xl, rounded, rounded-lg, rounded-md, rounded-sm, rounded-xl | `setAvatarShape` | `getAvatarShape` |
| `Icon` | String | — | — | `setIcon` | `getIcon` |
| `IconSize` | String | 20px | — | `setIconSize` | `getIconSize` |
| `IconColor` | String | — | — | `setIconColor` | `getIconColor` |
| `Parent` | Boolean | False | — | `setParent` | `getParent` |
| `Active` | Boolean | False | — | `setActive` | `getActive` |
| `Badge` | String | — | — | `setBadge` | `getBadge` |
| `BadgeColor` | String | secondary | — | `setBadgeColor` | `getBadgeColor` |
| `BadgeSize` | String | xs | lg, md, none, sm, xl, xs | `setBadgeSize` | `getBadgeSize` |
| `BadgeVisible` | Boolean | False | — | `setBadgeVisible` | `getBadgeVisible` |
| `Focus` | Boolean | False | — | `setFocus` | `getFocus` |
| `Href` | String | — | — | `setHref` | `getHref` |
| `Target` | String | none | _blank, _parent, _self, _top, none | `setTarget` | `getTarget` |
| `Tooltip` | String | — | — | — | `getTooltip` |
| `TooltipPosition` | String | none | bottom, left, none, right, top | — | `getTooltipPosition` |
| `PopOverTarget` | String | — | — | `setPopOverTarget` | `getPopOverTarget` |
| `ClosePopupOnClick` | Boolean | False | — | `setClosePopupOnClick` | `getClosePopupOnClick` |
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
_(none declared)_

Wire in parent: `Sub menuitem_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (17)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `LinkExisting()` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `AddMenuItemTitle(itemKey As String, itemText As String)` As SDUI5MenuItem _(public)_
- `AddMenuItem(itemKey As String, itemText As String, itemParent As Boolean)` As SDUI5MenuItem _(public)_
- `AddMenuItemIcon(itemKey As String, itemIcon As String, iconSize As String)` As SDUI5MenuItem _(public)_
- `AddMenuItemIconColor(itemKey As String, itemIcon As String, iconSize As String, iconColor As String)` As SDUI5MenuItem _(public)_
- `AddMenuItemIconText(itemKey As String, itemIcon As String, itemText As String, itemParent As Boolean)` As SDUI5MenuItem _(public)_
- `AddMenuItemAvatarText(itemKey As String, itemAvatar As String, itemAvatarShape As String, itemAvatarSize As String, itemText As String, itemParent As Boolean)` As SDUI5MenuItem _(public)_
- `AddMenuItemChild(itemKey As String, itemIcon As String, itemText As String)` As SDUI5MenuItem _(public)_
- `AddMenuItemParent(itemKey As String, itemIcon As String, itemText As String)` As SDUI5MenuItem _(public)_
- `Clear()` As 'ignoredeadcode _(public)_
- `SetItemActive(itemKey As String)` _(public)_
## Key Setters (45)
- `setCloseDropdownOnClick(b As Boolean)` _(public)_
- `setDropDownId(s As String)` _(public)_
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
- `setText(text As String)` As 'ignoredeadcode _(public)_
- `setItemActiveColor(s As String)` _(public)_
- `setItemColor(s As String)` _(public)_
- `setItemFocusColor(s As String)` _(public)_
- `setItemHoverColor(s As String)` _(public)_
- `setHasIcon(b As Boolean)` _(public)_
- `setHasAvatar(b As Boolean)` _(public)_
- `setHasBadge(b As Boolean)` _(public)_
- `setItemClasses(s As String)` As 'ignoredeadcode _(public)_
- `setItemStyles(s As String)` As 'ignoredeadcode _(public)_
- `setClosePopupOnClick(b As Boolean)` _(public)_
- `setChecked(b As Boolean)` As 'ignoredeadcode _(public)_
- `setCheckedColor(s As String)` As 'ignoredeadcode _(public)_
- `setHasCheckBox(b As Boolean)` As 'ignoredeadcode _(public)_
- `setAvatar(s As String)` As 'ignoredeadcode _(public)_
- `setAvatarShape(s As String)` As 'ignoredeadcode _(public)_
- `setAvatarSize(s As String)` As 'ignoredeadcode _(public)_
- `setPopOverTarget(s As String)` As 'ignoredeadcode _(public)_
- `setMenuName(s As String)` _(public)_
- `setActive(b As Boolean)` As 'ignoredeadcode _(public)_
- `setBadge(s As String)` As 'ignoredeadcode _(public)_
- `setBadgeColor(s As String)` As 'ignoredeadcode _(public)_
- `setBadgeSize(s As String)` As 'ignoredeadcode _(public)_
- `setFocus(b As Boolean)` As 'ignoredeadcode _(public)_
- `setHref(s As String)` As 'ignoredeadcode _(public)_
- `setIcon(s As String)` As 'ignoredeadcode _(public)_
- `setIconColor(s As String)` As 'ignoredeadcode _(public)_
- `setItemType(s As String)` _(public)_
- `setParent(b As Boolean)` As 'ignoredeadcode _(public)_
- `setTarget(s As String)` As 'ignoredeadcode _(public)_
- `setIconSize(s As String)` As 'ignoredeadcode _(public)_
- `setBadgeVisible(b As Boolean)` As 'ignoredeadcode _(public)_
- `setOpen(b As Boolean)` As 'ignoredeadcode _(public)_
## Getters (49)
- `getCloseDropdownOnClick()` As Boolean _(public)_
- `getDropDownId()` As String _(public)_
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
- `getItemActiveColor()` As String _(public)_
- `getItemColor()` As String _(public)_
- `getItemFocusColor()` As String _(public)_
- `getItemHoverColor()` As String _(public)_
- `getText()` As String _(public)_
- `getHasIcon()` As Boolean _(public)_
- `getHasAvatar()` As Boolean _(public)_
- `getHasBadge()` As Boolean _(public)_
- `getItemClasses()` As String _(public)_
- `getItemStyles()` As String _(public)_
- `getClosePopupOnClick()` As Boolean _(public)_
- `getChecked()` As Boolean _(public)_
- `getCheckedColor()` As String _(public)_
- `getHasCheckBox()` As Boolean _(public)_
- `getAvatar()` As String _(public)_
- `getAvatarShape()` As String _(public)_
- `getAvatarSize()` As String _(public)_
- `getPopOverTarget()` As String					'ignoredeadcode _(public)_
- `getMenuName()` As String _(public)_
- `getActive()` As Boolean _(public)_
- `getBadge()` As String _(public)_
- `getBadgeColor()` As String _(public)_
- `getBadgeSize()` As String _(public)_
- `getFocus()` As Boolean _(public)_
- `getHref()` As String _(public)_
- `getIcon()` As String _(public)_
- `getIconColor()` As String _(public)_
- `getItemType()` As String _(public)_
- `getParent()` As Boolean _(public)_
- `getTarget()` As String _(public)_
- `getTooltip()` As String _(public)_
- `getTooltipPosition()` As String _(public)_
- `getIconSize()` As String _(public)_
- `getBadgeVisible()` As Boolean _(public)_
- `getOpen()` As Boolean _(public)_
## Private Methods (0)
_(none)_
## Verified Demo Usage

Real syntax from [`pgMenu.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgMenu.bas) (verified demo). `SDUI5MenuItem27` = a SDUI5MenuItem.

```b4j
	SDUI5MenuItem27.Initialize(Me, "SDUI5MenuItem27", "SDUI5MenuItem27")
	SDUI5MenuItem27.ParentID = "menu10"
	SDUI5MenuItem27.Badge = "99"
	SDUI5MenuItem27.BadgeColor = "none"
	SDUI5MenuItem27.BadgeVisible = True
	SDUI5MenuItem27.Icon = "./assets/home.svg"
	SDUI5MenuItem27.ItemType = "icon-text"
	SDUI5MenuItem27.MenuName = "menu10"
	SDUI5MenuItem27.ItemClasses = ""
	SDUI5MenuItem27.ItemStyles = ""
	SDUI5MenuItem27.Text = "Inbox"
	BANano.Await(SDUI5MenuItem27.AddComponent)
```

Builder methods, real call order (from `pgMenu1.bas`):

```b4j
	solutions.AddMenuItem("design", "Design", False)
	solutions.AddMenuItem("development", "Development", False)
	solutions.AddMenuItem("hosting", "Hosting", False)
	solutions.AddMenuItem("domain", "Domain Register", False)
```

Composite structure — children mount into sub-regions: a `SDUI5MenuItem35` inside `title1_items`:

```b4j
	SDUI5MenuItem35.Initialize(Me, "SDUI5MenuItem35", "SDUI5MenuItem35")
	SDUI5MenuItem35.ParentID = "title1_items"
	SDUI5MenuItem35.BadgeSize = "none"
	SDUI5MenuItem35.MenuName = "menu13"
	SDUI5MenuItem35.ItemClasses = ""
	SDUI5MenuItem35.ItemStyles = ""
	SDUI5MenuItem35.Text = "Item 3"
	BANano.Await(SDUI5MenuItem35.AddComponent)
```

Also used in: `pgDropDown`, `pgMenu1`
## Emits (daisyUI classes pushed in DesignerCreateView)
**Classes**: `menu-active`, `menu-focus`
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim menuitem As SDUI5MenuItem
menuitem.Initialize(Me, "SDUI5MenuItem", "SDUI5MenuItem")
menuitem.ParentID = "placeholder"
BANano.Await(menuitem.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.


