---
name: SDUI5ToolTip
description: SithasoDaisy5 SDUI5ToolTip component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5ToolTip

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5ToolTip.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5ToolTip.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgToolTip.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgToolTip.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5ToolTip is a tooltip wrapper. Child mounts via ParentID. Use for hover hints.
_SDUI5ToolTip is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `Tip` | String | Tooltip | — | `setTip` | `getTip` |
| `HasContent` | Boolean | False | — | `setHasContent` | `getHasContent` |
| `Color` | String | none | accent, error, info, neutral, none, primary, secondary, success, warning | `setColor` | `getColor` |
| `Open` | Boolean | False | — | `setOpen` | `getOpen` |
| `TooltipPosition` | String | top | bottom, left, right, top | `setPosition` | `getPosition` |
| `TooltipAlignment` | String | none | start, center, end, none | `setAlignment` | `getAlignment` |

Setter and getter names are the actual source `Sub` names. `—` means this component has no named accessor for that side; designer-time values may still be consumed through `Props` in `DesignerCreateView`.
Where a designer key and method name differ, the method names shown are the source-verified mapping.
## Events
_(none declared)_

Wire in parent: `Sub tooltip_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (6)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
## Key Setters (7)
- `setParentID(s As String)` _(public)_
- `setHasContent(b As Boolean)` As 'ignoredeadcode _(public)_
- `setColor(s As String)` _(public)_
- `setOpen(b As Boolean)` _(public)_
- `setPosition(s As String)` _(public)_
- `setAlignment(s As String)` _(public)_
- `setTip(s As String)` _(public)_
## Getters (8)
- `getID()` As String _(public)_
- `getHere()` As String _(public)_
- `getHasContent()` As Boolean _(public)_
- `getAlignment()` As String _(public)_
- `getColor()` As String _(public)_
- `getOpen()` As Boolean _(public)_
- `getPosition()` As String _(public)_
- `getTip()` As String _(public)_
## Private Methods (1)
- `SetDefaults()` _(private)_
## Verified Demo Usage

Real syntax from [`pgToolTip.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgToolTip.bas) (verified demo). `SDUI5ToolTip1` = a SDUI5ToolTip.

```b4j
	SDUI5ToolTip1.Initialize(Me, "SDUI5ToolTip1", "SDUI5ToolTip1")
	SDUI5ToolTip1.ParentID = "SDUI5Container1"
	SDUI5ToolTip1.Color = "none"
	SDUI5ToolTip1.HasContent = False
	SDUI5ToolTip1.Open = False
	SDUI5ToolTip1.Tip = "Hello"
	SDUI5ToolTip1.Position = "right"
	SDUI5ToolTip1.Alignment = "start"
	BANano.Await(SDUI5ToolTip1.AddComponent)
```
## Emits (daisyUI classes pushed in DesignerCreateView)
**Classes**: `tooltip`, `tooltip-open`
**Colors**: `tooltip:sColor`
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim tooltip As SDUI5ToolTip
tooltip.Initialize(Me, "SDUI5ToolTip", "SDUI5ToolTip")
tooltip.ParentID = "placeholder"
tooltip.Tip = "Saved!"
tooltip.Position = "bottom"              ' top|bottom|left|right
tooltip.Alignment = "end"                ' start|center|end|none (optional; composed with Position)
BANano.Await(tooltip.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.


