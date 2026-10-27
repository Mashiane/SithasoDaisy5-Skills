---
name: SDUI5Hero
description: SithasoDaisy5 SDUI5Hero component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5Hero

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5Hero.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5Hero.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgHero.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgHero.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5Hero is a hero section (title, subtitle, image, CTA). Use for landing page headers.
_SDUI5Hero is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `BackgroundColor` | String | — | — | `setBackgroundColor` | `getBackgroundColor` |
| `TextColor` | String | — | — | `setTextColor` | `getTextColor` |
| `BackgroundImage` | String | — | — | `setBackgroundImage` | `getBackgroundImage` |
| `Overlay` | Boolean | False | — | `setOverlay` | `getOverlay` |
| `Rounded` | String | none | 0, 2xl, 3xl, full, lg, md, none, rounded, sm, xl | `setRounded` | `getRounded` |
| `Shadow` | String | none | 2xl, inner, lg, md, none, shadow, sm, xl | `setShadow` | `getShadow` |
| `ContentTextAlign` | String | — | center, end, justify, left, none, right, start | `setContentTextAlign` | `getContentTextAlign` |
| `ContentFlexDirection` | String | flex-col | flex-col, flex-col-reverse, flex-row, flex-row-reverse | `setContentFlexDirection` | `getContentFlexDirection` |
| `SmContentFlexDirection` | String | none | flex-col, flex-col-reverse, flex-row, flex-row-reverse | `setSmContentFlexDirection` | `getSmContentFlexDirection` |
| `MdContentFlexDirection` | String | none | flex-col, flex-col-reverse, flex-row, flex-row-reverse | `setMdContentFlexDirection` | `getMdContentFlexDirection` |
| `LgContentFlexDirection` | String | flex-row | flex-col, flex-col-reverse, flex-row, flex-row-reverse | `setLgContentFlexDirection` | `getLgContentFlexDirection` |
| `XlContentFlexDirection` | String | none | flex-col, flex-col-reverse, flex-row, flex-row-reverse | `setXlContentFlexDirection` | `getXlContentFlexDirection` |
| `XxlContentFlexDirection` | String | none | flex-col, flex-col-reverse, flex-row, flex-row-reverse | `setXxlContentFlexDirection` | `getXxlContentFlexDirection` |
| `MinHeight` | String | 56 | — | `setMinHeight` | `getMinHeight` |
| `Height` | String | — | — | `setHeight` | `getHeight` |
| `MinWidth` | String | — | — | `setMinWidth` | `getMinWidth` |
| `Width` | String | — | — | `setWidth` | `getWidth` |
| `RawContentAttributes` | String | — | — | `setContentAttributes` | `getContentAttributes` |
| `RawContentClass` | String | — | — | `setContentClass` | `getContentClass` |
| `RawContentStyle` | String | — | — | `setContentStyle` | `getContentStyle` |
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

Wire in parent: `Sub hero_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (4)
- `AddComponent()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `Remove()` _(public)_

## Key Setters (31)
- `setAttributes(s As String)` _(public)_
- `setBackgroundColor(s As String)` _(public)_
- `setBackgroundImage(s As String)` _(public)_
- `setClasses(s As String)` _(public)_
- `setContentAttributes(s As String)` _(public)_
- `setContentClass(s As String)` _(public)_
- `setContentFlexDirection(s As String)` _(public)_
- `setContentStyle(s As String)` _(public)_
- `setContentTextAlign(s As String)` _(public)_
- `setEnabled(b As Boolean)` _(public)_
- `setHeight(s As String)` _(public)_
- `setLgContentFlexDirection(s As String)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setMdContentFlexDirection(s As String)` _(public)_
- `setMinHeight(s As String)` _(public)_
- `setMinWidth(s As String)` _(public)_
- `setOverlay(b As Boolean)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setParentID(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setPositionStyle(s As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `setRounded(s As String)` _(public)_
- `setShadow(s As String)` _(public)_
- `setSmContentFlexDirection(s As String)` _(public)_
- `setStyles(s As String)` _(public)_
- `setTextColor(s As String)` _(public)_
- `setVisible(b As Boolean)` _(public)_
- `setWidth(s As String)` _(public)_
- `setXlContentFlexDirection(s As String)` _(public)_
- `setXxlContentFlexDirection(s As String)` _(public)_

## Getters (33)
- `getAttributes()` _(public)_
- `getBackgroundColor()` _(public)_
- `getBackgroundImage()` _(public)_
- `getClasses()` _(public)_
- `getContentAttributes()` _(public)_
- `getContentClass()` _(public)_
- `getContentFlexDirection()` _(public)_
- `getContentStyle()` _(public)_
- `getContentTextAlign()` _(public)_
- `getEnabled()` _(public)_
- `getHeight()` _(public)_
- `getHere()` As String _(public)_
- `getID()` As String _(public)_
- `getLgContentFlexDirection()` _(public)_
- `getMarginAXYTBLR()` _(public)_
- `getMdContentFlexDirection()` _(public)_
- `getMinHeight()` _(public)_
- `getMinWidth()` _(public)_
- `getOverlay()` _(public)_
- `getPaddingAXYTBLR()` _(public)_
- `getParentID()` _(public)_
- `getPosition()` _(public)_
- `getPositionStyle()` _(public)_
- `GetProperties()` _(public)_
- `getRounded()` _(public)_
- `getShadow()` _(public)_
- `getSmContentFlexDirection()` _(public)_
- `getStyles()` _(public)_
- `getTextColor()` _(public)_
- `getVisible()` _(public)_
- `getWidth()` _(public)_
- `getXlContentFlexDirection()` _(public)_
- `getXxlContentFlexDirection()` _(public)_

## Private Methods (1)
- `SetDefaults()` _(private)_

## Verified Demo Usage

Real syntax from [`pgHero.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgHero.bas) (verified demo):

```b4j
Private SDUI5Hero1 As SDUI5Hero		'ignore
BANano.Await(SDUI5Container1.AddComponent)
```

## Emits (daisyUI classes pushed in DesignerCreateView)
**Classes**: `hero`
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim hero As SDUI5Hero
hero.Initialize(Me, "SDUI5Hero", "SDUI5Hero")
hero.ParentID = "placeholder"
hero.BackgroundImage = "./assets/hero-bg.webp"
hero.Overlay = True
hero.Rounded = "lg"
hero.Classes = "overflow-hidden"     ' CRITICAL: clips the .hero-overlay to the rounded border; prevents square overlay corners bleeding out
BANano.Await(hero.AddComponent)   ' DesignerCreateView runs internally
```

### Rounded Corners + Overlay Gotcha
When `Overlay = True` and `Rounded` is set (e.g., `"lg"`, `"box"`, `"2xl"`), the inner child `<div id="${mName}_overlay" class="hero-overlay">` has `border-radius: 0px` (square corners). Because the outer hero container defaults to `overflow: visible`, the dark semi-transparent overlay spills outside the container's curved boundary, creating sharp triangular artifacts at each corner.

**Two ways to solve this:**
1. **Container Clipping (Recommended / Official daisyUI pattern)**: Set `hero.Classes = "overflow-hidden"`. The container clips all child elements (including the overlay) to the rounded border curve.
2. **Direct Overlay Class**: Add the matching rounded class directly to the overlay DOM element after `AddComponent`:
   ```vb
   app.UI.AddClassByID($"${hero.ID}_overlay"$, "rounded-lg")
   ```

## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.
