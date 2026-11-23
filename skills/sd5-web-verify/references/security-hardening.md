# Security Hardening (G8)

[Production hardening](production-hardening.md) covers release hygiene (secrets, publish paths, required
files). This reference covers application security for app-authored code. Both are release gates;
neither replaces the other.

## Scope

Analyze the app's first-party code and published output. Vendor-pinned framework files are supply-chain
review, not app review. Generated apps are static by default; server-side controls apply only when the app
calls a backend or an external service.

## Trust boundaries

Treat as untrusted: form fields, URL/query/hash input, `localStorage` and `sessionStorage` values,
third-party API responses, uploaded files, webhook payloads, LLM output, and browser content read during
verification. Trust follows who wrote a value, not which channel delivered it.

## Always

- Validate input at the boundary and use the parsed value downstream.
- Encode output; never inject untrusted strings into raw HTML.
- Keep secrets out of source, `env.json`, logs, and published assets.
- Use HTTPS for external calls; reject mixed content.
- Check authorization on every protected action, not just authentication.
- Audit dependencies against the committed lockfile before release.
- Treat LLM output as untrusted: validate, then encode; never pass it to `eval` or raw HTML.

## Ask first

- Adding an authentication flow or changing auth logic.
- Storing new PII, payment data, or credentials.
- Adding a file upload, webhook, or external integration.
- Changing CORS, CSP, or rate limiting.
- Granting elevated permissions.

## Never

- Commit a secret or a live token; a secret that reaches a remote is compromised.
- Trust client-side validation as a security boundary.
- Log passwords, tokens, or full personal data.
- Store session tokens in client-accessible storage when a server session exists.
- Expose stack traces or internal errors to users.
- Ship a non-empty `env.json` secret value.

## B4J/BANano specifics

- Output is framework code that emits markup; do not concatenate raw HTML (RULE-ANTI-001).
- `env.json` is published. Keep secrets empty or placeholder; use server-side configuration for real values.
- The `Publish` path is embedded in generated JS. Confirm it contains no sensitive path segments.
- Local storage is readable by any script on the origin; do not store long-lived credentials there.
- If the app calls a backend, validate the response shape and handle error states visibly.

## Evidence

Write `.agent/SECURITY.md` with the checklist result, the dependency audit command and result, and any
accepted risks. G8 cites it. A `FAIL` blocks release; a `WARN` ships with a recorded reason and owner.

## Verification

- [ ] Input boundaries identified and validated.
- [ ] No secrets in source, output, logs, or `env.json`.
- [ ] Output encoding is in place; no raw HTML from untrusted data.
- [ ] Security headers and CORS set by the host or backend where applicable.
- [ ] Dependency audit recorded; no unmitigated reachable high/critical finding.
- [ ] Auth and authorization checked on every protected action.
- [ ] Error responses do not expose internals.
- [ ] LLM output handled as untrusted input, if applicable.

## Attribution

Adapted from Addy Osmani's `security-and-hardening` skill (MIT, `addyosmani/agent-skills`),
restricted to the web and static-app surface of this suite.
