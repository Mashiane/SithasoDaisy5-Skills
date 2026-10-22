# ⚡ SithasoDaisy5-Skills

> **Supercharge Claude Code, Antigravity, OpenCode, Codex & AI Coding Agents to build 100% browser-renderable B4J/BANano web apps with DaisyUI v5 + Tailwind CSS v4 design semantics.**

[![B4X Forum Thread](https://img.shields.io/badge/B4X_Forum-SithasoDaisy5-007ACC?style=flat&logo=b4x)](https://www.b4x.com/android/forum/threads/web-sithasodaisy5-create-websites-webapps-with-the-power-of-the-abstract-designer-opensource.165095/#content)
[![GitHub Release](https://img.shields.io/badge/Release-v0.7.0-blue.svg)](https://github.com/Mashiane/SithasoDaisy5-Skills/releases)
[![Skills Suite](https://img.shields.io/badge/Skills-9_Modules-purple.svg)](#-skill-suite-architecture--capability-matrix)
[![Components](https://img.shields.io/badge/Components-159_Classes-brightgreen.svg)](https://github.com/Mashiane/SithasoDaisy5)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

---

## 📖 Overview

**`SithasoDaisy5-Skills`** is the official AI agent skill suite for **[SithasoDaisy5](https://github.com/Mashiane/SithasoDaisy5)** — a comprehensive B4J/BANano component library that transpiles B4J code to modern browser JavaScript. Every component in SithasoDaisy5 wraps semantic **DaisyUI v5 + Tailwind CSS v4** styling, allowing developers to build responsive web applications entirely in B4J.

This suite equips AI developer agents (**Claude Code, Antigravity, OpenCode, Codex, Cursor, Windsurf**) with verified, source-grounded knowledge to plan, scaffold, compose, verify, and deliver production-ready web apps without hallucinating unsupported methods, inventing classes, or breaking browser runtime contracts.

---

## 🧭 Failure Modes and Guardrails

The table below contrasts common failure modes when an AI model attempts to write B4J/BANano code without skills versus the guardrails enforced by **SithasoDaisy5-Skills**:

| Dimension | Generic LLM (Without Skills) ❌ | With SithasoDaisy5-Skills ✅ |
| :--- | :--- | :--- |
| **Technology Stack** | Injects raw HTML tags (`<div>`, `<button>`), JSX, or CSS styles directly into B4J strings. | Enforces native B4J component instantiation (`SDUI5Button.Initialize`, `AddComponent`) transpiled by BANano. |
| **API Accuracy** | Invents setters, properties, or event names based on generic HTML or web DaisyUI. | Strictly restricted to verified APIs from **159 component and support module specifications** extracted directly from framework source. |
| **Color Governance** | Passes raw hex codes (`#1e293b`) or RGB strings into `.Color`. | Enforces semantic tokens (`primary`, `secondary`, `accent`, `neutral`, `info`, `success`, `warning`, `error`). Arbitrary colors routed to `.Classes` or `.Styles`. |
| **Lifecycle & Shell** | Omits `BANano.Await(app.ClearPageView)` or fails to wire `pgIndex.UpdateTitle`, breaking SPA navigation. | Enforces canonical `Sub Show` lifecycle (RULE-LIFECYCLE-001/002) and `#pageview` DOM host container conventions. |
| **Layout & Ergonomics** | Creates misaligned flex layouts, broken grids, or unclickable touch targets. | Enforces **Fitts's Law** ($\ge 48\text{px}$ touch targets), **Hick's Law** ($\le 5$ nav items), **WCAG 2.2 AA** contrast, and 10 proven page architectures (ARCH-01..10). |
| **State Completeness** | Builds only the happy path, leaving loading and error states blank. | Enforces **4-state coverage** (Loading, Populated, Empty, Error) for all data-driven UI views (RULE-STATE-001). |
| **Delivery Reliability** | Claims an app works without verification. | Governed by an 8-gate state machine (**G0 Contract → G8 Delivery**) with deterministic static, build, runtime, and UX checks. |

---

## 🧭 Intent & Task Router ("When to Use What")

AI agents and developers can route directly to the appropriate starting skill based on task keywords and intent:

<!-- AUTOGEN_ROUTER_START -->
| User Intent / Task Keywords | Recommended Starting Skills | Why This Order? | Rejected / Why Not? |
| :--- | :--- | :--- | :--- |
| **new web app, greenfield, scaffold, project file, pgIndex** | sd5-project-bootstrap, sithasodaisy5, sd5-web-verify | shell first, then composition, then gate | sd5-web-regression (no existing behavior to protect) |
| **login screen, auth flow, form validation, cloud auth** | sd5-application-planner, sithasodaisy5, sd5-web-verify | auth touches requirements + contract before composition | sd5-project-bootstrap (not greenfield) |
| **navigation shell, navbar, drawer, dock, routing, multi-page** | sd5-application-planner, sithasodaisy5, sd5-project-bootstrap, sd5-web-verify | shell structure + composition + gate | sd5-web-regression (greenfield, nothing to regress) |
| **plan web app, feature planning, requirements, architecture** | sd5-application-planner (+ sd5-web-orchestrator for full build) | contract set before code; no contract = no gen | sd5-feature-engineer (no contract yet), bootstrap (plan before shell) |
| **implement feature, vertical slice, connect screen** | sd5-feature-engineer, sithasodaisy5, sd5-web-verify | slice needs domain + gate | bootstrap (not greenfield), orchestrator (single feature, not release) |
| **compose UI, screen, form, dashboard, card, modal, DaisyUI web** | sithasodaisy5, sd5-web-verify | domain generation + conformance gate | generic styling skill (platform mismatch; authority 6 loses to 2) |
| **screenshot to web app, recreate screenshot, mockup to B4J, wireframe to code** | sd5-visual-analysis + sd5-application-planner + sithasodaisy5 + sd5-web-verify; add sd5-project-bootstrap for a new app and sd5-web-regression for an existing app | visual forensics → canonical screen contract → verified BANano/SDUI5 mapping → appropriate app gates | image-to-code workflow (skips contracts, API truth, or existing-app impact) |
| **adapt another app's screenshot, use screenshot as inspiration** | sd5-visual-analysis + sd5-application-planner + sithasodaisy5 + sd5-web-verify when implementing | extract structure and hierarchy while preserving the destination app's approved design system | faithful brand copy when the user asked for adaptation |
| **compare current web app screenshot with target** | sd5-visual-analysis + sd5-web-regression + sithasodaisy5 + sd5-web-verify when changing the app; sd5-web-verify for review only | classify current-state evidence, protect existing behavior, and review the rendered result against the target | treating the current screenshot as the target without user intent |
| **verify, conformance, invented API, module wiring, before build** | sd5-web-verify | static gate before compile | — (gate never skipped; failed gate blocks) |
| **release, ship web app, end-to-end, full app, screen contract** | sd5-web-orchestrator + all depends | thin sequencer owns G0-G8 for multi-scope release | single-component shortcut (release requires full gate chain) |
| **change existing web app, fix, regression, impact** | sd5-web-regression, sd5-web-verify | baseline → impact → targeted + smoke | bootstrap (not greenfield), planner (unless contract changes) |
<!-- AUTOGEN_ROUTER_END -->

---

## 🗺️ Skill Suite Architecture & Capability Matrix

The suite includes 8 production skills with strict authority tiers (mirroring `ENGINEERING-CONSTITUTION.md` Art I):

<!-- AUTOGEN_SKILLS_START -->
| Skill | Authority | Category | When to Use (Triggers) | Core Objective & Output |
| :--- | :---: | :---: | :--- | :--- |
| **sd5-application-planner** | L4 | planning | build app, create web app, plan app, dashboard prompt, app requirements... | Turn a plain-language SithasoDaisy5 app or feature request into a source-grounded plan, page contracts, navigation map, and acceptance checks before implementation. Use for greenfield apps and substantial feature work; it does not invent SDUI5 APIs or backend behavior. |
| **sd5-feature-engineer** | L4 | implementation | implement feature, build dashboard, add page, compose screen, vertical slice... | Implement a planned SithasoDaisy5 app feature as a traceable B4J/BANano vertical slice. Use after contracts exist; verify every component API and lifecycle call against source-backed references and demos. |
| **sd5-project-bootstrap** | L4 | scaffolding | new app, new project, scaffold app, bootstrap b4j, banano scaffold... | Create or extend a code-first B4J/BANano web app that uses SithasoDaisy5. Use for project setup, embedded app entry, page module wiring, app shell startup, asset loading, and first-page composition; consult sithasodaisy5 for component APIs and screen design. |
| **sd5-visual-analysis** | L3 | visual-analysis | screenshot to code, replicate design, mockup to app, wireframe to code, visual forensics... | Design-to-code forensics for SithasoDaisy5. Turns a screenshot, mockup, wireframe, or reference URL into verified B4J/SDUI5 code via the 10-stage visual pipeline � function-first extraction (NEVER literal pixel mapping), screen contract, implementation through the orchestrator gates, then capture-and-compare fidelity review. Use when the user provides a design reference to replicate. |
| **sd5-web-orchestrator** | L4 | orchestration | orchestrate, release gate, first-time-right, ship app, build full app... | Turn a plain-language request into a complete source-grounded SithasoDaisy5 B4J/BANano app and carry it through planning, implementation, static/build/runtime/visual/regression gates, and an evidence-based delivery decision. Use for greenfield apps, complete features, or release work. |
| **sd5-web-regression** | L4 | quality | regression, modify existing app, refactor, bug fix, impact analysis... | Assess and verify change impact in an existing SithasoDaisy5 B4J/BANano app. Use for bug fixes, refactors, shared component or route changes, and release readiness; report pre-existing failures separately. |
| **sd5-web-verify** | L4 | verification | verify app, conformance check, pre-scan, gate, coverage contract... | Quality inspection and conformance gate for SithasoDaisy5 web apps. Pre-scan (L4) catches banned patterns; verify-conformance (L5) enforces the Skill Coverage Contract + lifecycle + wiring. Used by sd5-web-orchestrator Stages 5/6/8. |
| **sithasodaisy5** | L2 | domain | sithasodaisy5, sdui5, b4j component, banano, daisyui native... | SithasoDaisy5 � B4J/BANano component library (daisyUI + Tailwind) transpiled to JS. Use when building web apps/UIs with SithasoDaisy5 components in B4J/BANano, when you need a component's designer properties, events, setters, emitted daisyUI classes, or the app scaffold (SDUI5App), theme system, UsesX lazy-loaders, or the SDUI5Component skeleton contract. Produces B4J `.bas` code that calls the framework; never raw HTML. |
| **sd5-code-smells** | L4 | quality | code-smell, quality, refactoring, validation, clean-code... | Detect and remediate code smells from codesmells.org catalog across SithasoDaisy5 skills -- markdown, B4J code, Python scripts, JSON configs |
<!-- AUTOGEN_SKILLS_END -->

---

## 🔄 First-Time-Right (FTR) Delivery Pipeline (G0 → G8)

For complete multi-page web applications or feature releases, `sd5-web-orchestrator` sequences the lifecycle gates defined in `ENGINEERING-CONSTITUTION.md`:

```text
USER REQUIREMENT / PROMPT
   │
   ▼ PLAN (before G0)
sd5-application-planner ──► Drafts application plan, user journeys, and traceable contracts
   │
   ▼ [G0: Requirements Contract]
validate-contracts.py   ──► Validates contract index, screen state models, and traceability
   │
   ▼ [G1: Project Bootstrap]
sd5-project-bootstrap   ──► Generates .b4j project file, pgIndex shell, page registry, and Laragon serve config
   │
   ▼ [G2: Feature Implementation]
sd5-feature-engineer    ──► Implements vertical slices; sithasodaisy5 composes reference-grounded SDUI5 components
   │
   ▼ [G3: Static Source Integrity]
sd5-web-verify          ──► Runs pre-scan.ps1 and verify-conformance.ps1 (banned HTML, hex colors, missing setters)
   │
   ▼ [G4: B4J / BANano Build]
build-banano-app.ps1    ──► B4JBuilder compiles JAR + executes headless transpile into Laragon www folder
   │
   ▼ [G5: Browser Runtime Gate]
build-watch.ps1         ──► Headless browser navigates local URL; verifies title, theme, 0 console errors, 0 404s
   │
   ▼ [G6: Visual UX Review]
capture-screens.ps1     ──► Captures multi-viewport screenshots; reviews layout, hierarchy, and WCAG compliance
   │
   ▼ [G7: Regression Audit]
sd5-web-regression      ──► Runs impact-scoped checks and records regression evidence against baseline
   │
   ▼ [G8: Delivery Gate]
sd5-web-orchestrator    ──► Runs verify-production-hardening.ps1 and packages final delivery report
```

---

## ⚡ Practical Walkthrough: From Prompt to Web UI Composition

### 1. The Developer Prompt
> *"Build a modern SaaS login card with email, password with eye toggle, remember me checkbox, forgot password link, and a sign-in button."*

### 2. Contract & Planning (`sd5-application-planner`)
The planner creates the screen contract:
- Host Card: `SDUI5Card` (rounded `3xl`, shadow `xl`, border `base-300`)
- Inputs: `SDUI5TextBox` (`InputType = "legend"`, `Width = "full"`)
- Actions: `SDUI5CheckBox`, `SDUI5Link`, `SDUI5Button` (`Color = "primary"`, `Block = True`)

### 3. Reference-Grounded B4J Composition (`sithasodaisy5`)
The agent composes verified B4J code using documented `SDUI5*` properties:

```b4x
Sub Show
    app = pgIndex.App
    BANano.Await(app.ClearPageView)

    ' 1. Form Card
    SignInCard.Initialize(Me, "SignInCard", "SignInCard")
    SignInCard.ParentID = app.PageView
    SignInCard.BackgroundColor = "base-100"
    SignInCard.Border = True
    SignInCard.Rounded = "3xl"
    SignInCard.Shadow = "xl"
    SignInCard.Classes = "max-w-xl mx-auto border-base-300"
    SignInCard.BodyClasses = "p-7 sm:p-10"
    SignInCard.ContentClasses = "flex flex-col gap-4"
    BANano.Await(SignInCard.AddComponent)

    ' 2. Email Box
    EmailBox.Initialize(Me, "EmailBox", "EmailBox")
    EmailBox.ParentID = "SignInCard_content"
    EmailBox.Label = "Email address"
    EmailBox.InputType = "legend"
    EmailBox.Width = "full"
    EmailBox.Placeholder = "you@example.com"
    EmailBox.TypeOf = "email"
    BANano.Await(EmailBox.AddComponent)

    ' 3. Password Box with Toggle
    PasswordBox.Initialize(Me, "PasswordBox", "PasswordBox")
    PasswordBox.ParentID = "SignInCard_content"
    PasswordBox.Label = "Password"
    PasswordBox.InputType = "legend"
    PasswordBox.Width = "full"
    PasswordBox.Placeholder = "Enter your password"
    PasswordBox.TypeOf = "password"
    PasswordBox.ShowEyes = True
    BANano.Await(PasswordBox.AddComponent)

    ' 4. Submit Button
    SignInBtn.Initialize(Me, "SignInBtn", "SignInBtn")
    SignInBtn.ParentID = "SignInCard_content"
    SignInBtn.Text = "Sign In"
    SignInBtn.Color = "primary"
    SignInBtn.Size = "lg"
    SignInBtn.Block = True
    SignInBtn.RoundedField = True
    BANano.Await(SignInBtn.AddComponent)

    pgIndex.UpdateTitle("Sign In - MyApp")
End Sub
```

### 4. Verification Gate (`sd5-web-verify`)
The verification engine inspects the generated source before building:
- Confirms all classes exist in `SithasoDaisy5.b4xlib`.
- Validates that `Sub Show` starts with `ClearPageView` and ends with `UpdateTitle`.
- Verifies touch targets meet the $\ge 48\text{px}$ standard.
- Ensures no forbidden raw HTML or hardcoded hex colors were used.

---

## 🖼️ Create Web Screens from Screenshots (`sd5-visual-analysis`)

You can supply mockups, wireframes, or screenshots as design references:
- **New App from Mockup:** `sd5-visual-analysis` extracts layout regions, color palettes, and typography tokens, handing contract-ready specifications to `sd5-application-planner`.
- **Inspiration without Reproduction:** The skill extracts structural hierarchy while preserving your existing project's approved design system and semantic DaisyUI theme.
- **Comparison & Audit:** Compares a rendered browser screenshot against a design target to detect layout shifts, spacing discrepancies, or contrast regressions.

---

## 💻 System & Toolchain Requirements

- **Target Platform:** Modern Web Browsers (Chrome, Edge, Firefox, Safari).
- **Host Operating System:** Windows 10/11 (standard B4J development environment).
- **Required Tooling:**
  - **B4J v9.x+** (<https://www.b4x.com/b4j.html>)
  - **BANano Transpiler** (<https://www.b4x.com/android/forum/threads/web-banano-website-app-pwa-library-with-abstract-designer-support.99740/>)
  - **`SithasoDaisy5.b4xlib`** in B4J Additional Libraries (e.g. `C:\b4j\libraries\`)
  - **Local Web Server:** Laragon Apache (default publish path: `C:\laragon\www\<app>\`)
  - **PowerShell 5.1+** for gate automation scripts.

---

## 🚀 Quick Start & Installation

### 1. Install via Claude Code Plugin Marketplace (Recommended)

Add the marketplace repository and install the plugin suite directly in your Claude Code session:

```bash
# Step 1: Register the marketplace source
/plugin marketplace add Mashiane/SithasoDaisy5-Skills

# Step 2: Install the skills suite
/plugin install sithasodaisy5-skills@sithasodaisy5-skills
```

---

### 2. Manual Installation Across AI Coding Agents

#### A. Claude Code (Project or Global)
```bash
# Workspace project-level:
git clone https://github.com/Mashiane/SithasoDaisy5-Skills.git .claude/plugins/sithasodaisy5-skills

# Global user configuration:
git clone https://github.com/Mashiane/SithasoDaisy5-Skills.git ~/.claude/plugins/sithasodaisy5-skills
```

#### B. Antigravity & Gemini CLI (Global or Workspace)
```bash
# Global configuration:
git clone https://github.com/Mashiane/SithasoDaisy5-Skills.git ~/.gemini/config/plugins/sithasodaisy5-skills

# Workspace configuration:
git clone https://github.com/Mashiane/SithasoDaisy5-Skills.git .agents/plugins/sithasodaisy5-skills
```

#### C. OpenCode, Codex, Cursor & Windsurf
Add the repository to your agent configuration path or copy the skills folder:
```bash
# Clone directly into your workspace skills directory:
git clone https://github.com/Mashiane/SithasoDaisy5-Skills.git .agents/skills/sithasodaisy5
```

---

## 📂 Skill Suite Directory Structure

```text
SithasoDaisy5-Skills/
├── plugin.json                              # Plugin manifest & metadata
├── skills-registry.json                     # Machine-readable skill catalog & trigger index
├── ENGINEERING-CONSTITUTION.md              # Quality governance, hierarchy, and gate rules
├── create-dist.ps1                          # Builds publishable dist/ distribution bundle
├── PUBLISH.md                               # Marketplace publishing instructions
├── tools/
│   ├── sync-skills-readme.ps1               # Automated README metrics & table synchronizer
│   ├── validate-skills.ps1                  # Self-audit: registry, links, frontmatter, code smells
│   └── audit_designer_properties.py         # Component property verification utility
└── skills/
    ├── sd5-application-planner/             # Requirements, screen contracts, and acceptance checks
    ├── sd5-project-bootstrap/               # Greenfield web app scaffolding, pgIndex, and page wiring
    ├── sd5-feature-engineer/                # Contract-to-code vertical slice implementation
    ├── sithasodaisy5/                       # Core DaisyUI/Tailwind component composition skill
    │   ├── SKILL.md                         # Master component orchestrator
    │   ├── components/                      # 159 reference guides for SDUI5* UI and support modules
    │   └── references/                      # 18 Architecture, Token, and Doctrine references
    ├── sd5-web-orchestrator/                # G0–G8 First-Time-Right delivery sequencer
    ├── sd5-web-verify/                      # Static pre-scan, conformance, build, and runtime gates
    ├── sd5-web-regression/                  # Scoped impact analysis and baseline regression checks
    └── sd5-visual-analysis/                 # Screenshot/mockup design-to-code forensics
```

---

## 🧪 Self-Audit & Conformance Harness

You can validate the integrity of the skill suite using the built-in PowerShell verification tools:

```powershell
# 1. Validate skills registry, dependencies, broken links, and frontmatter
powershell.exe -NoProfile -ExecutionPolicy Bypass -File tools/validate-skills.ps1

# 2. Synchronize README metrics, capability matrix, and intent router
powershell.exe -NoProfile -ExecutionPolicy Bypass -File tools/sync-skills-readme.ps1
```

---

## 📄 License & Credits

* **Author:** Mashiane
* **Repository:** [https://github.com/Mashiane/SithasoDaisy5-Skills](https://github.com/Mashiane/SithasoDaisy5-Skills)
* **Parent Framework:** [SithasoDaisy5](https://github.com/Mashiane/SithasoDaisy5)
* **License:** [MIT License](LICENSE)

