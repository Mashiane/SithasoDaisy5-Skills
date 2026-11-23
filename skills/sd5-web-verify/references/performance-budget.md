# Performance Budget (G6/G8)

Performance is a release constraint, not a polish task. Measure before optimizing; keep a change only
when the number moves beyond run-to-run noise. This reference defines budgets, placement, and evidence.

## Targets

| Metric | Good | Needs improvement | Poor |
|---|---|---|---|
| LCP | <= 2500 ms | <= 4000 ms | > 4000 ms |
| INP | <= 200 ms | <= 500 ms | > 500 ms |
| CLS | <= 0.1 | <= 0.25 | > 0.25 |

Use the same viewport, network profile, and cache state for baseline and result. A cold baseline compared
with a warm result measures the cache, not the change.

## First-party budgets

Measure app-authored output, not vendor-pinned framework files. Framework and third-party assets are
reviewed as supply chain, not app performance.

| Asset | Budget | Notes |
|---|---|---|
| First-party JS | no growth > 10% vs baseline | BANano bundles framework code; exclude vendor files |
| First-party CSS | no growth > 10% vs baseline | |
| Images above the fold | <= 200 KB each | set width and height; use WebP or AVIF when available |
| Fonts | <= 100 KB total | local webfonts only; no remote runtime dependency |
| Lighthouse performance | >= 90 | median of 3 runs |
| Failed requests | 0 | |

## Where to measure

- **G6**: per-screen synthetic check at desktop and phone widths.
- **G8**: release check against the published output; compare with the recorded baseline.
- Use Lighthouse CLI when available: `npx --yes lighthouse <url> --output=json --output-path=<file> --quiet`.
- Use a Chrome DevTools MCP performance trace when Lighthouse is unavailable (see `browser-evidence.md`).
- If neither tool is available, record `NOT MEASURED` with the reason. Do not call it pass.

## Keep or revert

| Result vs baseline | Action |
|---|---|
| Past the threshold, gates green | Keep; record before/after numbers |
| Within noise | Revert |
| Worse | Revert |
| Improved but a gate went red | Revert |

"Neutral" is a revert. Log every attempt, including reverted ones, in `.agent/PERF.md` so the next agent
does not repeat a dead idea.

## BANano-specific suspects

- Unused transpiled code; enable dead-code removal only when the app is re-verified after the change.
- Duplicate or render-blocking CSS and JS files; consolidate or lazy-load via the matching `UsesX` loader.
- Oversized images and fonts; size rasters from logical size times device scale, never upscale.
- Layout shift from late fonts, images without dimensions, and delayed data.
- Main-thread long tasks from large DOM updates; check the Performance trace for tasks over 50 ms.

## Evidence

- `ux-review/perf-<YYYYMMDD>.json` (Lighthouse or trace summary).
- `.agent/PERF.md` ledger: idea, baseline -> result, verdict, reason.
- G6/G8 rows in `.agent/DELIVERY.json` cite the perf evidence.

## Attribution

Adapted from Addy Osmani's `performance-optimization` skill (MIT, `addyosmani/agent-skills`),
rewritten for BANano output and the G6/G8 gates.
