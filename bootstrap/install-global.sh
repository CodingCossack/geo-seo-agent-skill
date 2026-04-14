#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/common.sh"

MODE_REQUESTED="auto"
INSTALL_CODEX=true
INSTALL_CLAUDE=true
INSTALL_CLAUDE_AGENTS=true

for arg in "$@"; do
  case "$arg" in
    --copy) MODE_REQUESTED="copy" ;;
    --symlink) MODE_REQUESTED="symlink" ;;
    --codex-only)
      INSTALL_CODEX=true
      INSTALL_CLAUDE=false
      INSTALL_CLAUDE_AGENTS=false
      ;;
    --claude-only)
      INSTALL_CODEX=false
      INSTALL_CLAUDE=true
      ;;
    --no-claude-agents) INSTALL_CLAUDE_AGENTS=false ;;
    --with-claude-agents) INSTALL_CLAUDE_AGENTS=true ;;
    *)
      echo "Unknown argument: $arg" >&2
      exit 1
      ;;
  esac
done

MODE="$(choose_mode "$MODE_REQUESTED")"

echo "Canonical source: ${CANONICAL_DIR}"
echo "Install mode: ${MODE}"

if [[ "$INSTALL_CODEX" == true ]]; then
  install_path "$CANONICAL_DIR" "$CODEX_DEST" "$CODEX_STATE" "$MODE" "skill" "Codex skill"
fi

if [[ "$INSTALL_CLAUDE" == true ]]; then
  install_path "$CANONICAL_DIR" "$CLAUDE_DEST" "$CLAUDE_STATE" "$MODE" "skill" "Claude skill"
fi

if [[ "$INSTALL_CLAUDE" == true && "$INSTALL_CLAUDE_AGENTS" == true && -d "$CLAUDE_AGENT_SOURCE_DIR" ]]; then
  mkdir -p "$CLAUDE_AGENT_ROOT"
  for agent_file in "${CLAUDE_AGENT_FILES[@]}"; do
    install_path \
      "${CLAUDE_AGENT_SOURCE_DIR}/${agent_file}" \
      "${CLAUDE_AGENT_ROOT}/${agent_file}" \
      "${CLAUDE_AGENT_ROOT}/.${agent_file}.${SKILL_NAME}.state" \
      "$MODE" \
      "agent" \
      "Claude adapter ${agent_file}"
  done
fi

if [[ ${#BACKUP_PATHS[@]} -gt 0 ]]; then
  echo "Backups created:"
  printf '  %s\n' "${BACKUP_PATHS[@]}"
else
  echo "Backups created: none"
fi
