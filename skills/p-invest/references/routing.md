# P Invest Routing

Use this file to choose the right artifact. Keep the user's language simple; the numbered folders are the public workflow.

## Default Root

Use `${HOME}/Documents/Invest` unless the user specifies another path.

## First Run

When the user asks to initialize:

1. Check whether the root folder exists.
2. If absent, create it from `assets/vault-template/`.
3. If present, inspect its structure.
4. Create only missing folders or starter files.
5. Summarize what was created and tell the user they can open the folder in Obsidian.

Do not overwrite user notes, trades, reviews, company files, or rules.

## User Intent Map

| User intent | Primary folder | Main files |
|---|---|---|
| "现在该看什么", "更新面板", "now" | `0-dashboard/` | `now.md`, `inbox.md` |
| "宏观", "行业", "市场环境" | `1-environment/` | `macro/`, `industry/`, `market-notes/` |
| "研究公司", "公司卡片", "候选池" | `2-companies/` | `pool.md`, `{company}/card.md`, `{company}/analysis.md` |
| "观察清单", "是否该买", "记录交易" | `3-decisions/` | `watchlist.md`, `trades.md`, `decision-logs/` |
| "持仓", "thesis", "财报后检查" | `4-holdings/` | `holdings.md`, `thesis-checks/` |
| "复盘", "这个月错在哪" | `5-reviews/` | `monthly/` |
| "规则", "模板", "学习", "审计" | `6-system/` | `rules/`, `templates/`, `notes/`, `audits/` |

## Handoff Order

When a request spans multiple areas, follow the information order:

```text
1-environment -> 2-companies -> 3-decisions -> 4-holdings -> 5-reviews -> 6-system
```

`0-dashboard/now.md` is a summary output, not a source of truth. Update it after the underlying file is written or inspected.

## Process Notes

For non-trivial work, add a short "Process Log" section to the artifact, or write a dated note under `6-system/audits/` when the work is about system health.
