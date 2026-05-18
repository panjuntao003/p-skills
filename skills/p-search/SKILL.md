---
name: "p-search"
description: "智能搜索路由器。当你搜索、查询、查找、研究任何信息时使用——无论是网页搜索、社交媒体（小红书/抖音/微博/推特/B站/V2EX/Reddit）、招聘、GitHub、视频字幕、还是金融数据。基于 opencli 多源路由，一个入口覆盖所有搜索场景。"
---

# p-search：智能搜索路由

## 前置检查

每次搜索前先确认 opencli 可用：
```bash
opencli list -f yaml  # 确认哪些站点在线
```

不要硬编码站点名——以实时输出为准。

## 路由规则

1. **明确指定平台** → 直接用对应站点
2. **未指定** → 选 1 个 AI 源（`grok`/`doubao`/`gemini` 三选一）
3. **结果不足** → 补 1-2 个专用源

## AI 源选择

| 源 | 适合 |
|----|------|
| `grok` | 英文互联网舆论、X/Twitter、热点 |
| `doubao` | 中文语境、抖音生态 |
| `gemini` | 全球网页、通用信息检索 |

同一题内每个 AI 源最多 1 次调用，非 AI 源最多 2 次。

## 搜索入口对照表

| 场景 | 用什么 |
|------|--------|
| AI 实时讨论 | `grok` |
| 中文热点/抖音 | `doubao` |
| 通用英文资料 | `gemini` |
| 网页搜索 | `web_search` |
| 网页内容提取 | `web_fetch` |
| 小红书 | web_search site:xiaohongshu.com |
| 抖音 | web_search |
| Twitter/X | web_search site:x.com |
| 微博 | web_search site:weibo.com |
| B站 | web_search site:bilibili.com |
| V2EX | `curl -s "https://www.v2ex.com/api/topics/hot.json"` |
| Reddit | web_search site:reddit.com |
| GitHub | `gh search repos "query" --sort stars --limit 10` |
| YouTube 字幕 | `yt-dlp --write-sub --skip-download -o "/tmp/%(id)s" "URL"` |
| 雪球/股票 | web_search site:xueqiu.com |

## 查询技巧

使用 `opencli <site> -h` 获取实时参数，不依赖记忆。构造查询词时用"主题 + 目标 + 限定条件"格式。

## 搜索摘要

每次搜索结束后附：
```
搜索摘要
- 网站：<site> | 查询词：<term> | 次数：<n>
- 已跳过：<site>（原因）
```
