---
name: SDUI5Tabs
description: SithasoDaisy5 SDUI5Tabs component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5Tabs

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5Tabs.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5Tabs.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgTabs.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgTabs.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5Tabs is a tabbed container (styles: border/box/lift). Tab items (SDUI5TabsItem) mount into the tabs via `ParentID = tabsName`. Use for tabbed views; Active controls the selected tab. Change event fires on tab switch.
_SDUI5Tabs is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `ReadMe` | String | Child Item {key}_name_content | — | — | — |
| `ParentID` | String | — | — | `setParentID` | `getParentID` |
| `Placement` | String | top | bottom, top | `setPlacement` | `getPlacement` |
| `Size` | String | none | lg, md, none, sm, xl, xs | `setSize` | `getSize` |
| `Style` | String | lift | border, box, lift | `setStyle` | `getStyle` |
| `Height` | String | — | — | `setHeight` | `getHeight` |
| `Width` | String | — | — | `setWidth` | `getWidth` |
| `RawOptions` | String | btn1=Button 1; btn2=Button 2; btn3=Button 3 | — | `setOptions` | `getOptions` |
| `Active` | String | btn1 | — | `setActive` | `getActive` |
| `ClearContents` | Boolean | False | — | `setClearContents` | `getClearContents` |
| `IconSize` | String | 20px | — | `setIconSize` | `getIconSize` |
| `BadgeColor` | String | — | — | `setBadgeColor` | `getBadgeColor` |
| `BadgeSize` | String | md | lg, md, none, sm, xl, xs | `setBadgeSize` | `getBadgeSize` |
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

Wire in parent: `Sub tabs_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (9)
- `AddComponent()` _(public)_
- `AddOption(sKey As String, sText As String)` _(public)_
- `AddTabItem(sKey As String, sText As String, sIcon As String, sBadge As String)` As SDUI5TabsItem _(public)_
- `Clear()` _(public)_
- `ContentAt(key As String)` As String _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `Remove()` _(public)_
- `TabItem(skey As String)` As SDUI5TabsItem _(public)_

## Key Setters (26)
- `setActive(item As String)` _(public)_
- `setAttributes(s As String)` _(public)_
- `setBadgeColor(s As String)` _(public)_
- `setBadgeSize(s As String)` _(public)_
- `setClasses(s As String)` _(public)_
- `setClearContents(b As Boolean)` _(public)_
- `setEnabled(b As Boolean)` _(public)_
- `setHeight(s As String)` _(public)_
- `setIconSize(s As String)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setOptions(s As String)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setParentID(s As String)` _(public)_
- `setPlacement(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setPositionStyle(s As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `setSize(s As String)` _(public)_
- `setStyle(s As String)` _(public)_
- `setStyles(s As String)` _(public)_
- `SetTabItemActive(btnID As String, b As Boolean)` _(public)_
- `SetTabItemBadge(btnID As String, text As String)` _(public)_
- `SetTabItemIcon(btnID As String, text As String)` _(public)_
- `SetTabItemText(btnID As String, text As String)` _(public)_
- `setVisible(b As Boolean)` _(public)_
- `setWidth(s As String)` _(public)_

## Getters (24)
- `getActive()` _(public)_
- `getAttributes()` _(public)_
- `getBadgeColor()` _(public)_
- `getBadgeSize()` _(public)_
- `getClasses()` _(public)_
- `getClearContents()` _(public)_
- `getEnabled()` _(public)_
- `getHeight()` _(public)_
- `getHere()` As String _(public)_
- `getIconSize()` _(public)_
- `getID()` As String _(public)_
- `getMarginAXYTBLR()` _(public)_
- `getOptions()` _(public)_
- `getPaddingAXYTBLR()` _(public)_
- `getParentID()` _(public)_
- `getPlacement()` _(public)_
- `getPosition()` _(public)_
- `getPositionStyle()` _(public)_
- `GetProperties()` _(public)_
- `getSize()` _(public)_
- `getStyle()` _(public)_
- `getStyles()` _(public)_
- `getVisible()` _(public)_
- `getWidth()` _(public)_

## Private Methods (1)
- `SetDefaults()` _(private)_

## Verified Demo Usage

Real syntax from [`pgTabs.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgTabs.bas) (verified demo):

```b4j
Private tabs1 As SDUI5Tabs		'ignore
Private SDUI5Tabs1 As SDUI5Tabs		'ignore
Private tabs1item1 As SDUI5TabsItem		'ignore
Private tabs1item2 As SDUI5TabsItem		'ignore
Private tabs1item3 As SDUI5TabsItem		'ignore
Private tabs1item4 As SDUI5TabsItem		'ignore
BANano.Await(SDUI5Container1.AddComponent)
```

## Emits (daisyUI classes pushed in DesignerCreateView)
**Classes**: `tabs whitespace-nowrap`
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim tabs As SDUI5Tabs
tabs.Initialize(Me, "SDUI5Tabs", "SDUI5Tabs")
tabs.ParentID = "placeholder"
BANano.Await(tabs.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.
