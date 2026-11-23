#!/usr/bin/env python3
"""Read one section of a SithasoDaisy5 component reference.

The full component docs are large (some exceed 60 KB). This reader lets an
agent load only the section it needs instead of the whole file.

Examples:
  python scripts/component_sections.py SDUI5Button --list
  python scripts/component_sections.py SDUI5Button --get "Events"
  python scripts/component_sections.py SDUI5Table --get "Key Setters" --json

Exit codes: 0 = success, 1 = component/section not found, 2 = bad arguments.
"""
from __future__ import annotations

import argparse
import difflib
import json
import re
import sys
from pathlib import Path

HEADING_RE = re.compile(r"^(#{1,6})\s+(.+?)\s*$")
FENCE_RE = re.compile(r"^\s*(```|~~~)")


def skill_dir() -> Path:
    return Path(__file__).resolve().parent.parent


def components_dir() -> Path:
    return skill_dir() / "components"


def _skip_frontmatter(lines: list[str]) -> int:
    if not lines or lines[0].strip() != "---":
        return 0
    for i in range(1, len(lines)):
        if lines[i].strip() == "---":
            return i + 1
    return 0


def parse_headings(text: str) -> tuple[list[dict], str]:
    """Return ATX headings outside frontmatter and fenced code blocks."""
    lines = text.splitlines(keepends=True)
    start = _skip_frontmatter(lines)
    headings: list[dict] = []
    in_fence = False
    offset = 0
    for i, line in enumerate(lines):
        if i < start:
            offset += len(line)
            continue
        if FENCE_RE.match(line):
            in_fence = not in_fence
        elif not in_fence:
            match = HEADING_RE.match(line)
            if match:
                headings.append(
                    {
                        "title": match.group(2).strip(),
                        "level": len(match.group(1)),
                        "start_line": i + 1,
                        "start_char": offset,
                    }
                )
        offset += len(line)
    return headings, text


def section_bounds(text: str, headings: list[dict], index: int) -> tuple[int, int]:
    """Start/end characters for a heading, including nested subsections."""
    heading = headings[index]
    end = len(text)
    for j in range(index + 1, len(headings)):
        if headings[j]["level"] <= heading["level"]:
            end = headings[j]["start_char"]
            break
    return heading["start_char"], end


def section_summary(text: str, headings: list[dict], index: int) -> dict:
    start, end = section_bounds(text, headings, index)
    heading = headings[index]
    return {
        "title": heading["title"],
        "level": heading["level"],
        "start_line": heading["start_line"],
        "end_line": text[:end].count("\n") + 1,
        "characters": end - start,
    }


def find_section(headings: list[dict], requested: str) -> int:
    """Exact match first, then a heading that starts with the request."""
    query = requested.strip().lower()
    if not query:
        return -1
    for i, heading in enumerate(headings):
        if heading["title"].lower() == query:
            return i
    for i, heading in enumerate(headings):
        title = heading["title"].lower()
        if title.startswith(query + " ") or title.startswith(query + "(") or title.startswith(query + ":"):
            return i
    for i, heading in enumerate(headings):
        if query in heading["title"].lower():
            return i
    return -1


def resolve_component(name: str) -> Path:
    if not name or name.strip() != name or "/" in name or "\\" in name or ".." in name:
        raise ValueError(f"invalid component name: {name!r}")
    docs = {path.stem.lower(): path for path in components_dir().glob("*.md")}
    key = name.strip().lower()
    if key in docs:
        return docs[key]
    suggestions = difflib.get_close_matches(key, sorted(docs), n=5, cutoff=0.5)
    hint = f" Did you mean: {', '.join(suggestions)}?" if suggestions else ""
    raise FileNotFoundError(f"component {name!r} not found.{hint}")


def load_component(name: str) -> tuple[Path, str]:
    path = resolve_component(name)
    return path, path.read_text(encoding="utf-8")


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(
        prog="component_sections.py",
        description="List or read one section of a SithasoDaisy5 component reference.",
    )
    parser.add_argument("name", help="Component name, e.g. SDUI5Button (case-insensitive).")
    parser.add_argument("--list", action="store_true", help="List section headings (default).")
    parser.add_argument("--get", metavar="SECTION", help="Print one section, including nested subsections.")
    parser.add_argument("--json", action="store_true", help="Emit structured JSON instead of text.")
    args = parser.parse_args(argv)

    try:
        path, text = load_component(args.name)
    except (ValueError, FileNotFoundError) as exc:
        print(f"ERROR: {exc}", file=sys.stderr)
        return 1

    headings, _ = parse_headings(text)

    if args.get:
        index = find_section(headings, args.get)
        if index < 0:
            print(f"ERROR: section {args.get!r} not found in {path.name}.", file=sys.stderr)
            print("Available sections:", file=sys.stderr)
            for heading in headings:
                print(f"  {'#' * heading['level']} {heading['title']}", file=sys.stderr)
            return 1
        start, end = section_bounds(text, headings, index)
        content = text[start:end]
        if args.json:
            payload = {
                "component": path.stem,
                "doc": path.relative_to(skill_dir()).as_posix(),
                "section": section_summary(text, headings, index),
                "content": content,
            }
            print(json.dumps(payload, indent=2, ensure_ascii=False))
        else:
            sys.stdout.write(content)
            if not content.endswith("\n"):
                print()
        return 0

    payload = {
        "component": path.stem,
        "doc": path.relative_to(skill_dir()).as_posix(),
        "sections": [section_summary(text, headings, i) for i in range(len(headings))],
    }
    if args.json:
        print(json.dumps(payload, indent=2, ensure_ascii=False))
        return 0

    print(f"{path.stem} ({len(headings)} sections)")
    for item in payload["sections"]:
        print(
            f"  {item['level']:>2}  {item['title']} "
            f"(lines {item['start_line']}-{item['end_line']}, {item['characters']} chars)"
        )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
