---
description: Lint and format-check the repo with ruff (no writes).
---

Run, in this order:
1. `ruff check src tests`
2. `ruff format --check src tests`

Report any findings as a short bulleted list. Do not auto-fix — that is `/fix`.