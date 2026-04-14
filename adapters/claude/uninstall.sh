#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "${SCRIPT_DIR}/../.." && pwd)"
UNINSTALLER="${ROOT_DIR}/bootstrap/uninstall-global.sh"

exec "${UNINSTALLER}" --claude-only
