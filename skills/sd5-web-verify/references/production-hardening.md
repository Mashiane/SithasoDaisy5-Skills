# Production hardening (G8 release-only gate)

Release is a security boundary, not just a bundle. Run
`scripts/verify-production-hardening.ps1 -OutputFolder <published-app>`
(plus `-ProjectFolder` for advisory source warnings) as the last check
before G8 closes.

## Scope: first-party output + env.json

Deep checks run on `index.html`, `app.js`, `ES5_app.js`, `sithasodaisy5.js`,
and any `env.json` under the published folder. Vendor-pinned third-party libs
are excluded by design: their build strings and inert URLs are
lexically indistinguishable from real leaks, and judging them is
supply-chain review, not app release review.

## What it enforces

- **High-confidence tokens in first-party files** (FAIL): `AIza…`, `sk-…`,
  `xox…`, private keys, `ghp_…`, `AKIA…`.
- **Non-empty `env.json` secret values** (FAIL): `api-key`/`password`/`secret`/
  `token` must be empty or placeholder in shipped output. The demo's own
  `env.json` ships a live-shaped key — the gate correctly FAILs it; new apps
  start from `env.template.json` (empty secrets).
- **`index.html` present** (FAIL).
- **Embedded `Publish` path in `app*.js`** (WARN): accepted local-publish
  mechanism — confirm no sensitive path segments.
- **Non-localhost `http://` in first-party files** (WARN, mixed content).
- **`manifest.json` missing** (WARN, PWA). **Possible secrets in project
  `.bas`/`.b4j`** (WARN, advisory).

## Scope rules

- Scan app output (and optionally the app project). Never framework, demo,
  or skill source.
- A FAIL blocks G8. Warnings ship with a recorded reason in STATE.md.
- Sample/placeholder credentials in showcase apps must read as placeholders
  (`"demo-key"`, empty values), never live tokens.
