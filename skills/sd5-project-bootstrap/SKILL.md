---
name: sd5-project-bootstrap
description: Create or extend a code-first B4J/BANano web app that uses SithasoDaisy5. Use for project setup, embedded app entry, page module wiring, app shell startup, asset loading, and first-page composition; consult sithasodaisy5 for component APIs and screen design.
metadata:
  category: technique
  triggers: new SithasoDaisy5 app, B4J BANano scaffold, project bootstrap, add page module, wire pgIndex, app entry point
---

# SithasoDaisy5 Project Bootstrap

Use this skill to create a working B4J/BANano project structure and wire its first pages to the SithasoDaisy5 library. Follow the project's actual conventions and the supplied app scaffold; the component source defines APIs, and demo pages show concrete usage.

This skill handles project and page wiring. For detailed visual composition, read `../sithasodaisy5/SKILL.md`; for a complete multi-stage app workflow, use `../sd5-web-orchestrator/SKILL.md`.

## Workflow

1. **Inspect before scaffolding.** For an existing app, read its `.b4j` project file, embedded entry module, `pgIndex`, representative page, and referenced skill gates. Preserve its conventions. For a new app, read the relevant sections of [the app scaffold reference](../sithasodaisy5/references/app-scaffolds.md) before creating files.
2. **Choose the smallest useful shell.** Decide which app shell, routes, pages, components, external assets, and optional dependencies the request needs. The demo app is a rich example, not a requirement to copy its full navigation shell, backend settings, metadata, or asset bundle.
3. **Create or update project wiring.** Keep B4J project metadata and the embedded main entry module in the `.b4j` file. Register each new B4J page module in `ModuleN=` and keep `NumberOfModules` consistent. Preserve required library references from the scaffold or existing app. Do not invent a separate `Main.bas` when the project uses the embedded entry point.
4. **Initialize the browser app.** Follow the verified project pattern for `AppStart`, BANano configuration/build, `BANano_Ready`, and `pgIndex.Initialize`. If `BANano_Ready` calls an async `pgIndex.Initialize`, use `BANano.Await(pgIndex.Initialize)`. Keep app-specific environment variables, API credentials, publishing paths, PWA metadata, and server assumptions out of the scaffold unless the user needs them.
5. **Build the app shell and page registry.** Initialize the app once in `pgIndex`. Load only the optional `UsesX` assets required by the selected components. Create parent containers before mounting children. Add menu routes only when the requested app needs menu navigation; direct page calls are also used in the demos.
6. **Add pages and components.** Start from the page conventions in [the app scaffold reference](../sithasodaisy5/references/app-scaffolds.md). Every standalone `pg*.bas` module must begin with the complete B4J static-code designer header from `pgPage.template.bas` (`B4J=true` through `@EndOfDesignText@`) before any comments or code. Confirm every chosen class and API in its component reference and `.bas` source. Use a demo page to confirm instantiation, property assignment, event wiring, and composite mount points where available. Await each `AddComponent` before mounting a child into its DOM node. **Propagate BANano async work through every call level:** when a helper sub contains `BANano.Await(...)`, call that helper from its caller as `BANano.Await(HelperSub)` and wait for it to finish before starting dependent DOM work. In particular, `Show` must await each `Build*` helper that awaits component mounts internally, and `pgIndex.Initialize` must await the initial page's `Show`.
7. **Wire files and optional libraries.** Copy only app-owned assets the page uses. Keep `Files/`, `FileN=`, `FileGroupN=`, and `NumberOfFiles` consistent. Do not duplicate framework-bundled files. Confirm each optional dependency's loader in `SDUI5App.bas` and load it before the page uses that dependency.
8. **Check the result.** Confirm project module names match actual files, startup reaches `pgIndex`, page calls resolve, component APIs are source-backed, and asset/loader references are valid. Run the applicable `sd5-web-verify` static gates. When the request is for a working/runnable app, also run `build-banano-app.ps1` and record its B4JBuilder and BANano outcomes; a successful static scan does not prove a build or browser render. Report build and runtime verification separately.

## Evidence rules

- Framework `.bas` source and `SithasoDaisy5.b4j` project registration establish the current API and buildable class set.
- `0SithasoDaisy5DemoCode\B4J\SithasoDaisy5DemoCode.b4j`, `pgIndex.bas`, and component-specific `pg*.bas` files establish demonstrated project and usage patterns.
- A demo's page layout, navigation, backend, `env.json`, file registry, or personal project settings are app-specific unless another source makes them a framework requirement.
- If a class has no real demo instantiation, state that the recommendation is source-backed but not demo-verified.
- Keep forms, validation behavior, keyboard traversal, and IME behavior out of this skill unless the user asks to include them.

## References

- [Verified bootstrap workflow and evidence map](references/bootstrap-workflow.md)
- [Canonical app and page templates](../sithasodaisy5/references/app-scaffolds.md) — annotated guide; copy-ready files below
- [project.template.b4j](references/project.template.b4j) — minimal `.b4j` (5 libraries, pgIndex+pgHome, embedded entry with AppName/Publish/ServerIP)
- [pgIndex.template.bas](references/pgIndex.template.bas) — minimal shell (app + navbar + pageview + first page); grow to full drawer shell per app-scaffolds §2 when needed
- [pgPage.template.bas](references/pgPage.template.bas) — basic page (117+ demo shape, lowercase app, UpdateTitle last)
- [pgPageCrud.template.bas](references/pgPageCrud.template.bas) — data/CRUD page (table + modal, Build/Mount split; demos' uppercase App corrected)
- [env.template.json](references/env.template.json) — runtime config (empty secrets; per-key change table in app-scaffolds §1c)
- [SithasoDaisy5 component and design guidance](../sithasodaisy5/SKILL.md)
- [App delivery sequence](../sd5-web-orchestrator/SKILL.md)
- [Static, build, and visual checks](../sd5-web-verify/SKILL.md)
