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
  ├── SDUI5Row1 (sm:grid-cols-2 lg:grid-cols-3) — features grid
  │     ├── SDUI5Card (feature 1)
  │     ├── SDUI5Card (feature 2)
  │     └── SDUI5Card (feature 3)
  ├── SDUI5Row2 — CTA section
  │     └── SDUI5Button1 (.Color="primary", .Size="xl")
  └── SDUI5Footer
```

**Components used**: `SDUI5Hero`, `SDUI5Card`, `SDUI5Button`, `SDUI5Footer`, `SDUI5Stat` (optional, for social proof)  
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
  ├── SDUI5Row1 (sm:grid-cols-2 lg:grid-cols-4) — KPI stats
  │     ├── SDUI5Stat (.Color="primary")
  │     ├── SDUI5Stat (.Color="secondary")
  │     ├── SDUI5Stat (.Color="accent")
  │     └── SDUI5Stat (.Color="info")
  └── SDUI5Row2 (lg:grid-cols-2) — content
        ├── SDUI5Card — chart
        └── SDUI5Card — list / activity feed
```

**Components used**: `SDUI5NavBar`, `SDUI5Stat`, `SDUI5Card`, `SDUI5Progress`, `SDUI5ToastChart` (optional)  
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
