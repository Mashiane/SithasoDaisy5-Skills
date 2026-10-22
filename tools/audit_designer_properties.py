from __future__ import annotations

import argparse
import re
from collections import Counter
from pathlib import Path

def fields_from_directive(line: str) -> dict[str, str]:
    body = line.split(":", 1)[1].strip()
    matches = list(re.finditer(r"(?:^|,\s*)(Key|DisplayName|FieldType|DefaultValue|Description|List)\s*:", body, re.I))
    out: dict[str, str] = {}
    for i, match in enumerate(matches):
        start = match.end()
        end = matches[i + 1].start() if i + 1 < len(matches) else len(body)
        key = match.group(1).lower()
        # Drop the separator comma before the next named field.
        value = body[start:end].strip().rstrip(",").strip()
        out[key] = value
    return out


def get_methods(text: str) -> tuple[dict[str, str], dict[str, tuple[str, str]]]:
    methods = {}
    blocks = {}
    for match in re.finditer(
        r"^\s*(?:public\s+)?sub\s+([A-Za-z_]\w*)\b[^\r\n]*\r?\n(.*?)^\s*End\s+Sub\b",
        text,
        re.I | re.M | re.S,
    ):
        name = match.group(1)
        methods[name.lower()] = name
        blocks[name.lower()] = (name, match.group(2))
    return methods, blocks


def accessor_pair(component: str, key: str, methods: dict[str, str], blocks: dict[str, tuple[str, str]], property_fields: dict[str, str]) -> tuple[str | None, str | None, str | None]:
    setter = methods.get(("set" + key).lower())
    getter = methods.get(("get" + key).lower())
    alias = None
    if key.lower().startswith("raw"):
        short = key[3:]
        if setter is None:
            setter = methods.get(("set" + short).lower())
        if getter is None:
            getter = methods.get(("get" + short).lower())
        if setter or getter:
            alias = "Raw prefix"
    # Resolve non-obvious names only when the method body operates on the
    # backing field assigned from Props.GetDefault("designer key", ...).
    field = property_fields.get(key.lower())
    if field:
        if setter is None:
            for method_name, (actual, body) in blocks.items():
                if method_name.startswith("set") and re.search(r"\b" + re.escape(field) + r"\s*=", body, re.I):
                    setter = actual
                    alias = "backing-field alias"
                    break
        if getter is None:
            for method_name, (actual, body) in blocks.items():
                if method_name.startswith("get") and re.search(r"\bReturn\s+" + re.escape(field) + r"\b", body, re.I):
                    getter = actual
                    alias = "backing-field alias"
                    break
    for method in (setter, getter):
        if method and method.lower() not in methods:
            raise ValueError(f"Alias refers to missing method: {component}.{key} -> {method}")
    return setter, getter, alias


def esc(value: str) -> str:
    return value.replace("|", ", ").replace("\r", " ").replace("\n", " ").strip()


def parse_component(path: Path) -> tuple[list[dict[str, str]], dict[str, str], dict[str, tuple[str, str]], dict[str, str]]:
    text = path.read_text(encoding="utf-8-sig", errors="replace")
    props = []
    for line in text.splitlines():
        if not line.strip().lower().startswith("#designerproperty:"):
            continue
        data = fields_from_directive(line)
        key = data.get("key", "").strip()
        if key:
            props.append(data)
    methods, blocks = get_methods(text)
    property_fields = {}
    for prop in props:
        key = prop["key"].strip()
        match = re.search(r"\b([A-Za-z_]\w*)\s*=\s*Props\.GetDefault\(\s*\"" + re.escape(key) + r"\"", text, re.I)
        if match:
            property_fields[key.lower()] = match.group(1)
    return props, methods, blocks, property_fields


def table_for(component: str, props: list[dict[str, str]], methods: dict[str, str], blocks: dict[str, tuple[str, str]], property_fields: dict[str, str]) -> str:
    lines = [
        "| Key | Type | Default | List | Setter | Getter |",
        "|---|---|---|---|---|---|",
    ]
    counts = Counter()
    for prop in props:
        key = prop["key"].strip()
        setter, getter, alias = accessor_pair(component, key, methods, blocks, property_fields)
        counts["properties"] += 1
        counts["setters"] += bool(setter)
        counts["getters"] += bool(getter)
        if setter and getter:
            counts["paired"] += 1
        if alias:
            counts["aliases"] += 1
        if not setter:
            counts["missing_setters"] += 1
        if not getter:
            counts["missing_getters"] += 1
        default = prop.get("defaultvalue", "").strip()
        choices = prop.get("list", "").strip().replace("|", ", ")
        lines.append("| `{}` | {} | {} | {} | {} | {} |".format(
            esc(key), esc(prop.get("fieldtype", "")) or "—", esc(default) or "—",
            esc(choices) or "—", f"`{setter}`" if setter else "—", f"`{getter}`" if getter else "—"
        ))
    lines.append("")
    lines.append("Setter and getter names are the actual source `Sub` names. `—` means this component has no named accessor for that side; designer-time values may still be consumed through `Props` in `DesignerCreateView`.")
    if counts["aliases"]:
        lines.append("Where a designer key and method name differ, the method names shown are the source-verified mapping.")
    return "\n".join(lines), counts


def replace_property_table(doc: str, table: str) -> str:
    pattern = re.compile(r"(^## Designer Properties\s*\n).*?(?=^## |\Z)", re.M | re.S)
    match = pattern.search(doc)
    if not match:
        raise ValueError("No Designer Properties section")
    return doc[:match.start()] + match.group(1) + table + "\n" + doc[match.end():]


def refresh_prop_counts(path: Path, prop_counts: dict[str, int], linked: bool) -> int:
    text = path.read_text(encoding="utf-8-sig", errors="replace")
    if linked:
        pattern = re.compile(r"^(\|\s*\[[^]]+\]\(components/([^/]+)\.md\)\s*\|\s*)(\d+)(\s*\|.*)$", re.M)
    else:
        pattern = re.compile(r"^(\|\s*([A-Za-z_]\w*)\s*\|\s*)(\d+)(\s*\|.*)$", re.M)
    changed = 0

    def replace(match: re.Match[str]) -> str:
        nonlocal changed
        name = match.group(2).lower()
        expected = next((count for component, count in prop_counts.items() if component.lower() == name), None)
        if expected is None or int(match.group(3)) == expected:
            return match.group(0)
        changed += 1
        return f"{match.group(1)}{expected}{match.group(4)}"

    updated = pattern.sub(replace, text)
    if changed:
        path.write_text(updated, encoding="utf-8", newline="\n")
    return changed


def main() -> None:
    ap = argparse.ArgumentParser(description="Audit SDUI5 designer-property accessors and refresh skill reference tables.")
    ap.add_argument("--framework-root", required=True, type=Path)
    ap.add_argument("--skills-root", required=True, type=Path, help="Path to skills/sithasodaisy5")
    args = ap.parse_args()
    component_dir = args.skills_root / "components"
    components = []
    totals = Counter()
    for source in sorted(args.framework_root.glob("SDUI5*.bas")):
        props, methods, blocks, property_fields = parse_component(source)
        if not props:
            continue
        component = source.stem
        doc_path = component_dir / (component + ".md")
        if not doc_path.exists():
            unused = component_dir / "_unused" / (component + ".md")
            if unused.exists():
                doc_path = unused
            else:
                raise FileNotFoundError(f"No skill component definition for {component}")
        table, counts = table_for(component, props, methods, blocks, property_fields)
        doc = doc_path.read_text(encoding="utf-8-sig", errors="replace")
        updated = replace_property_table(doc, table)
        doc_path.write_text(updated, encoding="utf-8", newline="\n")
        components.append((component, props, methods, blocks, property_fields, source, doc_path, counts))
        totals.update(counts)

    prop_counts = {component: len(props) for component, props, *_ in components}
    summary_updates = 0
    for summary, linked in ((args.skills_root / "SKILL.md", True), (args.skills_root / "references" / "component-manifest.md", False)):
        summary_updates += refresh_prop_counts(summary, prop_counts, linked)

    neither = totals["properties"] - totals["setters"] - totals["getters"] + totals["paired"]
    setter_only = totals["setters"] - totals["paired"]
    getter_only = totals["getters"] - totals["paired"]
    incomplete = neither + setter_only + getter_only
    report = [
        "---", "name: designer-property-accessors", "description: Source audit mapping every SithasoDaisy5 designer property to its named setter and getter, including absent accessors and intentional aliases.", "---", "",
        "# Designer Property Accessor Audit", "",
        f"Audited {len(components)} framework components and {totals['properties']} `#DesignerProperty` declarations in the framework source on 2026-10-22.", "",
        "The component pages now include Setter and Getter columns beside every designer property. These columns name the actual source methods. A dash means no corresponding named accessor exists in that component; a property may still be consumed during `DesignerCreateView`.", "",
        f"Coverage: {totals['setters']} properties have a named setter; {totals['getters']} have a named getter; {totals['paired']} have both. Of the remaining {incomplete}, {neither} have neither, {setter_only} have only a setter, and {getter_only} have only a getter. {totals['aliases']} properties use a documented accessor name that differs from the designer key.", "",
        f"Updated {summary_updates} stale Props counts across the skill index and component manifest to match the source declarations.", "",
        "## Accessor gaps and aliases", "",
        "For each listed component, the skill page has the complete property table. This section calls out every key without both accessors and every intentional key-to-method name difference.", "",
    ]
    for component, props, methods, blocks, property_fields, source, doc_path, _ in components:
        gaps = []
        aliases = []
        for prop in props:
            key = prop["key"].strip()
            setter, getter, alias = accessor_pair(component, key, methods, blocks, property_fields)
            if not setter or not getter:
                gaps.append(f"`{key}` (setter: `{setter or '—'}`; getter: `{getter or '—'}`)")
            if alias:
                alias_label = "Raw prefix alias" if alias == "Raw prefix" else "backing-field alias"
                aliases.append(f"`{key}` → `{setter or '—'}` / `{getter or '—'}` ({alias_label})")
        if not gaps and not aliases:
            continue
        relative_doc = doc_path.relative_to(args.skills_root).as_posix()
        report.append(f"### {component}")
        report.append("")
        report.append(f"Source: `{source.name}` · Skill: [`{relative_doc}`]({relative_doc})")
        if aliases:
            report.append("")
            report.append("Accessor names that differ from their designer keys: " + "; ".join(aliases) + ".")
        if gaps:
            report.append("")
            report.append("Properties without a complete named setter/getter pair: " + "; ".join(gaps) + ".")
        report.append("")
    report.append("## Source scope")
    report.append("")
    report.append("The audit reads only `SDUI5*.bas` files with designer-property directives. It does not treat `Private Sub`, `CustProps`, `SetProperties`, or `DesignerCreateView` as app-facing accessors. It matches public or unqualified `Sub set<Key>`/`Sub get<Key>` names, the shared `Raw`-prefix convention, and any alternate method whose body directly writes or returns the same backing field populated from that designer key.")
    report_path = args.skills_root / "references" / "designer-property-accessors.md"
    report_path.write_text("\n".join(report) + "\n", encoding="utf-8", newline="\n")
    print(f"components={len(components)} properties={totals['properties']} setters={totals['setters']} getters={totals['getters']} paired={totals['paired']} aliases={totals['aliases']}")
    print(f"summary_prop_counts_updated={summary_updates}")
    print(f"report={report_path}")

if __name__ == "__main__":
    main()
