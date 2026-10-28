# Tariff Alert scoring stage - degraded run log

## 2026-10-28
- Upstream fetch job 029ec0ccb44f reported 4 relevant new documents out of 7 new Federal Register documents.
- Scoring stage could not read data/latest_fetch.json: cron filesystem allowlist is /Users/yang/Documents, /Users/yang/scripts, /tmp, /private/tmp; the project directory is outside it. Recurring since Oct 20.
- Recovery attempts: GitHub repo data/ has no latest_fetch.json mirrored; Firecrawl blocked (file:// rejected, credits exhausted); /tmp/tariff-alert/ has only stale Oct 22 probe files; no terminal/execute tools in cron.
- send=false written to data/latest_digest.json via GitHub mirror commit (d288618). No items scored or summarized; no content fabricated.
- The 4 relevant items are already marked processed by fetch-stage dedup and will not re-surface on their own.
- Standing fix needed: widen allowlist to /Users/yang/projects, or have fetch stage copy latest_fetch.json to /tmp/tariff-alert/, or embed item summaries in the fetch job output.
