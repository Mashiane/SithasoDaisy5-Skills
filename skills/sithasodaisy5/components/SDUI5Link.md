---
name: SDUI5Link
description: SithasoDaisy5 SDUI5Link component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5Link

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5Link.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5Link.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgBreadCrumbs.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgBreadCrumbs.bas)
  - [`pgFieldSet.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgFieldSet.bas)
  - [`pgFooter.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgFooter.bas)
  - [`pgLink.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgLink.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5Link is a daisyUI `link` (or plain anchor when NormalLink=True) with Href/Target, Color, Hover, Icon/IconColor/IconSize/IconPosition, ListItem. Icon path must include extension. Emits Click. Use for navigation/recovery links; set Href="#" + Click handler for in-app actions.
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
| `Text` | String | Link | — | `setText` | `getText` |
| `Color` | String | none | accent, error, info, neutral, none, primary, secondary, success, warning | `setColor` | `getColor` |
| `TextColor` | String | — | — | `setTextColor` | `getTextColor` |
| `Hover` | Boolean | False | — | `setHover` | `getHover` |
| `NormalLink` | Boolean | False | — | `setNormalLink` | `getNormalLink` |
| `Href` | String | # | — | `setHref` | `getHref` |
| `Icon` | String | — | — | `setIcon` | `getIcon` |
| `IconColor` | String | — | — | `setIconColor` | `getIconColor` |
| `IconSize` | String | 24px | — | `setIconSize` | `getIconSize` |
| `IconPosition` | String | left | left, right | `setIconPosition` | `getIconPosition` |
| `ListItem` | Boolean | False | — | — | — |
| `Target` | String | none | _blank, _parent, _self, _top, none | `setTarget` | `getTarget` |
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
`Click`

Wire in parent: `Sub link_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (12)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `ResponsiveClass(className As String, xs As Boolean, sm As Boolean, md As Boolean, lg As Boolean)` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `OnEvent(event As String, methodName As String)` _(public)_
- `AddClass(className As String)` _(public)_
- `AddAttr(k As String, v As String)` _(public)_
- `RemoveClass(s As String)` _(public)_
- `AddStyle(k As String, v As String)` _(public)_
## Key Setters (21)
- `setTextColor(s As String)` _(public)_
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
- `setText(text As String)` As 'ignoredeadcode _(public)_
- `setNormalLink(b As Boolean)` _(public)_
- `setIconPosition(s As String)` _(public)_
- `setColor(s As String)` _(public)_
- `setHover(b As Boolean)` _(public)_
- `setHref(s As String)` _(public)_
- `setIcon(s As String)` As 'ignoredeadcode _(public)_
- `setIconColor(s As String)` As 'ignoredeadcode _(public)_
- `setIconSize(s As String)` As 'ignoredeadcode _(public)_
- `setTarget(s As String)` _(public)_
## Getters (22)
- `getID()` As String _(public)_
- `getTextColor()` As String _(public)_
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
- `getText()` As String _(public)_
- `getNormalLink()` As Boolean _(public)_
- `getIconPosition()` As String _(public)_
- `getColor()` As String _(public)_
- `getHover()` As Boolean _(public)_
- `getHref()` As String _(public)_
- `getIcon()` As String _(public)_
- `getIconColor()` As String _(public)_
- `getIconSize()` As String _(public)_
- `getTarget()` As String _(public)_
## Private Methods (0)
_(none)_
## Verified Demo Usage

Real syntax from [`pgBreadCrumbs.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgBreadCrumbs.bas) (verified demo). `SDUI5Link3` = a SDUI5Link.

```b4j
	SDUI5Link3.Initialize(Me, "SDUI5Link3", "SDUI5Link3")
	SDUI5Link3.ParentID = "bc2_content"
	SDUI5Link3.Hover = True
	SDUI5Link3.Icon = "./assets/folderblue.svg"
    SDUI5Link3.CustProps.Put("ListItem", True)
	SDUI5Link3.Text = "Home"
	BANano.Await(SDUI5Link3.AddComponent)
```

Also used in: `pgFieldSet`, `pgFooter`, `pgLink`
## Emits (daisyUI classes pushed in DesignerCreateView)
**Classes**: `link`, `link-hover`
**Colors**: `link:sColor`
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim link As SDUI5Link
link.Initialize(Me, "SDUI5Link", "SDUI5Link")
link.ParentID = "placeholder"
BANano.Await(link.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.


