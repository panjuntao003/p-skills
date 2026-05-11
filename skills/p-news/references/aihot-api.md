# AI HOT API Notes

Source checked from `https://aihot.virxact.com/aihot-skill/` on 2026-05-11.

## Access

Base site: `https://aihot.virxact.com`

The public API requires a browser-like `User-Agent` header. If a call fails with a forbidden response, first check the header before assuming the service is unavailable.

Use the helper:

```bash
python3 scripts/fetch_aihot.py items --since-days 1 --take 50
python3 scripts/fetch_aihot.py daily
python3 scripts/fetch_aihot.py items --q OpenAI --since-days 7 --take 30
```

## Route Selection

- Selected items: default for broad, fresh questions. Supports time windows, category, keyword, and result limits.
- Daily report: only when the user explicitly asks for "日报" or a specific daily issue.
- Dailies archive: use when discovering available daily dates.
- All items: only when the user explicitly asks for all, complete, full, or exhaustive coverage.

## Categories

AI HOT item categories:

- `ai-models`: model releases and updates
- `ai-products`: product releases and updates
- `industry`: industry news
- `paper`: papers and research
- `tip`: techniques and opinions

Use category filters when the user asks for a specific lane such as papers, model releases, product launches, or tips.

## User-Facing Output Rules

Do show:

- Human-readable time window
- Source name
- Original URL
- Publication time converted to Beijing time or natural language

Do not show:

- Raw endpoint paths
- Query parameter names such as mode, category, take, cursor, or since
- Rate limit, cache, nginx, HTTP status, or cursor implementation details
- API debugging logs

## Failure Handling

- If today's daily report is unavailable, explain that the latest daily may not have generated yet and use the newest available daily or selected recent items.
- If keyword search returns little, broaden to a seven-day selected feed and explain the search was sparse in the process log, not in the main digest.
- If an item matters but only has an AI HOT summary, mark it as unverified until the original URL is checked.
