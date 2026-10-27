---
name: SDUI5Text
description: SithasoDaisy5 SDUI5Text component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5Text

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5Text.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5Text.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgAura.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgAura.bas)
  - [`pgBreadCrumbs.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgBreadCrumbs.bas)
  - [`pgHero.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgHero.bas)
  - [`pgIndex.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgIndex.bas)
  - [`pgLIst.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgLIst.bas)
  - [`pgSwiper.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgSwiper.bas)
  - [`pgTextrotate.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgTextrotate.bas)
  - [`pgTypography.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgTypography.bas)
  - [`pgWizard.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgWizard.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5Text is a text/paragraph element with color/size/alignment. Use for body text.
_SDUI5Text is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `TextTag` | String | p | a, abbr, blockquote, del, em, h1, h2, h3, h4, h5, h6, ins, mark, p, s, small, span, strong, u, aside, figcaption, figure, ol, ul, li, div, section, nav, input, label, br, hr, footer | `setTextTag` | `getTextTag` |
| `Icon` | String | — | — | `setIcon` | `getIcon` |
| `IconSize` | String | — | — | `setIconSize` | `getIconSize` |
| `Text` | String | Text | — | `setText` | `getText` |
| `RawHTML` | String | — | — | `setHTML` | `getHTML` |
| `NoText` | Boolean | False | — | `setNoText` | `getNoText` |
| `LoremIpsum` | Boolean | False | — | `setLoremIpsum` | `getLoremIpsum` |
| `Opacity` | Int | 100, MinRange: 0, MaxRange: 100 | — | `setOpacity` | `getOpacity` |
| `ListCol` | String | none | grow, none, wrap | `setListCol` | `getListCol` |
| `FontVariant` | String | none | diagonal-fractions, lining-nums, none, normal-nums, oldstyle-nums, ordinal, proportional-nums, slashed-zero, stacked-fractions, tabular-nums | `setFontVariant` | `getFontVariant` |
| `Height` | String | — | — | `setHeight` | `getHeight` |
| `Width` | String | — | — | `setWidth` | `getWidth` |
| `ApplyDefaults` | Boolean | True | — | `setApplyDefaults` | `getApplyDefaults` |
| `Decoration` | String | none | line-through, no-underline, none, underline | `setDecoration` | `getDecoration` |
| `FontWeight` | String | none | black, bold, extrabold, extralight, light, medium, none, normal, semibold, thin | `setFontWeight` | `getFontWeight` |
| `Italic` | Boolean | False | — | `setItalic` | `getItalic` |
| `Overflow` | String | none | none, overflow-clip, overflow-ellipsis, truncate | `setOverflow` | `getOverflow` |
| `TextAlign` | String | none | center, end, justify, left, none, right, start | `setTextAlign` | `getTextAlign` |
| `TextColor` | String | — | — | `setTextColor` | `getTextColor` |
| `TextSize` | String | none | 2xl, 3xl, 4xl, 5xl, 6xl, 7xl, 8xl, 9xl, base, lg, md, none, sm, xl, xs | `setTextSize` | `getTextSize` |
| `Transform` | String | none | capitalize, lowercase, none, normal-case, uppercase | `setTransform` | `getTransform` |
| `Rounded` | String | none | none, rounded, 2xl, 3xl, full, lg, md, sm, xl, 0 | `setRounded` | `getRounded` |
| `Shadow` | String | none | 2xl, inner, lg, md, none, shadow, sm, xl | `setShadow` | `getShadow` |
| `BackgroundColor` | String | — | — | `setBackgroundColor` | `getBackgroundColor` |
| `BackgroundImage` | String | — | — | `setBackgroundImage` | `getBackgroundImage` |
| `CenterChildren` | Boolean | False | — | `setCenterChildren` | `getCenterChildren` |
| `AlignContent` | String | none | around, baseline, between, center, end, evenly, none, normal, start, stretch | `setAlignContent` | `getAlignContent` |
| `AlignItems` | String | none | baseline, center, end, none, start, stretch | `setAlignItems` | `getAlignItems` |
| `AlignSelf` | String | none | auto, baseline, center, end, none, start, stretch | `setAlignSelf` | `getAlignSelf` |
| `JustifyContent` | String | none | around, baseline, between, center, end, evenly, none, normal, start, stretch | `setJustifyContent` | `getJustifyContent` |
| `JustifyItems` | String | none | center, end, none, normal, start, stretch | `setJustifyItems` | `getJustifyItems` |
| `JustifySelf` | String | none | auto, center, end, none, start, stretch | `setJustifySelf` | `getJustifySelf` |
| `PlaceContent` | String | none | around, baseline, between, center, end, evenly, none, start, stretch | `setPlaceContent` | `getPlaceContent` |
| `PlaceItems` | String | none | baseline, center, end, none, start, stretch | `setPlaceItems` | `getPlaceItems` |
| `PlaceSelf` | String | none | auto, center, end, none, start, stretch | `setPlaceSelf` | `getPlaceSelf` |
| `WordBreak` | String | none | all, none, normal, words | `setWordBreak` | `getWordBreak` |
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
`Click`, `MouseMove`, `MouseOver`, `MouseOut`, `MouseUp`, `MouseDown`

Wire in parent: `Sub text_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (12)
- `AddAttr(k As String, v As String)` _(public)_
- `AddClass(className As String)` _(public)_
- `AddComponent()` _(public)_
- `AddStyle(k As String, v As String)` _(public)_
- `Append(s As String)` _(public)_
- `Clear()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Empty()` _(public)_
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `OnEvent(event As String, MethodName As String)` _(public)_
- `Remove()` _(public)_
- `RemoveClass(className As String)` _(public)_

## Key Setters (50)
- `setAlignContent(s As String)` _(public)_
- `setAlignItems(s As String)` _(public)_
- `setAlignSelf(s As String)` _(public)_
- `setApplyDefaults(b As Boolean)` _(public)_
- `setAttributes(s As String)` _(public)_
- `setBackgroundColor(s As String)` _(public)_
- `setBackgroundImage(s As String)` _(public)_
- `setCenterChildren(b As Boolean)` _(public)_
- `setChecked(b As Boolean)` _(public)_
- `setClasses(s As String)` _(public)_
- `setDecoration(s As String)` _(public)_
- `setEnabled(b As Boolean)` _(public)_
- `setFontVariant(s As String)` _(public)_
- `setFontWeight(s As String)` _(public)_
- `setHeight(s As String)` _(public)_
- `setHTML(s As String)` _(public)_
- `setIcon(s As String)` _(public)_
- `setIconSize(s As String)` _(public)_
- `setItalic(b As Boolean)` _(public)_
- `setJustifyContent(s As String)` _(public)_
- `setJustifyItems(s As String)` _(public)_
- `setJustifySelf(s As String)` _(public)_
- `setListCol(s As String)` _(public)_
- `setLoremIpsum(b As Boolean)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setNoText(b As Boolean)` _(public)_
- `setOpacity(i As Int)` _(public)_
- `setOverflow(s As String)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setParentID(s As String)` _(public)_
- `setPlaceContent(s As String)` _(public)_
- `setPlaceItems(s As String)` _(public)_
- `setPlaceSelf(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setPositionStyle(s As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `setRounded(s As String)` _(public)_
- `setShadow(s As String)` _(public)_
- `SetStyle(k As String, v As String)` _(public)_
- `setStyles(s As String)` _(public)_
- `setText(text As String)` _(public)_
- `setTextAlign(s As String)` _(public)_
- `setTextColor(s As String)` _(public)_
- `setTextSize(s As String)` _(public)_
- `setTextTag(s As String)` _(public)_
- `setTransform(s As String)` _(public)_
- `setValue(v As Object)` _(public)_
- `setVisible(b As Boolean)` _(public)_
- `setWidth(s As String)` _(public)_
- `setWordBreak(s As String)` _(public)_

## Getters (51)
- `getAlignContent()` _(public)_
- `getAlignItems()` _(public)_
- `getAlignSelf()` _(public)_
- `getApplyDefaults()` _(public)_
- `getAttributes()` _(public)_
- `getBackgroundColor()` _(public)_
- `getBackgroundImage()` _(public)_
- `getCenterChildren()` _(public)_
- `getChecked()` _(public)_
- `getClasses()` _(public)_
- `getDecoration()` _(public)_
- `getEnabled()` _(public)_
- `getFontVariant()` _(public)_
- `getFontWeight()` _(public)_
- `getHeight()` _(public)_
- `getHere()` As String _(public)_
- `getHTML()` _(public)_
- `getIcon()` _(public)_
- `getIconSize()` _(public)_
- `getID()` As String _(public)_
- `getItalic()` _(public)_
- `getJustifyContent()` _(public)_
- `getJustifyItems()` _(public)_
- `getJustifySelf()` _(public)_
- `getListCol()` _(public)_
- `getLoremIpsum()` _(public)_
- `getMarginAXYTBLR()` _(public)_
- `getNoText()` _(public)_
- `getOpacity()` _(public)_
- `getOverflow()` _(public)_
- `getPaddingAXYTBLR()` _(public)_
- `getParentID()` _(public)_
- `getPlaceContent()` _(public)_
- `getPlaceItems()` _(public)_
- `getPlaceSelf()` _(public)_
- `getPosition()` _(public)_
- `getPositionStyle()` _(public)_
- `GetProperties()` _(public)_
- `getRounded()` _(public)_
- `getShadow()` _(public)_
- `getStyles()` _(public)_
- `getText()` _(public)_
- `getTextAlign()` _(public)_
- `getTextColor()` _(public)_
- `getTextSize()` _(public)_
- `getTextTag()` _(public)_
- `getTransform()` _(public)_
- `getValue()` _(public)_
- `getVisible()` _(public)_
- `getWidth()` _(public)_
- `getWordBreak()` _(public)_

## Private Methods (1)
- `SetDefaults()` _(private)_

## Verified Demo Usage

Real syntax from [`pgTextrotate.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgTextrotate.bas) (verified demo):

```b4j
Private SDUI5Label1 As SDUI5Text		'ignore
BANano.Await(SDUI5Container1.AddComponent)
```

## Emits (daisyUI classes pushed in DesignerCreateView)
_(none emitted directly — relies on base/CustProps)_
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim text As SDUI5Text
text.Initialize(Me, "SDUI5Text", "SDUI5Text")
text.ParentID = "placeholder"
BANano.Await(text.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.
