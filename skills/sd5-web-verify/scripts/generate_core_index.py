#!/usr/bin/env python3
"""Refresh the inline UI/support and prop-topic indexes in sithasodaisy5/SKILL.md."""
from __future__ import annotations

import argparse
import json
import re
from collections import Counter, defaultdict
from pathlib import Path

from generate_manifest import registry_names


def main() -> int:
    repo = Path(__file__).resolve().parents[3]
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--components-json", type=Path,
                        default=repo / "skills" / "sd5-book-to-skill" / "work_2026-10-10" / "components.json")
    parser.add_argument("--framework-project", type=Path,
                        default=repo.parent / "0SithasoDaisy5" / "SithasoDaisy5.b4j")
    parser.add_argument("--skill-folder", type=Path, default=repo / "skills" / "sithasodaisy5")
    args = parser.parse_args()

    modules = registry_names(args.framework_project)
    ui_names = [name for name in modules if name.startswith("SDUI5")]
    support_names = [name for name in modules if not name.startswith("SDUI5")]
    by_name = {item["name"].casefold(): item for item in json.loads(args.components_json.read_text(encoding="utf-8"))}
    missing = [name for name in modules if name.casefold() not in by_name]
    if missing:
        raise SystemExit("Registry entries missing from extraction: " + ", ".join(missing))

    lines = [
        "## Component Index",
        "",
        "| Component | Props | Events | Key daisyUI classes emitted |",
        "|---|---:|---:|---|",
    ]
    topics: dict[str, list[str]] = defaultdict(list)
    for name in ui_names:
        data = by_name[name.casefold()]
        props = data.get("props") or []
        events = data.get("events") or []
        classes = data.get("designer_classes") or []
        class_text = ", ".join(classes[:4]) if classes else "—"
        lines.append(f"| [{name}](components/{name}.md) | {len(props)} | {len(events)} | {class_text} |")
        for prop in props:
            key = prop.get("key")
            if key:
                topics[key].append(name)

    lines += ["", f"_Total: {len(ui_names)} registered `SDUI5*` UI classes._", "",
              f"## Registered Support Modules ({len(support_names)})", "",
              "| Module | Reference |", "|---|---|"]
    for name in support_names:
        lines.append(f"| {name} | [components/{name}.md](components/{name}.md) |")

    frequencies = Counter({key: len(names) for key, names in topics.items()})
    lines += ["", "## Topic Index (prop → components)", ""]
    for prop, count in frequencies.most_common(20):
        names = topics[prop]
        shown = ", ".join(names[:12])
        if count > 12:
            shown += f", … (+{count - 12} more)"
        lines.append(f"- **{prop}** → {shown}")
    lines.append("")

    path = args.skill_folder / "SKILL.md"
    text = path.read_text(encoding="utf-8")
    start = text.index("## Component Index")
    end = text.index("## Supporting Files", start)
    text = text[:start] + "\n".join(lines) + "\n" + text[end:]
    text = re.sub(r"\*\*Last regenerated\*\*: [^\n]+",
                  "**Last refreshed**: 2026-10-10 from the current framework registry/source snapshot", text, count=1)
    path.write_text(text, encoding="utf-8")
    print(f"Refreshed core index: {len(ui_names)} UI references, {len(support_names)} support modules, {len(topics)} prop keys")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
