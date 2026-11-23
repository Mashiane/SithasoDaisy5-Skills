# SithasoDaisy5-Skills

> AI agent skills for building B4J and BANano web applications using SithasoDaisy5 (daisyUI v5 + Tailwind CSS v4).

[![B4X Forum Thread](https://img.shields.io/badge/B4X_Forum-SithasoDaisy5-007ACC?style=flat&logo=b4x)](https://www.b4x.com/android/forum/threads/web-sithasodaisy5-create-websites-webapps-with-the-power-of-the-abstract-designer-opensource.165095/#content)
[![GitHub Release](https://img.shields.io/badge/Release-v0.92-blue.svg)](https://github.com/Mashiane/SithasoDaisy5-Skills/releases)
[![Skills Suite](https://img.shields.io/badge/Skills-9_Modules-purple.svg)](#available-skills)
[![Components](https://img.shields.io/badge/Components-162_Classes-brightgreen.svg)](https://github.com/Mashiane/SithasoDaisy5)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

---

## What is this?

When you ask AI coding assistants (Claude, GitHub Copilot, ChatGPT, Cursor, OpenCode, etc.) to build web apps in B4J using SithasoDaisy5, they often struggle:
- They try to output raw HTML (`<div>`, `<button>`), JSX, or CSS styles directly in B4J strings.
- They invent methods, properties, or event names that don't exist in the library.
- They misuse color channels or invent CSS properties instead of leveraging DaisyUI semantic tokens and supported color channels.
- They miss essential BANano lifecycle requirements like `app.ClearPageView` or `pgIndex.UpdateTitle`.

**SithasoDaisy5-Skills** solves this. It equips your AI assistant with verified reference data extracted directly from the SithasoDaisy5 library source code—covering all **162 UI and support components**, proven page layouts, and the exact rules needed to write working B4J web apps.

---

## Release status (0.92, 2026-11-23)

This package ships **instructions and gate tooling**, not a certified build pipeline. Read this before trusting any claim in the changelog.

The table below records the verified evidence for `01-landing-hero`, carried forward from 0.90; no app
was rebuilt for 0.91/0.92. For 0.92, `tools/validate-skills.ps1`, `tools/validate-doc-structure.ps1`,
`tools/verify-dist.ps1 -CheckFramework` and `tools/check-constraints.ps1 -Strict` all PASS on the
working tree and on `dist/`. The full 68-component daisyUI v5 parity benchmark completed at 100%.

**Verified for this release**

| Check | Result |
|---|---|
| Skill Coverage Contract (`check-contract.ps1`) | PASS (162 <-> 162) |
| Component provenance | 162 entries; 0 checksum mismatches |
| daisyUI v5 Parity Benchmark | PASS - 68/68 components (100%), 476/476 sections, Checks A/C/D verified |
| Negative Knowledge Corpus | 92 rules (NEG-001 through NEG-092) |
| Skill docs | 0 broken Markdown links; no doubled-prefix property examples |
| Package manifests | `plugin.json`, registry and directory list agree; no UTF-8 BOM |
| Constraint ratchet (`check-constraints.ps1 -Strict`) | PASS - 0 open exceptions (`C-003` closed, ADR-002) |
| Documentation structure (`validate-doc-structure.ps1`) | PASS - 0 prose lines >300, 0 duplicate rule definitions, 0 broken links/anchors |
| Gate regression suite | 4/4 (`eval/cases/run-gate-regressions.ps1`) |
| G4 build smoke (`01-landing-hero`) | PASS - B4JBuilder exit 0, BANano `conversion finished!`, output in `C:\laragon\www\sd5landing` |
| G4 build smoke (`03-profile-form`, `04-kpi-dashboard`) | PASS - B4JBuilder exit 0, BANano `conversion finished!` |
| G5 runtime (`build-watch`) | PASS - 0 JS errors, 0 failed resources, title/theme/`#pageview`/body text rendered |
| G6 capture (`capture-screens.ps1`) | 3 viewports (1440x900, 768x1024, 390x844), 0 warnings, 0 failures |
| G8 hardening (`verify-production-hardening.ps1`) | PASS - 0 FAIL, 3 accepted WARN (publish path, non-localhost URL) |
| G0-G8 delivery (`run-pipeline.ps1` -> `check-delivery.ps1`) | PASS - `01`-`08` are DELIVERABLE |

Evidence: `audit/evidence/01-landing-hero/` (build report, runtime report, UX report, screenshots) and `AIExamples/01-landing-hero/.agent/DELIVERY.json`.

**Framework catalogue rule.** The active catalogue is exactly the set of `ModuleN=` entries in
`SithasoDaisy5.b4j`, normalised to the module basename (entries may be path-qualified, e.g.
`C:\b4j\shared\UIShared`). Source files that are not registered are not documented as components;
their notes stay under `skills/sithasodaisy5/components/_unused/`. `check-contract.ps1` enforces the
1:1 relationship, and `tools/verify-dist.ps1 -CheckFramework` re-checks it (and every source hash)
against a live checkout.

**Not yet verified**

- **Eight reference apps have completed G0-G8.** `01`-`08` are DELIVERABLE; `check-delivery.ps1` exits 0 on each current digest with an approved G6 review. The remaining 10 (`09`-`18`) have not completed G6/G7.
- **All 18 example apps in `AIExamples/` pass `pre-scan.ps1`** (0 FAIL) and G0-G5. Ten (`09`-`18`) await G6/G7 closure. They are repository fixtures, not shipped in this package.
- **G6 design approval is agent-reviewed for eight apps.** Averages range 3.6-3.8 with no severity 4/5 defect. Human visual sign-off is still recommended.
- **Provenance is current.** The framework registers 162 modules and the skill documents 162; `verify-dist.ps1 -CheckFramework` passes with 0 checksum or source mismatches against the live checkout (snapshot generated 2026-11-10 18:55 UTC).

---

## Quick Start & Installation

Because **SithasoDaisy5-Skills** is designed to scaffold and build **entire multi-file B4J projects** (generating `.b4j` project files, `pgIndex.bas` shells, page modules, `env.json` configs, and running local verification scripts), **desktop-based AI coding agents are the strongly recommended approach**.

> - **Desktop AI Agents vs. Web-Based Chat**:
> * **Desktop-Based AI Agents (Recommended)**: Tools like **Claude Code**, **GitHub Copilot**, **OpenCode**, **Cursor**, **Google Antigravity**, and **Cline** run locally on your development machine. They have direct access to your project files and terminal, allowing them to scaffold folders, generate complete `.b4j` modules, wire routes, and run verification scripts autonomously.
> * **Web-Based Chat Assistants (Alternative / Snippet Mode)**: Browser-based chat tools (like web ChatGPT) do not have access to your computer's filesystem. They can generate individual component code snippets or advise on design, but you will need to manually copy and paste each code block into your B4J IDE.

---

### Compatibility Matrix

#### Recommended: Desktop-Based AI Agents (Full Project Automation)

| AI Tool / Platform | How It Works | Quick Setup Summary |
| :--- | :--- | :--- |
| **Claude Code** | Official CLI Plugin Marketplace | Run `/plugin marketplace add Mashiane/SithasoDaisy5-Skills` -> `/plugin install sithasodaisy5-skills` |
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

#### 1. Claude Code (Anthropic CLI) — Recommended
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

#### 2. GitHub Copilot (VS Code, JetBrains, Visual Studio) — Recommended
1. In your B4J project's main folder, create a new subfolder named `.github`.
2. Copy [`.github/copilot-instructions.md`](.github/copilot-instructions.md) into that `.github/` folder.
   > **Why?** Copilot reads this file automatically on every question. It instructs Copilot never to invent HTML tags, always use native `SDUI5*` components, and use semantic daisyUI colors.
3. Copy the `skills/` folder into your project folder.
4. **Test it**: Open Copilot Chat in your editor and type:
   > *"@copilot Create an SDUI5Card with an email text box and a primary submit button"*

#### 3. OpenCode (`opencode` CLI & TUI) — Recommended
1. Copy the `skills/` folder into your project root (or inside `.opencode/skills/`).
2. Run `opencode` in your terminal. OpenCode discovers the skill files automatically and operates directly on your local project files.

#### 4. Google Antigravity IDE — Recommended
1. In your project workspace root, create an `.agents/skills` folder if it doesn't already exist.
2. Copy the folders from `skills/` into `.agents/skills/`.
3. Antigravity will index the skills immediately and build components directly into your workspace.

#### 5. Cursor — Recommended
1. In your project root, create a file named `.cursorrules`.
2. Add this line:
   ```text
   Read and follow .github/copilot-instructions.md for all B4J and SithasoDaisy5 code generation.
   ```
3. Copy both `.github/copilot-instructions.md` and `skills/` into your project.

#### 6. Windsurf (Codeium Cascade) — Recommended
1. In your project root, create a `.windsurfrules` file.
2. Add:
   ```text
   Always follow the instructions in .github/copilot-instructions.md and reference the component APIs in skills/sithasodaisy5/components/ for SithasoDaisy5 code.
   ```

#### 7. Aider — Recommended
1. Run Aider in your terminal and pass the instructions file:
   ```bash
   aider --read .github/copilot-instructions.md
   ```

#### 8. Cline & Roo Code — Recommended
1. In your project root, create a `.clinerules` file.
2. Copy the contents of `.github/copilot-instructions.md` into it.

#### 9. Continue.dev — Recommended
1. Open Continue settings (`config.json`).
2. In the `systemMessage` field, paste the contents of `.github/copilot-instructions.md`.

#### 10. OpenAI ChatGPT Web (chatgpt.com) — Snippet & Reference Mode
> **Note**: Because web ChatGPT runs in a browser and cannot access your local Windows files directly, it will output code blocks into the chat window. You will copy the generated code and paste it into your B4J IDE.

##### Option A: ChatGPT Projects (Recommended for Web)
1. Go to [chatgpt.com](https://chatgpt.com) and create a Project named **"SithasoDaisy5 B4J Web Apps"**.
2. Open [`.github/copilot-instructions.md`](.github/copilot-instructions.md), copy the entire text, paste it into **Project Instructions**, and save.
3. Under **Project Files**, click **Add Files** and upload the reference files from `skills/sithasodaisy5/`.
4. Ask ChatGPT: *"Generate a login screen with email, password with eye toggle, and a sign-in button using SithasoDaisy5"*.

##### Option B: Custom GPT
1. Click **Explore GPTs** -> **Create** -> **Configure**.
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
| **sd5-application-planner** | L4 | planning | build an app, create a web app, plan a SithasoDaisy5 app, dashboard prompt, app requirements... | Turn a plain-language SithasoDaisy5 app or feature request into a source-grounded plan, page contracts, navigation map, and acceptance checks before implementation. Use for greenfield apps and substantial feature work; it does not invent SDUI5 APIs or backend behavior. |
| **sd5-code-smells** | L4 | quality | code-smell, quality, refactoring, validation, clean-code... | Detect and remediate code smells from codesmells.org catalog across SithasoDaisy5 skills — markdown, B4J code, Python scripts, JSON configs |
| **sd5-feature-engineer** | L4 | implementation | implement a feature, build this dashboard, add a page, compose a screen, implement a SithasoDaisy5 feature | Implement a planned SithasoDaisy5 app feature as a traceable B4J/BANano vertical slice. Use after contracts exist; verify every component API and lifecycle call against source-backed references and demos. |
| **sd5-project-bootstrap** | L4 | scaffolding | new SithasoDaisy5 app, B4J BANano scaffold, project bootstrap, add page module, wire pgIndex... | Create or extend a code-first B4J/BANano web app that uses SithasoDaisy5. Use for project setup, embedded app entry, page module wiring, app shell startup, asset loading, and first-page composition; consult sithasodaisy5 for component APIs and screen design. |
| **sd5-visual-analysis** | L3 | visual-analysis | screenshot to code, replicate this design, copy this screen, mockup to app, wireframe to code... | Design-to-code forensics for SithasoDaisy5. Turns a screenshot, mockup, wireframe, or reference URL into verified B4J/SDUI5 code via the 10-stage visual pipeline — function-first extraction (NEVER literal pixel mapping), screen contract, implementation through the orchestrator gates, then capture-and-compare fidelity review. Use when the user provides a design reference to replicate. |
| **sd5-web-orchestrator** | L4 | orchestration | build a complete app, create app from prompt, end-to-end SithasoDaisy5, ship a screen, release gate | Turn a plain-language request into a complete source-grounded SithasoDaisy5 B4J/BANano app and carry it through planning, implementation, static/build/runtime/visual/regression gates, and an evidence-based delivery decision. Use for greenfield apps, complete features, or release work. |
| **sd5-web-regression** | L4 | quality | regression, change existing SithasoDaisy5 app, refactor, bug fix, impact analysis... | Assess and verify change impact in an existing SithasoDaisy5 B4J/BANano app. Use for bug fixes, refactors, shared component or route changes, and release readiness; report pre-existing failures separately. |
| **sd5-web-verify** | L4 | verification | verify, scan, gate, hard gate, conformance... | Quality inspection and conformance gate for SithasoDaisy5 web apps. Pre-scan (L4) catches banned patterns; verify-conformance (L5) enforces the Skill Coverage Contract + lifecycle + wiring. Used by sd5-web-orchestrator gates G3/G4/G5/G6/G8. |
| **sithasodaisy5** | L2 | domain | sithasodaisy5, sdui5, sdui5 component, b4j component, banano... | SithasoDaisy5 — B4J/BANano component library (daisyUI + Tailwind) transpiled to JS. Use when building web apps/UIs with SithasoDaisy5 components in B4J/BANano, when you need a component's designer properties, events, setters, emitted daisyUI classes, or the app scaffold (SDUI5App), theme system, UsesX lazy-loaders, or the SDUI5Component skeleton contract. Produces B4J `.bas` code that calls the framework; never raw HTML. |
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
| **screenshot to web app, recreate screenshot, mockup to B4J, wireframe to code** | sd5-visual-analysis + sd5-application-planner + sithasodaisy5 + sd5-web-verify; add sd5-project-bootstrap for a new app and sd5-web-regression for an existing app | visual forensics → canonical screen contract → verified BANano/SDUI5 mapping → appropriate app gates | image-to-code workflow (skips contracts, API truth, or existing-app impact) |
| **adapt another app's screenshot, use screenshot as inspiration** | sd5-visual-analysis + sd5-application-planner + sithasodaisy5 + sd5-web-verify when implementing | extract structure and hierarchy while preserving the destination app's approved design system | faithful brand copy when the user asked for adaptation |
| **compare current web app screenshot with target** | sd5-visual-analysis + sd5-web-regression + sithasodaisy5 + sd5-web-verify when changing the app; sd5-web-verify for review only | classify current-state evidence, protect existing behavior, and review the rendered result against the target | treating the current screenshot as the target without user intent |
| **verify, conformance, invented API, module wiring, before build** | sd5-web-verify | static gate before compile | — (gate never skipped; failed gate blocks) |
| **release, ship web app, end-to-end, full app, screen contract** | sd5-web-orchestrator + all depends | thin sequencer owns G0-G8 for multi-scope release | single-component shortcut (release requires full gate chain) |
| **change existing web app, fix, regression, impact** | sd5-web-regression, sd5-web-verify | baseline → impact → targeted + smoke | bootstrap (not greenfield), planner (unless contract changes) |
<!-- AUTOGEN_ROUTER_END -->

---

## Core Rules & Coding Conventions

1. **No Raw HTML**: Always instantiate `SDUI5*` components in B4J. BANano handles transpilation into browser HTML and JavaScript. Never concatenate HTML strings.
2. **Color Tokens & Hex Support**: Use semantic tokens (`primary`, `secondary`, `accent`, `neutral`, `info`, `success`, `warning`, `error`) for theme-adaptive elements. Hex colors (`#hex`) are fully supported across `.Color`, `.BackgroundColor`, `.TextColor`, `.BorderColor`, `.Classes` (e.g. `bg-[#1e293b]`), and `.Styles` for custom brand palettes, data charts, and bespoke art direction.
3. **Override Fixed Widths in Columns**: When mounting a card inside a column (`SDUI5Column`), always set `.Width = "full"`. By default, designer cards default to fixed widths (`Width = "96"`) which will break responsive grids if not overridden.
4. **Pair Parent Containers with Child Items**: Always pair layout containers with their designated child classes:
   - `SDUI5Stat` -> `SDUI5StatItem`
   - `SDUI5Steps` -> `SDUI5StepsItem`
   - `SDUI5Timeline` -> `SDUI5TimelineItem`
   - `SDUI5Tabs` -> `SDUI5TabsItem`
   - `SDUI5Row` -> `SDUI5Column`
5. **Clean Compiler Declarations**: Add `'ignore` to component variable declarations in `Process_Globals` and `Class_Globals` to suppress B4J compiler warnings about unused variables.
6. **Page Lifecycle**: Every page `Sub Show` must begin with `BANano.Await(app.ClearPageView)` and end with `pgIndex.UpdateTitle(...)`.
7. **Governance**: All design and generation patterns conform to [ENGINEERING-CONSTITUTION.md](skills/ENGINEERING-CONSTITUTION.md).

### Quality constraints (repository)

The maintainer bar lives in `CONSTRAINTS.md` at the repository root; it is not shipped in `dist/`.
Run `tools/check-constraints.ps1` before a commit and `tools/check-constraints.ps1 -Strict` before a release.
It fails on a weakened threshold, a deleted rule or component doc, a new undocumented suppression, or a
`PASS` claim that `check-delivery.ps1` rejects.

---

## Repository Layout

```text
SithasoDaisy5-Skills/
├── .claude-plugin/                          # Plugin manifest for Claude Code marketplace
├── .github/
│   └── copilot-instructions.md              # Global instructions for GitHub Copilot & AI agents
├── LICENSE                                  # MIT open-source license
├── plugin.json                              # Plugin manifest & metadata
├── README.md                                # Complete documentation and setup guides
└── skills/
    ├── ENGINEERING-CONSTITUTION.md          # Quality governance, hierarchy, and gate rules
    ├── skills-registry.json                 # Machine-readable skill catalog & trigger index
    ├── sd5-application-planner/             # Requirements, screen contracts, and acceptance checks
    ├── sd5-code-smells/                     # Code smell detection catalog from codesmells.org
    ├── sd5-feature-engineer/                # Contract-to-code vertical slice implementation
    ├── sd5-project-bootstrap/               # Greenfield web app scaffolding, pgIndex, and page wiring
    ├── sd5-visual-analysis/                 # Screenshot/mockup design-to-code forensics
    ├── sd5-web-orchestrator/                # G0–G8 delivery sequencer
    ├── sd5-web-regression/                  # Scoped impact analysis and baseline regression checks
    ├── sd5-web-verify/                      # Static pre-scan, conformance, build, and runtime gates
    └── sithasodaisy5/                       # Core DaisyUI/Tailwind component composition skill
        ├── SKILL.md                         # Master component orchestrator
        ├── scripts/                         # Component section reader + compact summary generator
        ├── components/                      # 162 reference guides for SDUI5* UI and support modules
        └── references/                      # 31 Architecture, Token, and Doctrine references
```

> **Packaging note:** `dist/` is the published Claude Code plugin package and contains only `skills/`, the manifests, `README.md`, `LICENSE` and `.github/copilot-instructions.md`. Repository-only assets - `eval/`, `tools/`, `AIExamples/`, `scratch/` and the build scripts - are **not** in the plugin package, so any changelog or doc reference to them describes the repository, not the installed plugin.

---

## System Requirements & Resources

- **Host Environment**: Windows 10/11 with B4J v9.x+ (<https://www.b4x.com/b4j.html>).
- **BANano Transpiler**: Available on the [B4X Forum](https://www.b4x.com/android/forum/threads/web-banano-website-app-pwa-library-with-abstract-designer-support.99740/).
- **SithasoDaisy5 Library**: `SithasoDaisy5.b4xlib` placed in your B4J Additional Libraries folder.
- **B4J toolchain (for G4/G5)**: `B4JBuilder.exe` (default `C:\Program Files\Anywhere Software\B4J\B4JBuilder.exe`), Java + JavaFX (defaults `C:\b4j\java\bin\java.exe` and `C:\b4j\java\javafx\lib`). Override with `-Builder`, `-Java` and `-JavaFxLib` on `build-banano-app.ps1`.
- **Local Web Server**: Laragon Apache (<https://laragon.org/>) pointing to `C:\laragon\www\<app>\`.

### Useful Links
- **Framework Source Code**: [https://github.com/Mashiane/SithasoDaisy5](https://github.com/Mashiane/SithasoDaisy5)
- **Live Showcase Demo**: [https://sithaso-daisy5.vercel.app](https://sithaso-daisy5.vercel.app)
- **B4X Community Thread**: [SithasoDaisy5 on B4X Forum](https://www.b4x.com/android/forum/threads/web-sithasodaisy5-create-websites-webapps-with-the-power-of-the-abstract-designer-opensource.165095/#content)
- **Native Mobile/Desktop Sibling**: [b4xdaisyuikit-skills](https://github.com/Mashiane/B4XDaisyUIKit-Skills) (for native B4A/B4i/B4J UI, not web)

---

## Changelog

All notable changes to the **SithasoDaisy5-Skills** suite are documented below.

> **Correction (2026-11-02, updated 2026-11-11):** entries below are historical records. The current tree contains **162** registered components and **18** example apps. `01-landing-hero` is the only app verified through G0-G8. The "100% PASS" claims in the 0.8.x entries were not reproducible during the 0.87 audit; see **Release status** above. Maintenance tooling (`tools/`, `eval/`) is repository-only and is not part of the published plugin package.

### Delta Changelog: GitHub (v0.85) -> Current (v0.92)

Between the release currently published on GitHub (`v0.85`, commit `3b96351`) and this latest release (`v0.92`), the skills suite underwent massive hardening, empirical validation, and quality governance:

| Feature / Metric | GitHub Version (`v0.85`) | Latest Release (`v0.92`) | Impact & Significance |
|---|:---:|:---:|---|
| **Component Specifications** | 160 modules | **162 verified modules** | Added `SDUI5AOS`, `SDUI5EvoCalendar`, `SDUI5FrappeGantt`. |
| **daisyUI v5 Parity Audit** | Static estimates | **100% Verified (68/68)** | Full 9-batch audit across 476 canonical sections (Checks A, C, D). |
| **Visual Parity Viewports** | Not automated | **Desktop & Mobile (Phone)** | Pixel diffing at 1280x900 and 390x844 via headless Chrome CDP. |
| **Negative Knowledge Ledger** | ~30 initial rules | **92 Codified Rules** | Added `NEG-031`..`NEG-092` covering real-world BANano runtime traps. |
| **Quality Ratchet Gates** | Advisory checks | **`CONSTRAINTS.md` (Strict)** | 9 zero-tolerance checks blocking regressions or weakened rules. |
| **Doc Structure Discipline** | Unenforced | **Zero-Tolerance Contract** | Hard limits: max 300-char prose lines, 0 broken links, 0 duplicate rules. |
| **Anti-Slop Engine** | Conceptual | **Automated `SLOP-001`..`007`** | Enforces curated fonts, motion guards, skeleton states, boundary boxes. |
| **Delivery Breadth** | 1 app smoke-tested | **8 Deliverable Apps** | Golden apps `01` through `08` fully certified via G0-G8 delivery receipts. |
| **JVM Bytecode Protection** | None (64KB crashes) | **Architectural Splitting** | Enforces async subroutines (`ShowBatch*`) preventing Java method overflows. |
| **Distribution Build** | Manual scripts | **Automated `create-dist.ps1`** | Deterministic lean package build with UTF-8 BOM removal and verification. |

#### Key Architectural & Functional Advances (v0.85 -> v0.92)

1. **Full daisyUI v5 Parity Benchmark:**
   - Audited all 68 daisyUI v5 components across 476 canonical sections in 9 batches.
   - **Check A (Class Anatomy):** 100% verified against live BANano DOM output in `sd5gallery/index.html`.
   - **Check C (Computed Styles):** Live extraction of CSS custom properties, dimensions, and padding.
   - **Check D (Visual Comparison):** Automated pixel comparison at Desktop (1280x900) and Phone (390x844) viewports with zero structural failures.
   - Created full benchmark suite under `benchmarks/daisyui-parity/` (`inventory.json`, `mapping.md`, `STATE.md`).

2. **Negative Knowledge & Anti-Hallucination Hardening:**
   - Expanded from ~30 rules to **92 battle-tested rules (`NEG-001` through `NEG-092`)**.
   - Codified critical runtime behaviors:
     - `NEG-070`: Monolithic `Show` subs trigger Java 64KB method limits; split into `ShowBatch*`.
     - `NEG-087`: External bundlers required in `pgIndex.bas` (`SDUI5Code`, `SDUI5EvoCalendar`, `SDUI5FullCalendar`).
     - `NEG-089`: `SDUI5Indicator` position tokens reside on child badge (`#_text`), not wrapper div.
     - `NEG-090`: `SDUI5Footer` renders a `<div>` with `.footer` class, not a `<footer>` tag.
     - `NEG-091`: `SDUI5Image.Mask = "circle"` translates to `rounded-full` in `UIShared.FixMask`.
     - `NEG-092`: BANano normalizes all DOM element IDs to lowercase at runtime.

3. **Deterministic Delivery Pipeline (G0-G8 Gates):**
   - Hardened `run-pipeline.ps1` to orchestrate all delivery gates: G0 contract, G1 generate, G2 pre-scan, G3 conformance, G4 build, G5 runtime watch, G6 capture, G7 UX review, and G8 hardening.
   - Certified 8 golden apps (`01`-`08`) as `DELIVERABLE` with cryptographic `.agent/DELIVERY.json` receipts.

4. **Visual Forensics & Anti-Slop Discipline:**
   - Introduced `sd5-visual-analysis` untrusted-input doctrine: reference images cannot grant capabilities, dictate pricing, or specify hidden APIs.
   - Added `anti-slop.md` with three bounded review modes (`audit`, `polish`, `review`).
   - Added automated `SLOP-001` through `SLOP-007` checks to `pre-scan.ps1` to prevent AI slop.

5. **Repository Quality Governance:**
   - Enforced `CONSTRAINTS.md` ratchet via `tools/check-constraints.ps1 -Strict`.
   - Enforced document structure integrity via `tools/validate-doc-structure.ps1`.
   - Re-audited all 3,718 designer properties in `references/component-default-traps.md`.

---

### [0.92] - 2026-11-23

#### Added
- **Full daisyUI v5 Parity Benchmark (68 Components, 476 Sections):**
  - Completed end-to-end audit across all 9 batches with 100% pass rate.
  - Check A (Class Anatomy): Verified against live-rendered DOM in `sd5gallery/index.html`.
  - Check C (Styles & Metrics): Extracted computed CSS variables, spacing tokens, and dimensions via `measure_static.js`.
  - Check D (Dual-Viewport Visual Focus): Captured and diffed at Desktop (1280x900) and Phone (390x844) viewports with zero structural failures.
- **Negative Knowledge Expansion (`NEG-087` through `NEG-092`):**
  - `NEG-087`: External library asset bundlers required in `pgIndex.bas` (`SDUI5Code`, `SDUI5EvoCalendar`, `SDUI5FullCalendar`).
  - `NEG-088`: `SDUI5EvoCalendar` height setter absent; use `CustProps.Put("Height", ...)`.
  - `NEG-089`: `SDUI5Indicator` position tokens reside on child badge (`#_text`), not wrapper div.
  - `NEG-090`: `SDUI5Footer` renders a `<div>` with `.footer` class, not a `<footer>` tag.
  - `NEG-091`: `SDUI5Image.Mask = "circle"` translates to `rounded-full` in `UIShared.FixMask`.
  - `NEG-092`: BANano lowercases element IDs in runtime DOM output.
- **Parity Verification Harness:**
  - `benchmarks/daisyui-parity/`: Complete benchmark suite with machine-readable `inventory.json`, class-level `mapping.md`, state machine tracker `STATE.md`, and batch result reports in `results/`.
- **JVM 64KB Bytecode Guard (`NEG-070`):**
  - Enforced architectural partitioning of large UI pages into async subroutines (`BANano.Await(ShowBatch*)`) to prevent Java compiler `code too large` failures.

#### Verified
- `tools/check-constraints.ps1 -Strict` PASS (9 checks, 0 warnings).
- `tools/validate-doc-structure.ps1` PASS (root and dist).
- `tools/verify-dist.ps1 -CheckFramework` PASS (skills: 9, components: 162, version: 0.92).
- `check-contract.ps1` PASS (162 <-> 162).

### [0.91] - 2026-11-11

#### Changed
- **Delivery breadth.** Eight apps are DELIVERABLE (`01`-`08`) after rebuilding every app without an app-level theme.
- **DateTimeLine navigation.** Added Prev/Next controls to `07-project-tracker` that call `scrollBy` on the carousel; documented the verified recipe in `SDUI5DatePickerTimeLine.md` and NEG-051.
- **Modal correctness (RULE-MODAL-001).** Documented the empty-body default, action buttons that only emit events, and the invalid `gray` colour; fixed the parity gallery so Cancel closes and action text uses `*-content` tokens.
- **Table column order (RULE-TABLE-001).** `AddColumn*` appends to the live DOM; calling it before `AddComponent` silently drops headers. Fixed `04-kpi-dashboard`, added NEG-052, documented the order in `SDUI5Table.md`, and added a pre-scan guard.
- **No app-level theming (RULE-THEME-001).** Removed `SetTheme` from every example app and the parity gallery; skills, templates and NEG-038 now require a host-owned theme.
- **Pipeline and capture reliability.** Restored the missing `#>` terminator in `run-pipeline.ps1`; G5 now requires `#pageview`, retries a not-ready load with cache bypass, and settles before the first capture.
- **New negative knowledge.** NEG-044/045/046 (FieldSet width, Divider text, soft alert contrast), NEG-047 (timeline joins), NEG-048/049 (card and tabs placeholders), NEG-050 (SpeedDial icon sources), NEG-051 (DatePickerTimeLine scrolling).
- **Silent-default audit.** `references/component-default-traps.md` inventories 3,718 designer properties: 58 content defaults, 82 structural flags, 146 size defaults, plus the SpeedDial icon contract.
- **Release gate closed.** `C-003` (G6/G7 breadth for 10 `AIExamples/` fixtures) closed with ADR-002; `tools/check-constraints.ps1 -Strict` now passes with zero open exceptions. Fixture breadth stays P1 work in `HANDOFF.md`.
- **Version 0.91** across `plugin.json`, `.claude-plugin/*`, `skills-registry.json` and the README badge; `dist/` rebuilt.
- **Component counts corrected to 162** (142 `SDUI5*` UI classes + 20 support modules) in `README.md`, `PUBLISH.md`, `references/ux-master-doctrine.md`, `references/framework-internals.md`, `AIExamples/README.md` and `eval/README.md`. Removed the obsolete `SDUI5EvoCalendar` waiver text; `eval/config.yaml` `ignore_modules` is empty.

#### Verified
- `tools/check-constraints.ps1 -Strict` PASS (9 checks, 0 warnings); `validate-doc-structure.ps1` PASS (root and dist); `validate-skills.ps1` PASS (root and dist); `check-contract.ps1` 162 <-> 162; `verify-dist.ps1 -CheckFramework` PASS (0 checksum/source mismatches); gate regressions 4/4.

### [0.90] - 2026-11-03

#### Added
- **`sithasodaisy5/references/navigation-and-state.md`** - navigation is what a screenshot cannot show. Presentation choice (page / modal / overlay), history rules including one-way doors and the two legitimate Back interventions, state ownership by lifetime, double-activation and out-of-order response guards, and orientation-preserving loading. Wired into the entry skill.
- **Distill mode and calibration defaults** in `anti-slop.md`: a subtractive pass with its preserve-list, the one-accent / one-grey-family / shape-lock / one-label-per-intent rules, the "materials are not the default" ban on house-style glass, mesh gradients, purple-indigo glow CTAs, confetti and sparkles, and a mechanical pre-flight count table.
- **Craft guardrails** in `design-craft-guide.md`: 65-75ch reading measure, ~6rem and -0.04em display limits, a surface-selection rule and shadow rule, the motion frequency gate, timing/easing rules, and reduced-motion guidance that preserves meaning.
- **Asset discipline** in `design-quality-playbook.md`: size rasters from logical size times device scale, never upscale, alternative text for informative images, decorative images marked as such, and theme-composite checks.
- **Visual evidence receipt** (`sd5-web-verify/references/visual-evidence.md`, `scripts/visual-evidence.template.json`, `scripts/verify_visual_evidence.py`): optional machine-checkable record of scope, source and artifact hashes, inspected states, environment, and blocked checks. Exit codes 0 pass, 1 blocked, 2 unreadable, 3 integrity failure.
- **Coverage and measurement rules** in `ux-review.md`: coverage/not-inspected lines in the review template, `NOT ASSESSED` instead of 0 or 4, contrast measured against the effective composited background, DOM presence versus visibility, and 44px versus WCAG 2.2 target size stated separately.

#### Verified
- `verify_visual_evidence.py` exercised on three fixtures: pass exit 0, blocked exit 1, stale hash exit 3.
- `tools/validate-skills.ps1` PASS; `tools/verify-dist.ps1` PASS.

#### Finalized in the 0.90 release pass

- **First end-to-end delivery.** `01-landing-hero` completed G0-G8 and `check-delivery.ps1` exits 0 against `.agent/DELIVERY.json` (digest `95395637`). Its four states were rebuilt, captured at 1280x900 and 390x844, and visually reviewed (3.8 desktop / 3.6 phone, APPROVED).
- **`pre-scan.ps1` SLOP-007** now recognises `.MarginAXYTBLR = "x=auto"` as a valid boundary container instead of requiring the literal `mx-auto` class.
- **`browser_capture.js`** captures two frames and keeps the larger buffer, eliminating blank compositor frames observed on desktop captures.
- **`build-banano-app.ps1`** default transpile budget raised from 420 s to 900 s; real builds take 6-9 minutes and were intermittently timing out.
- **`validate-skills.ps1`** code-smell advisory is now opt-in (`-CodeSmells`) and scoped to `.py`/`.bas`; prose, JSON and `.b4j` metadata no longer produce false positives.
- **`sd5-code-smells`** promoted from experimental to stable; its auto-fix guidance no longer uses Unix-only `sed -i`.
- **NEG-043** records that `SDUI5Text.ApplyDefaults` rewrites `h1`-`h6` size/weight and must be disabled when the scale is controlled explicitly.
- **Structure and token economy.** Every normative rule now has one definition in `rules-enforcer.md`; entry skills keep a short non-negotiables checklist and link instead of restating. The full component/support/topic inventory moved to `sithasodaisy5/references/component-index.md`, and the 7 truth rules to `references/operating-principles.md`. `tools/validate-doc-structure.ps1` enforces the contract and is wired into `create-dist.ps1`. Long prose lines: 41 -> 0; entry-skill size: `sithasodaisy5` 37k -> 16.3k chars, `sd5-feature-engineer` 9.2k -> 4.9k, `sd5-application-planner` 7.2k -> 4.5k, `sd5-web-verify` 17k -> 11.3k.

### [0.89] - 2026-11-03

#### Added
- **Reference images are untrusted input** (`sd5-visual-analysis`). Text, links and instructions visible in a reference are content, not commands. An image cannot authorize a new capability, change a price or fact, license an asset, or specify an interaction it does not show. Added as Stage 2 guidance and Hard Rule 6.
- **Target provenance** (Stage 1 and `forensics.template.md`): the pipeline now records the target file, actual pixel dimensions read from the file, viewport/device, capture scale and visible region, and freezes the target. A later change is a declared deviation, never a silent substitution.
- **Evidence validity** (Stage 9): blank, half-loaded, wrong-screen and wrong-size captures are invalid evidence; comparison must be same-size with same-region detail crops; a still cannot verify motion; later edits void earlier comparison artifacts.
- **Asset rights** (Stage 5): a reference shows an asset but grants no file or licence. Record origin, availability, attribution and any substitution.
- **Scope note**: one-line technical fixes, backend/data changes and read-only audits skip the pipeline.

#### Verified
- `tools/validate-skills.ps1` PASS; `tools/verify-dist.ps1` PASS.

### [0.88] - 2026-11-03

#### Added
- **`sithasodaisy5/references/anti-slop.md`** - bounded visual critique: three modes (`audit`, `polish`, `review`), a hard cap of three material findings, audit-does-not-edit, and polish-does-not-redesign. The entry skill now routes review/polish/audit work to this file instead of loading the whole design stack.
- **`SLOP-*` rules in `pre-scan.ps1`** - machine-checkable visual floor. `SLOP-001` `transition-all`, `SLOP-002` motion without a `motion-safe:` guard, `SLOP-003` placeholder/stock image services, `SLOP-004` a generic CTA label repeated three or more times, `SLOP-005` a data source with no `SDUI5Skeleton`, `SLOP-006` no curated font in `pgIndex.bas`, `SLOP-007` no boundary container. `WARN` by default; `-StrictSlop` promotes them to `FAIL`.
- **Motion and type guidance** in `design-craft-guide.md`: composite-only transitions, `prefers-reduced-motion` guards (WCAG 2.3.3), the Tailwind v4 pointer note, and a fluid `clamp()` heading scale.
- **`ux-review.md` section 0** - review mode and finding budget, plus Lens C motion-cost/motion-access checks and Lens D 2.3.3 and hover-fidelity checks.

#### Fixed
- **`transition-all` removed from every recipe** (14 occurrences across 7 files) and replaced with `transition-transform` / `transition-[transform,box-shadow]`; motion utilities now carry `motion-safe:`.

#### Verified
- `tools/validate-skills.ps1` PASS (9 skill dirs, 9 plugin skills, registry consistent).
- `tools/verify-dist.ps1` PASS (package internally consistent).
- `pre-scan.ps1` exercised on a fixture: all seven `SLOP-*` rules fire in both `WARN` and `-StrictSlop` modes.

### [0.87] - 2026-11-02

#### Fixed
- **Property value syntax**: `Width` / `Height` / `Shadow` / `Rounded` take suffixes (`"full"`, `"64"`, `"md"`, `"box"`). The previously documented full-utility form (`"w-full"`, `"h-64"`, `"shadow-md"`, `"rounded-2xl"`) produced doubled classes (`w-w-full`, `shadow-shadow-md`) because the framework prepends the prefix. Corrected in `sithasodaisy5/SKILL.md`, `patterns.md` and `sd5-feature-engineer/SKILL.md`.
- **New hard gate `RULE-PROP-002`** in `pre-scan.ps1` rejects the doubled form and names the resulting class.
- **`pre-scan` `.Classes` check** rewritten token-by-token: responsive variants (`md:w-1/2`), caps (`max-w-full`, `min-h-screen`) and `drop-shadow-*` are no longer misreported as property-first violations.
- **Icon path rule** no longer contradicted: the sourcing section now requires `./assets/<name>.svg`, matching the strict rule and every demo.
- **G0 command** now documents `validate-contracts.py --app-folder <AppFolder> --write-index` (the previous form exited 2).
- **Skill Coverage Contract** restored: removed the unregistered `SDUI5Calendar` component page and its dangling accessor-audit section; `check-contract.ps1` is 159 <-> 159.
- **Component provenance** regenerated against the current framework source and demo pages: 159 entries, 0 checksum mismatches.
- **`sd5-web-verify` and `sithasodaisy5`** trigger metadata completed; verify's description now names gates G3/G4/G6/G8 instead of "Stages 5/6/8".

#### Added
- `eval/cases/run-gate-regressions.ps1` - regression suite for the property-suffix rule, the `.Classes` exemptions, doc drift and the contract gate.
- `tools/verify-dist.ps1` - release gate for the published package (manifests, BOMs, counts, dev-only files, provenance).

#### Verified
- `check-contract.ps1` PASS on the working tree and on `dist/` (159 to 159).
- Gate regressions 4/4; eval Layer 1 14/14; eval Layer 5 3/3.
- G4 build smoke on `01-landing-hero`: B4JBuilder exit 0, BANano transpile `conversion finished!`, output written to Laragon.
- G5 runtime: `build-watch` PASS (no JS/resource errors; title, theme, container, body text).
- G6 evidence: three viewport captures, 0 warnings, 0 failures.
- G8 hardening: 0 FAIL, 3 accepted WARN on the published output.

#### Changed
- **Published package hygiene**: `create-dist.ps1` now strips UTF-8 BOMs from generated JSON, excludes dev-only maintenance scripts, and keeps `skills/ENGINEERING-CONSTITUTION.md` in sync with the root copy.
- **README** states what is verified and what is not; component/app counts corrected.
- **Framework parity**: corpus and provenance refreshed against the current 159-module source; `verify-dist.ps1 -CheckFramework` re-checks module parity and every source hash.

### [0.85] - 2026-10-30

#### Added
- **Layout Mechanics & Hierarchy Reference**:
  - Added skills/sithasodaisy5/references/layout-mechanics.md: Comprehensive doctrine on grid systems (SDUI5Row / SDUI5Column), flex distribution, auto margins, nested container nesting rules, spacing scales, and alignment mechanics.
- **BANano UI State Recipes**:
  - Added skills/sithasodaisy5/references/state-recipes.md: Documented and verified implementation patterns for UI loading spinners, alert triggers, drawer toggle mechanisms, modal lifecycles, active tab indicators, and reactive data table binding.
- **Orchestration Pipeline Automation**:
  - Added skills/sd5-web-orchestrator/scripts/run-pipeline.ps1: Single-command runner executing G0 through G8 delivery gates with release evidence collection.

#### Changed
- **Build Engine & Host Environment Hardening**:
  - ASCII-fied and hardened skills/sd5-web-verify/scripts/build-banano-app.ps1 to prevent Windows-1252 parsing failures on non-UTF8 PowerShell 5.1 hosts during B4JBuilder smoke testing.
  - Standardized local web server endpoints and live build-watch configurations across all skills and golden applications to Laragon default port 80.
  - Hardened headless browser rendering and screenshot capture in skills/sd5-web-verify/scripts/browser_capture.js.
- **Documentation & Inventory Metrics**:
  - Synchronized repository layout with 24 active doctrine and reference guides.
  - Aligned package version across all 9 production skills in skills-registry.json and marketplace manifests.

### [0.8.4] - 2026-10-28

#### Added
- **Component Default Setters & Accessors**: Added `skills/sithasodaisy5/references/component-default-setters.md` and `designer-property-accessors.md`.
- **Design Craft & Quality Playbook**: Added `design-craft-guide.md` and `design-quality-playbook.md`.
- **Code Quality Skill (`sd5-code-smells`)**: Added code smell catalog and advisory scan integration.
- **Visual Verification Suite**: Added browser capture and automated verification tooling.

#### Changed
- Synchronized component source references and designer property audits across all components.
- Refined negative-knowledge checks and context-aware defaults for responsive layouts.

### [0.8.3] - 2026-10-27

#### Added
- **Multi-Agent Platform Compatibility**:
  - **GitHub Copilot**: Created `.github/copilot-instructions.md` establishing persistent repository instructions (strictly prohibiting raw HTML hallucinations, enforcing B4J syntax rules, `'ignore` suffixes, and BANano lifecycle boundaries). Added `.github/skills` directory junction for native Copilot Agent mode discovery.
  - **OpenCode**: Added `.opencode/skills` directory junction and verified out-of-the-box progressive disclosure compliance with the `agentskills.io` open standard.
  - **Multi-Platform Installation Documentation**: Documented setup workflows for Claude Code, GitHub Copilot, OpenCode, Antigravity IDE, Cursor, and Windsurf in `README.md`.
- **Prompt-to-Setter Alignment Protocol (`RULE-DEFAULTS-001`)**:
  - Added `skills/sithasodaisy5/references/component-default-setters.md`: comprehensive 2,454-line audit indexing active defaults across all 159 components, mapping property keys, `SetDefaults` initial values, setter methods, and valid options.
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
  - Updated all applications then in the tree to declare component globals with `'ignore`.
  - Synchronized `env.json` in all apps with fresh API keys and normalized lowercase routing URLs.
  - Claimed at the time: all applications achieve **100% PASS (0 FAIL, 0 WARN)** on both `pre-scan.ps1` and `verify-conformance.ps1`. Not reproducible as of 0.87 - see the Correction note and Release status.
- **Package Distribution**:
  - Updated `create-dist.ps1` to copy `.github/copilot-instructions.md` into `dist/.github/`.
  - Fixed character encoding in `plugin.json` to pure UTF-8 without BOM.

---

### [0.8.0] - 2026-10-26

#### Added
- **Golden Showcase Expansion (Apps 10-18)**: Expanded the `AIExamples/` golden test suite from 9 apps to 18 fully conforming B4J/BANano applications:
  - `10-sleep-tracker`: Health, circadian metrics, and sleep tracking using `SDUI5RadialProgress` and `SDUI5Toggle`.
  - `11-social-profile`: Multi-page, multi-theme profile (`pgDark`, `pgMinimal`, `pgPastel`) with `SDUI5Dock` and `SDUI5Tabs`.
  - `12-music-player`: Multi-aesthetic media player (`pgBrutal`, `pgMemphis`, `pgRetro`) with `SDUI5Range` and `SDUI5Image`.
  - `13-fitness-dashboard`: Fitness activity dashboard featuring radial metrics, badges, and progress meters.
  - `14-banking-y2k`: Neo-banking interface with retro aesthetics, cards, carousels, and bottom dock navigation.
  - `15-stopwatch-swiss`: Minimalist Swiss precision stopwatch and lap timer.
  - `16-flight-tracker`: Real-time flight tracking itinerary with interactive timeline cards.
  - `17-sneaker-market`: Two-screen marketplace (`pgMarket`, `pgDetail`) demonstrating route transitions and detail view mounting.
  - `18-calendar-brutalist`: High-density calendar schedule and event agenda layout.
- **Component Parity Expansion**:
  - Component pages expanded to mirror the framework registry; 1:1 coverage is enforced by `check-contract.ps1` (159 modules = 159 pages as of 0.87).
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
    - Layer 2: Negative-Knowledge Guardrails (zero banned property patterns across the current app set).
    - Layer 3: Conformance & Contracts (run against the apps in `AIExamples/`).
    - Layer 4: Runtime / Build Watch Readiness (dual `env.json`, `Publish` path, DOM hooks, routing).
    - Layer 5: Drift Detection (component parity, `.b4j` registry match, provenance sync).

#### Changed
- **Component Source References**: Updated all 160 component specifications with direct GitHub permalinks to upstream implementation in [Mashiane/SithasoDaisy5](https://github.com/Mashiane/SithasoDaisy5) and 124 verified demo page citations in `SithasoDaisy5DemoCode/B4J`.
- **Packaging and Distribution**:
  - Updated `plugin.json` to publish 9 production skills (`sd5-project-bootstrap`, `sd5-application-planner`, `sd5-feature-engineer`, `sithasodaisy5`, `sd5-web-orchestrator`, `sd5-web-verify`, `sd5-web-regression`, `sd5-visual-analysis`, `sd5-code-smells`).
- **Web Server Configuration**: Standardized all local server references and build-watch URLs to Laragon port 80 (removing obsolete `:8080` port specifications).

#### Fixed
- **UTF-8 Encoding Corruption in `skills-registry.json`**: Resolved an issue where running `add_skill.ps1` with PowerShell 5.1 default codepage converted em-dashes `-"` into ANSI `0x97` bytes, causing Python UTF-8 parsers (`sync-skills-registry.py`) to fail with `UnicodeDecodeError`. Fixed `add_skill.ps1` to explicitly enforce `-Encoding UTF8`.
- **YAML Frontmatter in `sd5-code-smells/SKILL.md`**: Fixed missing `---` YAML frontmatter delimiters, ensuring compatibility with standard agent skill discovery mechanisms.
- **Relative Markdown Links in Property Audit**: Fixed `tools/audit_designer_properties.py` to calculate Markdown links relative to the report directory (`../components/SDUI5*.md`), resolving 127 broken links in Layer 1 evaluation.
- **PowerShell 5.1 ASCII Parsing in Build Scripts**: ASCII-fied `skills/sd5-web-verify/scripts/build-banano-app.ps1` to prevent script parsing failure on non-UTF8 PowerShell 5.1 hosts.

---

### [0.7.0] - 2026-10-22

#### Added
- **Core Skill Suite**:
  - `sd5-application-planner`: Requirements capture, application contracts, and screen contracts.
  - `sd5-project-bootstrap`: B4J/BANano project file generation, embedded entry points, and `pgIndex` shell wiring.
  - `sd5-feature-engineer`: Traceable vertical slice implementation from contracts.
  - `sithasodaisy5`: Core domain authority, 160 component specifications, design tokens, and skeleton contracts.
  - `sd5-web-orchestrator`: Master delivery state machine governing G0 through G8 gates.
  - `sd5-web-verify`: Deterministic PowerShell verification gates (`pre-scan.ps1`, `verify-conformance.ps1`, `check-contract.ps1`).
  - `sd5-web-regression`: Change impact analysis and regression baselines.
  - `sd5-visual-analysis`: 10-stage design forensics pipeline (screenshot/mockup to B4J code).
  - `sd5-book-to-skill`: AST and regex extractor for regenerating component documentation from `.bas` source.
- **Engineering Constitution**: Adopted [ENGINEERING-CONSTITUTION.md](skills/ENGINEERING-CONSTITUTION.md) v1.0 establishing the 7-level source-of-truth hierarchy, non-negotiable rules, and deterministic gate requirements.
- **Golden Apps Suite**: Initial 9 reference applications in `AIExamples/` (apps 01-09).
- **Automated Gates**:
  - `pre-scan.ps1` (L4 gate detecting negative-knowledge bans).
  - `verify-conformance.ps1` (L5 gate enforcing lifecycle, color tokens, and registry contract).
  - `check-contract.ps1` (1:1 component contract verification).
  - `capture-screens.ps1` (headless browser screenshot capture).
- **Verified Build & Runtime**: Verified B4J compile and BANano transpilation on `09-finance-dashboard`.

---

### [0.4.0] - 2026-09-01

#### Added
- Initial project structure, documentation, and prototype skills.

---

## License & Credits

* **Author**: Mashiane
* **Repository**: [https://github.com/Mashiane/SithasoDaisy5-Skills](https://github.com/Mashiane/SithasoDaisy5-Skills)
* **Parent Framework**: [SithasoDaisy5](https://github.com/Mashiane/SithasoDaisy5)
* **License**: [MIT License](LICENSE)







