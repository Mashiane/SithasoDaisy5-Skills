---
name: design-craft-guide
description: Definitive guide for crafting award-winning, visually stunning, human-crafted web applications with SithasoDaisy5 and TailwindCSS. Covers the 3 Design Dials Engine, 10-Tier UX Quality Hierarchy, Industry Archetype Matrix, typography systems, surface elevation, glassmorphism, Bento grids, accent rarity, micro-interactions, and 20-point polish checklist.
---

# SithasoDaisy5 Design Craft Guide
## From Component Scaffolding to Award-Winning Web Experiences

> **The Golden Rule of SithasoDaisy5 Design:**  
> A daisyUI theme is only a palette foundation. It is **not** an art direction. Passing AST compiler checks does **not** make an app look designed. Great software feels deliberate, uncluttered, beautifully proportioned, responsive, and alive with subtle craft.

---

## 1. The Anatomy of an Award-Winning SithasoDaisy5 Screen

An amateur screen and an award-winning screen use the same underlying framework components (`SDUI5Card`, `SDUI5Button`, `SDUI5Stat`, `SDUI5Hero`). The difference is entirely in **art direction, surface craft, typography, spacing rhythm, and restraint**:

| Element | Amateur / Default "AI Slop" | Award-Winning SithasoDaisy5 Craft |
| :--- | :--- | :--- |
| **Typography** | Browser default system font; flat headers; identical font weights. | Curated Google Font (e.g. *Plus Jakarta Sans*, *Inter*, *Space Grotesk*); tight tracking (`tracking-tight`); bold typographic hierarchy; subtle muted labels (`text-xs uppercase tracking-widest font-semibold text-base-content/60`). |
| **Surfaces** | Heavy solid gray cards with opaque black borders (`border-2`) and generic drop-shadows. | Layered surfaces; subtle hairline borders (`border border-base-200/80` or `border-base-content/10`); frosted glass (`backdrop-blur-md bg-base-100/80`); smooth rounded corners (`rounded-2xl` / `rounded-3xl`). |
| **Background** | Harsh stark white or flat pitch black canvas. | Subtle ambient canvas tones (`bg-base-200/30`); soft radial background glows or delicate mesh gradient accents. |
| **Color Discipline** | Primary color applied to cards, headings, stats, buttons, badges, and icons simultaneously. | **Accent Rarity & Palette Harmony**: The dominant accent is reserved **strictly once per viewport** for the primary call-to-action. Secondary elements use `"ghost"`, `"outline"`, or `"neutral"`. Semantic tokens are preferred for theme switching, but **hex colors (`#hex`) are fully supported and allowed** for brand-specific styling, custom cards, and data visualization. |
| **Composition** | Formulaic: Banner -> 3 equal cards in a row -> 4 stats -> giant button. | Asymmetric Bento grids; interactive split-screen heroes; rich KPI cards with trend delta pills (`+14.2%`); interactive simulated product widgets. |
| **Micro-Interactions** | Static, lifeless elements with zero hover response. | Subtle elevation transitions (`transition-all duration-300 hover:-translate-y-1 hover:shadow-xl hover:border-primary/40`); active focus rings; pulsing status dots. |
| **Assets & Content** | Generic Unsplash cityscape photos; default `"Card Title"` / `"Card Content"` placeholder strings left visible. | Highly relevant, domain-specific imagery; crisp SVG icons; realistic, human-crafted copy and data that tells a believable product story. |

---

## 2. The 3 Design Dials Engine

Every professional screen is calibrated across three design dimensions (rated 1 to 10). When planning or building a screen, declare these three dials:

### Dial 1: Visual Density (1 - 10)
Controls padding, margins, whitespace, and information density per viewport:

- **1 - 3 (Spacious / Editorial)**:
  - *Context*: Luxury brands, consumer landing pages, lifestyle showcases, marketing heroes.
  - *Metrics*: `p-8 md:p-12`, `gap-8 md:gap-12`, `py-16 md:py-24`, generous card interior padding (`p-8 md:p-10`), `text-lg` or `text-xl` body text.
- **4 - 7 (Standard / Balanced)**:
  - *Context*: General SaaS apps, consumer portals, user profile settings, e-commerce product catalogs.
  - *Metrics*: `p-6`, `gap-6`, `py-8 md:py-12`, standard card padding (`p-6`), `text-base` body text.
- **8 - 10 (Compact / Information-Dense)**:
  - *Context*: Financial trading desks, developer consoles, server telemetry, ERP systems, live operations dashboards.
  - *Metrics*: `p-3 sm:p-4`, `gap-3 sm:gap-4`, tight KPI cards (`p-4`), dense data tables (`table-xs` or `table-sm`), compact badges, `text-xs` or `text-sm` body text, tabular numbers (`font-mono`).

### Dial 2: Design Variance (1 - 10)
Controls layout symmetry, compositional contrast, and visual rhythm:

- **1 - 3 (Formal / Predictable)**:
  - *Context*: Enterprise legal/compliance apps, medical record views, government portals.
  - *Layout*: Strict single-column or symmetrical two-column grids. Uniform card heights, centered text, standard top-to-bottom layout flow.
- **4 - 7 (Modern / Balanced)**:
  - *Context*: Modern SaaS dashboards, cloud tools, analytics consoles.
  - *Layout*: Asymmetrical split heroes (e.g. 7-col hero copy + 5-col simulated app preview), sticky frosted navigation bar, 4-card KPI metric rows with trend badges.
- **8 - 10 (Bold / Expressive Bento)**:
  - *Context*: Award-winning showcase landing pages, modern fintech mobile apps, product launch studios.
  - *Layout*: Multi-span Bento mosaics (8/4 or 5/7 column splits), overlapping layered cards, gradient glow backdrops, floating chip indicators, contrasting surface treatments.

### Dial 3: Motion / Interaction Intensity (1 - 10)
Controls the dynamic physicality, hover responsiveness, and micro-animation of the interface:

- **1 - 3 (Restrained / Subtle)**:
  - *Context*: High-frequency trading, dense data entry, low-power enterprise displays.
  - *Behaviors*: Instant transitions or subtle opacity fades (`transition-colors duration-150`). No physical translation or movement.
- **4 - 7 (Tactile / Physical)**:
  - *Context*: Standard web apps, dashboards, interactive admin consoles.
  - *Behaviors*: Smooth card hover elevation (`hover:-translate-y-0.5 hover:shadow-lg transition-all duration-200`), button click depression (`active:scale-95 transition-transform duration-100`), smooth color transitions on hover.
- **8 - 10 (Lively / Animated)**:
  - *Context*: Consumer showcases, onboarding flows, interactive games, live status monitors.
  - *Behaviors*: Pulsing live operational dots (`animate-ping`), skeleton shimmers (`skeleton` loading states), sliding drawer transitions, floating badges, animated progress rings.

---

## 3. The 10-Tier UX Quality Hierarchy

When engineering screens, prioritize design decisions through this strict 10-tier quality hierarchy:

1. **Tier 1: Accessibility & Contrast** (Non-negotiable foundation)
   - Ensure minimum 4.5:1 text contrast for body copy; 3:1 for large headers and interactive icons.
   - Never use raw emojis for critical status (e.g. avoid raw unicode icons that render unpredictably across OSs); use crisp vector icons or semantic daisyUI badges.
   - Maintain visible keyboard focus indicators on all inputs and interactive buttons.
2. **Tier 2: Touch & Hit Targets**
   - Minimum tap target size of 44x44px (recommended 48x48px) for buttons, tabs, and menu items.
   - Minimum 8px spacing between adjacent interactive elements to prevent accidental mis-taps.
3. **Tier 3: Perceived Performance & Loading States**
   - Provide skeleton screens (`SDUI5Skeleton` or `skeleton` class) for initial data fetching instead of empty white containers.
   - Buttons show immediate active state feedback upon click (`active:scale-95`). Zero cumulative layout shifts (CLS) when data loads.
4. **Tier 4: Style Uniformity & Accent Rarity**
   - Enforce Accent Rarity: exactly **one** primary call-to-action per viewport. Secondary actions must be `neutral`, `ghost`, or `outline`.
   - Maintain a uniform corner radius hierarchy throughout the entire application (e.g. `rounded-2xl` for cards, `rounded-xl` for buttons/inputs, `rounded-full` for badges).
5. **Tier 5: Responsive Layout Resilience**
   - All page layouts must be wrapped in responsive boundary containers (`max-w-7xl mx-auto px-4 sm:px-6 lg:px-8`).
   - Strictly zero horizontal scrolling on mobile viewports (tested at 390px width). Columns must wrap gracefully from 12-col desktop to single-column mobile.
6. **Tier 6: Typographic Scale & Hierarchy**
   - Curated Google Font injected at application initialization.
   - Strict 3-level typographic scale: Major Heading (`text-3xl` to `text-5xl` font-extrabold tracking-tight) -> Section Header (`text-xl` font-bold tracking-tight) -> Body Copy (`text-sm` or `text-base` font-normal text-base-content/80) -> Muted Eyebrow / Kicker (`text-xs` font-semibold uppercase tracking-widest text-primary or text-base-content/60).
7. **Tier 7: Surface Craft & Elevation**
   - Hairline borders (`border border-base-200/80` in light mode, `border border-white/10` in dark mode) replace heavy solid borders.
   - Layered surfaces using frosted glass (`backdrop-blur-md bg-base-100/80`) and subtle ambient canvas tones (`bg-base-200/30`).
8. **Tier 8: Form Usability & Error Guidance**
   - Visible labels above inputs; placeholders serve as formatting examples, never as field labels.
   - Inline validation guidance and clear red error messages positioned directly beneath offending fields.
9. **Tier 9: Wayfinding & Navigation Hierarchy**
   - Active page states clearly highlighted on sidebars or navbars.
   - Breadcrumbs or kicker labels provide clear orientation. Mobile viewports provide accessible bottom navigation or drawer navigation.
10. **Tier 10: Empty State Craft**
    - Dynamic data containers (tables, list views, cards) must never render as blank voids when zero records exist.
    - Always provide a rich empty state: muted vector icon, explanatory title, helpful 1-sentence prompt, and a direct CTA button (e.g. "Create First Record").

---

## 4. Industry Archetype Matrix (6 Core Profiles)

When designing a SithasoDaisy5 web application, align with one of these 6 industry archetypes:

### Archetype 1: Fintech & Precision Trading
- **Best Themes**: `dark`, `luxury`, or `night`
- **Typography**: Headings: `Space Grotesk` (700) | Data/Body: `Inter` (400/500) + tabular numbers (`font-mono`)
- **Dial Settings**: Density: 8-9 (Compact) | Variance: 5-6 (Structured) | Motion: 4-5 (Precise)
- **Signature Elements**:
  - High-contrast KPI metric cards with green/red trend delta pills (`+14.8%`, `-2.4%`).
  - Dark ambient canvas (`bg-base-300/40`) with frosted glass cards (`bg-base-100/80 backdrop-blur-md border border-white/10`).
  - Monospace formatting for balances, crypto addresses, and transaction hashes.
- **Anti-Patterns to Avoid**: Soft pastel colors, cartoon illustrations, excessive whitespace, missing currency symbols.

### Archetype 2: B2B SaaS & Cloud Developer Tools
- **Best Themes**: `corporate`, `business`, or `dark`
- **Typography**: Headings: `Plus Jakarta Sans` (700/800) | Body: `Inter` (400/500)
- **Dial Settings**: Density: 6-7 (Standard/Dense) | Variance: 6-7 (Modern Bento) | Motion: 5-6 (Tactile)
- **Signature Elements**:
  - Asymmetric Bento grid layout (8-column primary card + 4-column metric stack).
  - Sticky frosted header with global search shortcut and profile avatar.
  - Pulsing live operational status indicators (`animate-ping bg-success`).
  - Code snippet blocks with copy-to-clipboard buttons and hairline borders.
- **Anti-Patterns to Avoid**: Giant decorative banners that push data offscreen, center-aligned walls of body text.

### Archetype 3: Executive Command Center & Operations Dashboard
- **Best Themes**: `nord`, `dim`, or `business`
- **Typography**: Headings: `Plus Jakarta Sans` (700) | Body: `Plus Jakarta Sans` (400/500)
- **Dial Settings**: Density: 8-9 (High Density) | Variance: 6-7 (Bento Layout) | Motion: 4-5 (Smooth)
- **Signature Elements**:
  - 4-metric top summary row with trend badges and micro-progress bars.
  - 8/4 split with primary interactive chart on left and real-time audit event feed on right.
  - Filter toolbar with date range selector, status dropdown, and search input.
- **Anti-Patterns to Avoid**: Single massive card consuming the entire display, low-contrast gray-on-gray labels.

### Archetype 4: E-Commerce & Consumer Showcase
- **Best Themes**: `light`, `retro`, `cupcake`, or `cyberpunk`
- **Typography**: Headings: `Outfit` (700) | Body: `Outfit` or `Plus Jakarta Sans` (400/500)
- **Dial Settings**: Density: 4-5 (Spacious) | Variance: 7-8 (Visual Showcase) | Motion: 6-8 (Engaging)
- **Signature Elements**:
  - Product cards with smooth hover lift (`hover:-translate-y-1 hover:shadow-xl`), discount badge overlays, and rating stars.
  - Floating or sticky checkout cart summary bar.
  - High-resolution product showcase with gallery thumbnails and instant size/color selector chips.
- **Anti-Patterns to Avoid**: Dense tabular layouts resembling Excel spreadsheets, missing product imagery, tiny buy buttons.

### Archetype 5: Healthcare & Wellness Portal
- **Best Themes**: `winter`, `emerald`, or `aqua`
- **Typography**: Headings: `Inter` (600/700) | Body: `Inter` (400/500)
- **Dial Settings**: Density: 4-5 (Spacious / Calm) | Variance: 3-5 (Clean / Symmetrical) | Motion: 2-4 (Gentle)
- **Signature Elements**:
  - Generous card padding (`p-8`), rounded pill-like corners (`rounded-3xl`), calming teal/blue accents.
  - Clear multi-step appointment booking wizard with highlighted progress steps.
  - Legible, large body copy (`text-base` or `text-lg`) with high contrast for elderly patients.
- **Anti-Patterns to Avoid**: Neon colors, chaotic asymmetry, intimidating technical jargon, tiny input fields.

### Archetype 6: Creative Portfolio & Product Launch
- **Best Themes**: `black`, `luxury`, or `synthwave`
- **Typography**: Headings: `Space Grotesk` (700/800) | Body: `Inter` (400/500)
- **Dial Settings**: Density: 2-3 (Ultra-Spacious) | Variance: 8-10 (Bold Asymmetry) | Motion: 7-9 (Fluid)
- **Signature Elements**:
  - Giant typographic hero statement with tight tracking and subtle gradient fill.
  - Full-width showcase Bento with floating project tags and interactive preview modal.
  - Ambient radial glow positioned behind featured case studies.
- **Anti-Patterns to Avoid**: Boring 3-column equal card grids, cookie-cutter templates, static flat visuals.

---

## 5. Typography & Font Pairing Engine

Web typography establishes 90% of visual character. Never let an app render in the browser's raw system font.

### A. Recommended Font Pairings

| Aesthetic Mood | Primary / Headings | Body / UI Elements | Google Fonts Link | Best For |
| :--- | :--- | :--- | :--- | :--- |
| **Modern SaaS & Tech** | `Plus Jakarta Sans` (700/800) | `Inter` or `Plus Jakarta Sans` (400/500) | `https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&family=Inter:wght@400;500;600&display=swap` | Dashboards, Cloud Tools, Analytics |
| **Fintech & Precision** | `Space Grotesk` (700) | `Inter` (400/500) | `https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@500;700&family=Inter:wght@400;500;600&display=swap` | Banking, Crypto, Developer APIs |
| **Clean Editorial / Lifestyle**| `Outfit` (600/700) | `Outfit` or `Plus Jakarta Sans` | `https://fonts.googleapis.com/css2?family=Outfit:wght@400;500;600;700&display=swap` | Portfolios, Consumer Products, E-Commerce |

### B. How to Wire Custom Fonts in SithasoDaisy5

In `pgIndex.bas` (or app startup), inject the Google Font stylesheet using the framework's asset loader, then declare the font family on the page root:

```b4j
' In pgIndex.bas: Initialize
Sub Initialize
    App.Initialize(Me)
    ' Load curated modern typography once at app start
    App.LoadAssetsOnDemand("google-font-jakarta", Array("https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&family=Inter:wght@400;500;600&display=swap"))
    
    ' Set pageview with default font and ambient surface
    App.AddClass("font-['Plus_Jakarta_Sans',sans-serif] bg-base-200/30 text-base-content antialiased min-h-screen")
    ...
End Sub
```

### C. Typographic Ranks & Tracking Classes

Always apply intentional tracking and weight via `.Classes`:

```b4j
' Hero Main Title (tight tracking, bold, high contrast)
title.Classes = "text-4xl md:text-6xl font-extrabold tracking-tight text-base-content leading-tight"

' Section Card Header
cardHeader.Classes = "text-xl font-bold tracking-tight text-base-content"

' Eyebrow / Kicker Label (above headers)
eyebrow.Classes = "text-xs font-semibold tracking-widest uppercase text-primary mb-2"

' Stat / KPI Number
statVal.Classes = "text-3xl md:text-4xl font-extrabold tracking-tight text-base-content"

' Metric Subtitle / Delta Label
statLabel.Classes = "text-xs font-medium text-base-content/60"
```

---

## 6. Surface Craft, Elevation & Glassmorphism

Never emit naked, plain cards. A card should feel like a polished, tactile physical surface.

### A. The 3 Surface Tiers

1. **Tier 1: Subtle Flat Surface with Hairline Border** (Best for High-Density Dashboards)
   ```b4j
   card.Classes = "bg-base-100 border border-base-200/80 rounded-2xl shadow-sm hover:shadow-md transition-all duration-200 p-6"
   card.Border = False  ' Disable daisyUI default heavy border
   card.Shadow = "none" ' Let Tailwind classes handle the shadow
   ```

2. **Tier 2: Frosted Glass / Glassmorphism** (Best for Hero Banners & Modern SaaS)
   ```b4j
   card.Classes = "bg-base-100/75 backdrop-blur-xl border border-white/20 dark:border-white/10 rounded-3xl shadow-xl shadow-base-content/5 p-8"
   ```

3. **Tier 3: Featured Accent Card / Gradient Glow** (Best for Primary Pricing or Spotlight Features)
   ```b4j
   card.Classes = "relative bg-gradient-to-b from-base-100 to-base-200/60 border-2 border-primary/40 rounded-3xl shadow-2xl shadow-primary/10 p-8 overflow-hidden"
   ```

### B. Ambient Canvas Background

Avoid rendering content on pure `#FFFFFF` or `#000000`. Use subtle ambient canvas contrast:
```b4j
' Page container wrapper:
SDUI5Container1.Classes = "mx-auto max-w-7xl px-4 sm:px-6 lg:px-8 py-8 md:py-12"
```

---

## 7. Accent Rarity & Color Discipline

The most common mark of an amateur AI app is **color soup**: pink cards next to teal badges next to purple buttons next to yellow stats.

### The 60-30-10 Color Rule in SithasoDaisy5:
- **60% Dominant Base**: Canvas, containers, cards (`base-100`, `base-200`, `base-300`).
- **30% Structural Neutral**: Typography, icons, hairline borders, subtle badges (`base-content`, `neutral`, `border-base-200`).
- **10% Accent Power**: **Reserved for high-intent actions only**.

```b4j
' PRIMARY ACTION (One per screen - lg, high contrast, subtle glow)
btnPrimary.Color = "primary"
btnPrimary.Size = "lg"
btnPrimary.Classes = "shadow-lg shadow-primary/25 hover:shadow-primary/40 hover:-translate-y-0.5 transition-all duration-200 rounded-xl font-bold"

' SECONDARY ACTION (Subordinated, ghost or outline)
btnSecondary.Color = "neutral"
btnSecondary.Style = "ghost"
btnSecondary.Size = "lg"
btnSecondary.Classes = "hover:bg-base-200 rounded-xl font-semibold"
```

---

## 8. Modern Bento Grid Blueprints

Bento grids organize complex information into an asymmetrical, harmonious layout.

### Bento Pattern: The 12-Column Modern SaaS Bento

```text
+-------------------------------------------------------------+
|                      [BENTO GRID]                           |
|  +------------------------------------+  +---------------+  |
|  | FEATURE 1 (Spans 8 cols)           |  | STAT (4 cols) |  |
|  | - Big visual headline              |  | - Circular    |  |
|  | - Interactive simulated mini UI    |  |   progress    |  |
|  | - Live status chip                 |  | - Large KPI   |  |
|  +------------------------------------+  +---------------+  |
|  +------------------+  +------------------+  +------------+ |
|  | MICRO 1 (4 cols) |  | MICRO 2 (4 cols) |  | MICRO 3 (4)| |
|  | - Clean icon     |  | - Feature badge  |  | - Quote    | |
|  | - Crisp benefit  |  | - Short metric   |  | - Mini CTA | |
|  +------------------+  +------------------+  +------------+ |
+-------------------------------------------------------------+
```

### B4J Implementation Pattern:
```b4j
' Row 1: Asymmetrical 8 / 4 split
SDUI5Row1.Classes = "gap-6 mb-6"

' Left Column: Span 12 on mobile, 8 on desktop
SDUI5ColHero.Size = "12"
SDUI5ColHero.SizeLg = "8"

' Right Column: Span 12 on mobile, 4 on desktop
SDUI5ColMetric.Size = "12"
SDUI5ColMetric.SizeLg = "4"

' Row 2: Symmetric 3-column split (4 / 4 / 4)
SDUI5Row2.Classes = "gap-6"
SDUI5ColSub1.Size = "12"
SDUI5ColSub1.SizeMd = "4"
```

---

## 9. Micro-Interactions & Hover Polish

Static components feel like dead wireframes. Add purposeful micro-interactions to make the web app feel responsive and fluid:

### A. Card Hover Lift:
```b4j
card.Classes = "transition-all duration-300 ease-out hover:-translate-y-1 hover:shadow-xl hover:border-primary/40 cursor-pointer"
```

### B. Pulsing Live Status Dot:
```b4j
' Create a status badge with an active breathing pulse
statusBadge.Classes = "inline-flex items-center gap-2 px-3 py-1 rounded-full text-xs font-semibold bg-success/10 text-success border border-success/20"
' Prefix with animated dot:
statusBadge.Text = "<span class='relative flex h-2 w-2'><span class='animate-ping absolute inline-flex h-full w-full rounded-full bg-success opacity-75'></span><span class='relative inline-flex rounded-full h-2 w-2 bg-success'></span></span> Live Operational"
```

### C. Trend Delta Pills for KPI Metrics:
Instead of raw numbers, pair KPI cards with contextual percentage badges:
```b4j
' Inside a KPI Card header or footer:
badgeTrend.Classes = "badge badge-success badge-sm gap-1 font-semibold bg-success/15 text-success border-0"
badgeTrend.Text = "&uarr; 14.8% vs last mo"
```

### D. Button Active Depression:
```b4j
btn.Classes = "active:scale-95 transition-transform duration-100"
```

---

## 10. Concrete Recipes for Core Components

### Recipe 1: Executive KPI Stat Card
```b4j
' 1. Parent Column (span 12 on mobile, 6 on tablet, 3 on desktop)
col.Size = "12"
col.SizeSm = "6"
col.SizeLg = "3"

' 2. Surface Card
card.Initialize(Me, "cardMetric1", "cardMetric1")
card.ParentID = col.ID
card.Border = False
card.Shadow = "none"
card.Classes = "bg-base-100 border border-base-200/80 rounded-2xl p-5 hover:shadow-md hover:border-base-300 transition-all duration-200"
BANano.Await(card.AddComponent)

' 3. Eyebrow Title + Icon
lblTitle.Classes = "text-xs font-semibold tracking-wider uppercase text-base-content/60"
lblTitle.Text = "Total Revenue"

' 4. Metric Value
lblValue.Classes = "text-3xl font-extrabold tracking-tight text-base-content mt-1 mb-2"
lblValue.Text = "$124,592"

' 5. Footer with Trend Pill
badgeDelta.Classes = "badge badge-success badge-sm font-semibold bg-success/15 text-success border-0"
badgeDelta.Text = "&uarr; 18.2% from last month"
```

### Recipe 2: High-Conversion Split Hero
```b4j
' Row with centered alignment and generous vertical padding
rowHero.Classes = "items-center gap-12 py-12 md:py-20"

' Left: Headline + Value Prop + CTA
colLeft.Size = "12"
colLeft.SizeLg = "6"

' Right: Live Interactive Card Preview (Simulated Application)
colRight.Size = "12"
colRight.SizeLg = "6"
cardPreview.Classes = "bg-base-100/90 backdrop-blur-xl border border-base-200 rounded-3xl shadow-2xl p-6 relative overflow-hidden"
```

### Recipe 3: Rich Empty State Card
```b4j
' Empty container when list or table has 0 records
cardEmpty.Initialize(Me, "cardEmpty", "cardEmpty")
cardEmpty.ParentID = colTable.ID
cardEmpty.Border = False
cardEmpty.Shadow = "none"
cardEmpty.Classes = "bg-base-100 border border-dashed border-base-300 rounded-2xl p-12 text-center flex flex-col items-center justify-center"
BANano.Await(cardEmpty.AddComponent)

' Muted icon wrapper
iconBox.Classes = "w-16 h-16 rounded-full bg-base-200/60 flex items-center justify-center text-base-content/40 mb-4"

' Explanatory copy
lblEmptyTitle.Classes = "text-lg font-bold text-base-content mb-1"
lblEmptyTitle.Text = "No projects found"

lblEmptySub.Classes = "text-sm text-base-content/60 max-w-sm mb-6"
lblEmptySub.Text = "Get started by creating your very first project workspace to track milestones."

' Primary action CTA
btnCreate.Color = "primary"
btnCreate.Text = "Create New Project"
btnCreate.Classes = "shadow-lg shadow-primary/25 rounded-xl font-bold"
```

---

## 11. The 20-Point Award-Winning Pre-Delivery Polish Checklist

Before any screen is approved for release (Gate G6), verify every item across the 5 core pillars:

### Pillar A: Surface & Color Discipline
- [ ] **1. Accent Rarity**: Is the `"primary"` button color reserved strictly **once** per viewport for the main CTA?
- [ ] **2. Surface Elevation**: Are all cards styled with subtle hairline borders (`border-base-200/80` or `border-white/10`) rather than thick default borders?
- [ ] **3. Ambient Canvas**: Is the background treated with subtle ambient contrast (`bg-base-200/30` or soft mesh gradient) rather than flat pure white?
- [ ] **4. Contrast Ratio**: Does all body copy meet WCAG AA 4.5:1 contrast against its immediate card surface?

### Pillar B: Typography & Content Integrity
- [ ] **5. Modern Font Injected**: Is a curated Google Font (`Plus Jakarta Sans`, `Inter`, `Space Grotesk`, `Outfit`) loaded at startup in `pgIndex.bas`?
- [ ] **6. Typographic Tracking**: Is `tracking-tight` applied to major headings and `tracking-widest uppercase` applied to eyebrow kickers?
- [ ] **7. Zero Placeholder Pollution**: Are default framework strings (`"Card Title"`, `"Card Content"`, `"Lorem Ipsum"`) 100% eliminated?
- [ ] **8. Domain-Specific Numbers**: Are metric values formatted with currency symbols, commas, and percentage trend pills (`&uarr; 14.8%`)?

### Pillar C: Layout & Responsive Resilience
- [ ] **9. Max Container Bound**: Is the page bounded with `max-w-7xl mx-auto px-4 sm:px-6 lg:px-8`?
- [ ] **10. Zero Horizontal Scroll**: Is the page verified at **1280px (Desktop)** and **390px (Mobile)** with zero horizontal scrollbar?
- [ ] **11. Bento Asymmetry**: Do dashboards and feature sections use deliberate 8/4 or 7/5 column splits instead of identical 3-card rows?
- [ ] **12. Spacing Rhythm**: Are grid gaps and card padding calibrated to the declared Visual Density Dial (1-10)?

### Pillar D: Micro-Interactions & Physicality
- [ ] **13. Card Elevation Lift**: Do interactive cards lift smoothly on hover (`hover:-translate-y-0.5 hover:shadow-lg transition-all duration-200`)?
- [ ] **14. Button Click Feedback**: Do action buttons scale down on click (`active:scale-95 transition-transform duration-100`)?
- [ ] **15. Live Status Indicators**: Do live operational metrics feature an active breathing pulse dot (`animate-ping`)?
- [ ] **16. Hit Target Safety**: Are all buttons, inputs, and touch targets at least 44x44px with >= 8px separation?

### Pillar E: Component & Code Discipline
- [ ] **17. Native SithasoDaisy5**: Is 100% of the UI composed via native B4J/BANano components with zero hand-rolled HTML/CSS stylesheets (`RULE-ANTI-001`)?
- [ ] **18. Pure ASCII Encoding**: Is the file saved strictly as UTF-8 without BOM, with 0 non-ASCII characters in source code (`RULE-ENCODING-001/002/003`)?
- [ ] **19. Event Sub Wiring**: Do all buttons and inputs have corresponding event handlers implemented (`Sub btn_Click (e As BANanoEvent)`)?
- [ ] **20. Rich Empty States**: Does every dynamic table or list view have an illustrated empty state with an icon and CTA?
