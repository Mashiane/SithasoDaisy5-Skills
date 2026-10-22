# Publish & Install Guide — SithasoDaisy5-Skills (Claude Code plugin)

Everything in `dist/` is a **self-contained** plugin package: publish it
and users install the skills via Claude Code.

Build it from the working tree with:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File create-dist.ps1          # lean (default, patch bump)
powershell.exe -NoProfile -ExecutionPolicy Bypass -File create-dist.ps1 -NoBump  # same version
powershell.exe -NoProfile -ExecutionPolicy Bypass -File create-dist.ps1 -Full    # + sd5-book-to-skill
```

## What installs the skills

| Component | Role |
|---|---|
| `.claude-plugin/marketplace.json` | Marketplace discovery — `claude plugin marketplace add` reads this. |
| `.claude-plugin/plugin.json` + `plugin.json` | Plugin definition (metadata). Skills auto-discovered from `skills/` (each `skills/<name>/SKILL.md`). |
| `skills/` | The 8 production skills (valid `name:`/`description:` frontmatter; `sd5-book-to-skill` excluded, `-Full` includes it). |
| `skills-registry.json` | Machine-readable registry filtered to shipped skills. |
| `tools/` | `validate-skills.ps1` (structure gate) + `sync-skills-registry.py` (registry refresh). |
| `ENGINEERING-CONSTITUTION.md` | Governance the skill bodies point to. |
| `README.md`, `LICENSE` | Documentation + MIT license. |

## Install (end user)

```bash
# 1. Add this repository as a Claude Code marketplace
claude plugin marketplace add <published-repo-url>

# 2. Install the plugin (and its skills)
claude plugin install sithasodaisy5-skills
```

## Publish checklist

- `create-dist.ps1` ran green (ends with `validate-skills` PASS on `dist/`).
- `plugin.json`, `.claude-plugin/*`, README badge, registry versions agree.
- `check-contract.ps1` PASS on the working tree (registry unchanged by packaging).
- Copy `dist/` contents to the published marketplace repo; tag the release.
