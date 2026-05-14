# CLAUDE.md

Stack: Python 3.11+, setuptools, `uv` for env management.

Common commands:
- Test: `pytest` (or `/test` for `pytest -x -q`)
- Lint: `ruff check src tests` (or `/lint` 窶・also checks format)
- Format: `ruff format src tests` (or `/fix` to also auto-fix lint)
- Install (editable): `uv pip install -e .`

Layout:
- Core code: `src/browser_harness/` (admin, daemon, helpers, run)
- Agent edits stay inside `agent-workspace/` 窶・never touch core from there.
- Tests: `tests/` (pytest, `pythonpath = ["src"]` already set in `pyproject.toml`).

Reference docs:
- `AGENTS.md` 窶・architecture overview and contribution norms
- `SKILL.md` 窶・how an agent operates the harness/CLI
- `install.md` 窶・install, attach a browser, troubleshoot

Hooks:
- `.claude/hooks/session-start.sh` installs deps in remote sessions and exports `PYTHONPATH=src`.
- `.claude/hooks/ruff-on-edit.sh` runs `ruff format` on edited `.py` files automatically.

Pre-commit (optional but recommended):
- One-time setup: `pip install pre-commit && pre-commit install`
- Runs ruff format + ruff check --fix on staged files before each commit.
