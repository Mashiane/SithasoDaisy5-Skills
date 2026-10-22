# SithasoDaisy5 Application Contract Schema

These Markdown files are the human-readable source of truth. The validator checks required headings, IDs, ownership, and requirement-to-test links; it does not judge product quality or prove runtime behavior.

## Canonical files and IDs

| Artifact | Required content | ID family |
|---|---|---|
| `contract/application.md` | app purpose, actors, scope, constraints, assumptions, open items | `REQ-*`, `CON-*`, `BR-*`, `ASM-*`, `OPEN-*` |
| `contract/navigation.md` | routes, entry, transitions, destination screen IDs | `JRN-*`, `SCREEN-*` |
| `contract/features/<id>.md` | owned requirement IDs, behavior, affected screens, dependencies | `FEATURE-*` |
| `contract/screens/<id>.md` | exactly one feature owner, task, architecture, state, responsive plan, component provenance | `SCREEN-*`, `FEATURE-*`, `COMPONENT-*` |
| `contract/acceptance-tests.md` | observable check and covered critical requirement | `TEST-*`, `REQ-*` |
| `contract/data-contract.md` | source, shape, loading/error/empty behavior, privacy boundaries | `DATA-*` |
| `contract/domain-model.md` | **optional** — domain entities, fields, keys, relations. Required when the app persists/exchanges entities; omit for static apps | entities named by `FEATURE-*`/`SCREEN-*` |
| `contract/business-rules.md` | only user/domain rules; distinguish assumed display sample data | `BR-*` |

Use stable IDs in the body and cross-reference them verbatim. One ID has one definition. Avoid duplicate screen definitions in navigation and screen files: navigation references screen IDs, screen files define them.

## G0 invariants

- Every critical `REQ-*` has at least one `TEST-*` row that names it.
- Every `SCREEN-*` has exactly one `FEATURE-*` owner; every navigation destination resolves to a screen file.
- Every screen inventory component resolves to the registered component manifest and its reference, or is explicitly marked unsupported and omitted from implementation.
- Any unresolved `OPEN-*` that blocks app structure, data behavior, security, or core user journey blocks G0. Reversible visual details can be recorded as assumptions.
- For an existing B4J app, navigation page IDs must resolve to project modules. For a greenfield plan, G1 bootstrap performs this check after the `.b4j` file exists.
- A static demonstration uses clearly labeled local sample values. It must not claim production data, backend integration, account connectivity, or financial correctness.

## Traceability

Use `REQ → FEATURE → RULE/BR → SCREEN → COMPONENT → CODE → TEST`. Not every UI-only choice needs a business rule, but every critical requirement must reach implementation and an acceptance check before release.

