---
name: p-invest
description: >-
  Personal investment research workflow skill. Use to initialize and maintain a human-readable
  investment research folder under Documents/Invest, update now.md, research companies, manage
  environment notes, watchlists, trade logs, holdings checks, monthly reviews, rules, templates,
  and learning notes. Produces Markdown artifacts and does not provide direct buy or sell advice.
---

# P Invest

## Purpose

`p-invest` helps a user and their agent share one readable investment research system. It creates and maintains a numbered Markdown folder, defaulting to `${HOME}/Documents/Invest`, that can also be opened as an Obsidian vault.

Default language is Chinese unless the user asks otherwise.

## Output Contract

Always leave a durable Markdown artifact before the chat summary.

Default root:

```text
${HOME}/Documents/Invest
```

If the user gives another path, use that path. If the folder does not exist, initialize it from `assets/vault-template/`. If it already exists, inspect it first and only create missing files or folders; do not overwrite user content unless explicitly asked.

The final chat response should summarize the result and name the updated file path.

## Folder Model

The user and agent should use the same structure:

```text
0-dashboard/     current view and inbox
1-environment/   macro, industry, and market context
2-companies/     company pool, screening, cards, and analysis
3-decisions/     watchlist, trade log, and decision records
4-holdings/      current holdings and thesis checks
5-reviews/       monthly reviews
6-system/        rules, templates, notes, and audits
```

Daily users can mostly read `0-dashboard/now.md`. The numbered folders explain the rest of the workflow when the user wants to inspect or take over.

## Routing

- Initialize or repair the folder structure: read `references/routing.md` and use `assets/vault-template/`.
- Update the dashboard, environment, company research, decisions, holdings, reviews, or system notes: read `references/workflows.md`.
- Apply investment discipline, source quality, and decision guardrails: read `references/rules.md`.
- Create or repair Markdown artifacts: read `references/templates.md`.

## Invariants

1. Do not provide direct buy or sell instructions. Provide checks, scenarios, evidence, and decision records.
2. Every external fact that enters a formal artifact needs a source, confidence level, and date.
3. Treat social media and unsourced claims as leads only.
4. Keep current facts fresh; browse or otherwise verify market, price, legal, regulatory, company, and macro data when the answer depends on recency.
5. Do not hide the system from the user. Files should be readable by a human without knowing agent internals.
6. Preserve existing user files. Append, repair, or create missing files; do not silently rewrite history.

## Common Commands

Examples of user requests this skill should handle:

- "用 p-invest 初始化我的投资系统"
- "更新我的投资面板"
- "研究一下这家公司"
- "把这家公司加入观察清单"
- "我今天买了/卖了 X，帮我记录"
- "检查一下持仓 thesis 有没有变化"
- "做一次月度复盘"
- "把这条投资教训固化到规则里"
