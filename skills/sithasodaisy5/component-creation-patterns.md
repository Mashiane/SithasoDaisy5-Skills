---
name: component-creation-patterns
description: Mount-sequence patterns for every SDUI5* component. Standard 3-step for most; container deviations for SDUI5Stat, SDUI5Dock, SDUI5Carousel, SDUI5Timeline, SDUI5Accordion, SDUI5SweetAlert.
---

# SithasoDaisy5 — Component Creation Patterns

Standardized mount sequences. Every component follows one of two patterns:

1. **Standard 3-Step** — most components
2. **Container Deviation** — for components that hold children (Stat, Dock, Carousel, Timeline, Accordion, SweetAlert)

**Verify your pattern** matches the per-component `.md` before generating.

---

## 1. Standard 3-Step (Most Components)

Applies to: `SDUI5Button`, `SDUI5Badge`, `SDUI5Alert`, `SDUI5Card`, `SDUI5Toggle`, `SDUI5Select`, `SDUI5CheckBox`, `SDUI5Radio`, `SDUI5Range`, `SDUI5Rating`, `SDUI5Progress`, `SDUI5RadialProgress`, `SDUI5Stat`, `SDUI5Avatar`, `SDUI5TextBox`, `SDUI5TextArea`, `SDUI5FieldSet`, `SDUI5FileInput`, `SDUI5Image`, `SDUI5Divider`, `SDUI5Skeleton`, `SDUI5Loading`, `SDUI5ToolTip`, etc.

```b4j
' Step 1: Initialize
Component.Initialize(Me, "ComponentEventName")

' Step 2: Set Properties (Prompt-to-Setter Alignment — see references/component-default-setters.md)
' Audit component defaults! Set every property where the user prompt diverges from SetDefaults.
Button.Color = "primary"           ' buttons default to "none"; set explicitly for theme colors
Button.Outline = True              ' buttons default to False; set True if outlined in prompt
Card.Width = "full"                ' cards default to "96" (384px); MUST override to "full" inside columns
Card.Border = False                ' cards default to True; set False if prompt calls for flat/borderless
Stat.Direction = "horizontal"      ' stats default to "vertical"; set "horizontal" for stat bars
Component.Icon = "./assets/img.svg"' asset path must include ./assets/ and extension

' Step 3: Mount to parent hierarchy
Component.ParentID = "SDUI5Column1"' must reference existing parent
BANano.Await(Component.AddComponent)' must call AddComponent after ParentID set
```

### Critical Order Requirements

| Step | Must Be Completed Before | Failure Mode |
|---|---|---|
| Initialize | Parent component exists in hierarchy | `Initialize` succeeds but `AddComponent` throws "Parent not found" |
| Set Properties | After Initialize | None — properties set before Initialize also work |
| AddComponent | ParentID set to existing parent | Runtime error: "Parent not found" or silent failure |

### Prefer Matching Designer Properties to Utility Classes

Before adding a utility to `.Classes`, inspect the component reference and use its typed designer property when it represents the same behavior. Examples:

```b4j
Card.Height = "full"                 ' use Height instead of h-full when supported
Avatar.Shadow = "lg"                  ' use Shadow instead of shadow-lg when supported
Text.FontWeight = "semibold"          ' use FontWeight instead of font-semibold
Text.MarginAXYTBLR = "a=?; x=?; y=?; t=6; b=?; l=?; r=?" ' use root spacing property
Text.Opacity = 70                     ' use Opacity instead of opacity-70
```

Use only properties listed for that exact component. `MarginAXYTBLR` and `PaddingAXYTBLR` affect the outer component element; use `BodyClasses`, `ContentClasses`, or another named inner-region property for styles on a compound component's child region. Keep breakpoint utilities (for example `md:py-8`), min/max sizing, flex/grid layout, and utilities with no equivalent component property in `.Classes`. `RawClasses` is the underlying raw-class channel; it is not a substitute for typed designer properties. Use `RawStyles` for exceptional inline CSS and `RawAttributes` for HTML attributes.

---

## 2. Parent Container & Child Leaf (Companion) Architecture

In SithasoDaisy5, components strictly separate into **Parent Containers** (structural daisyUI layout wrappers) and **Child Leaf Components** (content items that populate those wrappers).

### The Inviolable Companion Rules (RULE-LAYOUT-005)
1. **Never Orphan a Child Leaf**: A child leaf component (`SDUI5StatItem`, `SDUI5StepsItem`, `SDUI5TimelineItem`, `SDUI5TabsItem`, `SDUI5Column`, `SDUI5CarouselItem`, `SDUI5SwiperSlide`, `SDUI5MenuItem`, `SDUI5ListItem`, `SDUI5FooterTitle`) **CANNOT** mount directly to `app.PageView`, `SDUI5Container`, or an unrelated parent. Its `ParentID` MUST be the ID of its designated parent container.
2. **Parent First Lifecycle**: The Parent Container MUST be initialized, configured, and awaited (`BANano.Await(Parent.AddComponent)`) **BEFORE** any Child Leaf Component is mounted to it.
3. **Universal 3-Step Mounting**: Child leaf components do **NOT** use imaginary container methods like `.AddItem()` or `.Refresh()`. They are standard `SDUI5*` components mounted via `ParentID = "parentID"` and `BANano.Await(child.AddComponent)`.

### Companion Taxonomy Table

| Parent Container | Child Leaf Component | daisyUI Relationship | Notes |
|---|---|---|---|
| `SDUI5Row` | `SDUI5Column` | `.grid` container → `.col-span-*` cells | Row defines grid layout (`GridCols`, `GridColsMd`); Column defines cell span (`Size`, `SizeMd`). |
| `SDUI5Stat` | `SDUI5StatItem` | `.stats` wrapper → `.stat` tile | `SDUI5Stat` sets orientation/borders; `SDUI5StatItem` holds `Title`, `Value`, `Desc`, figure. |
| `SDUI5Steps` | `SDUI5StepsItem` | `.steps` wrapper → `step` item | `SDUI5Steps` sets direction/color; `SDUI5StepsItem` holds step label and active/completed state. |
| `SDUI5Timeline` | `SDUI5TimelineItem` | `.timeline` list → item | `SDUI5Timeline` sets vertical/horizontal; `SDUI5TimelineItem` holds start/middle/end content. |
| `SDUI5Tabs` | `SDUI5TabsItem` | `.tabs` bar → tab button/content | `SDUI5Tabs` sets tab style (`boxed`, `bordered`); `SDUI5TabsItem` holds label and content. |
| `SDUI5Carousel` | `SDUI5CarouselItem` | `.carousel` scroller → item | `SDUI5Carousel` sets snapping; `SDUI5CarouselItem` mounts image/content inside. |
| `SDUI5Swiper` | `SDUI5SwiperSlide` | Swiper slider → slide | `SDUI5Swiper` sets autoplay/pagination; `SDUI5SwiperSlide` holds slide content. |
| `SDUI5Slider` | `SDUI5SliderItem` | Slider wrapper → slide | `SDUI5Slider` controls track; `SDUI5SliderItem` holds slide elements. |
| `SDUI5Menu` | `SDUI5MenuItem` | `.menu` list → `<li>` entry | `SDUI5Menu` sets sizing/orientation; `SDUI5MenuItem` holds link/title/icon. |
| `SDUI5List` | `SDUI5ListItem` | `.list` container → item row | `SDUI5List` formats list rows; `SDUI5ListItem` holds item content. |
| `SDUI5Footer` | `SDUI5FooterTitle` | `.footer` layout → column header | `SDUI5Footer` organizes columns; `SDUI5FooterTitle` renders section heading. |

---

### Implementation Patterns for Companion Pairs

#### 2.1 Grid Layout: SDUI5Row (Parent) + SDUI5Column (Child Leaf)
```b4j
' 1. Parent Row FIRST
SDUI5Row1.Initialize(Me, "SDUI5Row1", "SDUI5Row1")
SDUI5Row1.ParentID = "SDUI5Container1"
SDUI5Row1.GridCols = 1
SDUI5Row1.GridColsMd = 3
SDUI5Row1.Gap = "6"
BANano.Await(SDUI5Row1.AddComponent)

' 2. Child Column mounting into Row
SDUI5Column1.Initialize(Me, "SDUI5Column1", "SDUI5Column1")
SDUI5Column1.ParentID = "SDUI5Row1"           ' Parent is SDUI5Row1!
SDUI5Column1.Size = "12"
SDUI5Column1.SizeMd = "4"
BANano.Await(SDUI5Column1.AddComponent)
```

#### 2.2 Stats KPI: SDUI5Stat (Parent) + SDUI5StatItem (Child Leaf)
```b4j
' 1. Parent Stat Container FIRST
SDUI5Stat1.Initialize(Me, "SDUI5Stat1", "SDUI5Stat1")
SDUI5Stat1.ParentID = "SDUI5Column1"
SDUI5Stat1.Shadow = "sm"
SDUI5Stat1.Border = True
SDUI5Stat1.RoundedBox = True
BANano.Await(SDUI5Stat1.AddComponent)

' 2. Child Stat Items mounting into SDUI5Stat1
SDUI5StatItem1.Initialize(Me, "SDUI5StatItem1", "SDUI5StatItem1")
SDUI5StatItem1.ParentID = "SDUI5Stat1"       ' Parent is SDUI5Stat1!
SDUI5StatItem1.Title = "Total Revenue"
SDUI5StatItem1.Value = "$45,200"
SDUI5StatItem1.Desc = "12% from last month"
SDUI5StatItem1.ValueTextColor = "primary"
BANano.Await(SDUI5StatItem1.AddComponent)
```

#### 2.3 Timeline: SDUI5Timeline (Parent) + SDUI5TimelineItem (Child Leaf)
```b4j
' 1. Parent Timeline Container FIRST
SDUI5Timeline1.Initialize(Me, "SDUI5Timeline1", "SDUI5Timeline1")
SDUI5Timeline1.ParentID = "SDUI5Column1"
SDUI5Timeline1.Vertical = True
BANano.Await(SDUI5Timeline1.AddComponent)

' 2. Child Timeline Items mounting into SDUI5Timeline1
SDUI5TimelineItem1.Initialize(Me, "SDUI5TimelineItem1", "SDUI5TimelineItem1")
SDUI5TimelineItem1.ParentID = "SDUI5Timeline1" ' Parent is SDUI5Timeline1!
SDUI5TimelineItem1.StartText = "09:00 AM"
SDUI5TimelineItem1.EndText = "Sprint Planning"
SDUI5TimelineItem1.EndBox = True
BANano.Await(SDUI5TimelineItem1.AddComponent)
```

#### 2.4 Steps Progress: SDUI5Steps (Parent) + SDUI5StepsItem (Child Leaf)
```b4j
' 1. Parent Steps Container FIRST
SDUI5Steps1.Initialize(Me, "SDUI5Steps1", "SDUI5Steps1")
SDUI5Steps1.ParentID = "SDUI5Container1"
SDUI5Steps1.Vertical = False
BANano.Await(SDUI5Steps1.AddComponent)

' 2. Child Steps Items mounting into SDUI5Steps1
SDUI5StepsItem1.Initialize(Me, "SDUI5StepsItem1", "SDUI5StepsItem1")
SDUI5StepsItem1.ParentID = "SDUI5Steps1"     ' Parent is SDUI5Steps1!
SDUI5StepsItem1.Text = "Register"
SDUI5StepsItem1.StepColor = "primary"
BANano.Await(SDUI5StepsItem1.AddComponent)
```

#### 2.5 Tabs Navigation: SDUI5Tabs (Parent) + SDUI5TabsItem (Child Leaf)
```b4j
' 1. Parent Tabs Container FIRST
SDUI5Tabs1.Initialize(Me, "SDUI5Tabs1", "SDUI5Tabs1")
SDUI5Tabs1.ParentID = "SDUI5Container1"
SDUI5Tabs1.Boxed = True
BANano.Await(SDUI5Tabs1.AddComponent)

' 2. Child Tabs Items mounting into SDUI5Tabs1
SDUI5TabsItem1.Initialize(Me, "SDUI5TabsItem1", "SDUI5TabsItem1")
SDUI5TabsItem1.ParentID = "SDUI5Tabs1"       ' Parent is SDUI5Tabs1!
SDUI5TabsItem1.Text = "Overview"
SDUI5TabsItem1.Checked = True
BANano.Await(SDUI5TabsItem1.AddComponent)
```

---

## 3. Specialized Layout & Feedback Containers

### 3.1 SDUI5Modal (Dialog wrapper)
Hosts child controls inside named regions (e.g., `_actions`, `_box`).
```b4j
SDUI5Modal1.Initialize(Me, "SDUI5Modal1", "SDUI5Modal1")
SDUI5Modal1.ParentID = "SDUI5Container1"
SDUI5Modal1.Title = "Confirm Action"
BANano.Await(SDUI5Modal1.AddComponent)

' Children mount into modal's named regions
SDUI5Button1.Initialize(Me, "SDUI5Button1", "SDUI5Button1")
SDUI5Button1.ParentID = "SDUI5Modal1_actions"
SDUI5Button1.Color = "primary"
SDUI5Button1.Text = "Confirm"
BANano.Await(SDUI5Button1.AddComponent)
```

### 3.2 SDUI5Swal / SweetAlert (Alert dialog)
Programmatic dialog; uses 3-argument initialize:
```b4j
SDUI5Swal1.Initialize(Me, "SDUI5Swal1", "SDUI5Swal1")
SDUI5Swal1.ParentID = app.PageView
BANano.Await(SDUI5Swal1.AddComponent)
```

---

## 4. Anti-Patterns

| Anti-pattern | Why It Fails | Correct Pattern |
|---|---|---|
| Mounting child leaf (`SDUI5StatItem`, `SDUI5TimelineItem`, `SDUI5Column`) directly to Row, Container, or PageView | DaisyUI CSS classes expect the exact parent container wrapper (e.g. `.stats`, `.timeline`, `.grid`). Missing wrapper breaks styling and alignment. | Always mount child leaf into its designated parent container (`ParentID = parentID`). |
| Calling `.AddItem()` or `.Refresh()` on parent container | Neither method exists in SithasoDaisy5 B4J library; causes compile or runtime failure. | Use standard `child.ParentID = parentID` + `BANano.Await(child.AddComponent)`. |
| Mounting child before parent `AddComponent` | Child looks for DOM element `#parentID`, which does not exist yet. | Always `BANano.Await(parent.AddComponent)` BEFORE mounting any children. |
| Skipping `'ignore` suffix in Globals | B4J compiler warns about unused variables. | Always append `'ignore` to component declarations. |

---

## 6. References

- `references/ux-master-doctrine.md` — quantitative design laws + DoD
- `references/rules-enforcer.md` — RULE-MOUNT-* rules citing this doc
- `references/negative-knowledge.md` — anti-patterns
- `components/<Name>.md` — per-component authoritative mount sequence
