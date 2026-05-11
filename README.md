# p-skills

Portable Codex/Hermes skills for AI news, investment research, builder signals, and personal intelligence workflows.

## Skills

| Skill | Purpose | Status |
|---|---|---|
| `p-news` | AI news and builder-signal digest powered by AI HOT plus primary-source verification. | stable |
| `p-invest` | Human-readable personal investment research vault workflow under `~/Documents/Invest`. | beta |

## Install

### Codex skill installer

Ask your agent to install a skill from this repository, or run:

```bash
python3 ~/.codex/skills/.system/skill-installer/scripts/install-skill-from-github.py \
  --url https://github.com/panjuntao003/p-skills/tree/main/skills/p-invest
```

Restart Codex after installation.

### Manual copy

Copy a skill folder into your local skills directory.

```bash
mkdir -p ~/.hermes/skills/information-curation
cp -R skills/p-news ~/.hermes/skills/information-curation/p-news
mkdir -p ~/.hermes/skills/investment
cp -R skills/p-invest ~/.hermes/skills/investment/p-invest
```

`p-news` writes Markdown artifacts to:

```text
~/Documents/news/
```

The folder is created by the agent when needed.

`p-invest` creates and maintains:

```text
~/Documents/Invest/
```

The folder is intentionally human-readable. Open it directly in Obsidian if you want a vault-style interface.

After installing, ask your agent:

```text
用 p-invest 初始化我的投资系统
```

The initialized folder uses numbered sections:

```text
0-dashboard/     current view and inbox
1-environment/   macro, industry, and market context
2-companies/     company pool, screening, cards, and analysis
3-decisions/     watchlist, trade log, and decision records
4-holdings/      current holdings and thesis checks
5-reviews/       monthly reviews
6-system/        rules, templates, notes, and audits
```

Common follow-up prompts:

```text
用 p-invest 更新我的投资面板
用 p-invest 研究一家公司
用 p-invest 把这家公司加入观察清单
用 p-invest 记录一笔交易
用 p-invest 做一次月度复盘
```
