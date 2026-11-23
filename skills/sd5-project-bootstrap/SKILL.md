---
name: sd5-project-bootstrap
description: Create or extend a code-first B4J/BANano web app that uses SithasoDaisy5. Use for project setup, embedded app entry, page module wiring, app shell startup, asset loading, and first-page composition; consult sithasodaisy5 for component APIs and screen design.
metadata:
  category: technique
  triggers: new SithasoDaisy5 app, B4J BANano scaffold, project bootstrap, add page module, wire pgIndex, app entry point
---

# SithasoDaisy5 Project Bootstrap

Create a working B4J/BANano project structure and wire its first pages to SithasoDaisy5.
Follow the project's conventions and the supplied scaffold; component source defines APIs, and demo pages show concrete usage.

This skill handles project and page wiring. For visual composition read `../sithasodaisy5/SKILL.md`; for a complete workflow use `../sd5-web-orchestrator/SKILL.md`.

## Workflow

1. **Inspect before scaffolding.** For an existing app, read its `.b4j`, embedded entry module,
   `pgIndex`, a representative page, and the referenced gates. Preserve its conventions.
   For a new app, read the relevant sections of [the scaffold reference](../sithasodaisy5/references/app-scaffolds.md) first.
2. **Choose the smallest useful shell.** Decide which shell, routes, pages, components, assets, and optional dependencies the request needs. The demo app is a rich example, not a copy target.
3. **Create or update project wiring.**
   - Keep B4J metadata and the embedded main entry in the `.b4j` file.
   - Register each new page in `ModuleN=` and keep `NumberOfModules` consistent.
   - Preserve required library references from the scaffold or existing app.
   - Do not invent a separate `Main.bas` when the project uses the embedded entry point.
4. **Initialize the browser app.**
   - Follow the verified pattern for `AppStart`, BANano configuration/build, `BANano_Ready`, and `pgIndex.Initialize`.
   - If `BANano_Ready` calls an async `pgIndex.Initialize`, use `BANano.Await(pgIndex.Initialize)`.
   - Keep app-specific environment variables, credentials, publish paths, and PWA metadata out of the scaffold unless needed.
5. **Build the shell and page registry.**
   - Initialize the app once in `pgIndex`.
   - Load only the optional `UsesX` assets required by the selected components.
   - Create parent containers before mounting children.
   - Add menu routes only when the app needs menu navigation; direct page calls are also used in the demos.
6. **Add pages and components.**
   - Every standalone `pg*.bas` starts with the complete static-code header from `pgPage.template.bas` (`B4J=true` through `@EndOfDesignText@`).
   - Confirm every class and API in its component reference and `.bas` source.
   - Use a demo page to confirm instantiation, property assignment, event wiring, and mount points.
   - Await each `AddComponent` before mounting a child into its DOM node.
   - Propagate async work through every call level: if a helper awaits, call it as `BANano.Await(HelperSub)`.
   - `Show` must await each `Build*` helper; `pgIndex.Initialize` must await the first page's `Show`.
7. **Wire files and optional libraries.**
   - Copy only app-owned assets the page uses.
   - Keep `Files/`, `FileN=`, `FileGroupN=`, and `NumberOfFiles` consistent.
   - Do not duplicate framework-bundled files.
   - Confirm each optional dependency's loader in `SDUI5App.bas` and load it before the page uses it.
8. **Check the result.**
   - Module names match files; startup reaches `pgIndex`; page calls resolve.
   - Component APIs are source-backed; asset and loader references are valid.
   - Run the applicable `sd5-web-verify` static gates.
   - For a runnable app, also run `build-banano-app.ps1` and record B4JBuilder and BANano outcomes.
   - Report build and runtime verification separately; a successful static scan does not prove either.

## Evidence rules

- Framework `.bas` source and `SithasoDaisy5.b4j` registration establish the API and buildable class set.
- Demo project files and component-specific `pg*.bas` files establish project and usage patterns.
- A demo's layout, navigation, backend, `env.json`, file registry, or personal settings are app-specific unless another source makes them a framework requirement.
- If a class has no real demo instantiation, state that the recommendation is source-backed but not demo-verified.
- Keep forms, validation, keyboard traversal, and IME behavior out of this skill unless the user asks to include them.

## References

- [Verified bootstrap workflow and evidence map](references/bootstrap-workflow.md)
- [Canonical app and page templates](../sithasodaisy5/references/app-scaffolds.md)
- [project.template.b4j](references/project.template.b4j) - minimal `.b4j`
- [pgIndex.template.bas](references/pgIndex.template.bas) - minimal shell
- [pgPage.template.bas](references/pgPage.template.bas) - basic page
- [pgPageCrud.template.bas](references/pgPageCrud.template.bas) - data/CRUD page
- [env.template.json](references/env.template.json) - runtime config
- [Component and design guidance](../sithasodaisy5/SKILL.md)
- [App delivery sequence](../sd5-web-orchestrator/SKILL.md)
