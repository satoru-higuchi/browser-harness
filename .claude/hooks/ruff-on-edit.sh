#!/bin/bash
set -euo pipefail
if ! command -v ruff >/dev/null 2>&1; then exit 0; fi
input=$(cat)
paths=$(printf '%s' "$input" | jq -r '
  [.tool_input.file_path? // empty,
   (.tool_input.edits // [] | .[]?.file_path? // empty),
   (.tool_input.file_paths // [] | .[]? // empty)]
  | unique | .[]' 2>/dev/null || true)
[[ -z "$paths" ]] && exit 0
py_files=()
while IFS= read -r p; do
  [[ -z "$p" ]] && continue
  [[ "$p" == *.py ]] || continue
  [[ -f "$p" ]] || continue
  py_files+=("$p")
done <<<"$paths"
[[ ${#py_files[@]} -eq 0 ]] && exit 0
ruff format "${py_files[@]}" >/dev/null 2>&1 || true
exit 0