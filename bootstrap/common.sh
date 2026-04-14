#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CANONICAL_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
SKILL_NAME="geo-seo-toolkit"

CODEX_ROOT="${HOME}/.agents/skills"
CODEX_DEST="${CODEX_ROOT}/${SKILL_NAME}"
CODEX_STATE="${CODEX_ROOT}/.${SKILL_NAME}.state"

CLAUDE_SKILLS_ROOT="${HOME}/.claude/skills"
CLAUDE_DEST="${CLAUDE_SKILLS_ROOT}/${SKILL_NAME}"
CLAUDE_STATE="${CLAUDE_SKILLS_ROOT}/.${SKILL_NAME}.state"

CLAUDE_AGENT_ROOT="${HOME}/.claude/agents"
CLAUDE_AGENT_SOURCE_DIR="${CANONICAL_DIR}/adapters/claude/agents"
CLAUDE_AGENT_FILES=(
  "geo-seo-content.md"
  "geo-seo-platforms.md"
  "geo-seo-schema.md"
  "geo-seo-technical.md"
  "geo-seo-visibility.md"
)

declare -a BACKUP_PATHS=()

timestamp() {
  date +"%Y%m%d-%H%M%S"
}

realpath_safe() {
  python3 - "$1" <<'PY'
import os
import sys

path = sys.argv[1]
if os.path.lexists(path):
    print(os.path.realpath(path))
PY
}

sha256_file() {
  shasum -a 256 "$1" | awk '{print $1}'
}

state_value() {
  local state_file="$1"
  local key="$2"
  if [[ ! -f "$state_file" ]]; then
    return 1
  fi
  awk -F= -v key="$key" '$1 == key { print substr($0, index($0, "=") + 1) }' "$state_file"
}

write_state() {
  local state_file="$1"
  local mode="$2"
  local source="$3"
  local dest="$4"
  local kind="$5"

  mkdir -p "$(dirname "$state_file")"
  printf 'kind=%s\nmode=%s\nsource=%s\ndest=%s\ninstalled_at=%s\n' \
    "$kind" "$mode" "$source" "$dest" "$(timestamp)" >"$state_file"
}

remove_state() {
  local state_file="$1"
  [[ -f "$state_file" ]] && rm -f "$state_file"
}

supports_symlink() {
  local tmpdir
  tmpdir="$(mktemp -d)"
  ln -s "${tmpdir}" "${tmpdir}/link" >/dev/null 2>&1
  local status=$?
  rm -rf "$tmpdir"
  [[ $status -eq 0 ]]
}

choose_mode() {
  local requested="${1:-auto}"
  case "$requested" in
    symlink|copy)
      printf '%s\n' "$requested"
      ;;
    auto)
      if supports_symlink; then
        printf 'symlink\n'
      else
        printf 'copy\n'
      fi
      ;;
    *)
      echo "Unsupported install mode: $requested" >&2
      return 1
      ;;
  esac
}

record_backup() {
  local backup_path="$1"
  BACKUP_PATHS+=("$backup_path")
}

backup_target() {
  local target="$1"
  local backup_path="${target}.backup-$(timestamp)"
  mv "$target" "$backup_path"
  record_backup "$backup_path"
  printf 'Backed up existing path to %s\n' "$backup_path"
}

target_matches_source() {
  local target="$1"
  local source="$2"
  [[ -e "$target" || -L "$target" ]] || return 1
  [[ "$(realpath_safe "$target")" == "$(realpath_safe "$source")" ]]
}

state_matches_install() {
  local state_file="$1"
  local source="$2"
  local dest="$3"
  [[ -f "$state_file" ]] || return 1
  [[ "$(state_value "$state_file" source 2>/dev/null)" == "$source" ]] || return 1
  [[ "$(state_value "$state_file" dest 2>/dev/null)" == "$dest" ]] || return 1
}

prepare_destination() {
  local dest="$1"
  local state_file="$2"
  local source="$3"

  mkdir -p "$(dirname "$dest")"

  if [[ -L "$dest" ]]; then
    if target_matches_source "$dest" "$source"; then
      rm -f "$dest"
      return 0
    fi
    backup_target "$dest"
    return 0
  fi

  if [[ -e "$dest" ]]; then
    if state_matches_install "$state_file" "$source" "$dest"; then
      rm -rf "$dest"
      return 0
    fi
    backup_target "$dest"
  fi
}

install_path() {
  local source="$1"
  local dest="$2"
  local state_file="$3"
  local mode="$4"
  local kind="$5"
  local label="$6"

  prepare_destination "$dest" "$state_file" "$source"

  case "$mode" in
    symlink)
      ln -s "$source" "$dest"
      ;;
    copy)
      cp -R "$source" "$dest"
      ;;
    *)
      echo "Unsupported install mode: $mode" >&2
      return 1
      ;;
  esac

  write_state "$state_file" "$mode" "$source" "$dest" "$kind"
  printf 'Installed %s at %s using %s\n' "$label" "$dest" "$mode"
}

remove_owned_install() {
  local dest="$1"
  local state_file="$2"
  local source="$3"
  local label="$4"

  if ! state_matches_install "$state_file" "$source" "$dest"; then
    printf 'Skipped %s at %s: no matching install state\n' "$label" "$dest"
    return 0
  fi

  if [[ -L "$dest" || -f "$dest" ]]; then
    rm -f "$dest"
  elif [[ -d "$dest" ]]; then
    rm -rf "$dest"
  fi

  remove_state "$state_file"
  printf 'Removed %s at %s\n' "$label" "$dest"
}

verify_install() {
  local dest="$1"
  local state_file="$2"
  local source="$3"
  local label="$4"

  if ! state_matches_install "$state_file" "$source" "$dest"; then
    printf 'FAIL %s: install state missing or mismatched\n' "$label"
    return 1
  fi

  local mode
  mode="$(state_value "$state_file" mode)"

  if [[ "$mode" == "symlink" ]]; then
    if [[ ! -L "$dest" ]]; then
      printf 'FAIL %s: expected symlink at %s\n' "$label" "$dest"
      return 1
    fi
    if ! target_matches_source "$dest" "$source"; then
      printf 'FAIL %s: symlink does not resolve to %s\n' "$label" "$source"
      return 1
    fi
    printf 'OK   %s: symlink resolves to canonical source\n' "$label"
    return 0
  fi

  if [[ ! -e "$dest" ]]; then
    printf 'FAIL %s: copied target missing at %s\n' "$label" "$dest"
    return 1
  fi

  if [[ -d "$source" && -f "$source/SKILL.md" ]]; then
    if [[ ! -f "$dest/SKILL.md" ]]; then
      printf 'FAIL %s: copied target missing SKILL.md\n' "$label"
      return 1
    fi
    if [[ "$(sha256_file "$source/SKILL.md")" != "$(sha256_file "$dest/SKILL.md")" ]]; then
      printf 'FAIL %s: copied SKILL.md does not match canonical source\n' "$label"
      return 1
    fi
  elif [[ -f "$source" ]]; then
    if [[ "$(sha256_file "$source")" != "$(sha256_file "$dest")" ]]; then
      printf 'FAIL %s: copied file does not match canonical source\n' "$label"
      return 1
    fi
  fi

  printf 'OK   %s: copied content matches canonical source\n' "$label"
}
