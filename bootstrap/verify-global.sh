#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/common.sh"

FAILURES=0
WARNINGS=0

pass() {
  printf 'OK   %s\n' "$1"
}

warn() {
  printf 'WARN %s\n' "$1"
  WARNINGS=$((WARNINGS + 1))
}

fail() {
  printf 'FAIL %s\n' "$1"
  FAILURES=$((FAILURES + 1))
}

required_paths=(
  "$CANONICAL_DIR/SKILL.md"
  "$CANONICAL_DIR/PACKAGING.md"
  "$CANONICAL_DIR/bootstrap/install-global.sh"
  "$CANONICAL_DIR/bootstrap/uninstall-global.sh"
  "$CANONICAL_DIR/bootstrap/verify-global.sh"
  "$CANONICAL_DIR/references/workflow.md"
  "$CANONICAL_DIR/workers/audit.md"
  "$CANONICAL_DIR/scripts/fetch_page.py"
  "$CANONICAL_DIR/templates/report.md"
  "$CANONICAL_DIR/migration/AUDIT.md"
  "$CANONICAL_DIR/migration/old-to-new-map.csv"
)

if [[ -d "$CANONICAL_DIR" ]]; then
  pass "Canonical source directory exists at ${CANONICAL_DIR}"
else
  fail "Canonical source directory missing at ${CANONICAL_DIR}"
fi

for path in "${required_paths[@]}"; do
  if [[ -e "$path" ]]; then
    pass "Required path exists: ${path}"
  else
    fail "Required path missing: ${path}"
  fi
done

verify_install "$CODEX_DEST" "$CODEX_STATE" "$CANONICAL_DIR" "Codex skill" || FAILURES=$((FAILURES + 1))
verify_install "$CLAUDE_DEST" "$CLAUDE_STATE" "$CANONICAL_DIR" "Claude skill" || FAILURES=$((FAILURES + 1))

installed_agents=0
for agent_file in "${CLAUDE_AGENT_FILES[@]}"; do
  state_file="${CLAUDE_AGENT_ROOT}/.${agent_file}.${SKILL_NAME}.state"
  if [[ -f "$state_file" ]]; then
    installed_agents=1
    verify_install \
      "${CLAUDE_AGENT_ROOT}/${agent_file}" \
      "$state_file" \
      "${CLAUDE_AGENT_SOURCE_DIR}/${agent_file}" \
      "Claude adapter ${agent_file}" || FAILURES=$((FAILURES + 1))
  fi
done

if [[ "$installed_agents" -eq 0 ]]; then
  warn "No Claude adapter agents are currently installed"
fi

mapfile -d '' PY_FILES < <(find "$CANONICAL_DIR" -type f -name '*.py' ! -path '*/__pycache__/*' -print0)
if [[ ${#PY_FILES[@]} -gt 0 ]]; then
  if python3 -m py_compile "${PY_FILES[@]}"; then
    pass "Python files compile with python3 -m py_compile"
  else
    fail "Python syntax check failed"
  fi
else
  warn "No Python files found for py_compile"
fi

if [[ -d "$CANONICAL_DIR/tests" ]] && find "$CANONICAL_DIR/tests" -type f | grep -q .; then
  if command -v uv >/dev/null 2>&1; then
    if uv run --quiet --with pytest --with-requirements "$CANONICAL_DIR/requirements.txt" pytest -q "$CANONICAL_DIR/tests"; then
      pass "Test suite passes via uv"
    else
      fail "Test suite failed via uv"
    fi
  elif python3 -m pytest --version >/dev/null 2>&1; then
    if python3 -m pytest -q "$CANONICAL_DIR/tests"; then
      pass "Test suite passes via python3 -m pytest"
    else
      fail "Test suite failed via python3 -m pytest"
    fi
  else
    warn "Tests present but pytest is unavailable and uv is not installed"
  fi
else
  warn "No tests were found"
fi

if [[ -f "$CODEX_DEST/SKILL.md" ]]; then
  pass "Smoke check: Codex installed SKILL.md exists"
else
  fail "Smoke check: Codex installed SKILL.md missing"
fi

if [[ -f "$CLAUDE_DEST/SKILL.md" ]]; then
  pass "Smoke check: Claude installed SKILL.md exists"
else
  fail "Smoke check: Claude installed SKILL.md missing"
fi

echo "Summary: ${FAILURES} failure(s), ${WARNINGS} warning(s)"
if [[ "$FAILURES" -gt 0 ]]; then
  exit 1
fi
