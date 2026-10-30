# Tariff Alert scoring stage - degraded run log

## 2026-10-28
- Upstream fetch job 029ec0ccb44f reported 4 relevant new documents out of 7 new Federal Register documents.
- Scoring stage could not read data/latest_fetch.json: cron filesystem allowlist is /Users/yang/Documents, /Users/yang/scripts, /tmp, /private/tmp; the project directory is outside it. Recurring since Oct 20.
- Recovery attempts: GitHub repo data/ has no latest_fetch.json mirrored; Firecrawl blocked (file:// rejected, credits exhausted); /tmp/tariff-alert/ has only stale Oct 22 probe files; no terminal/execute tools in cron.
- send=false written to data/latest_digest.json via GitHub mirror commit (d288618). No items scored or summarized; no content fabricated.
- The 4 relevant items are already marked processed by fetch-stage dedup and will not re-surface on their own.
- Standing fix needed: widen allowlist to /Users/yang/projects, or have fetch stage copy latest_fetch.json to /tmp/tariff-alert/, or embed item summaries in the fetch job output.

## 2026-10-29
- Upstream fetch job 029ec0ccb44f reported 5 relevant new documents out of 6 new Federal Register documents. 4th degraded run (Oct 20, 26, 28, 29).
- Same root cause: data/latest_fetch.json outside cron filesystem allowlist (/Users/yang/Documents, /Users/yang/scripts, /tmp, /private/tmp).
- Recovery attempts: GitHub data/ still has no fetch-file mirror; Firecrawl live-confirmed out of credits (fresh 402-style error this run); /tmp and Documents searches found no copies; no terminal/execute tools.
- send=false written to data/latest_digest.json via GitHub mirror commit (2978758). No items scored; nothing fabricated.
- The 5 relevant items are deduped as seen upstream and will not re-surface; each degraded day permanently skips real documents for subscribers.
- ESCALATED standing fix (any one restores the pipeline): (a) widen cron allowlist to /Users/yang/projects, (b) fetch stage copies latest_fetch.json to /tmp/tariff-alert/latest_fetch.json after each run, (c) fetch job output embeds the full item list (document_number, title, url, abstract).
- Note: Canada-side stage (job 8c9b7a31ac77) shares the same handoff path; CBSA/Gazette items were equally unrecoverable.

## 2026-10-30
- Upstream fetch job 029ec0ccb44f reported 5 relevant new documents out of 6 new Federal Register documents. 5th degraded run (Oct 20, 26, 28, 29, 30).
- Same root cause: data/latest_fetch.json outside cron filesystem allowlist.
- Recovery attempts: /tmp/tariff-alert/ checked FIRST per standing procedure - only stale probe files present (digest_probe.txt, latest_fetch_link.txt, Oct 28 digest copy); a symlink-read attempt returned ENOENT (dangling stub, not a real handoff); GitHub data/ still has no fetch-file mirror; Firecrawl out of credits; no terminal/execute tools.
- send=false written to data/latest_digest.json via GitHub mirror commit (cd5395e). No items scored; nothing fabricated.
- The 5 relevant items are deduped as seen upstream and will not re-surface.
- The standing fix remains undone and is now blocking the majority of weekday runs. Any ONE of: (a) allowlist /Users/yang/projects, (b) fetch stage copies latest_fetch.json to /tmp/tariff-alert/, (c) fetch output embeds full item list. Canada-side stage 8c9b7a31ac77 shares the handoff and needs the same treatment.
