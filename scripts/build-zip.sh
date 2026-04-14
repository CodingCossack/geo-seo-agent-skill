#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OUT_DIR="$ROOT_DIR/dist"
TMP_DIR="$OUT_DIR/.tmp-package"
SKILL_DIR_NAME="$(
  awk '
    /^name:[[:space:]]*/ {
      value = $0
      sub(/^name:[[:space:]]*/, "", value)
      gsub(/"/, "", value)
      print value
      exit
    }
  ' "$ROOT_DIR/SKILL.md"
)"

if [[ -z "$SKILL_DIR_NAME" ]]; then
  echo "Failed to determine skill folder name from SKILL.md" >&2
  exit 1
fi

ZIP_PATH="$OUT_DIR/${SKILL_DIR_NAME}-skill.zip"
STAGE_DIR="$TMP_DIR/$SKILL_DIR_NAME"

rm -rf "$TMP_DIR"
mkdir -p "$STAGE_DIR" "$OUT_DIR"

rsync -a \
  --exclude '.git' \
  --exclude '.github' \
  --exclude 'dist' \
  --exclude 'README.md' \
  --exclude 'AGENTS.md' \
  --exclude '.gitignore' \
  --exclude '.DS_Store' \
  --exclude '__pycache__' \
  --exclude '.pytest_cache' \
  "$ROOT_DIR/" "$STAGE_DIR/"

(
  cd "$TMP_DIR"
  zip -qr "$ZIP_PATH" "$SKILL_DIR_NAME"
)

rm -rf "$TMP_DIR"

echo "Wrote $ZIP_PATH"
