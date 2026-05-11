# p-skills

Portable Codex/Hermes skills for AI news, builder signals, and personal intelligence workflows.

## Skills

| Skill | Purpose | Status |
|---|---|---|
| `p-news` | AI news and builder-signal digest powered by AI HOT plus primary-source verification. | stable |

## Install

Copy a skill folder into your local skills directory.

```bash
mkdir -p ~/.hermes/skills/information-curation
cp -R skills/p-news ~/.hermes/skills/information-curation/p-news
```

`p-news` writes Markdown artifacts to:

```text
~/Documents/news/
```

The folder is created by the agent when needed.
