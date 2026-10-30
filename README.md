# SithasoDaisy5-Skills

> AI agent skills for building B4J and BANano web applications using SithasoDaisy5 (daisyUI v5 + Tailwind CSS v4).

[![B4X Forum Thread](https://img.shields.io/badge/B4X_Forum-SithasoDaisy5-007ACC?style=flat&logo=b4x)](https://www.b4x.com/android/forum/threads/web-sithasodaisy5-create-websites-webapps-with-the-power-of-the-abstract-designer-opensource.165095/#content)
[![GitHub Release](https://img.shields.io/badge/Release-v0.8.5-blue.svg)](https://github.com/Mashiane/SithasoDaisy5-Skills/releases)
[![Skills Suite](https://img.shields.io/badge/Skills-9_Modules-purple.svg)](#available-skills)
[![Components](https://img.shields.io/badge/Components-160_Classes-brightgreen.svg)](https://github.com/Mashiane/SithasoDaisy5)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

---

## What is this?

When you ask AI coding assistants (Claude, GitHub Copilot, ChatGPT, Cursor, OpenCode, etc.) to build web apps in B4J using SithasoDaisy5, they often struggle:
- They try to output raw HTML (`<div>`, `<button>`), JSX, or CSS styles directly in B4J strings.
- They invent methods, properties, or event names that don't exist in the library.
- They misuse color channels or invent CSS properties instead of leveraging DaisyUI semantic tokens and supported color channels.
- They miss essential BANano lifecycle requirements like `app.ClearPageView` or `pgIndex.UpdateTitle`.

**SithasoDaisy5-Skills** solves this. It equips your AI assistant with verified reference data extracted directly from the SithasoDaisy5 library source codeâ€”covering all **160 UI and support components**, proven page layouts, and the exact rules needed to write working B4J web apps.

---

## Quick Start & Installation

Because **SithasoDaisy5-Skills** is designed to scaffold and build **entire multi-file B4J projects** (generating `.b4j` project files, `pgIndex.bas` shells, page modules, `env.json` configs, and running local verification scripts), **desktop-based AI coding agents are the strongly recommended approach**.

> ðŸ’¡ **Desktop AI Agents vs. Web-Based Chat**:
> * **Desktop-Based AI Agents (Recommended)**: Tools like **Claude Code**, **GitHub Copilot**, **OpenCode**, **Cursor**, **Google Antigravity**, and **Cline** run locally on your development machine. They have direct access to your project files and terminal, allowing them to scaffold folders, generate complete `.b4j` modules, wire routes, and run verification scripts autonomously.
> * **Web-Based Chat Assistants (Alternative / Snippet Mode)**: Browser-based chat tools (like web ChatGPT) do not have access to your computer's filesystem. They can generate individual component code snippets or advise on design, but you will need to manually copy and paste each code block into your B4J IDE.

---

### Compatibility Matrix

#### Recommended: Desktop-Based AI Agents (Full Project Automation)

| AI Tool / Platform | How It Works | Quick Setup Summary |
| :--- | :--- | :--- |
| **Claude Code** | Official CLI Plugin Marketplace | Run `/plugin marketplace add Mashiane/SithasoDaisy5-Skills` â†’ `/plugin install sithasodaisy5-skills` |
| **GitHub Copilot** | VS Code / JetBrains / Visual Studio | Copy `.github/copilot-instructions.md` and `skills/` into your project folder |
| **OpenCode** | Local Terminal Agent (`opencode`) | Copy `skills/` into your project root; OpenCode auto-detects it |
| **Google Antigravity IDE** | AI Pair Programming IDE | Copy `skills/` into `.agents/skills/` in your workspace root |
| **Cursor** | AI Code Editor | Add `.cursorrules` pointing to `.github/copilot-instructions.md`; copy `skills/` |
| **Windsurf** | Codeium Cascade Agent | Add `.windsurfrules` pointing to `.github/copilot-instructions.md`; copy `skills/` |
| **Aider** | CLI Terminal Pair Programmer | Start with `aider --read .github/copilot-instructions.md` |
| **Cline & Roo Code** | Autonomous VS Code Agent Extension | Create `.clinerules` with contents of `.github/copilot-instructions.md` |
| **Continue.dev** | Open-Source IDE Extension | Add instructions to `systemMessage` in Continue Settings |

#### Alternative: Web-Based AI Assistants (Snippet & Reference Mode)

| AI Tool / Web Interface | How It Works | Quick Setup Summary |
| :--- | :--- | :--- |
| **OpenAI / ChatGPT Web** | Custom GPT / ChatGPT Projects | Paste `.github/copilot-instructions.md` into Project Instructions; upload reference files from `skills/sithasodaisy5/` |

---

### Step-by-Step Setup Guides

#### 1. Claude Code (Anthropic CLI) â€” Recommended
1. Open your terminal in your B4J project folder.
2. Add the marketplace repository:
   ```bash
   /plugin marketplace add Mashiane/SithasoDaisy5-Skills
   ```
3. Install the skill suite:
   ```bash
   /plugin install sithasodaisy5-skills@sithasodaisy5-skills
   ```
4. **Test it**: Ask Claude: *"Plan and create a landing page with a hero banner using SithasoDaisy5"*. Claude Code will create the files directly in your folder.

#### 2. GitHub Copilot (VS Code, JetBrains, Visual Studio) â€” Recommended
1. In your B4J project's main folder, create a new subfolder named `.github`.
2. Copy [`.github/copilot-instructions.md`](.github/copilot-instructions.md) into that `.github/` folder.
   > **Why?** Copilot reads this file automatically on every question. It instructs Copilot never to invent HTML tags, always use native `SDUI5*` components, and use semantic daisyUI colors.
3. Copy the `skills/` folder into your project folder.
4. **Test it**: Open Copilot Chat in your editor and type:
   > *"@copilot Create an SDUI5Card with an email text box and a primary submit button"*

#### 3. OpenCode (`opencode` CLI & TUI) â€” Recommended
1. Copy the `skills/` folder into your project root (or inside `.opencode/skills/`).
2. Run `opencode` in your terminal. OpenCode discovers the skill files automatically and operates directly on your local project files.

#### 4. Google Antigravity IDE â€” Recommended
1. In your project workspace root, create an `.agents/skills` folder if it doesn't already exist.
2. Copy the folders from `skills/` into `.agents/skills/`.
3. Antigravity will index the skills immediately and build components directly into your workspace.

#### 5. Cursor â€” Recommended
1. In your project root, create a file named `.cursorrules`.
2. Add this line:
   ```text
   Read and follow .github/copilot-instructions.md for all B4J and SithasoDaisy5 code generation.
   ```
3. Copy both `.github/copilot-instructions.md` and `skills/` into your project.

#### 6. Windsurf (Codeium Cascade) â€” Recommended
1. In your project root, create a `.windsurfrules` file.
2. Add:
   ```text
   Always follow the instructions in .github/copilot-instructions.md and reference the component APIs in skills/sithasodaisy5/components/ for SithasoDaisy5 code.
   ```

#### 7. Aider â€” Recommended
1. Run Aider in your terminal and pass the instructions file:
   ```bash
   aider --read .github/copilot-instructions.md
   ```

#### 8. Cline & Roo Code â€” Recommended
1. In your project root, create a `.clinerules` file.
2. Copy the contents of `.github/copilot-instructions.md` into it.

#### 9. Continue.dev â€” Recommended
1. Open Continue settings (`config.json`).
2. In the `systemMessage` field, paste the contents of `.github/copilot-instructions.md`.

#### 10. OpenAI ChatGPT Web (chatgpt.com) â€” Snippet & Reference Mode
> **Note**: Because web ChatGPT runs in a browser and cannot access your local Windows files directly, it will output code blocks into the chat window. You will copy the generated code and paste it into your B4J IDE.

##### Option A: ChatGPT Projects (Recommended for Web)
1. Go to [chatgpt.com](https://chatgpt.com) and create a Project named **"SithasoDaisy5 B4J Web Apps"**.
2. Open [`.github/copilot-instructions.md`](.github/copilot-instructions.md), copy the entire text, paste it into **Project Instructions**, and save.
3. Under **Project Files**, click **Add Files** and upload the reference files from `skills/sithasodaisy5/`.
4. Ask ChatGPT: *"Generate a login screen with email, password with eye toggle, and a sign-in button using SithasoDaisy5"*.

##### Option B: Custom GPT
1. Click **Explore GPTs** â†’ **Create** â†’ **Configure**.
2. In **Instructions**, paste the contents of [`.github/copilot-instructions.md`](.github/copilot-instructions.md).
3. In **Knowledge**, upload the documentation files from `skills/sithasodaisy5/`.

---

## Example: Prompt to Working B4J Code

### Developer Prompt:
> *"Build a modern login card with an email field, a password field with a show/hide eye toggle, and a primary submit button."*

### Generated B4J Code:

```b4x
Sub Show
    app = pgIndex.App
    BANano.Await(app.ClearPageView)

    ' 1. Host Card (Full width inside column, rounded 3xl)
    Dim SignInCard As SDUI5Card 'ignore
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

    ' 2. Email Field
    Dim EmailBox As SDUI5TextBox 'ignore
    EmailBox.Initialize(Me, "EmailBox", "EmailBox")
    EmailBox.ParentID = "SignInCard_content"
    EmailBox.Label = "Email address"
    EmailBox.InputType = "legend"
    EmailBox.Width = "full"
    EmailBox.Placeholder = "you@example.com"
    EmailBox.TypeOf = "email"
    BANano.Await(EmailBox.AddComponent)

    ' 3. Password Field with Toggle
    Dim PasswordBox As SDUI5TextBox 'ignore
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
    Dim SignInBtn As SDUI5Button 'ignore
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

---

## Available Skills

The suite includes 9 production skills:

<!-- AUTOGEN_SKILLS_START -->
| Skill | Authority | Category | When to Use (Triggers) | Core Objective & Output |
| :--- | :---: | :---: | :--- | :--- |
| **sd5-application-planner** | L4 | planning | build app, create web app, plan app, dashboard prompt, app requirements... | Turn a plain-language SithasoDaisy5 app or feature request into a source-grounded plan, page contracts, navigation map, and acceptance checks before implementation. Use for greenfield apps and substantial feature work; it does not invent SDUI5 APIs or backend behavior. |
| **sd5-code-smells** | L4 | quality | code-smell, quality, refactoring, validation, clean-code... | Detect and remediate code smells from codesmells.org catalog across SithasoDaisy5 skills â€” markdown, B4J code, Python scripts, JSON configs |
| **sd5-feature-engineer** | L4 | implementation | implement feature, build dashboard, add page, compose screen, vertical slice... | Implement a planned SithasoDaisy5 app feature as a traceable B4J/BANano vertical slice. Use after contracts exist; verify every component API and lifecycle call against source-backed references and demos. |
| **sd5-project-bootstrap** | L4 | scaffolding | new app, new project, scaffold app, bootstrap b4j, banano scaffold... | Create or extend a code-first B4J/BANano web app that uses SithasoDaisy5. Use for project setup, embedded app entry, page module wiring, app shell startup, asset loading, and first-page composition; consult sithasodaisy5 for component APIs and screen design. |
| **sd5-visual-analysis** | L3 | visual-analysis | screenshot to code, replicate design, mockup to app, wireframe to code, visual forensics... | Design-to-code forensics for SithasoDaisy5. Turns a screenshot, mockup, wireframe, or reference URL into verified B4J/SDUI5 code via the 10-stage visual pipeline â€” function-first extraction (NEVER literal pixel mapping), screen contract, implementation through the orchestrator gates, then capture-and-compare fidelity review. Use when the user provides a design reference to replicate. |
| **sd5-web-orchestrator** | L4 | orchestration | orchestrate, release gate, first-time-right, ship app, build full app... | Turn a plain-language request into a complete source-grounded SithasoDaisy5 B4J/BANano app and carry it through planning, implementation, static/build/runtime/visual/regression gates, and an evidence-based delivery decision. Use for greenfield apps, complete features, or release work. |
| **sd5-web-regression** | L4 | quality | regression, modify existing app, refactor, bug fix, impact analysis... | Assess and verify change impact in an existing SithasoDaisy5 B4J/BANano app. Use for bug fixes, refactors, shared component or route changes, and release readiness; report pre-existing failures separately. |
| **sd5-web-verify** | L4 | verification | verify app, conformance check, pre-scan, gate, coverage contract... | Quality inspection and conformance gate for SithasoDaisy5 web apps. Pre-scan (L4) catches banned patterns; verify-conformance (L5) enforces the Skill Coverage Contract + lifecycle + wiring. Used by sd5-web-orchestrator Stages 5/6/8. |
| **sithasodaisy5** | L2 | domain | sithasodaisy5, sdui5, b4j component, banano, daisyui native... | SithasoDaisy5 â€” B4J/BANano component library (daisyUI + Tailwind) transpiled to JS. Use when building web apps/UIs with SithasoDaisy5 components in B4J/BANano, when you need a component's designer properties, events, setters, emitted daisyUI classes, or the app scaffold (SDUI5App), theme system, UsesX lazy-loaders, or the SDUI5Component skeleton contract. Produces B4J `.bas` code that calls the framework; never raw HTML. |
<!-- AUTOGEN_SKILLS_END -->

### Which Skill to Use When

<!-- AUTOGEN_ROUTER_START -->
| User Intent / Task Keywords | Recommended Starting Skills | Why This Order? | Rejected / Why Not? |
| :--- | :--- | :--- | :--- |
| **new web app, greenfield, scaffold, project file, pgIndex** | sd5-project-bootstrap, sithasodaisy5, sd5-web-verify | shell first, then composition, then gate | sd5-web-regression (no existing behavior to protect) |
| **login screen, auth flow, form validation, cloud auth** | sd5-application-planner, sithasodaisy5, sd5-web-verify | auth touches requirements + contract before composition | sd5-project-bootstrap (not greenfield) |
| **navigation shell, navbar, drawer, dock, routing, multi-page** | sd5-application-planner, sithasodaisy5, sd5-project-bootstrap, sd5-web-verify | shell structure + composition + gate | sd5-web-regression (greenfield, nothing to regress) |
| **plan web app, feature planning, requirements, architecture** | sd5-application-planner (+ sd5-web-orchestrator for full build) | contract set before code; no contract = no gen | sd5-feature-engineer (no contract yet), bootstrap (plan before shell) |
| **implement feature, vertical slice, connect screen** | sd5-feature-engineer, sithasodaisy5, sd5-web-verify | slice needs domain + gate | bootstrap (not greenfield), orchestrator (single feature, not release) |
| **compose UI, screen, form, dashboard, card, modal, DaisyUI web** | sithasodaisy5, sd5-web-verify | domain generation + conformance gate | generic styling skill (platform mismatch; authority 6 loses to 2) |
| **screenshot to web app, recreate screenshot, mockup to B4J, wireframe to code** | sd5-visual-analysis + sd5-application-planner + sithasodaisy5 + sd5-web-verify; add sd5-project-bootstrap for a new app and sd5-web-regression for an existing app | visual forensics â†’ canonical screen contract â†’ verified BANano/SDUI5 mapping â†’ appropriate app gates | image-to-code workflow (skips contracts, API truth, or existing-app impact) |
| **adapt another app's screenshot, use screenshot as inspiration** | sd5-visual-analysis + sd5-application-planner + sithasodaisy5 + sd5-web-verify when implementing | extract structure and hierarchy while preserving the destination app's approved design system | faithful brand copy when the user asked for adaptation |
| **compare current web app screenshot with target** | sd5-visual-analysis + sd5-web-regression + sithasodaisy5 + sd5-web-verify when changing the app; sd5-web-verify for review only | classify current-state evidence, protect existing behavior, and review the rendered result against the target | treating the current screenshot as the target without user intent |
| **verify, conformance, invented API, module wiring, before build** | sd5-web-verify | static gate before compile | â€” (gate never skipped; failed gate blocks) |
| **release, ship web app, end-to-end, full app, screen contract** | sd5-web-orchestrator + all depends | thin sequencer owns G0-G8 for multi-scope release | single-component shortcut (release requires full gate chain) |
| **change existing web app, fix, regression, impact** | sd5-web-regression, sd5-web-verify | baseline â†’ impact â†’ targeted + smoke | bootstrap (not greenfield), planner (unless contract changes) |
<!-- AUTOGEN_ROUTER_END -->

---

## Core Rules & Coding Conventions

1. **No Raw HTML**: Always instantiate `SDUI5*` components in B4J. BANano handles transpilation into browser HTML and JavaScript. Never concatenate HTML strings.
2. **Color Tokens & Hex Support**: Use semantic tokens (`primary`, `secondary`, `accent`, `neutral`, `info`, `success`, `warning`, `error`) for theme-adaptive elements. Hex colors (`#hex`) are fully supported across `.Color`, `.BackgroundColor`, `.TextColor`, `.BorderColor`, `.Classes` (e.g. `bg-[#1e293b]`), and `.Styles` for custom brand palettes, data charts, and bespoke art direction.
3. **Override Fixed Widths in Columns**: When mounting a card inside a column (`SDUI5Column`), always set `.Width = "full"`. By default, designer cards default to fixed widths (`Width = "96"`) which will break responsive grids if not overridden.
4. **Pair Parent Containers with Child Items**: Always pair layout containers with their designated child classes:
   - `SDUI5Stat` â†’ `SDUI5StatItem`
   - `SDUI5Steps` â†’ `SDUI5StepsItem`
   - `SDUI5Timeline` â†’ `SDUI5TimelineItem`
   - `SDUI5Tabs` â†’ `SDUI5TabsItem`
   - `SDUI5Row` â†’ `SDUI5Column`
5. **Clean Compiler Declarations**: Add `'ignore` to component variable declarations in `Process_Globals` and `Class_Globals` to suppress B4J compiler warnings about unused variables.
6. **Page Lifecycle**: Every page `Sub Show` must begin with `BANano.Await(app.ClearPageView)` and end with `pgIndex.UpdateTitle(...)`.
7. **Governance**: All design and generation patterns conform to [ENGINEERING-CONSTITUTION.md](skills/ENGINEERING-CONSTITUTION.md).

---

## Repository Layout

```text
SithasoDaisy5-Skills/
â”œâ”€â”€ .claude-plugin/                          # Plugin manifest for Claude Code marketplace
â”œâ”€â”€ .github/
â”‚   â””â”€â”€ copilot-instructions.md              # Global instructions for GitHub Copilot & AI agents
â”œâ”€â”€ LICENSE                                  # MIT open-source license
â”œâ”€â”€ plugin.json                              # Plugin manifest & metadata
â”œâ”€â”€ README.md                                # Complete documentation and setup guides
â””â”€â”€ skills/
    â”œâ”€â”€ ENGINEERING-CONSTITUTION.md          # Quality governance, hierarchy, and gate rules
    â”œâ”€â”€ skills-registry.json                 # Machine-readable skill catalog & trigger index
    â”œâ”€â”€ sd5-application-planner/             # Requirements, screen contracts, and acceptance checks
    â”œâ”€â”€ sd5-code-smells/                     # Code smell detection catalog from codesmells.org
    â”œâ”€â”€ sd5-feature-engineer/                # Contract-to-code vertical slice implementation
    â”œâ”€â”€ sd5-project-bootstrap/               # Greenfield web app scaffolding, pgIndex, and page wiring
    â”œâ”€â”€ sd5-visual-analysis/                 # Screenshot/mockup design-to-code forensics
    â”œâ”€â”€ sd5-web-orchestrator/                # G0â€“G8 delivery sequencer
    â”œâ”€â”€ sd5-web-regression/                  # Scoped impact analysis and baseline regression checks
    â”œâ”€â”€ sd5-web-verify/                      # Static pre-scan, conformance, build, and runtime gates
    â””â”€â”€ sithasodaisy5/                       # Core DaisyUI/Tailwind component composition skill
        â”œâ”€â”€ SKILL.md                         # Master component orchestrator
        â”œâ”€â”€ components/                      # 160 reference guides for SDUI5* UI and support modules
        â””â”€â”€ references/                      # 20 Architecture, Token, and Doctrine references
```

---

## System Requirements & Resources

- **Host Environment**: Windows 10/11 with B4J v9.x+ (<https://www.b4x.com/b4j.html>).
- **BANano Transpiler**: Available on the [B4X Forum](https://www.b4x.com/android/forum/threads/web-banano-website-app-pwa-library-with-abstract-designer-support.99740/).
- **SithasoDaisy5 Library**: `SithasoDaisy5.b4xlib` placed in your B4J Additional Libraries folder.
- **Local Web Server**: Laragon Apache (<https://laragon.org/>) pointing to `C:\laragon\www\<app>\`.

### Useful Links
- **Framework Source Code**: [https://github.com/Mashiane/SithasoDaisy5](https://github.com/Mashiane/SithasoDaisy5)
- **Live Showcase Demo**: [https://sithaso-daisy5.vercel.app](https://sithaso-daisy5.vercel.app)
- **B4X Community Thread**: [SithasoDaisy5 on B4X Forum](https://www.b4x.com/android/forum/threads/web-sithasodaisy5-create-websites-webapps-with-the-power-of-the-abstract-designer-opensource.165095/#content)
- **Native Mobile/Desktop Sibling**: [b4xdaisyuikit-skills](https://github.com/Mashiane/B4XDaisyUIKit-Skills) (for native B4A/B4i/B4J UI, not web)

---

## Changelog

All notable changes to the **SithasoDaisy5-Skills** suite are documented below.

### [0.8.5] — 2026-10-30

#### Added
- **Layout Mechanics & State Recipes**:
  - Added `skills/sithasodaisy5/references/layout-mechanics.md` covering grid, flex, hierarchy, and nested container mechanics.
  - Added `skills/sithasodaisy5/references/state-recipes.md` documenting verified patterns for UI state, modal lifecycles, and reactive views.
- **Orchestration Pipeline Automation**:
  - Added `skills/sd5-web-orchestrator/scripts/run-pipeline.ps1` for end-to-end execution of G0 through G8 delivery gates.
- **Build & Verification Refinements**:
  - Enhanced `build-banano-app.ps1` with strict ASCII/UTF-8 safety for Windows PowerShell 5.1 and B4JBuilder compatibility.
  - Hardened headless browser screenshot capture in `browser_capture.js`.

### [0.8.4] â€” 2026-10-28

#### Added
- **SDUI5Calendar Component Reference**: Added full component specifications and designer property mapping for `SDUI5Calendar`.
- **Component Default Setters & Accessors**: Added `skills/sithasodaisy5/references/component-default-setters.md` and `designer-property-accessors.md`.
- **Design Craft & Quality Playbook**: Added `design-craft-guide.md` and `design-quality-playbook.md`.
- **Code Quality Skill (`sd5-code-smells`)**: Added code smell catalog and advisory scan integration.
- **Visual Verification Suite**: Added browser capture and automated verification tooling.

#### Changed
- Synchronized component source references and designer property audits across all 160 components.
- Refined negative-knowledge checks and context-aware defaults for responsive layouts.

### [0.8.3] â€” 2026-10-27

#### Added
- **Multi-Agent Platform Compatibility**:
  - **GitHub Copilot**: Created `.github/copilot-instructions.md` establishing persistent repository instructions (strictly prohibiting raw HTML hallucinations, enforcing B4J syntax rules, `'ignore` suffixes, and BANano lifecycle boundaries). Added `.github/skills` directory junction for native Copilot Agent mode discovery.
  - **OpenCode**: Added `.opencode/skills` directory junction and verified out-of-the-box progressive disclosure compliance with the `agentskills.io` open standard.
  - **Multi-Platform Installation Documentation**: Documented setup workflows for Claude Code, GitHub Copilot, OpenCode, Antigravity IDE, Cursor, and Windsurf in `README.md`.
- **Prompt-to-Setter Alignment Protocol (`RULE-DEFAULTS-001`)**:
  - Added `skills/sithasodaisy5/references/component-default-setters.md`: comprehensive 2,454-line audit indexing active defaults across all 160 components, mapping property keys, `SetDefaults` initial values, setter methods, and valid options.
  - Added `skills/sithasodaisy5/references/context-aware-defaults.md`: Context-Conflict Matrix solving fixed designer defaults (`SDUI5Card.Width = "96"`, `SDUI5Wizard.Width = "96"`, `SDUI5Menu.Width = "56"`) inside responsive grid containers (`SDUI5Column`).
  - Added pattern `P13` (Context-Aware Default Value Overrides) to `skills/sithasodaisy5/patterns.md`.
  - Enshrined `RULE-DEFAULTS-001` in `sithasodaisy5/SKILL.md`, `sd5-application-planner/SKILL.md`, and `sd5-feature-engineer/SKILL.md`.
  - Added automated negative-knowledge check to `skills/sd5-web-verify/scripts/pre-scan.ps1` flagging cards mounted in columns without `.Width = "full"`.
- **Parent Container vs. Child Leaf Architecture (`RULE-LAYOUT-005`)**:
  - Enforced structural pairing between parent containers (`SDUI5Stat`, `SDUI5Steps`, `SDUI5Timeline`, `SDUI5Tabs`, `SDUI5Menu`, `SDUI5List`, `SDUI5Carousel`, `SDUI5Slider`, `SDUI5Swiper`, `SDUI5Footer`, `SDUI5Row`) and child leaf components (`SDUI5StatItem`, `SDUI5StepsItem`, `SDUI5TimelineItem`, `SDUI5TabsItem`, `SDUI5MenuItem`, `SDUI5ListItem`, `SDUI5CarouselItem`, `SDUI5SliderItem`, `SDUI5SwiperSlide`, `SDUI5FooterTitle`, `SDUI5Column`).
  - Prohibited child leaves from mounting as orphans directly into general layout containers (`app.PageView`, `SDUI5Container`).
  - Added parent-child hierarchy verification check to `pre-scan.ps1`.
- **B4X Compiler Warning Elimination**:
  - Enforced `'ignore` suffix on all component declarations in `Process_Globals` / `Class_Globals` to eliminate B4J compiler warnings.
  - Added automated validation check to `pre-scan.ps1`.
- **Hero Overlay Clipping**:
  - Documented and enforced `Hero.Classes = "overflow-hidden"` to prevent sharp overlay corners from bleeding past rounded hero container curves.

#### Changed
- **Golden Showcase Clean Conformance**:
  - Fixed card widths (`.Width = "full"`) in `01-landing-hero`, `02-auth-login`, `04-kpi-dashboard`, `05-master-detail`, and `06-ecommerce-product`.
  - Updated all 19 golden applications to declare component globals with `'ignore`.
  - Synchronized `env.json` in all apps with fresh API keys and normalized lowercase routing URLs.
  - All 19 applications now achieve **100% PASS (0 FAIL, 0 WARN)** on both `pre-scan.ps1` and `verify-conformance.ps1`.
- **Package Distribution**:
  - Updated `create-dist.ps1` to copy `.github/copilot-instructions.md` into `dist/.github/`.
  - Fixed character encoding in `plugin.json` to pure UTF-8 without BOM.

---

### [0.8.0] â€” 2026-10-26

#### Added
- **Golden Showcase Expansion (Apps 10â€“19)**: Expanded the `AIExamples/` golden test suite from 9 apps to 19 fully conforming B4J/BANano applications:
  - `10-sleep-tracker`: Health, circadian metrics, and sleep tracking using `SDUI5RadialProgress` and `SDUI5Toggle`.
  - `11-social-profile`: Multi-page, multi-theme profile (`pgDark`, `pgMinimal`, `pgPastel`) with `SDUI5Dock` and `SDUI5Tabs`.
  - `12-music-player`: Multi-aesthetic media player (`pgBrutal`, `pgMemphis`, `pgRetro`) with `SDUI5Range` and `SDUI5Image`.
  - `13-fitness-dashboard`: Fitness activity dashboard featuring radial metrics, badges, and progress meters.
  - `14-banking-y2k`: Neo-banking interface with retro aesthetics, cards, carousels, and bottom dock navigation.
  - `15-stopwatch-swiss`: Minimalist Swiss precision stopwatch and lap timer.
  - `16-flight-tracker`: Real-time flight tracking itinerary with interactive timeline cards.
  - `17-sneaker-market`: Two-screen marketplace (`pgMarket`, `pgDetail`) demonstrating route transitions and detail view mounting.
  - `18-calendar-brutalist`: High-density calendar schedule and event agenda layout.
  - `19-privacy-cloud-auth`: Cloud security consent dialog and OAuth credentials modal.
- **Component Parity Expansion (160 Components)**:
  - Added official specification for `SDUI5Calendar` (`skills/sithasodaisy5/components/SDUI5Calendar.md`), reflecting `Module160=SDUI5Calendar` registered in `SithasoDaisy5.b4j`.
  - Strict 1:1 coverage maintained: 160 framework modules = 160 component markdown files.
- **Designer Properties Accessor Audit**:
  - Added `skills/sithasodaisy5/references/designer-property-accessors.md` mapping 3,636 designer properties across 134 components to their explicit setter and getter methods, identifying intentional aliases and accessor gaps.
  - Added `tools/audit_designer_properties.py` for automated continuous verification of designer properties against framework source.
- **Intent-to-Skill Task Router**:
  - Added `skills/sithasodaisy5/references/intent-to-skill.md` mapping natural language task intents directly to recommended starting skills.
- **Code Quality Skill (`sd5-code-smells`)**:
  - Added `skills/sd5-code-smells/SKILL.md` mapping 56 code smell patterns from codesmells.org to B4J code, Python scripts, Markdown docs, and JSON configs.
  - Integrated code smell scanner patterns into `tools/validate-skills.ps1` for automated quality advisories.
  - Registered `sd5-code-smells` as an official production skill in `plugin.json`.
- **5-Layer Evaluation Harness**:
  - Added `eval/run-harness.ps1` and `eval/harness.ps1` executing multi-layer automated validation:
    - Layer 1: Structural Integrity (14 checks, zero broken links, section completeness).
    - Layer 2: Negative-Knowledge Guardrails (zero banned property patterns, 19 apps clean).
    - Layer 3: Conformance & Contracts (19/19 golden apps pass conformance).
    - Layer 4: Runtime / Build Watch Readiness (dual `env.json`, `Publish` path, DOM hooks, routing).
    - Layer 5: Drift Detection (component parity, `.b4j` registry match, provenance sync).

#### Changed
- **Component Source References**: Updated all 160 component specifications with direct GitHub permalinks to upstream implementation in [Mashiane/SithasoDaisy5](https://github.com/Mashiane/SithasoDaisy5) and 124 verified demo page citations in `SithasoDaisy5DemoCode/B4J`.
- **Packaging and Distribution**:
  - Updated `plugin.json` to publish 9 production skills (`sd5-project-bootstrap`, `sd5-application-planner`, `sd5-feature-engineer`, `sithasodaisy5`, `sd5-web-orchestrator`, `sd5-web-verify`, `sd5-web-regression`, `sd5-visual-analysis`, `sd5-code-smells`).
- **Web Server Configuration**: Standardized all local server references and build-watch URLs to Laragon port 80 (removing obsolete `:8080` port specifications).

#### Fixed
- **UTF-8 Encoding Corruption in `skills-registry.json`**: Resolved an issue where running `add_skill.ps1` with PowerShell 5.1 default codepage converted em-dashes `â€”` into ANSI `0x97` bytes, causing Python UTF-8 parsers (`sync-skills-registry.py`) to fail with `UnicodeDecodeError`. Fixed `add_skill.ps1` to explicitly enforce `-Encoding UTF8`.
- **YAML Frontmatter in `sd5-code-smells/SKILL.md`**: Fixed missing `---` YAML frontmatter delimiters, ensuring compatibility with standard agent skill discovery mechanisms.
- **Relative Markdown Links in Property Audit**: Fixed `tools/audit_designer_properties.py` to calculate Markdown links relative to the report directory (`../components/SDUI5*.md`), resolving 127 broken links in Layer 1 evaluation.
- **PowerShell 5.1 ASCII Parsing in Build Scripts**: ASCII-fied `skills/sd5-web-verify/scripts/build-banano-app.ps1` to prevent script parsing failure on non-UTF8 PowerShell 5.1 hosts.

---

### [0.7.0] â€” 2026-10-22

#### Added
- **Core Skill Suite**:
  - `sd5-application-planner`: Requirements capture, application contracts, and screen contracts.
  - `sd5-project-bootstrap`: B4J/BANano project file generation, embedded entry points, and `pgIndex` shell wiring.
  - `sd5-feature-engineer`: Traceable vertical slice implementation from contracts.
  - `sithasodaisy5`: Core domain authority, 159 component specifications, design tokens, and skeleton contracts.
  - `sd5-web-orchestrator`: Master delivery state machine governing G0 through G8 gates.
  - `sd5-web-verify`: Deterministic PowerShell verification gates (`pre-scan.ps1`, `verify-conformance.ps1`, `check-contract.ps1`).
  - `sd5-web-regression`: Change impact analysis and regression baselines.
  - `sd5-visual-analysis`: 10-stage design forensics pipeline (screenshot/mockup to B4J code).
  - `sd5-book-to-skill`: AST and regex extractor for regenerating component documentation from `.bas` source.
- **Engineering Constitution**: Adopted [ENGINEERING-CONSTITUTION.md](skills/ENGINEERING-CONSTITUTION.md) v1.0 establishing the 7-level source-of-truth hierarchy, non-negotiable rules, and deterministic gate requirements.
- **Golden Apps Suite**: Initial 9 reference applications in `AIExamples/` (apps 01â€“09).
- **Automated Gates**:
  - `pre-scan.ps1` (L4 gate detecting negative-knowledge bans).
  - `verify-conformance.ps1` (L5 gate enforcing lifecycle, color tokens, and registry contract).
  - `check-contract.ps1` (1:1 component contract verification).
  - `capture-screens.ps1` (headless browser screenshot capture).
- **Verified Build & Runtime**: Verified B4J compile and BANano transpilation on `09-finance-dashboard`.

---

### [0.4.0] â€” 2026-09-01

#### Added
- Initial project structure, documentation, and prototype skills.

---

## License & Credits

* **Author**: Mashiane
* **Repository**: [https://github.com/Mashiane/SithasoDaisy5-Skills](https://github.com/Mashiane/SithasoDaisy5-Skills)
* **Parent Framework**: [SithasoDaisy5](https://github.com/Mashiane/SithasoDaisy5)
* **License**: [MIT License](LICENSE)




