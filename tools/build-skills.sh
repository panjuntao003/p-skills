#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OUT_DIR="${1:-"$ROOT_DIR/dist/skills"}"
VERSION="$(tr -d '[:space:]' < "$ROOT_DIR/VERSION")"

if ! command -v python3 >/dev/null 2>&1; then
  echo "error: python3 command is required" >&2
  exit 1
fi

rm -rf "$OUT_DIR"
mkdir -p "$OUT_DIR"

INNER_DIR="$(mktemp -d)"
trap 'rm -rf "$INNER_DIR"' EXIT

group_for() {
  case "$1" in
    p-invest)
      echo "investment" ;;
    p-news)
      echo "intelligence" ;;
    *)
      echo "other" ;;
  esac
}

build_one() {
  local skill_dir="$1"
  local name
  local group
  local target_dir
  local archive_path

  name="$(basename "$skill_dir")"
  group="$(group_for "$name")"
  target_dir="$INNER_DIR/$group"
  mkdir -p "$target_dir"
  archive_path="$target_dir/${name}.zip"

  python3 - "$skill_dir" "$archive_path" <<'PY'
import os
import sys
import zipfile

source_dir, archive_path = sys.argv[1], sys.argv[2]

skip_names = {".DS_Store"}
skip_dirs = {"__pycache__"}

with zipfile.ZipFile(archive_path, "w", compression=zipfile.ZIP_DEFLATED) as archive:
    for root, dirs, files in os.walk(source_dir):
        dirs[:] = [d for d in sorted(dirs) if d not in skip_dirs]
        for filename in sorted(files):
            if filename in skip_names or filename.endswith(".pyc"):
                continue
            path = os.path.join(root, filename)
            archive.write(path, os.path.relpath(path, source_dir))
PY

  echo "built $group/${name}.zip"
}

for skill_md in "$ROOT_DIR"/skills/*/SKILL.md; do
  build_one "$(dirname "$skill_md")"
done

cat > "$INNER_DIR/README.md" <<EOF
# p-skills ${VERSION}

Portable personal workflow skills.

## Included skills

- p-invest - human-readable investment research workflow under ~/Documents/Invest
- p-news - AI news and builder-signal digest under ~/Documents/news

## Install from zip

Each skill zip contains a root-level SKILL.md. Import the individual zip supported by your agent tool, or unzip and copy the skill folder into your local skills directory.

For Codex, the preferred install path remains GitHub:

\`\`\`bash
python3 ~/.codex/skills/.system/skill-installer/scripts/install-skill-from-github.py \\
  --url https://github.com/panjuntao003/p-skills/tree/main/skills/p-invest
\`\`\`

Restart the agent after installing skills.
EOF

python3 - "$INNER_DIR" "$OUT_DIR/p-skills-${VERSION}.zip" <<'PY'
import os
import sys
import zipfile

inner_dir, archive_path = sys.argv[1], sys.argv[2]

with zipfile.ZipFile(archive_path, "w", compression=zipfile.ZIP_DEFLATED) as archive:
    for root, dirs, files in os.walk(inner_dir):
        dirs[:] = sorted(dirs)
        for filename in sorted(files):
            path = os.path.join(root, filename)
            archive.write(path, os.path.relpath(path, inner_dir))
PY

echo
echo "done: $OUT_DIR/p-skills-${VERSION}.zip"
