# P Invest Templates

Use these structures when creating or repairing artifacts. Keep them concise enough that a human will actually read them.

## Dashboard: `0-dashboard/now.md`

```markdown
# Now

> Last updated: YYYY-MM-DD

## One Line

...

## 1 Environment

- Macro:
- Industry:
- Market temperature:

## 2 Companies

| Company | Status | Reason | Next check |
|---|---|---|---|

## 3 Decisions

| Name | Trigger | Current status | Required check |
|---|---|---|---|

## 4 Holdings

| Holding | Thesis status | Watch item |
|---|---|---|

## Next Actions

1. ...

## Source Notes

- ...
```

## Company Card: `2-companies/{name}/card.md`

```markdown
# Company Card: {Name}

> Last updated: YYYY-MM-DD

## Summary

- Business:
- Rating:
- Thesis:
- Failure condition:

## Business Quality

- Moat:
- Management:
- Financial quality:

## Valuation

- Anchor:
- Interesting price or condition:
- Margin of safety:

## Bear Case

1. ...
2. ...
3. ...

## Next Check

...

## Sources

| Source | Confidence | Date | Note |
|---|---|---|---|
```

## Decision Log: `3-decisions/decision-logs/{date}-{name}.md`

```markdown
# Decision Log: {Name} - YYYY-MM-DD

## Proposed Action

Buy / add / hold / reduce / sell / no action

## Base Checks

1. Good company:
2. Good price:
3. Good patience:

## Key Questions

- What is being bought or sold?
- What is the thesis?
- What can prove the thesis wrong?
- What happens if price moves against the user by 20 percent?
- Is there FOMO, fear, anchoring, or social proof?

## Position and Risk

- Current exposure:
- Proposed exposure:
- Personal constraint:

## Conclusion

...

## Follow-up

...
```

## Trade Entry: `3-decisions/trades.md`

```markdown
## YYYY-MM-DD - {Action} - {Name}

- Price:
- Quantity:
- User-reported reason:
- Linked decision log:
- Discipline note:
```

## Monthly Review: `5-reviews/monthly/{YYYY-MM}.md`

```markdown
# Monthly Review - YYYY-MM

## Decision Summary

| Date | Name | Action | Result | Process quality |
|---|---|---|---|---|

## What Worked

...

## Mistakes

...

## Repeated Patterns

...

## Rule Changes

...

## Next Month Focus

1. ...
```
