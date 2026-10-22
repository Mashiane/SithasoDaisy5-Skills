#!/usr/bin/env python3
"""Generate the component manifest from the live B4J registry and docs.

The registry is authoritative for active modules. Path-qualified ModuleN entries
are reduced to their module basename before matching docs. SDUI5* entries are
listed as UI components; other registered entries are listed as support modules.
"""
from __future__ import annotations

import argparse
import json
import re
from pathlib import Path


def registry_names(project_file: Path) -> list[str]:
    text = project_file.read_text(encoding="utf-8", errors="replace")
    names: list[str] = []
    for match in re.finditer(r"^Module\d+=(.+)$", text, re.MULTILINE):
        value = match.group(1).strip()
        if value.startswith("|"):
            value = re.sub(r"^\|[^|]*\|", "", value)
        value = value.replace("\\", "/").rstrip("/").split("/")[-1]
        value = re.sub(r"\.[^.]+$", "", value)
        if value:
            names.append(value)
    return sorted(set(names), key=str.casefold)


def main() -> int:
    repo = Path(__file__).resolve().parents[3]
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--framework-project", type=Path,
                        default=repo.parent / "0SithasoDaisy5" / "SithasoDaisy5.b4j")
    parser.add_argument("--demo-folder", type=Path,
                        default=repo.parent / "0SithasoDaisy5DemoCode" / "B4J")
    parser.add_argument("--skill-folder", type=Path, default=repo / "skills" / "sithasodaisy5")
    parser.add_argument("--data", type=Path,
                        default=repo / "skills" / "sd5-book-to-skill" / "work_2026-10-10" / "components.json")
    args = parser.parse_args()

    for path in (args.framework_project, args.demo_folder, args.skill_folder):
        if not path.exists():
            raise SystemExit(f"Required path does not exist: {path}")

    names = registry_names(args.framework_project)
    ui_names = [name for name in names if name.startswith("SDUI5")]
    support_names = [name for name in names if not name.startswith("SDUI5")]
    comp_dir = args.skill_folder / "components"
    docs = {p.stem.casefold(): p for p in comp_dir.glob("*.md")}
    missing = [n for n in names if n.casefold() not in docs]
    if missing:
        raise SystemExit("Missing registered module docs: " + ", ".join(missing))

    extracted: dict[str, dict] = {}
    if args.data.exists():
        values = json.loads(args.data.read_text(encoding="utf-8"))
        extracted = {item["name"].casefold(): item for item in values if item.get("name")}

    demo_text = "\n".join(
        path.read_text(encoding="utf-8", errors="replace")
        for path in args.demo_folder.glob("pg*.bas")
    )
    used_types = {
        m.group(1).casefold()
        for m in re.finditer(r"\b(?:As|New)\s+(SDUI5[A-Za-z0-9_]+)\b", demo_text, re.IGNORECASE)
    }

    def values_for(name: str) -> tuple[int, int, str]:
        data = extracted.get(name.casefold(), {})
        props = len(data.get("props") or [])
        events = data.get("events") or []
        classes = data.get("designer_classes") or []
        return props, len(events) if isinstance(events, list) else 0, ", ".join(classes[:4]) if classes else "—"

    demo_names = [n for n in ui_names if n.casefold() in used_types]
    doc_only = [n for n in ui_names if n.casefold() not in used_types]
    unused_dir = comp_dir / "_unused"
    orphan_docs = sorted(unused_dir.glob("*.md"), key=lambda p: p.stem.casefold())

    lines = [
        "---",
        "name: component-manifest",
        "description: Live registry inventory of SithasoDaisy5 UI components and support modules, with UI demo coverage and unregistered reference notes.",
        "---",
        "",
        "# SithasoDaisy5 Component Manifest",
        "",
        "Generated from the framework project's `ModuleN=` registry and the demo app's `pg*.bas` type usage.",
        "A path-qualified module entry is normalized to its final module name. Only registered modules are active.",
        "",
        f"**Registered modules**: {len(names)} | **UI components**: {len(ui_names)} | **Support modules**: {len(support_names)} | **UI demo-backed**: {len(demo_names)} | **UI without a detected demo type declaration**: {len(doc_only)} | **Unregistered reference docs**: {len(orphan_docs)}",
        "",
        "## UI Components with Demo Type Usage (" + str(len(demo_names)) + ")",
        "",
        "A `pg*.bas` file contains an `As SDUI5*` or `New SDUI5*` type reference. This is evidence of demo usage, not a substitute for checking the component API documentation.",
        "",
        "| Component | Props | Events | Key daisyUI classes emitted |",
        "|---|---:|---:|---|",
    ]
    for name in demo_names:
        props, events, classes = values_for(name)
        lines.append(f"| {name} | {props} | {events} | {classes} |")

    lines += ["", "## UI Components without Detected Demo Type Usage (" + str(len(doc_only)) + ")", "",
              "The API reference exists, but no matching type declaration was detected in a `pg*.bas` demo file. Verify the source reference before relying on it.",
              "", "| Component | Props | Events | Key daisyUI classes emitted |", "|---|---:|---:|---|"]
    for name in doc_only:
        props, events, classes = values_for(name)
        lines.append(f"| {name} | {props} | {events} | {classes} |")

    lines += ["", f"## Registered Support Modules ({len(support_names)})", "",
              "These modules are registered in the framework project but are not `SDUI5*` visual components.",
              "", "| Module | Reference |", "|---|---|"]
    for name in support_names:
        lines.append(f"| {name} | [`components/{name}.md`](../components/{name}.md) |")

    lines += ["", f"## Unregistered Reference Docs ({len(orphan_docs)})", "",
              "These notes are retained for source archaeology. Do not generate app code from them: their classes are not in the framework `ModuleN=` registry.",
              "", "| Name | Reference |", "|---|---|"]
    for path in orphan_docs:
        lines.append(f"| {path.stem} | [`components/_unused/{path.name}`](../components/_unused/{path.name}) |")

    lines += ["", "## Regeneration and verification", "",
              "From the skills repository root, run:", "", "```powershell",
              "py -3 skills/sd5-web-verify/scripts/generate_manifest.py",
              "py -3 tools/generate_component_source_refs.py",
              "pwsh -File skills/sd5-web-verify/scripts/check-contract.ps1",
              "```", "",
              "`check-contract.ps1` enforces exact one-to-one coverage between normalized registered module names and top-level `components/*.md` files. `_unused/` is excluded by design.", ""]

    out = args.skill_folder / "references" / "component-manifest.md"
    out.write_text("\n".join(lines), encoding="utf-8")
    print(f"Wrote {out}: {len(ui_names)} UI, {len(support_names)} support, {len(orphan_docs)} unregistered notes; {len(demo_names)} UI demo references found")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
