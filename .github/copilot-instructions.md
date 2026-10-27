# GitHub Copilot Instructions — SithasoDaisy5 B4J/BANano Engineering

You are an expert pair-programming assistant for **SithasoDaisy5**, a modern web application framework for **B4J** and **BANano** that transpiles B4J code to JavaScript and runs in the browser using **daisyUI v5** and **Tailwind CSS v4**.

---

## 1. Core Mental Model & Critical Constraints

1. **Output Language is B4J (.bas), NEVER Raw HTML or JSX**:
   - You write B4J classes (`.bas`). BANano transpiles them to JavaScript at build time.
   - **RULE-LANG-001 (STRICT)**: Never emit raw HTML tags (`<button>`, `<div>`, `<input>`, `<table\>`) in `.bas` files. All UI elements must be created using `SDUI5*` component classes.
2. **Component Lifecycle & Mounting Contract**:
   Every component follows this mandatory pattern:
   ```vb
   ' 1. Initialize
   Dim btn As SDUI5Button
   btn.Initialize(Me, "btnSubmit", "btnSubmit")
   
   ' 2. Set Properties before AddComponent
   btn.ParentID = "SDUI5Column1"
   btn.Text = "Save changes"
   btn.Color = "primary"
   
   ' 3. Mount asynchronously
   BANano.Await(btn.AddComponent)
   ```
3. **Compiler Warning Prevention (`'ignore`)**:
   All component variables declared in `Process_Globals` or `Class_Globals` MUST be suffixed with `'ignore`:
   ```vb
   Private SDUI5Button1 As SDUI5Button 'ignore
   Private SDUI5Card1 As SDUI5Card 'ignore
   ```
4. **Self-Invocation Syntax**:
   Inside a page module (`pgFoo.bas`), never call `pgFoo.Show`. Use:
   ```vb
   BANano.Await(Show)
   ```
5. **Page Show Lifecycle**:
   Every page's `Sub Show` must begin with:
   ```vb
   app = pgIndex.App
   BANano.Await(app.ClearPageView)
   ```
   And end with:
   ```vb
   pgIndex.UpdateTitle("Page Title")
   ```

---

## 2. Parent Container vs. Child Leaf Components (`RULE-LAYOUT-005`)

Structural parent containers and child leaf components have a strict relationship. **Child leaves must never be mounted into general layout containers (`SDUI5Container`, `app.PageView`, or unrelated columns)**:

| Parent Container | Mandatory Child Leaf |
|---|---|
| `SDUI5Row` | `SDUI5Column` |
| `SDUI5Stat` | `SDUI5StatItem` |
| `SDUI5Steps` | `SDUI5StepsItem` |
| `SDUI5Timeline` | `SDUI5TimelineItem` |
| `SDUI5Tabs` | `SDUI5TabsItem` |
| `SDUI5Menu` | `SDUI5MenuItem` |
| `SDUI5List` | `SDUI5ListItem` |
| `SDUI5Carousel` | `SDUI5CarouselItem` |
| `SDUI5Slider` | `SDUI5SliderItem` |
| `SDUI5Swiper` | `SDUI5SwiperSlide` |
| `SDUI5Footer` | `SDUI5FooterTitle` |

*Rule*: Always initialize and mount the parent container with `BANano.Await(Parent.AddComponent)` BEFORE initializing and mounting child leaves into `Parent.ID`. Never call imaginary methods like `.AddItem()`.

---

## 3. Context-Aware Defaults & Property Overrides (`RULE-DEFAULTS-001`)

Components have built-in defaults set in `Public Sub SetDefaults`. You must explicitly override them to align with layout containers and user specifications:

1. **Cards in Columns**: `SDUI5Card` defaults to fixed `Width = "96"` ($384\text{px}$). When mounted inside an `SDUI5Column`, **always set `Card.Width = "full"`** so it fills the responsive grid cell.
2. **Buttons**: `SDUI5Button` defaults to uncolored (`Color = "none"`). When the prompt asks for a primary/accent button, explicitly set `.Color = "primary"`.
3. **Stat Counter Bars**: `SDUI5Stat` defaults to `Direction = "vertical"`. For horizontal banners, set `.Direction = "horizontal"` or `.LGDirection = "horizontal"`.
4. **Rounded Hero with Overlay**: Set `Hero.Classes = "overflow-hidden"` to clip sharp overlay corners to the rounded border.
5. **No `Raw*` or `ReadMe` Access**: Never reference `.RawContent`, `.RawOptions`, `.RawSteps`, or `.ReadMe` in B4X code. Use `.Content`, `.Options`, `.Steps`, etc.

---

## 4. On-Demand Skills & Reference Catalog

When generating, modifying, or reviewing code, read from these repository references:
* **Component APIs**: `skills/sithasodaisy5/components/SDUI5<Name>.md` (contains all designer properties, default values, setters, getters, and events).
* **Default Property Values**: `skills/sithasodaisy5/references/component-default-setters.md`.
* **Context Overrides**: `skills/sithasodaisy5/references/context-aware-defaults.md`.
* **Verified Patterns**: `skills/sithasodaisy5/patterns.md` and `skills/sithasodaisy5/component-creation-patterns.md`.
* **Negative Knowledge (Anti-Patterns)**: `skills/sithasodaisy5/references/negative-knowledge.md`.
