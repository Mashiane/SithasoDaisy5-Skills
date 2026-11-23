#!/usr/bin/env python3
"""Validate a SithasoDaisy5 visual-evidence receipt.

Checks integrity and declared coverage only. It does not judge aesthetics, execute the
project, or prove that anyone inspected the pixels.

Exit codes:
  0 = valid and every required check passed
  1 = valid but blocked or failing checks remain
  2 = bad arguments or unreadable receipt
  3 = integrity failure (missing artifact, stale hash, malformed receipt)
"""

import argparse
import hashlib
import json
import os
import sys

SCHEMA = "sithaso.visual-evidence.v1"
EXIT_OK = 0
EXIT_BLOCKED = 1
EXIT_ARGS = 2
EXIT_INTEGRITY = 3
VALID_STATUS = ("pass", "fail", "blocked")


def sha256_file(path):
    digest = hashlib.sha256()
    with open(path, "rb") as handle:
        for chunk in iter(lambda: handle.read(65536), b""):
            digest.update(chunk)
    return digest.hexdigest()


class Report:
    def __init__(self):
        self.errors = []
        self.blocked = []

    def error(self, message):
        self.errors.append(message)

    def block(self, message):
        self.blocked.append(message)


def resolve(base, path):
    return path if os.path.isabs(path) else os.path.normpath(os.path.join(base, path))


def check_hashed_file(entry, base, report, where, require_kind):
    if not isinstance(entry, dict):
        report.error("%s: entry is not an object" % where)
        return None
    path = entry.get("path")
    if not path:
        report.error("%s: missing path" % where)
        return None
    if require_kind:
        kind = entry.get("kind")
        if kind not in ("image", "video"):
            report.error("%s: artifact kind must be image|video" % where)
            return None
    expected = (entry.get("sha256") or "").lower()
    if len(expected) != 64:
        report.error("%s: sha256 must be 64 hex characters (%s)" % (where, path))
        return None
    full = resolve(base, path)
    if not os.path.isfile(full):
        report.error("%s: file not found: %s" % (where, path))
        return None
    actual = sha256_file(full)
    if actual != expected:
        report.error(
            "%s: stale sha256 for %s (receipt %s..., actual %s...)"
            % (where, path, expected[:12], actual[:12])
        )
        return None
    return entry


def main(argv=None):
    parser = argparse.ArgumentParser(description="Validate a visual-evidence receipt.")
    parser.add_argument("receipt", help="path to visual-evidence.json")
    args = parser.parse_args(argv)

    try:
        with open(args.receipt, "r", encoding="utf-8-sig") as handle:
            data = json.load(handle)
    except Exception as exc:  # noqa: BLE001 - report any read/parse failure verbatim
        print("ERROR: cannot read receipt: %s" % exc)
        return EXIT_ARGS

    base = os.path.dirname(os.path.abspath(args.receipt))
    report = Report()

    if not isinstance(data, dict):
        print("ERROR: receipt root must be a JSON object")
        return EXIT_INTEGRITY

    if data.get("schemaVersion") != SCHEMA:
        report.error("schemaVersion must be %s" % SCHEMA)

    if not (data.get("scope") or "").strip():
        report.error("scope is empty")

    if data.get("platform") not in ("web", "ios", "android"):
        report.error("platform must be web, ios or android")

    sources = data.get("sources")
    if not isinstance(sources, list) or not sources:
        report.error("sources must be a non-empty list")
    else:
        for index, source in enumerate(sources):
            check_hashed_file(source, base, report, "sources[%d]" % index, False)

    comparison = data.get("comparison")
    if comparison not in ("existing-system", "target"):
        report.error("comparison must be existing-system or target")
    elif comparison == "target":
        check_hashed_file(data.get("target"), base, report, "target", False)

    required = data.get("requiredChecks")
    required_ids = []
    if not isinstance(required, list) or not required:
        report.error("requiredChecks must be a non-empty list")
    else:
        for index, item in enumerate(required):
            if not isinstance(item, dict) or not item.get("id"):
                report.error("requiredChecks[%d]: missing id" % index)
                continue
            required_ids.append(item["id"])

    checks = data.get("checks")
    status_by_id = {}
    if not isinstance(checks, list) or not checks:
        report.error("checks must be a non-empty list")
    else:
        for index, check in enumerate(checks):
            where = "checks[%d]" % index
            if not isinstance(check, dict):
                report.error("%s: entry is not an object" % where)
                continue
            check_id = check.get("id")
            if not check_id:
                report.error("%s: missing id" % where)
                continue
            if check_id in status_by_id:
                report.error("%s: duplicate check id %s" % (where, check_id))
            status = check.get("status")
            if status not in VALID_STATUS:
                report.error("%s: status must be pass|fail|blocked" % where)
                continue
            status_by_id[check_id] = status

            if not (check.get("state") or "").strip():
                report.error("%s: state is empty" % where)
            if check.get("observed") is not None and not isinstance(check.get("observed"), str):
                report.error("%s: observed must be a string" % where)

            artifacts = check.get("artifacts")
            if not isinstance(artifacts, list):
                report.error("%s: artifacts must be a list" % where)
                artifacts = []
            for art_index, artifact in enumerate(artifacts):
                check_hashed_file(artifact, base, report, "%s.artifacts[%d]" % (where, art_index), True)

            kind = check.get("kind")
            steps = check.get("steps")
            if kind == "motion":
                if not steps:
                    report.error("%s: motion check needs steps" % where)
                if not any(a.get("kind") == "video" for a in artifacts if isinstance(a, dict)):
                    report.error("%s: motion check needs a video artifact; a still cannot prove motion" % where)
            if kind == "interaction":
                if not steps:
                    report.error("%s: interaction check needs steps" % where)
                if not any(a.get("kind") == "image" for a in artifacts if isinstance(a, dict)):
                    report.error("%s: interaction check needs an image artifact" % where)

            if status == "pass":
                environment = check.get("environment")
                if not isinstance(environment, dict):
                    report.error("%s: a passing check needs an environment object" % where)
                else:
                    for dim in ("width", "height"):
                        value = environment.get(dim)
                        if not isinstance(value, int) or value <= 0:
                            report.error("%s: environment.%s must be a positive integer" % (where, dim))
                if not artifacts:
                    report.error("%s: a passing check needs at least one artifact" % where)
            else:
                report.block("%s: %s" % (check_id, status))

    for required_id in required_ids:
        if required_id not in status_by_id:
            report.error("required check not recorded: %s" % required_id)

    unresolved = data.get("unresolved")
    unresolved_ids = set()
    if not isinstance(unresolved, list):
        report.error("unresolved must be a list")
    else:
        for index, item in enumerate(unresolved):
            if not isinstance(item, dict) or not item.get("id"):
                report.error("unresolved[%d]: missing id" % index)
                continue
            unresolved_ids.add(item["id"])
            if not (item.get("reason") or "").strip():
                report.error("unresolved[%d]: missing reason" % index)
        for check_id, status in status_by_id.items():
            if status != "pass" and check_id not in unresolved_ids:
                report.error("non-passing check not listed in unresolved: %s" % check_id)
        for check_id in sorted(unresolved_ids):
            if check_id not in status_by_id:
                report.error("unresolved references unknown check: %s" % check_id)

    if report.errors:
        for message in report.errors:
            print("[FAIL] %s" % message)
        print("")
        print("RESULT: INTEGRITY FAIL (%d error(s))" % len(report.errors))
        return EXIT_INTEGRITY

    if report.blocked:
        for message in report.blocked:
            print("[BLOCKED] %s" % message)
        print("")
        print("RESULT: BLOCKED (%d check(s) not passing)" % len(report.blocked))
        return EXIT_BLOCKED

    print("RESULT: PASS (%d required check(s) verified)" % len(required_ids))
    return EXIT_OK


if __name__ == "__main__":
    sys.exit(main())
