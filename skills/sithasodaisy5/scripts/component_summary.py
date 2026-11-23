#!/usr/bin/env python3
"""Generate a compact per-component summary for quick lookup.

Sources are the generated provenance (counts, emitted classes, demo pages) and
the component Markdown docs (Core Idea description and section headings). The
output is deterministic so --check can gate a release.

Examples:
  python scripts/component_summary.py --write
  python scripts/component_summary.py --check
  python scripts/component_summary.py --get SDUI5Button
  python scripts/component_summary.py --list

Exit codes: 0 = success, 1 = not found or stale, 2 = bad arguments.
"""
from __future__ import annotations

import argparse
import json
import re
import sys
from pathlib import Path

from component_sections import find_section, parse_headings, section_bounds, skill_dir


def references_dir() -> Path:
    return skill_dir() / "references"


def provenance_path() -> Path:
    return references_dir() / "component-provenance.json"


def summary_path() -> Path:
    return references_dir() / "component-summary.json"


def manifest_path() -> Path:
    return references_dir() / "component-manifest.md"


def _documented_only(manifest_text: str) -> set[str]:
    """Read the manifest's authority list for UI components without demos."""
    section = re.search(
        r"(?ms)^## UI Components without Detected Demo Type Usage.*?(?=^## |\Z)",
        manifest_text,
    )
    if not section:
        return set()
    return {
        name.casefold()
        for name in re.findall(r"^\|\s*(SDUI5[A-Za-z0-9_]+)\s*\|", section.group(0), re.MULTILINE)
    }


def _description(text: str) -> str:
    if not text:
        return ""
    headings, _ = parse_headings(text)
    index = find_section(headings, "Core Idea")
    if index >= 0:
        start, end = section_bounds(text, headings, index)
        block = text[start:end]
        body = block.split("\n", 1)[1] if "\n" in block else ""
        for paragraph in re.split(r"\n\s*\n", body):
            paragraph = paragraph.strip()
            if paragraph and not paragraph.startswith("#"):
                return " ".join(paragraph.split())
    match = re.search(r"(?ms)^---\s*\n(.*?)\n---", text)
    if match:
        desc = re.search(r"(?m)^description:\s*(.+)$", match.group(1))
        if desc:
            return desc.group(1).strip()
    return ""


def build_summary() -> dict:
    provenance = json.loads(provenance_path().read_text(encoding="utf-8"))
    components = provenance.get("components", {})
    manifest_text = manifest_path().read_text(encoding="utf-8") if manifest_path().is_file() else ""
    documented_only = _documented_only(manifest_text)
    rows: list[dict] = []

    for key in sorted(components):
        entry = components[key]
        name = entry.get("registry-name") or key
        doc_rel = entry.get("doc") or f"components/{name}.md"
        doc_path = skill_dir() / doc_rel
        text = doc_path.read_text(encoding="utf-8") if doc_path.is_file() else ""
        headings, _ = parse_headings(text) if text else ([], "")
        counts = entry.get("counts") or {}
        demo_pages = sorted(entry.get("demo-pages") or [])
        kind = entry.get("kind") or ("support" if not name.startswith("SDUI5") else "ui")
        if kind == "support":
            status = "support"
        elif name.casefold() in documented_only:
            status = "documented-only"
        else:
            status = "demonstrated"
        rows.append(
            {
                "name": name,
                "kind": kind,
                "status": status,
                "props": int(counts.get("props", 0)),
                "events": int(counts.get("events", 0)),
                "setters": int(counts.get("setters", 0)),
                "getters": int(counts.get("getters", 0)),
                "methods": int(counts.get("methods", 0)),
                "initSignature": entry.get("init-sig", ""),
                "sourceLines": int(entry.get("source-lines", 0)),
                "hasDesignerCreateView": bool(entry.get("has-designer-create-view", False)),
                "emittedClasses": sorted(entry.get("designer-classes") or []),
                "demoPages": demo_pages,
                "description": _description(text),
                "doc": doc_rel.replace("\\", "/"),
                "sections": [heading["title"] for heading in headings if heading["level"] == 2],
            }
        )

    return {
        "schemaVersion": 1,
        "source": "component-manifest.md (status) + component-provenance.json (counts/classes) + components/*.md (description/sections)",
        "registeredModules": len(rows),
        "uiComponents": sum(1 for row in rows if row["kind"] == "ui"),
        "supportModules": sum(1 for row in rows if row["kind"] == "support"),
        "components": rows,
    }


def _render(summary: dict) -> str:
    return json.dumps(summary, indent=2, ensure_ascii=True) + "\n"


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(
        prog="component_summary.py",
        description="Generate or query the compact SithasoDaisy5 component summary.",
    )
    parser.add_argument("--write", action="store_true", help="Write references/component-summary.json.")
    parser.add_argument("--check", action="store_true", help="Exit 1 if the committed summary is stale.")
    parser.add_argument("--get", metavar="NAME", help="Print one component summary as JSON.")
    parser.add_argument("--list", action="store_true", help="Print a TSV table (default).")
    args = parser.parse_args(argv)

    summary = build_summary()

    if args.get:
        wanted = args.get.strip().lower()
        for row in summary["components"]:
            if row["name"].lower() == wanted:
                print(json.dumps(row, indent=2, ensure_ascii=False))
                return 0
        print(f"ERROR: component {args.get!r} not found.", file=sys.stderr)
        return 1

    if args.check:
        path = summary_path()
        if not path.is_file():
            print(f"ERROR: {path} is missing; run --write.", file=sys.stderr)
            return 1
        if path.read_text(encoding="utf-8") != _render(summary):
            print(f"ERROR: {path} is stale; run --write.", file=sys.stderr)
            return 1
        print(f"component-summary.json in sync ({len(summary['components'])} components)")
        return 0

    if args.write:
        path = summary_path()
        path.write_text(_render(summary), encoding="utf-8")
        print(f"wrote {path}")
        return 0

    for row in summary["components"]:
        print(
            f"{row['name']}\t{row['kind']}\t{row['status']}\t"
            f"{row['props']}\t{row['events']}\t{len(row['demoPages'])}"
        )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
