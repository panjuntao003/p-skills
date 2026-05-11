#!/usr/bin/env python3
"""Fetch AI HOT public data with stable routing and User-Agent handling."""

from __future__ import annotations

import argparse
import json
import sys
from datetime import datetime, timedelta, timezone
from typing import Any
from urllib.error import HTTPError, URLError
from urllib.parse import urlencode
from urllib.request import Request, urlopen


BASE_URL = "https://aihot.virxact.com"
UA = (
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) "
    "AppleWebKit/537.36 (KHTML, like Gecko) "
    "Chrome/124.0.0.0 Safari/537.36"
)


def iso_days_ago(days: int) -> str:
    dt = datetime.now(timezone.utc) - timedelta(days=days)
    return dt.replace(microsecond=0).isoformat().replace("+00:00", "Z")


def fetch(path: str, params: dict[str, Any] | None = None) -> Any:
    url = f"{BASE_URL}{path}"
    if params:
        clean = {k: v for k, v in params.items() if v is not None}
        if clean:
            url = f"{url}?{urlencode(clean)}"
    req = Request(url, headers={"User-Agent": UA, "Accept": "application/json"})
    try:
        with urlopen(req, timeout=30) as resp:
            body = resp.read().decode("utf-8")
    except HTTPError as exc:
        body = exc.read().decode("utf-8", errors="replace")
        raise SystemExit(f"AI HOT HTTP {exc.code}: {body}") from exc
    except URLError as exc:
        raise SystemExit(f"AI HOT request failed: {exc}") from exc
    return json.loads(body)


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description="Fetch AI HOT public API data.")
    sub = parser.add_subparsers(dest="command", required=True)

    items = sub.add_parser("items", help="Fetch selected or all recent items.")
    items.add_argument("--mode", choices=["selected", "all"], default="selected")
    items.add_argument("--category", choices=["ai-models", "ai-products", "industry", "paper", "tip"])
    items.add_argument("--q", help="Keyword search.")
    items.add_argument("--since-days", type=int, default=1, help="UTC lookback window in days.")
    items.add_argument("--take", type=int, default=50)
    items.add_argument("--cursor")

    daily = sub.add_parser("daily", help="Fetch latest or date-specific daily report.")
    daily.add_argument("--date", help="YYYY-MM-DD")

    dailies = sub.add_parser("dailies", help="Fetch daily report archive index.")
    dailies.add_argument("--take", type=int, default=14)

    return parser


def main() -> int:
    args = build_parser().parse_args()
    if args.command == "items":
        params = {
            "mode": args.mode,
            "category": args.category,
            "q": args.q,
            "since": iso_days_ago(args.since_days) if args.since_days is not None else None,
            "take": args.take,
            "cursor": args.cursor,
        }
        data = fetch("/api/public/items", params)
    elif args.command == "daily":
        path = f"/api/public/daily/{args.date}" if args.date else "/api/public/daily"
        data = fetch(path)
    else:
        data = fetch("/api/public/dailies", {"take": args.take})

    print(json.dumps(data, ensure_ascii=False, indent=2))
    return 0


if __name__ == "__main__":
    sys.exit(main())
