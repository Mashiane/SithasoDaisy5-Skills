# Bootstrap skill evaluation cases

Use these prompts to review whether the bootstrap skill leads to source-backed project wiring. They define expected behavior; they are not claims that a generated app has been compiled or browser-tested.

## Case 1: Greenfield two-page app

**Prompt**

> Create a small B4J/BANano SithasoDaisy5 app called FieldNotes with a home page and a notes page. Use a simple app shell with a menu route to each page and one card with a button on the home page. Keep it local and leave backend integration out.

**Reference evidence**

- `skills/sithasodaisy5/references/app-scaffolds.md` project, app-shell, and page templates.
- Framework `SDUI5App.bas`, `SDUI5Card.bas`, `SDUI5Button.bas`, and `SithasoDaisy5.b4j`.
- Demo `B4J/SithasoDaisy5DemoCode.b4j`, `B4J/pgIndex.bas`, `B4J/pgCard.bas`, and `B4J/pgButtons.bas`.

**Pass criteria**

- Produces a `.b4j` project with the embedded entry module, `pgIndex`, and two page modules; does not invent a separate `Main.bas`.
- Registers every new page module and keeps `NumberOfModules` consistent.
- Keeps app shell minimal; includes only the requested navigation and required components.
- Uses `SDUI5Card` and `SDUI5Button` only with APIs confirmed in source/component docs and demo-backed usage.
- Builds parents before children, awaits component creation before mounting into a child region, and identifies a demo as evidence rather than copying unrelated business logic.
- States whether a real B4J/BANano build and browser run were performed.

**Fail conditions**

- Copies demo-specific DB credentials, environment variables, optional asset bundles, all demo routes/loaders, or backend logic without need.
- Omits page module registration, invents methods/properties, or claims build success without a build.

## Case 2: Add one page to an existing app

**Prompt**

> In my existing B4J/BANano SithasoDaisy5 app, add a Help page reachable from the current drawer menu. Keep the current shell, route naming, and project settings unchanged except for the new page wiring.

**Reference evidence**

- The user's existing `.b4j` project file, `pgIndex.bas`, and one neighboring page module.
- `skills/sd5-web-verify/scripts/verify-conformance.ps1` for current project gates.
- The chosen page's component source and component-specific demo if it uses new UI components.

**Pass criteria**

- Inspects and preserves the existing project and route conventions instead of replacing the shell with the large demo shell.
- Adds one page module, the matching `ModuleN=` entry and count update, and the requested route/menu entry.
- Uses only source-verified component APIs; avoids unrelated page, backend, asset, or global-loader changes.
- Reports any missing component demo as source-only evidence and does not claim runtime verification unless performed.

**Fail conditions**

- Rewrites `pgIndex` or project settings wholesale, adds a second app initializer, forgets module registration, or uses speculative component/event APIs.
