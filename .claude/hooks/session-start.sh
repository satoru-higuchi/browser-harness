#!/bin/bash
set -euo pipefail
echo '{"async": true, "asyncTimeout": 300000}'
if [[ -n "${CLAUDE_ENV_FILE:-}" ]]; then
  echo 'export PYTHONPATH=src' >> "$CLAUDE_ENV_FILE"
fi
if [[ "${CLAUDE_CODE_REMOTE:-}" != "true" ]]; then
  exit 0
fi
cd "${CLAUDE_PROJECT_DIR:-$(pwd)}"
if command -v uv >/dev/null 2>&1; then
  uv pip install --system -e . >/tmp/claude-session-start.log 2>&1 || true
elif command -v pip >/dev/null 2>&1; then
  pip install -e . >/tmp/claude-session-start.log 2>&1 || true
fi
exit 0