# ADR Template (.agent/DECISIONS.md)

Record consequential decisions where a future agent can find them. A decision that is not written down
will be re-litigated or silently reversed. Keep one entry per decision, newest first or in an index.

## When to write an ADR

- A contract requirement, scope, or acceptance check changes.
- A gate is skipped, blocked, or an exception is accepted.
- A framework gap forces an approximation or deviation.
- A visual or interaction choice is not derivable from the prompt.
- A release decision (ship, defer, revert) is made.
- A rule or constraint is loosened.

## Format

```markdown
## ADR-<NNN> — <title>

- **Date:** YYYY-MM-DD
- **Status:** proposed | accepted | superseded by ADR-NNN | rejected
- **Owner:** <name or agent id>
- **Context:** what forced the decision; link requirements and evidence.
- **Decision:** what will be done.
- **Consequences:** what becomes easier, harder, or out of scope.
- **Alternatives:** what was rejected and why.
- **Evidence:** gate logs, screenshots, contract paths, or source links.
```

## Rules

- One decision per entry; do not rewrite history. Supersede with a new ADR.
- A gate exception must name the gate, scope, reason, owner, and expiry.
- Link the decision from `.agent/PLAN.md`, `.agent/STATE.md`, or the contract where it applies.
- The ADR is a decision artifact, not evidence. Evidence still comes from deterministic tooling.

## Example

```markdown
## ADR-004 — Use a static sample for the activity feed

- **Date:** 2026-11-07
- **Status:** accepted
- **Context:** FEATURE-003 requires a feed, but the contract defines no backend.
- **Decision:** ship a labelled static sample; mark live data `OPEN`.
- **Consequences:** G2 is static-only; remote loading and error states are not applicable.
- **Alternatives:** invent an endpoint (rejected: no contract), omit the feed (rejected: requirement).
- **Evidence:** contract/features/feature-003.md; .agent/DECISIONS.md
```

## See also

- [contract-schema.md](contract-schema.md)
- [application-plan.template.md](application-plan.template.md)

## Attribution

Adapted from Addy Osmani's `documentation-and-adrs` skill (MIT, `addyosmani/agent-skills`),
aligned with the existing planner artifacts.
