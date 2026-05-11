# P Invest Workflows

This file describes the human-readable workflows. Use only the sections relevant to the user request.

## 0 Dashboard

Use `0-dashboard/now.md` as the user's first screen.

Update it when the user asks for a current overview or after major research changes.

Recommended sections:

1. One-line status
2. Environment
3. Companies to watch
4. Decision watchlist
5. Holdings requiring attention
6. Next actions

Do not turn `now.md` into a long research report. Link to deeper files.

## 1 Environment

Use for macro, industry, liquidity, policy, market temperature, and broad risk context.

Write dated files under:

- `1-environment/macro/`
- `1-environment/industry/`
- `1-environment/market-notes/`

The output should answer:

1. Is the environment supportive, neutral, or hostile?
2. Which industries or styles deserve attention?
3. What changed since the last note?
4. What data is stale or uncertain?

## 2 Companies

Use `2-companies/pool.md` for the candidate pool.

For each company, create a folder named by ticker or readable company slug:

```text
2-companies/{ticker-or-name}/
├── card.md
└── analysis.md
```

`card.md` is the durable half-page summary. `analysis.md` is the deeper evidence file.

Company work should answer:

1. What does the company do?
2. Why might it be a good business?
3. What is the moat, and how could it fail?
4. What valuation anchor is being used?
5. What conditions would move it to the watchlist?
6. What are at least three bear arguments?

## 3 Decisions

Use `3-decisions/watchlist.md` for names close to a decision.

Use `3-decisions/trades.md` for actual user-reported trades. Append newest entries at the top.

Use `3-decisions/decision-logs/{date}-{ticker}.md` for pre-trade or sell/reduce evaluations.

Decision work should distinguish:

- A company is good
- A price is interesting
- The user is actually ready to act

Never treat a watchlist trigger as permission to buy or sell.

## 4 Holdings

Use `4-holdings/holdings.md` for current holdings if the user wants the system to track them.

Use `4-holdings/thesis-checks/{date}-{ticker}.md` for filing checks, catalyst follow-up, valuation drift, or thesis-break reviews.

Holding work should answer:

1. Is the original thesis intact?
2. Has new evidence changed the risk?
3. Is the issue fundamental or just price movement?
4. Does this need a decision log?

## 5 Reviews

Use `5-reviews/monthly/{YYYY-MM}.md` for monthly reviews.

Review work should cover:

1. Decisions made
2. Decisions avoided
3. Mistakes and repeated patterns
4. Good judgment versus luck
5. Rule changes for next month

If there were no trades, review research quality, missed triggers, and whether inaction was disciplined or avoidant.

## 6 System

Use `6-system/rules/` for durable rules, `6-system/templates/` for reusable formats, `6-system/notes/` for learning notes, and `6-system/audits/` for system checks.

Only change rules when the lesson changes future behavior. Do not overfit one anecdote into a permanent rule.
