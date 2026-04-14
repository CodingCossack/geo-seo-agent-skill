#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "${SCRIPT_DIR}/../.." && pwd)"
INSTALLER="${ROOT_DIR}/bootstrap/install-global.sh"
INSTALL_AGENTS=false

for arg in "$@"; do
  case "$arg" in
    --with-agents) INSTALL_AGENTS=true ;;
    *) echo "Unknown argument: $arg" >&2; exit 1 ;;
  esac
done

if [ "${INSTALL_AGENTS}" = true ]; then
  exec "${INSTALLER}" --claude-only --with-claude-agents
fi

exec "${INSTALLER}" --claude-only --no-claude-agents
