---
id: DOMAIN-MODEL
status: DRAFT
version: 1
depends-on: [APPLICATION]
---

# Domain Model

Optional. Required when the app persists or exchanges domain entities
(CRUD, trackers, stores, records). Omit for static/presentation-only apps
and say so in `contract/data-contract.md` instead of inventing entities.

## Entity: <Name>

- fields:
  - <field>: <type> — required|optional
- keys: <primary/unique fields>
- relations:
  - <verb> <OtherEntity> (<cardinality>, e.g. one-to-many)

## Rules

- One `## Entity:` section per domain entity. No backend, table, or API
  claims beyond what the request + `data-contract.md` establish.
- Every entity referenced by a `DATA-*` shape in `data-contract.md` must be
  defined here, and vice versa: no orphan entities, no orphan shapes.
- Sample values stay in `data-contract.md` / screen contracts, not here.
- Trace: entities are named by `FEATURE-*`/`SCREEN-*` files that use them;
  the chain stays `REQ → FEATURE → RULE/BR → SCREEN → COMPONENT → CODE → TEST`.
