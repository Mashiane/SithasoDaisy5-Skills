---
name: page-architectures
description: Conceptual page composition patterns for SithasoDaisy5 web apps. ARCH-01 through ARCH-10 define layout choices; source usage is linked from component skills.
---

# SithasoDaisy5 — Page Architectures

Conceptual page models for design selection. They are not copies of source demo pages. Pick one before generating; if your screen does not fit, propose a new ARCH-N in the reasoning trace. For source evidence, use verified excerpts and demo-source links in the relevant component skills.

The indented trees below describe layout intent; they are not copy-ready B4J code and do not certify every shown property. For generated code, verify each component member against its component skill and follow the app/page scaffolds.

---

## ARCH-01 — Landing Page

**Purpose**: Marketing / brand awareness  
**Layout**: Single-column hero → desktop grid of features → CTA → footer  
**Responsive**: mobile single column → desktop 3-column feature grid

```
SDUI5Container1
  ├── SDUI5Hero (full-width, md:grid-start)
  ├── SDUI5Row1 — features grid (3 columns: Size="12", SizeMd="4")
  │     ├── SDUI5Column1 -> SDUI5Card (feature 1)
  │     ├── SDUI5Column2 -> SDUI5Card (feature 2)
  │     └── SDUI5Column3 -> SDUI5Card (feature 3)
  ├── SDUI5Stat1 — social proof strip (Direction="vertical", LGDirection="horizontal", Border=True, RoundedBox=True, Shadow="md")
  │     ├── SDUI5StatItem1
  │     ├── SDUI5StatItem2
  │     ├── SDUI5StatItem3
  │     └── SDUI5StatItem4
  ├── SDUI5Container (flex justify-center mt-6) — CTA section
  │     └── SDUI5Button1 (.Color="primary", .Size="xl")
  └── SDUI5Footer
```

**Components used**: `SDUI5Hero`, `SDUI5Card`, `SDUI5Stat` + `SDUI5StatItem` (RULE-LAYOUT-005 companion hierarchy), `SDUI5Button`, `SDUI5Footer`  
**Density**: Hero  
**Source guidance**: Use the relevant component skill’s verified usage excerpt; the architecture here is conceptual.

---

## ARCH-02 — Auth (Login / Signup / OTP / Password Reset)

**Purpose**: Authentication flows  
**Layout**: Centered card on full-screen background  
**Responsive**: single column, max-width card

```
SDUI5Container1 (min-h-screen, flex items-center justify-center)
  └── SDUI5Card (Title="Login", max-w-sm)
        ├── SDUI5TextBox — email
        ├── SDUI5TextBox — password
        ├── SDUI5CheckBox — remember me
        ├── SDUI5Button (.Color="primary", .Size="lg") — Submit
        └── SDUI5Link — forgot password / signup
```

**Components used**: `SDUI5Card`, `SDUI5TextBox`, `SDUI5Button`, `SDUI5CheckBox`, `SDUI5Link`  
**Density**: Comfortable  
**Special**: For OTP, swap `SDUI5TextBox` for `SDUI5OTP`. Use `app.ShowSwalError(...)` on auth failure.  
**Source guidance**: Use the relevant component skill’s verified usage excerpt; the architecture here is conceptual.

---

## ARCH-03 — Dashboard (KPI Grid)

**Purpose**: Analytics / data overview  
**Layout**: Navbar top → KPI stats grid → content grid below  
**Responsive**: mobile single column → desktop 4-column KPI grid

```
SDUI5NavBar (sticky top)
SDUI5Container1
  ├── SDUI5Row1 (gap-4) — KPI stats (4 columns: Size="12", SizeSm="6", SizeMd="3")
  │     ├── SDUI5Column1 -> SDUI5Stat1 (Border=True, RoundedBox=True, Shadow="sm") -> SDUI5StatItem1 (.ValueTextColor="primary")
  │     ├── SDUI5Column2 -> SDUI5Stat2 (Border=True, RoundedBox=True, Shadow="sm") -> SDUI5StatItem2 (.ValueTextColor="secondary")
  │     ├── SDUI5Column3 -> SDUI5Stat3 (Border=True, RoundedBox=True, Shadow="sm") -> SDUI5StatItem3 (.ValueTextColor="accent")
  │     └── SDUI5Column4 -> SDUI5Stat4 (Border=True, RoundedBox=True, Shadow="sm") -> SDUI5StatItem4 (.ValueTextColor="error")
  └── SDUI5Row2 (gap-4) — content (2 columns: Size="12", SizeMd="6")
        ├── SDUI5Column5 -> SDUI5Card — progress / targets
        └── SDUI5Column6 -> SDUI5Card — traffic / activity feed
```

**Components used**: `SDUI5NavBar`, `SDUI5Stat` + `SDUI5StatItem` (RULE-LAYOUT-005 companion hierarchy), `SDUI5Card`, `SDUI5Progress`, `SDUI5ToastChart` (optional)  
**Density**: High  
**4-state**: Loading=skeleton, Populated=stats, Empty=SDUI5Text message with optional SDUI5Button action, Error=SDUI5Alert  
**Source guidance**: Use the relevant component skill’s verified usage excerpt; the architecture here is conceptual.

---

## ARCH-04 — Form (Multi-Field Entry)

**Purpose**: User profiles, settings, data entry  
**Layout**: Card with grouped fieldsets  
**Responsive**: single column, max-width

```
SDUI5Container1
  └── SDUI5Card (max-w-2xl, mx-auto)
        ├── SDUI5FieldSet — "Account"
        │     ├── SDUI5TextBox — name
        │     ├── SDUI5TextBox — email
        │     └── SDUI5Select — role
        ├── SDUI5Divider
        ├── SDUI5FieldSet — "Preferences"
        │     ├── SDUI5Toggle — email notifications
        │     ├── SDUI5Toggle — push notifications
        │     └── SDUI5Select — language
        └── SDUI5Button1 (.Color="primary", .Size="lg") — Submit (bottom-right)
```

**Components used**: `SDUI5Card`, `SDUI5FieldSet`, `SDUI5TextBox`, `SDUI5Select`, `SDUI5Toggle`, `SDUI5Button`, `SDUI5Divider`  
**Density**: Comfortable  
**4-state**: Loading=spinner on submit button, Populated=form, Empty=N/A, Error=per-field `SDUI5Alert` + summary Swal  
**Source guidance**: Use the relevant component skill’s verified usage excerpt; the architecture here is conceptual.

---

## ARCH-05 — Master-Detail (List + Detail)

**Purpose**: Browse + view single record  
**Layout**: Left list (or top on mobile), right detail  
**Responsive**: mobile stacks list above detail; desktop side-by-side

```
SDUI5NavBar
SDUI5Container1
  └── SDUI5Row1 (lg:grid-cols-3)
        ├── SDUI5Column1 (lg:col-span-1) — list
        │     └── SDUI5List
        │           ├── SDUI5ListItem — record 1
        │           ├── SDUI5ListItem — record 2
        │           └── ... (virtualized)
        └── SDUI5Column2 (lg:col-span-2) — detail
              └── SDUI5Card (Title="Selected item")
                    ├── SDUI5Text — description
                    ├── SDUI5Stat — metrics
                    └── SDUI5Button1 (.Color="primary") — edit
```

**Components used**: `SDUI5List`, `SDUI5ListItem`, `SDUI5Card`, `SDUI5Button`, `SDUI5Stat`  
**Density**: High (list side), Comfortable (detail side)  
**4-state**: Loading=skeleton list, Populated=list+detail, Empty=SDUI5Text message with optional SDUI5Button action + "Add first", Error=SDUI5Alert  
**Source guidance**: Use the relevant component skill’s verified usage excerpt; the architecture here is conceptual.

---

## ARCH-06 — Stock-Take / Inventory Scan

**Purpose**: Real-world inventory counting with barcode scanning + count entry  
**Layout**: Sticky scan area + live count table  
**Responsive**: mobile-first (operators carry tablets)

```
SDUI5NavBar (.Color="primary", Title="Stock Count")
SDUI5Container1
  ├── SDUI5Row1 — scan input (sticky top)
  │     ├── SDUI5BarcodeReader (camera scan)
  │     └── SDUI5TextBox — manual SKU entry
  ├── SDUI5Divider
  └── SDUI5Row2 — count table
        └── SDUI5Table
              ├── column: SKU
              ├── column: Name
              ├── column: Count (editable)
              ├── column: Last updated
              └── column: Action (delete)
  └── SDUI5BottomNavigation — Tabs (Active / History / Settings)
```

**Components used**: `SDUI5NavBar`, `SDUI5BarcodeReader`, `SDUI5TextBox`, `SDUI5Table`, `SDUI5BottomNavigation`, `SDUI5Divider`  
**Density**: High  
**4-state**: Loading=initial scan + table skeleton, Populated=table with rows, Empty="No items yet — scan to begin", Error=alert with retry  
**Source guidance**: Use the relevant component skill’s verified usage excerpt; the architecture here is conceptual.

---

## ARCH-07 — Wizard / Multi-Step Form

**Purpose**: Complex input (3-5 steps, e.g., onboarding, checkout)  
**Layout**: Steps progress + current step content + Next/Back navigation  
**Responsive**: single column

```
SDUI5Container1
  ├── SDUI5Steps (Step1 active, Step2, Step3)
  ├── SDUI5Divider
  ├── SDUI5Row1 — current step content
  │     └── ...step-specific components...
  └── SDUI5Row2 (justify-between) — navigation
        ├── SDUI5Button1 (.Color="neutral") — Back
        └── SDUI5Button2 (.Color="primary") — Next
```

**Components used**: `SDUI5Steps`, `SDUI5Button`, `SDUI5Card`, `SDUI5TextBox` (per step)  
**Density**: Comfortable  
**Source guidance**: Use the relevant component skill’s verified usage excerpt; the architecture here is conceptual.

---

## ARCH-08 — Chat / Messaging

**Purpose**: Real-time chat between users (or user + bot)  
**Layout**: Header + scrollable message list + sticky input row  
**Responsive**: mobile-first; desktop same

```
SDUI5NavBar (Title="Chat", avatar, online indicator)
SDUI5Container1
  ├── SDUI5Column1 — scrollable chat
  │     ├── SDUI5ChatBubble (incoming, align-start)
  │     ├── SDUI5ChatBubble (incoming)
  │     ├── SDUI5ChatBubble (outgoing, align-end, .Color="primary")
  │     └── SDUI5ChatBubble (incoming)
  └── SDUI5Row2 (sticky bottom) — input
        ├── SDUI5TextBox — message
        └── SDUI5Button1 (.Color="primary") — Send
```

**Components used**: `SDUI5ChatBubble`, `SDUI5ChatItem`, `SDUI5Conversation`, `SDUI5TextBox`, `SDUI5Button`, `SDUI5Status`  
**Density**: Comfortable (input) / High (message list)  
**Source guidance**: Use the relevant component skill’s verified usage excerpt; the architecture here is conceptual.

---

## ARCH-09 — Settings / Preferences

**Purpose**: App or user settings  
**Layout**: Left sidebar with categories + right detail panel  
**Responsive**: mobile collapses to single-column accordion

```
SDUI5Container1 (max-w-6xl, mx-auto)
  └── SDUI5Row1 (lg:grid-cols-4)
        ├── SDUI5Column1 (lg:col-span-1) — sidebar
        │     └── SDUI5Menu (categories)
        │           ├── SDUI5MenuItem — Account
        │           ├── SDUI5MenuItem — Notifications
        │           ├── SDUI5MenuItem — Theme
        │           └── SDUI5MenuItem — About
        └── SDUI5Column2 (lg:col-span-3) — detail
              └── SDUI5Card
                    ├── SDUI5Toggle — Email
                    ├── SDUI5Toggle — Push
                    ├── SDUI5Select — Frequency
                    └── SDUI5Button1 (.Color="primary") — Save
```

**Components used**: `SDUI5Menu`, `SDUI5MenuItem`, `SDUI5Card`, `SDUI5Toggle`, `SDUI5Select`, `SDUI5Button`  
**Density**: Comfortable  
**Source guidance**: Use the relevant component skill’s verified usage excerpt; the architecture here is conceptual.

---

## ARCH-10 — Error / Empty / 404

**Purpose**: Catch-all for not-found / error states  
**Layout**: Full-screen centered card with icon + headline + message + action

```
SDUI5Container1 (min-h-screen, flex items-center justify-center)
  └── SDUI5Card (max-w-md, text-center)
        ├── SDUI5Avatar (.Size="lg") — icon
        ├── SDUI5Text — "404" or "Error" (large heading)
        ├── SDUI5Text — human-readable message
        └── SDUI5Button1 (.Color="primary") — Back to Home
```

**Components used**: `SDUI5Card`, `SDUI5Avatar`, `SDUI5Button`, `SDUI5Text`  
**Density**: Hero  
**Source guidance**: Use the relevant component skill’s verified usage excerpt; the architecture here is conceptual.

---

## ARCH-11 (ARCH-BENTO-01) — Modern Asymmetric Bento Showcase

**Purpose**: Modern high-impact product landing / feature showcase (Apple / Linear / Stripe aesthetic)  
**Layout**: Asymmetrical 12-column grid mixing wide hero card, live simulated UI, radial metric, and twin glass micro-cards  
**Responsive**: Single column on mobile (`Size="12"`) → 8/4 split and 4/4/4 split on desktop (`SizeLg="8"`, `SizeLg="4"`)

```
SDUI5Container1 (max-w-7xl, px-4, py-12)
  ├── SDUI5Row (Header: Eyebrow + Display Title + Subtitle centered)
  ├── SDUI5Row1 (gap-6, mb-6) — Asymmetric Bento Hero Row
  │     ├── SDUI5Column1 (Size="12", SizeLg="8")
  │     │     └── SDUI5Card (Featured card, p-8, rounded-3xl, bg-base-100/90, border border-base-200/80, shadow-xl)
  │     │           ├── SDUI5Badge (Eyebrow: "Live Platform")
  │     │           ├── SDUI5Text (Display feature heading, font-extrabold, tracking-tight)
  │     │           ├── SDUI5Text (Benefit description)
  │     │           └── SDUI5Container (Interactive simulated UI preview card with live status & tabs)
  │     └── SDUI5Column2 (Size="12", SizeLg="4")
  │           └── SDUI5Card (KPI / Metric card, p-8, rounded-3xl, bg-gradient-to-br from-base-100 to-base-200/50, border border-base-200/80)
  │                 ├── SDUI5RadialProgress (Value=88, Color="primary", Size="4.5rem")
  │                 ├── SDUI5Text (KPI Value: "99.98%", text-3xl, font-bold)
  │                 └── SDUI5Text (Caption: "System Uptime & SLA Guarantee")
  └── SDUI5Row2 (gap-6) — Trio Micro-Feature Row
        ├── SDUI5Column3 (Size="12", SizeMd="4") -> SDUI5Card (Micro-card 1, rounded-2xl, border border-base-200/70)
        ├── SDUI5Column4 (Size="12", SizeMd="4") -> SDUI5Card (Micro-card 2, rounded-2xl, border border-base-200/70)
        └── SDUI5Column5 (Size="12", SizeMd="4") -> SDUI5Card (Micro-card 3, rounded-2xl, border border-base-200/70)
```

**Components used**: `SDUI5Card`, `SDUI5RadialProgress`, `SDUI5Badge`, `SDUI5Text`, `SDUI5Button`  
**Density**: Comfortable / Hero  
**Craft Guidance**: Apply `design-craft-guide.md` surface rules: `Classes = "bg-base-100/80 backdrop-blur-md border border-base-200/80 rounded-3xl shadow-sm hover:shadow-xl hover:-translate-y-1 transition-all duration-300"`.

---

## ARCH-12 (ARCH-HERO-SPLIT) — High-Conversion SaaS Split Hero

**Purpose**: Modern SaaS conversion hero section  
**Layout**: Two-column split: left column has eyebrow badge + tight editorial title + description + avatar proof stack + CTA button; right column has interactive simulated application preview card  
**Responsive**: Stacks vertically on mobile (text first, preview below); 50/50 split on desktop (`SizeLg="6"`)

```
SDUI5Container1 (max-w-7xl, px-4, py-16 md:py-24)
  └── SDUI5Row1 (items-center, gap-12)
        ├── SDUI5Column1 (Size="12", SizeLg="6") — Value Proposition
        │     ├── SDUI5Badge (Eyebrow: "New - V5.0 Released", Color="primary", Style="soft", Classes="mb-4")
        │     ├── SDUI5Text (Heading: text-4xl sm:text-5xl lg:text-6xl, font-extrabold, tracking-tight)
        │     ├── SDUI5Text (Subtitle: text-lg, text-base-content/70, py-6)
        │     ├── SDUI5Row (CTA Row: SDUI5Button .Color="primary" .Size="lg" + SDUI5Button .Color="neutral" .Style="ghost")
        │     └── SDUI5Row (Social Proof: SDUI5AvatarGroup + SDUI5Text "Loved by 4,200+ engineers")
        └── SDUI5Column2 (Size="12", SizeLg="6") — Interactive Product Preview
              └── SDUI5Card (Mockup surface: bg-base-100/90, backdrop-blur-2xl, border border-base-200, rounded-3xl, shadow-2xl, p-6)
                    ├── SDUI5NavBar (Simulated topbar: window controls, breadcrumb, live status dot)
                    ├── SDUI5Tabs (Active preview tabs)
                    ├── SDUI5Stat (Live metric preview)
                    └── SDUI5Table (Simulated live activity feed)
```

**Components used**: `SDUI5Badge`, `SDUI5Text`, `SDUI5Button`, `SDUI5AvatarGroup`, `SDUI5Card`, `SDUI5Tabs`, `SDUI5Stat`, `SDUI5Table`  
**Density**: Hero  

---

## ARCH-13 (ARCH-DASH-PRO) — Executive Command Center

**Purpose**: Production analytics & operational workspace  
**Layout**: Sticky Topbar $\rightarrow$ Trend Stat Row with delta pills $\rightarrow$ 2-Column Analytics Split (chart slot + activity feed) $\rightarrow$ Paginated Data Table with user avatars & status pills  
**Responsive**: High density, auto-wrapping KPI stats, responsive tables

```
SDUI5NavBar (sticky top, z-40, border-b border-base-200/80, bg-base-100/80 backdrop-blur-md)
SDUI5Container1 (max-w-7xl, px-4, py-8)
  ├── SDUI5Row1 (gap-4, mb-8) — KPI Row with Trend Badges (4 columns: Size="12", SizeSm="6", SizeLg="3")
  │     ├── SDUI5Column1 -> SDUI5Card (Revenue: stat + "+14.8% vs last mo" badge)
  │     ├── SDUI5Column2 -> SDUI5Card (Active Users: stat + "+8.3%" badge)
  │     ├── SDUI5Column3 -> SDUI5Card (Conversion: stat + "+2.1%" badge)
  │     └── SDUI5Column4 -> SDUI5Card (Avg Latency: stat + "-18ms" badge)
  ├── SDUI5Row2 (gap-6, mb-8) — Analytics Split (SizeLg="8" & SizeLg="4")
  │     ├── SDUI5Column5 (SizeLg="8") -> SDUI5Card (Analytics / Chart panel + time-range Segment Tabs)
  │     └── SDUI5Column6 (SizeLg="4") -> SDUI5Card (Realtime Event Feed / Notifications list)
  └── SDUI5Row3 — Data Table
        └── SDUI5Column7 (Size="12")
              └── SDUI5Card (border border-base-200/80, rounded-2xl, p-6)
                    ├── SDUI5Row (Search bar + Filter Dropdown + Export Button)
                    ├── SDUI5Table (Avatar cells, status badges, formatted currency, action menu)
                    └── SDUI5Pagination (Page navigation)
```

**Components used**: `SDUI5NavBar`, `SDUI5Card`, `SDUI5Badge`, `SDUI5Stat`, `SDUI5Tabs`, `SDUI5Table`, `SDUI5Pagination`, `SDUI5Button`  
**Density**: High  

---

## ARCH-14 (ARCH-SETTINGS-SPLIT) — Modern Two-Column Account / Settings

**Purpose**: Profile, preferences, integrations, security settings  
**Layout**: Two-column split per section (Left: section title, description, and context; Right: elevated card with grouped fieldsets, switch toggles, inputs, and actions)  
**Responsive**: Single column on mobile; 4/8 split on desktop (`SizeLg="4"`, `SizeLg="8"`)

```
SDUI5Container1 (max-w-5xl, px-4, py-10)
  ├── SDUI5Row1 (Header: Title + description + breadcrumbs)
  ├── SDUI5Divider (my-8)
  ├── SDUI5Row2 (Section 1: Profile & Identity)
  │     ├── SDUI5Column1 (Size="12", SizeLg="4") -> SDUI5Text (Title + guidance)
  │     └── SDUI5Column2 (Size="12", SizeLg="8") -> SDUI5Card (Avatar uploader + TextBox name/email)
  ├── SDUI5Divider (my-8)
  └── SDUI5Row3 (Section 2: Notifications & Privacy)
        ├── SDUI5Column3 (Size="12", SizeLg="4") -> SDUI5Text (Title + guidance)
        └── SDUI5Column4 (Size="12", SizeLg="8") -> SDUI5Card (Toggle switches with descriptive labels)
```

**Components used**: `SDUI5Card`, `SDUI5Avatar`, `SDUI5TextBox`, `SDUI5Toggle`, `SDUI5Button`, `SDUI5Divider`  
**Density**: Comfortable  

---

## ARCH-15 (ARCH-PRODUCT-SHOWCASE) — Modern E-Commerce Studio

**Purpose**: Product drop, luxury retail, tech hardware showcase  
**Layout**: Left sticky media gallery with thumbnail carousel; right sticky purchase card with price, stock pill, star rating, color chips, size selector, and primary Add to Cart CTA  
**Responsive**: Mobile single column; desktop 6/6 split with sticky positioning

```
SDUI5NavBar (sticky top)
SDUI5Container1 (max-w-6xl, px-4, py-10)
  └── SDUI5Row1 (gap-12)
        ├── SDUI5Column1 (Size="12", SizeLg="6") — Gallery Studio
        │     └── SDUI5Card (Rounded-3xl, overflow-hidden, border border-base-200/80)
        │           ├── SDUI5Carousel (Main high-res product imagery)
        │           └── SDUI5Row (Thumbnail selector strip)
        └── SDUI5Column2 (Size="12", SizeLg="6") — Purchase Configuration
              └── SDUI5Card (p-8, rounded-3xl, border border-base-200/80, bg-base-100)
                    ├── SDUI5Badge (Brand / Series pill)
                    ├── SDUI5Text (Product Name, text-3xl, font-bold, tracking-tight)
                    ├── SDUI5Row (Star Rating + Review count badge)
                    ├── SDUI5Text (Price: "$349.00", text-3xl, font-extrabold, text-primary)
                    ├── SDUI5Divider
                    ├── SDUI5RadioGroup (Color variants with circular color chips)
                    ├── SDUI5Select (Size / Edition selector)
                    ├── SDUI5Button (Single Primary Action: "Add to Bag", .Color="primary", .Size="lg", full-width)
                    └── SDUI5Text (Shipping & guarantee trust badges)
```

**Components used**: `SDUI5Carousel`, `SDUI5Card`, `SDUI5Badge`, `SDUI5Text`, `SDUI5Rating`, `SDUI5RadioGroup`, `SDUI5Select`, `SDUI5Button`  
**Density**: Comfortable  

---

## How to Use These Patterns

1. **Pick the closest ARCH-N** before composing any page
2. **Confirm with the user** if the intent is ambiguous
3. **Cite the ARCH-N in your reasoning trace** (Stage 4 of the workflow)
4. **Use source-backed examples when needed** — use the verified excerpt and demo-source link in the relevant component skill. A component declaration is not by itself proof that every API or behavior is exercised.
5. **Deviate only with justification** — and update `references/component-manifest.md` if you establish a new pattern

---

## Custom Architecture Proposal

If your screen doesn't fit any ARCH-N:

1. Document the deviation in your reasoning trace
2. Sketch the hierarchy (Container → Row → Column → leaf) explicitly
3. Identify which components you're using and their status (Demonstrated vs Documented-only)
4. Submit as a new ARCH-N+1 in the next skill iteration

Pattern proposals go in your reasoning trace, not in this file (until accepted).
