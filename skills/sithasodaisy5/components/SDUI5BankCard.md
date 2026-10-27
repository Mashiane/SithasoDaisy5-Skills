---
name: SDUI5BankCard
description: SithasoDaisy5 SDUI5BankCard component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5BankCard

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5BankCard.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5BankCard.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgBankCard.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgBankCard.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5BankCard is a bank/credit-card styled card (number, holder, expiry). Use for payment card display.
_SDUI5BankCard is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `BankName` | String | BANK OF LATVERIA | — | `setBankName` | `getBankName` |
| `CardNumber` | String | 0210 8820 1150 0222 | — | `setCardNumber` | `getCardNumber` |
| `CardHolder` | String | CARD HOLDER | — | `setCardHolder` | `getCardHolder` |
| `ExpiresMonth` | String | 29 | — | `setExpiresMonth` | `getExpiresMonth` |
| `ExpiresYear` | String | 08 | — | `setExpiresYear` | `getExpiresYear` |
| `CardBrand` | String | ❁ | — | `setCardBrand` | `getCardBrand` |
| `TextColor` | Color | #FFFFFFFF | — | `setTextColor` | `getTextColor` |
| `GradientActive` | Boolean | True | — | `setGradientActive` | `getGradientActive` |
| `Gradient` | String | bl_tr | bl_tr, bottom_top, br_tl, left_right, right_left, tl_br, top_bottom, tr_bl | `setGradient` | `getGradient` |
| `GradientColor1` | Color | #f86194, Gradient Color 1. | — | — | — |
| `GradientColor2` | Color | #968918, Gradient Color 2. | — | — | — |
| `Width` | String | 100 | — | `setWidth` | `getWidth` |
| `Height` | String | — | — | `setHeight` | `getHeight` |
| `Rounded` | String | 2xl | 0, 2xl, 3xl, full, lg, md, none, rounded, sm, xl | `setRounded` | `getRounded` |
| `Shadow` | String | 2xl | 2xl, inner, lg, md, none, shadow, sm, xl | `setShadow` | `getShadow` |
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

Wire in parent: `Sub bankcard_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (4)
- `AddComponent()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `Remove()` _(public)_

## Key Setters (24)
- `setAttributes(s As String)` _(public)_
- `setBankName(s As String)` _(public)_
- `setCardBrand(s As String)` _(public)_
- `setCardHolder(s As String)` _(public)_
- `setCardNumber(s As String)` _(public)_
- `setClasses(s As String)` _(public)_
- `setEnabled(b As Boolean)` _(public)_
- `setExpiresMonth(s As String)` _(public)_
- `setExpiresYear(s As String)` _(public)_
- `setGradient(s As String)` _(public)_
- `setGradientActive(b As Boolean)` _(public)_
- `setHeight(s As String)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setParentID(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setPositionStyle(s As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `setRounded(s As String)` _(public)_
- `setShadow(s As String)` _(public)_
- `setStyles(s As String)` _(public)_
- `setTextColor(s As String)` _(public)_
- `setVisible(b As Boolean)` _(public)_
- `setWidth(s As String)` _(public)_

## Getters (26)
- `getAttributes()` _(public)_
- `getBankName()` _(public)_
- `getCardBrand()` _(public)_
- `getCardHolder()` _(public)_
- `getCardNumber()` _(public)_
- `getClasses()` _(public)_
- `getEnabled()` _(public)_
- `getExpiresMonth()` _(public)_
- `getExpiresYear()` _(public)_
- `getGradient()` _(public)_
- `getGradientActive()` _(public)_
- `getHeight()` _(public)_
- `getHere()` As String _(public)_
- `getID()` As String _(public)_
- `getMarginAXYTBLR()` _(public)_
- `getPaddingAXYTBLR()` _(public)_
- `getParentID()` _(public)_
- `getPosition()` _(public)_
- `getPositionStyle()` _(public)_
- `GetProperties()` _(public)_
- `getRounded()` _(public)_
- `getShadow()` _(public)_
- `getStyles()` _(public)_
- `getTextColor()` _(public)_
- `getVisible()` _(public)_
- `getWidth()` _(public)_

## Private Methods (1)
- `SetDefaults()` _(private)_

## Verified Demo Usage

Real syntax from [`pgBankCard.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgBankCard.bas) (verified demo):

```b4j
Private SDUI5BankCard1 As SDUI5BankCard			'ignore
BANano.Await(bankcontainer.AddComponent)
```

## Emits (daisyUI classes pushed in DesignerCreateView)
**Classes**: `card`
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim bankcard As SDUI5BankCard
bankcard.Initialize(Me, "SDUI5BankCard", "SDUI5BankCard")
bankcard.ParentID = "placeholder"
BANano.Await(bankcard.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.
