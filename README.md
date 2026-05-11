# p-skills

Portable personal workflow skills for Codex, Claude Code, and other agents that support `SKILL.md`.

Version: `0.1.0`

## Skills

| Skill | Purpose | Output folder | Status |
|---|---|---|---|
| `p-news` | AI news and builder-signal digest powered by AI HOT plus primary-source verification. | `~/Documents/news/` | stable |
| `p-invest` | Human-readable personal investment research workflow. | `~/Documents/Invest/` | beta |

## Install

### Codex Skill Installer

Install one skill directly from GitHub:

```bash
python3 ~/.codex/skills/.system/skill-installer/scripts/install-skill-from-github.py \
  --url https://github.com/panjuntao003/p-skills/tree/main/skills/p-invest
```

or:

```bash
python3 ~/.codex/skills/.system/skill-installer/scripts/install-skill-from-github.py \
  --url https://github.com/panjuntao003/p-skills/tree/main/skills/p-news
```

Restart Codex after installation.

### Universal Skills CLI

If your environment supports the `skills` CLI:

```bash
npx skills add panjuntao003/p-skills
```

### Claude Code Plugin Marketplace

This repo includes `.claude-plugin/marketplace.json` for Claude Code style plugin marketplace installs.

```bash
claude plugin marketplace add panjuntao003/p-skills
```

Then install the plugin exposed by your marketplace flow.

### Release Zip

Each tagged release publishes a bundle:

```text
p-skills-{version}.zip
```

Inside the bundle, each skill is also available as its own zip with a root-level `SKILL.md`.

### Manual Copy

Copy a skill folder into your local skills directory:

```bash
mkdir -p ~/.hermes/skills/information-curation
cp -R skills/p-news ~/.hermes/skills/information-curation/p-news

mkdir -p ~/.hermes/skills/investment
cp -R skills/p-invest ~/.hermes/skills/investment/p-invest
```

## p-invest

After installing, ask your agent:

```text
用 p-invest 初始化我的投资系统
```

It creates and maintains:

```text
~/Documents/Invest/
```

The folder is intentionally human-readable and can be opened directly in Obsidian.

```text
0-dashboard/     current view and inbox
1-environment/   macro, industry, and market context
2-companies/     company pool, screening, cards, and analysis
3-decisions/     watchlist, trade log, and decision records
4-holdings/      current holdings and thesis checks
5-reviews/       monthly reviews
6-system/        rules, templates, notes, and audits
```

Common prompts:

```text
用 p-invest 更新我的投资面板
用 p-invest 研究一家公司
用 p-invest 把这家公司加入观察清单
用 p-invest 记录一笔交易
用 p-invest 做一次月度复盘
```

## p-news

`p-news` writes Markdown artifacts to:

```text
~/Documents/news/
```

The folder is created by the agent when needed.

## Build

Build local release artifacts:

```bash
bash tools/build-skills.sh
```

The output is written to:

```text
dist/skills/
```

## Release

1. Update `VERSION`.
2. Commit the change.
3. Tag the same version:

```bash
git tag v$(cat VERSION)
git push origin main --tags
```

GitHub Actions will build and publish the release bundle.
