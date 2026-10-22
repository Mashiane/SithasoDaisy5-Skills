---
name: SDUI5TabsItem
description: SithasoDaisy5 SDUI5TabsItem component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5TabsItem

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5TabsItem.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5TabsItem.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgTabs.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgTabs.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5TabsItem is a single tab for SDUI5Tabs. Mount into the tabs via `ParentID = tabsName`. Holds tab label and content.
_SDUI5TabsItem is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `ReadMe` | String | Child Item _content | — | — | — |
| `ParentID` | String | — | — | `setParentID` | `getParentID` |
| `Width` | String | — | — | `setWidth` | `getWidth` |
| `Icon` | String | — | — | `setIcon` | `getIcon` |
| `IconSize` | String | 20px | — | `setIconSize` | `getIconSize` |
| `Text` | String | Text | — | `setText` | `getText` |
| `Badge` | String | — | — | `setBadge` | `getBadge` |
| `BadgeColor` | String | — | — | `setBadgeColor` | `getBadgeColor` |
| `BadgeSize` | String | md | lg, md, none, sm, xl, xs | `setBadgeSize` | `getBadgeSize` |
| `Active` | Boolean | False | — | `setActive` | `getActive` |
| `BackgroundColor` | String | — | — | `setBackgroundColor` | `getBackgroundColor` |
| `BorderColor` | String | — | — | `setBorderColor` | `getBorderColor` |
| `TextColor` | String | — | — | `setTextColor` | `getTextColor` |
| `HasIcon` | Boolean | True | — | `setHasIcon` | `getHasIcon` |
| `HasBadge` | Boolean | True | — | `setHasBadge` | `getHasBadge` |
| `Disabled` | Boolean | False | — | — | — |
| `Visible` | Boolean | True | — | `setVisible` | `getVisible` |
| `Enabled` | Boolean | True | — | `setEnabled` | `getEnabled` |
| `MarginAXYTBLR` | String | a=?; x=?; y=?; t=?; b=?; l=?; r=? | — | `setMarginAXYTBLR` | `getMarginAXYTBLR` |
| `PaddingAXYTBLR` | String | a=?; x=?; y=?; t=?; b=?; l=?; r=? | — | `setPaddingAXYTBLR` | `getPaddingAXYTBLR` |
| `RawClasses` | String | — | — | `setClasses` | `getClasses` |
| `RawStyles` | String | — | — | `setStyles` | `getStyles` |
| `RawAttributes` | String | — | — | `setAttributes` | `getAttributes` |

Setter and getter names are the actual source `Sub` names. `—` means this component has no named accessor for that side; designer-time values may still be consumed through `Props` in `DesignerCreateView`.
Where a designer key and method name differ, the method names shown are the source-verified mapping.
## Events
_(none declared)_

Wire in parent: `Sub tabsitem_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (10)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `LinkExisting()` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `ClearContent()` _(public)_
- `HideContent(skey As String)` _(public)_
- `ShowContent(skey As String)` _(public)_
## Key Setters (21)
- `setParentID(s As String)` _(public)_
- `setVisible(b As Boolean)` _(public)_
- `setAttributes(s As String)` _(public)_
- `setStyles(s As String)` _(public)_
- `setClasses(s As String)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setHasBadge(b As Boolean)` As 'ignoredeadcode _(public)_
- `setHasIcon(b As Boolean)` As 'ignoredeadcode _(public)_
- `setWidth(s As String)` _(public)_
- `setIconSize(s As String)` _(public)_
- `setIcon(s As String)` As 'ignoredeadcode _(public)_
- `setText(text As String)` _(public)_
- `setActive(b As Boolean)` As 'ignoredeadcode _(public)_
- `setBackgroundColor(s As String)` As 'ignoredeadcode _(public)_
- `setBadge(s As String)` As 'ignoredeadcode _(public)_
- `setBadgeColor(s As String)` As 'ignoredeadcode _(public)_
- `setBadgeSize(s As String)` _(public)_
- `setBorderColor(s As String)` As 'ignoredeadcode _(public)_
- `setEnabled(b As Boolean)` As 'ignoredeadcode _(public)_
- `setTextColor(s As String)` As 'ignoredeadcode _(public)_
## Getters (23)
- `getID()` As String _(public)_
- `getParentID()` As String _(public)_
- `getHere()` As String _(public)_
- `getVisible()` As Boolean _(public)_
- `getAttributes()` As String _(public)_
- `getStyles()` As String _(public)_
- `getClasses()` As String _(public)_
- `getPaddingAXYTBLR()` As String _(public)_
- `getMarginAXYTBLR()` As String _(public)_
- `getHasBadge()` As Boolean _(public)_
- `getHasIcon()` As Boolean _(public)_
- `getWidth()` As String _(public)_
- `getIconSize()` As String _(public)_
- `getIcon()` As String _(public)_
- `getText()` As String _(public)_
- `getEnabled()` As Boolean _(public)_
- `getActive()` As Boolean _(public)_
- `getBackgroundColor()` As String _(public)_
- `getBadge()` As String _(public)_
- `getBadgeColor()` As String _(public)_
- `getBadgeSize()` As String _(public)_
- `getBorderColor()` As String _(public)_
- `getTextColor()` As String _(public)_
## Private Methods (1)
- `SetDefaults()` _(private)_
## Verified Demo Usage

Real syntax from [`pgTabs.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgTabs.bas) (verified demo). `SDUI5TabsItem5` = a SDUI5TabsItem.

```b4j
	SDUI5TabsItem5.Initialize(Me, "SDUI5TabsItem5", "SDUI5TabsItem5")
	SDUI5TabsItem5.ParentID = "tabs3"
	SDUI5TabsItem5.Badge = "20"
	SDUI5TabsItem5.BadgeColor = "secondary"
	SDUI5TabsItem5.Icon = "./assets/heart-solid.svg"
	SDUI5TabsItem5.Text = "Item 1"
	BANano.Await(SDUI5TabsItem5.AddComponent)
```
## Emits (daisyUI classes pushed in DesignerCreateView)
**Classes**: `tab-active`, `tab flex items-center justify-center gap-2 relative`
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim tabsitem As SDUI5TabsItem
tabsitem.Initialize(Me, "SDUI5TabsItem", "SDUI5TabsItem")
tabsitem.ParentID = "placeholder"
BANano.Await(tabsitem.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.


