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
## Public Methods (10)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `ContentHere()` As String _(public)_
- `ContentAt(stepNumber As String)` As String _(public)_
- `Clear()` _(public)_
- `AddStep(stepName As String)` _(public)_
## Key Setters (29)
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
- `setActiveStep(s As String)` As 'ignoredeadcode _(public)_
- `setBackgroundColor(s As String)` _(public)_
- `setButtonsRounded(s As String)` As 'ignoredeadcode _(public)_
- `setButtonsShadow(s As String)` As 'ignoredeadcode _(public)_
- `setButtonsWidth(s As String)` As 'ignoredeadcode _(public)_
- `setHeight(s As String)` As 'ignoredeadcode _(public)_
- `setNextColor(s As String)` As 'ignoredeadcode _(public)_
- `setNextText(s As String)` _(public)_
- `setNextTextColor(s As String)` As 'ignoredeadcode _(public)_
- `setPreviousColor(s As String)` As 'ignoredeadcode _(public)_
- `setPreviousText(s As String)` As 'ignoredeadcode _(public)_
- `setPreviousTextColor(s As String)` As 'ignoredeadcode _(public)_
- `setSteps(s As String)` As 'ignoredeadcode _(public)_
- `setShadow(s As String)` As 'ignoredeadcode _(public)_
- `setStepsColor(s As String)` _(public)_
- `setStepsTextSize(s As String)` As 'ignoredeadcode _(public)_
- `setTitle(s As String)` _(public)_
- `setTitleVisible(b As Boolean)` As 'ignoredeadcode _(public)_
- `setWidth(s As String)` As 'ignoredeadcode _(public)_
## Getters (31)
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
- `getActiveStep()` As String _(public)_
- `getButtonsRounded()` As String _(public)_
- `getSteps()` As String _(public)_
- `getBackgroundColor()` As String _(public)_
- `getButtonsShadow()` As String _(public)_
- `getButtonsWidth()` As String _(public)_
- `getHeight()` As String _(public)_
- `getNextColor()` As String _(public)_
- `getNextText()` As String _(public)_
- `getNextTextColor()` As String _(public)_
- `getPreviousColor()` As String _(public)_
- `getPreviousText()` As String _(public)_
- `getPreviousTextColor()` As String _(public)_
- `getShadow()` As String _(public)_
- `getStepsColor()` As String _(public)_
- `getStepsTextSize()` As String _(public)_
- `getTitle()` As String _(public)_
- `getTitleVisible()` As Boolean _(public)_
- `getWidth()` As String _(public)_
## Private Methods (1)
- `SetDefaults()` _(private)_
## Verified Demo Usage

Real syntax from [`pgWizard.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgWizard.bas) (verified demo). `SDUI5Wizard1` = a SDUI5Wizard.

```b4j
	SDUI5Wizard1.Initialize(Me, "SDUI5Wizard1", "SDUI5Wizard1")
	SDUI5Wizard1.ParentID = "SDUI5Column1"
	SDUI5Wizard1.ButtonsRounded = "lg"
	SDUI5Wizard1.ButtonsShadow = "none"
	SDUI5Wizard1.NextColor = "success"
	SDUI5Wizard1.PreviousColor = "error"
	SDUI5Wizard1.Steps = "Register;Choose Plan;Purchase;Receive Product"
	SDUI5Wizard1.Width = "full"
	BANano.Await(SDUI5Wizard1.AddComponent)
```

Demo-wired events: `Change` — handlers named `SDUI5Wizard1_<Event>`.
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


