---
name: p-invest
description: >-
  Personal investment research workflow skill. Use this skill whenever the user mentions investing,
  stocks, portfolio, company research, watchlists, trade logging, holdings, monthly reviews, or any
  personal investment activity — even casual mentions like "I bought some shares" or "is this company
  worth researching". Initializes and maintains a human-readable Markdown folder under
  Documents/Invest (also works as an Obsidian vault). Produces research artifacts; does not give
  direct buy or sell advice.
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

## Routing

- Initialize or repair the folder structure: read `references/routing.md` and use `assets/vault-template/`.
- Update the dashboard, environment, company research, decisions, holdings, reviews, or system notes: read `references/workflows.md`.
- Apply investment discipline, source quality, and decision guardrails: read `references/rules.md`.
- Create or repair Markdown artifacts: read `references/templates.md`.

## Invariants

1. Do not provide direct buy or sell instructions. Provide checks, scenarios, evidence, and decision records.
2. Every external fact that enters a formal artifact needs a source, confidence level, and date.
3. Treat social media and unsourced claims as leads only.
4. Keep current facts fresh; use WebSearch or WebFetch to verify market, price, legal, regulatory, company, and macro data when the answer depends on recency.
5. Do not hide the system from the user. Files should be readable by a human without knowing agent internals.
6. Preserve existing user files. Append, repair, or create missing files; do not silently rewrite history.
7. Trading is restricted to A-shares (沪深两市, Shanghai/Shenzhen exchanges). All company research, watchlist entries, trade logs, and holdings must use A-share tickers only. Do not research or recommend US stocks, HK stocks, or any other non-A-share markets unless the user explicitly removes this restriction.

## Example Triggers

Phrases that should invoke this skill (Chinese or English):

- "用 p-invest 初始化我的投资系统" / "set up my investment research folder"
- "更新我的投资面板" / "update my dashboard"
- "研究一下这家公司" / "research this company for me"
- "把这家公司加入观察清单" / "add this to my watchlist"
- "我今天买了/卖了 X，帮我记录" / "I bought some X today, log it"
- "检查一下持仓 thesis 有没有变化" / "check if my thesis still holds"
- "做一次月度复盘" / "do a monthly review"
- "把这条投资教训固化到规则里" / "turn this lesson into a rule"
