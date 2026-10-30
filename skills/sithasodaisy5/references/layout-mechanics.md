---
name: layout-mechanics
description: Mathematical layout mechanics and responsive architecture for SithasoDaisy5 web apps. Enforces the 3 Golden Layout Rules (Anti-Scrollbar, Boundary Container, and Column-Child Override), Responsive Dual-Mode Ergonomics, and Asymmetric Bento Grid composition.
---

# SithasoDaisy5 — Layout Mechanics & Responsive Architecture

> **The Golden Law of SithasoDaisy5 Web Layouts:**  
> A web screen must never scroll horizontally, must never stretch unconstrained across ultra-wide displays, and must never clip nested cards inside grid columns. Layout is deterministic geometry.

---

## 1. The Three Golden Layout Rules

Every SithasoDaisy5 application must strictly adhere to these three rules:

### Rule 1: The Anti-Scrollbar Rule (Mandatory Bootstrap)
In `pgIndex.bas` (and in every page's `Show` sub):
```b4x
App.RemoveClass("w-screen")
```
* **Why it matters**: In standard CSS, `100vw` (and Tailwind's `w-screen`) computes the width **including** the operating system vertical scrollbar. When page content exceeds the viewport height, an OS vertical scrollbar appears (~15–17px wide), causing the `w-screen` body to exceed the client window and triggering an ugly, amateur horizontal scrollbar.
* **The fix**: Removing `w-screen` allows `#body` to naturally take `w-full` (100% of client width minus scrollbar), guaranteeing strictly **zero horizontal scrolling**.

### Rule 2: The Responsive Boundary Container Rule
Every page root view mounted into `app.PageView` (`#pageview`) must be wrapped in a responsive boundary container:
```b4x
Dim rootContainer As SDUI5Container
rootContainer.Initialize(Me, "rootContainer", "rootContainer")
rootContainer.ParentID = App.PageView
rootContainer.Classes = "max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 w-full min-h-[calc(100vh-4rem)]"
BANano.Await(rootContainer.AddComponent)
```
* **Why it matters**: Without `max-w-7xl mx-auto`, layouts stretch infinitely across 1440p, 4K, and ultra-wide desktop monitors, stranding navigation on the far left and actions on the far right.
* **Responsive padding**: `px-4 sm:px-6 lg:px-8` provides comfortable 16px margins on mobile, 24px on tablet, and 32px on desktop.

### Rule 3: The Column-Child Override Rule
When mounting any `SDUI5Card`, `SDUI5Wizard`, or form container inside an `SDUI5Column`:
```b4x
Dim card As SDUI5Card
card.Initialize(Me, "myCard", "myCard")
card.ParentID = col.Here
card.Width = "full"  '<--- MANDATORY: overrides default fixed Width = "96"
BANano.Await(card.AddComponent)
```
* **Why it matters**: By default, standalone Visual Designer cards default to `Width = "96"` (24rem / 384px). If dropped into a 12-column responsive grid column without setting `.Width = "full"`, the card overflows the column boundary on mobile and narrow desktop viewports.

---

## 2. Responsive Dual-Mode Ergonomics

A professional web application is not a mobile app blown up, nor is it a desktop site shrunk down. It adapts to **two distinct ergonomic modalities**:

| Ergonomic Feature | Desktop Mode ($\ge 1024\text{px}$) | Mobile Mode ($< 768\text{px}$) |
| :--- | :--- | :--- |
| **Input Modality** | High-precision mouse pointer & keyboard shortcuts | Low-precision thumb & finger touch |
| **Target Size** | Standard clickable elements ($32\text{--}40\text{px}$) | **Fitts's Law**: Minimum **$48\text{px}$** hit targets |
| **Micro-Interactions** | Tactile hover elevation (`hover:-translate-y-0.5 hover:shadow-lg`) | Active tap feedback (`active:scale-95`) |
| **Navigation Model** | Pinned horizontal navbar or persistent sidebar drawer | Collapsible hamburger drawer (`SDUI5Drawer`) or bottom dock (`SDUI5Dock`) |
| **Information Density** | Dial 6–9: Compact padding (`p-4`), dense data tables (`table-sm`) | Dial 3–5: Comfortable single-column vertical flow |
| **Primary Actions** | Top-right or bottom-right of workspace | **Thumb Zone**: Sticky bottom bar anchored above viewport base |

---

## 3. Asymmetric Bento Grid Composition

Avoid formulaic, repetitive 3-equal-card layouts ("AI Card Slop"). Use modern asymmetric Bento grids where visual weight reflects information importance:

### Pattern A: The 8 / 4 Asymmetric Split (Dashboard & Feature Hub)
```text
┌──────────────────────────────────────────────┬──────────────────────────────┐
│                                              │                              │
│   PRIMARY INTERACTIVE PREVIEW / HERO METRIC  │   SECONDARY ACTION PANEL     │
│   (Column SizeMd = 8, SizeSm = 12)           │   (Column SizeMd = 4)        │
│   • Multi-series chart or primary data table │   • Quick actions / CTA list │
│   • Hairline border + frosted surface        │   • Recent notifications     │
│                                              │                              │
└──────────────────────────────────────────────┴──────────────────────────────┘
```

### Pattern B: The Asymmetric 3-Tile Mosaic (Showcase / Metrics)
```text
┌──────────────────────────────────────────────┬──────────────────────────────┐
│                                              │   TILE 2: FAST STAT (col-4)  │
│   TILE 1: HERO FEATURE (col-8, row-span-2)   │   • Trending KPI metric      │
│   • Interactive live widget or high-res art  ├──────────────────────────────┤
│   • Subdued background glow accent           │   TILE 3: STATUS (col-4)     │
│                                              │   • Live pulsing system pill │
└──────────────────────────────────────────────┴──────────────────────────────┘
```

---

## 4. Density-to-Spacing Translation Engine

When declaring the **Visual Density Dial (1–10)** in your screen contract, calibrate properties strictly using this table:

| Density Dial | Context | Card / Container Padding | Grid Gap | Typography Size | Table Density |
| :---: | :--- | :--- | :--- | :--- | :--- |
| **1 – 3** | Luxury, Marketing, Lifestyle | `p-8 md:p-12` | `gap-8 md:gap-12` | `text-lg` body, `text-5xl` title | `table-lg` |
| **4 – 7** | SaaS, Portals, E-Commerce | `p-6` | `gap-6` | `text-base` body, `text-3xl` title | `table-md` |
| **8 – 10** | FinTech, Telemetry, Admin | `p-3 sm:p-4` | `gap-3 sm:gap-4` | `text-xs / text-sm`, `font-mono` | `table-xs / table-sm` |

---

## 5. Verification Checklist (Before Release)

- [ ] `App.RemoveClass("w-screen")` executed in `pgIndex.Initialize` and initial page `Show`.
- [ ] Root container uses `max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 w-full`.
- [ ] Every `SDUI5Card` mounted inside an `SDUI5Column` has `.Width = "full"`.
- [ ] Chrome CDP `layoutMetrics.overflow` returns `false` at both 1280px (Desktop) and 390px (Mobile).
- [ ] Zero unconstrained horizontal scrollbars across all screen widths.

