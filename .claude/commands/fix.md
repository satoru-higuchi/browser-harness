---
description: Auto-fix lint and format issues with ruff.
---

Run, in this order:
1. `ruff format src tests`
2. `ruff check --fix src tests`

Then `git status` and summarize what changed. Do not commit — leave the diff for the user to review.