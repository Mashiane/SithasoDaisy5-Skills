---
name: SDUI5Wizard
description: SithasoDaisy5 SDUI5Wizard component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5Wizard

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5Wizard.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5Wizard.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgWizard.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgWizard.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5Wizard is a multi-step wizard. Steps mount via ParentID. Use for guided multi-step flows.
_SDUI5Wizard is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `ReadMe` | String | Child Item _1_content | — | — | — |
| `ParentID` | String | — | — | `setParentID` | `getParentID` |
| `Title` | String | Subscription | — | `setTitle` | `getTitle` |
| `TitleVisible` | Boolean | True | — | `setTitleVisible` | `getTitleVisible` |
| `Width` | String | 96 | — | `setWidth` | `getWidth` |
| `Height` | String | — | — | `setHeight` | `getHeight` |
| `RawSteps` | String | Register;Choose Plan;Purchase;Receive Product | — | `setSteps` | `getSteps` |
| `ActiveStep` | String | 1 | — | `setActiveStep` | `getActiveStep` |
| `StepsColor` | String | primary | accent, error, info, neutral, none, primary, secondary, success, warning | `setStepsColor` | `getStepsColor` |
| `StepsTextSize` | String | sm | 2xl, 3xl, 4xl, 5xl, 6xl, 7xl, 8xl, 9xl, base, lg, md, none, sm, xl, xs | `setStepsTextSize` | `getStepsTextSize` |
| `BackgroundColor` | String | base-100 | — | `setBackgroundColor` | `getBackgroundColor` |
| `PreviousText` | String | Previous | — | `setPreviousText` | `getPreviousText` |
| `PreviousColor` | String | — | — | `setPreviousColor` | `getPreviousColor` |
| `PreviousTextColor` | String | — | — | `setPreviousTextColor` | `getPreviousTextColor` |
| `NextColor` | String | — | — | `setNextColor` | `getNextColor` |
| `NextText` | String | Next | — | `setNextText` | `getNextText` |
| `NextTextColor` | String | — | — | `setNextTextColor` | `getNextTextColor` |
| `ButtonsShadow` | String | md | 2xl, inner, lg, md, none, shadow, sm, xl | `setButtonsShadow` | `getButtonsShadow` |
| `ButtonsWidth` | String | 22 | — | `setButtonsWidth` | `getButtonsWidth` |
| `ButtonsRounded` | String | md | none, rounded, 2xl, 3xl, full, lg, md, sm, xl, 0 | `setButtonsRounded` | `getButtonsRounded` |
| `Shadow` | String | sm | 2xl, inner, lg, md, none, shadow, sm, xl | `setShadow` | `getShadow` |
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

Wire in parent: `Sub wizard_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (8)
- `AddComponent()` _(public)_
- `AddStep(stepName As String)` _(public)_
- `Clear()` _(public)_
- `ContentAt(stepNumber As String)` As String _(public)_
- `ContentHere()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `Remove()` _(public)_

## Key Setters (30)
- `setActiveStep(s As String)` _(public)_
- `setAttributes(s As String)` _(public)_
- `setBackgroundColor(s As String)` _(public)_
- `setButtonsRounded(s As String)` _(public)_
- `setButtonsShadow(s As String)` _(public)_
- `setButtonsWidth(s As String)` _(public)_
- `setClasses(s As String)` _(public)_
- `setEnabled(b As Boolean)` _(public)_
- `setHeight(s As String)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setNextColor(s As String)` _(public)_
- `setNextText(s As String)` _(public)_
- `setNextTextColor(s As String)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setParentID(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setPositionStyle(s As String)` _(public)_
- `setPreviousColor(s As String)` _(public)_
- `setPreviousText(s As String)` _(public)_
- `setPreviousTextColor(s As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `setShadow(s As String)` _(public)_
- `setSteps(s As String)` _(public)_
- `setStepsColor(s As String)` _(public)_
- `setStepsTextSize(s As String)` _(public)_
- `setStyles(s As String)` _(public)_
- `setTitle(s As String)` _(public)_
- `setTitleVisible(b As Boolean)` _(public)_
- `setVisible(b As Boolean)` _(public)_
- `setWidth(s As String)` _(public)_

## Getters (32)
- `getActiveStep()` _(public)_
- `getAttributes()` _(public)_
- `getBackgroundColor()` _(public)_
- `getButtonsRounded()` _(public)_
- `getButtonsShadow()` _(public)_
- `getButtonsWidth()` _(public)_
- `getClasses()` _(public)_
- `getEnabled()` _(public)_
- `getHeight()` _(public)_
- `getHere()` As String _(public)_
- `getID()` As String _(public)_
- `getMarginAXYTBLR()` _(public)_
- `getNextColor()` _(public)_
- `getNextText()` _(public)_
- `getNextTextColor()` _(public)_
- `getPaddingAXYTBLR()` _(public)_
- `getParentID()` _(public)_
- `getPosition()` _(public)_
- `getPositionStyle()` _(public)_
- `getPreviousColor()` _(public)_
- `getPreviousText()` _(public)_
- `getPreviousTextColor()` _(public)_
- `GetProperties()` _(public)_
- `getShadow()` _(public)_
- `getSteps()` _(public)_
- `getStepsColor()` _(public)_
- `getStepsTextSize()` _(public)_
- `getStyles()` _(public)_
- `getTitle()` _(public)_
- `getTitleVisible()` _(public)_
- `getVisible()` _(public)_
- `getWidth()` _(public)_

## Private Methods (4)
- `ChangeStep(e As BANanoEvent)` _(private)_
- `MoveNext(e As BANanoEvent)` _(private)_
- `MovePrevious(e As BANanoEvent)` _(private)_
- `SetDefaults()` _(private)_

## Verified Demo Usage

Real syntax from [`pgWizard.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgWizard.bas) (verified demo):

```b4j
Private SDUI5Wizard1 As SDUI5Wizard		'ignore
BANano.Await(SDUI5Container1.AddComponent)
```

## Emits (daisyUI classes pushed in DesignerCreateView)
**Classes**: `card`
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim wizard As SDUI5Wizard
wizard.Initialize(Me, "SDUI5Wizard", "SDUI5Wizard")
wizard.ParentID = "placeholder"
BANano.Await(wizard.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.
