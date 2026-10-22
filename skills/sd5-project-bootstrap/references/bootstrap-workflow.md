# Bootstrap workflow: verified project shape

This reference records the project conventions used by the starter workflow and distinguishes reusable wiring from conventions specific to the large demo app. Read it when creating a project or wiring pages; use the component catalog for detailed component properties.

## Evidence locations

| Topic | Framework source | Demonstrated project/page |
|---|---|---|
| App initialization and optional asset loaders | `C:\b4j\workspace\0SithasoDaisy5\SDUI5App.bas` (`Initialize` near line 611; `UsesX` methods near lines 844–1007 and 2181–2277) | `C:\b4j\workspace\0SithasoDaisy5DemoCode\B4J\pgIndex.bas` (`Initialize` near line 25) |
| Page component lifecycle and parent assignment | `C:\b4j\workspace\0SithasoDaisy5\SDUI5Page.bas` and individual component `.bas` files | `pgCard.bas`, `pgButtons.bas`, and the matching component-specific `pg*.bas` page |
| Project libraries and module registration | `C:\b4j\workspace\0SithasoDaisy5\SithasoDaisy5.b4j` | `C:\b4j\workspace\0SithasoDaisy5DemoCode\B4J\SithasoDaisy5DemoCode.b4j` |
| Entry point and BANano startup | BANano project entry in `.b4j`; framework library build in the framework project's embedded build module | Embedded `AppStart` and `BANano_Ready` in `SithasoDaisy5DemoCode.b4j` |
| Full copyable skeleton | Skills repo scaffold reference | `C:\b4j\workspace\0SithasoDaisy5Skills\skills\sithasodaisy5\references\app-scaffolds.md` |

The skills project's app scaffold is the starting template. When it differs from a user's existing project, inspect both sources and preserve the user's project structure while keeping generated calls source-backed. Do not assume a newer or larger demo page is a canonical template without checking it. The current reference demo calls `BANano.Initialize("BANano", AppName, DateTime.Now, AppName)`; use the installed toolchain's demonstrated signature.

## Project file and entry point

The demonstrated B4J project combines project metadata and the main module in one `.b4j` file. Metadata declares libraries, B4J modules, file resources, counts, and the `@EndOfDesignText@` separator. The entry module after the separator contains startup code, including `AppStart` and `BANano_Ready`.

The skills repo's scaffold provides a minimal greenfield metadata block and entry sample. Adapt its libraries and build settings to the installed toolchain and requested app. Keep these checks:

- Every referenced page module exists and is registered in the project file.
- `NumberOfModules`, `NumberOfLibraries`, and `NumberOfFiles` agree with their corresponding entries.
- Project `ModuleN=` entries can include path-qualified shared modules; distinguish them from local page names.
- Keep the entry point embedded in the `.b4j` project when following this demonstrated structure. Do not generate `Main.bas` by habit.
- BANano initializer arguments differ across the checked examples (three in the skill examples and four in the full demo). Preserve the signature in the chosen current scaffold/project or verify the installed BANano API; do not normalize it based on one example.

The full demo's `BANano_Ready` reads `assets/env.json` and fills backend/version globals before calling `pgIndex.Initialize`. Those environment fields and reload behavior are optional app-specific setup, not required for a blank UI app.

## App shell and page registry

The demo's `pgIndex.Initialize` calls `App.Initialize(Me)`, then loads selected shared `UsesX` dependencies, then builds its chrome. The exact menu, drawers, navbar, user card, theme controls, route cases, and global dependency choices belong to that demo app.

When a requested app needs a shared shell:

1. Initialize one `SDUI5App` in the app-level module.
2. Call only the optional `App.UsesX` loaders needed by the chosen components, before those components are used.
3. Build each parent region before mounting children into it.
4. Route a menu entry to the selected page when menu navigation is part of the request. Verify the route string, handler case, and page module name together.
5. For apps without shell navigation, keep the app/page entry minimal and use direct page entry consistent with the scaffold.

Do not copy the demo's page module list, optional loaders, DB globals, or personal assets into a new app.

## Page and component composition

The common page convention in the skill scaffold is a static `pg*.bas` module with a no-argument `Show` entry. It borrows `pgIndex.App`, clears the page view, builds fresh components, and updates the title. The demo includes exceptions and older pages, so inspect the current page reference and applicable conformance gate when working in an existing project.

For a new page, the standard example is:

1. Declare the BANano handle, app reference, and component instances in `Process_Globals` as shown in the scaffold.
2. Use the project's `Show` lifecycle and page title convention.
3. Mount the root into the app page view.
4. For each component, follow its source-backed initialization and parent assignment. Set properties before `AddComponent` when configuration is part of the initial render.
5. Await `AddComponent` before using a newly-created component as the parent of another component.
6. Confirm event callback names and payload types in the component `.bas` source and demo.

`Container → Row → Column` is one common responsive layout pattern, not a framework requirement. A page can mount a single component or use another source-supported parent structure. Composite component regions such as a card's actions/content are component-specific; read that component's source/reference for exact region IDs.

## Assets and optional dependencies

- `SDUI5App.UsesX` methods load optional JS/CSS libraries. Trace a component's source or its specific skill reference to identify the loader rather than guessing from the component name.
- The project's app scaffold contains instructions for library-bundled assets versus app-owned files. Follow that inventory before copying assets; don't assume the large demo's `Files/` bundle is needed by every app.
- For app-owned files, update the `.b4j` `FileN=` and `FileGroupN=` entries and `NumberOfFiles` together. Recheck actual file names and paths.
- Keep secrets and deployment endpoints out of generated source unless the user explicitly supplies an appropriate configuration pattern. Do not copy the demo's `env.json` or credentials into starter projects.

## Bootstrap review checklist

- [ ] New or changed local modules are registered; counts and filenames agree.
- [ ] Startup builds the browser app and hands control to the app-level initializer.
- [ ] App shell is as small as requested and parent elements exist before children mount.
- [ ] Optional `UsesX` assets are called before dependent components run.
- [ ] Component API and event wiring match source; a demo citation is used when available.
- [ ] Project-owned assets resolve and bundled assets are not redundantly copied.
- [ ] The selected page is reachable from the requested startup/route path.
- [ ] If build/runtime checks were not run, state that explicitly instead of claiming the generated app builds.
