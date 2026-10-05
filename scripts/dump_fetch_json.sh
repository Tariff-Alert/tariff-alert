#!/bin/bash
# Fetches the current Federal Register fetch JSON and prints it to stdout so the
# agent-side cron can capture it via GitHub. One-shot read-only probe.
/usr/bin/python3 - <<'PY'
import json
p = "/Users/yang/projects/tariff-alert/data/latest_fetch.json"
try:
    with open(p, "r", encoding="utf-8") as f:
        data = json.load(f)
    print(json.dumps(data, ensure_ascii=False))
except Exception as e:
    print(json.dumps({"error": str(e)}))
PY
