# AGENTS CODE INSTRUCTIONS

**Use this guide for any coding agent (Claude, Gemini, Codex, etc.). Keep it in sync with project reality and trim stale notes.**

## Read This First
- Start with `README.md` for the current overview and architecture. If `.claude/project_context.md` exists, read it on every relaunch for current status and open issues.
- Check `CHANGELOG.md` for prior fixes/decisions. Review relevant PRPs in `PRPs/` when implementing features.
- Skim `.claude/commands/` so you know the available workflows (`generate-prp`, `execute-prp`, `ultimate_validate_command`).
- Confirm referenced paths exist before acting; prefer absolute paths in examples on Windows.

## Core Workflow
- Gather context → plan → execute → validate. Use the available task/todo tool (e.g., TodoWrite) to track multi-step work.
- When a PRP is provided, follow it end-to-end and extend research if gaps remain. Create new PRPs via `.claude/commands/generate-prp.md` when specs are missing.
- Keep the workspace tidy: avoid temporary files; delete any you create once done.
- Run the validation steps appropriate to the repo (see `tests/` and `.claude/commands/validate.md` if present). Fix failures before handing off.

## Standards & Behavior (Global)
- Minimize new files and avoid emoji in code/documents.
- Document learnings: update this file (AGENTS.md) with agent-facing guidance when things change meaningfully. Record fixes/learnings in `CHANGELOG.md`; update `README.md` when APIs/architecture shift. Move completed PRPs to `PRPs/implemented/` after execution.
- Prefer modular, readable code; split files when they become unwieldy. Keep imports clear and consistent.
- Be cautious with external dependencies/APIs: add error handling, log context, and fail gracefully. Handle Unicode input safely when working with user data.
- Never hallucinate packages, paths, or APIs—verify before referencing.
- Avoid destructive actions (purges/resets) unless explicitly approved and with clear warnings to the user.

## Documentation & Tracking
- Keep `.claude/project_context.md` (if present) current with metrics, known issues, and active work.
- Use AGENTS.md for agent-facing practices; keep it concise and project-specific. See `CLAUDE-example.md` for a detailed reference layout if you need to expand this file.
- Update `README.md` when user-facing behavior, endpoints, or setup steps change.
- `CHANGELOG.md` captures fixes, root causes, and key lessons.

## Testing & Validation
- Default to the repo’s existing tools (pytest/Jest/etc.) and configs. Include happy-path, edge, and failure tests when adding coverage.
- If `.claude/commands/validate.md` exists, run it before completion; if missing, generate it using `ultimate_validate_command.md`.
- Re-run checks after fixes until clean; report what was run and any remaining risk.

## Project Context (fill in as you learn)
- Current system state:
- Tech stack:
- Key features:
- Known issues/risks:

## Command Quick Reference
- `.claude/commands/generate-prp.md`: How to research and draft a PRP (agent-agnostic).
- `.claude/commands/execute-prp.md`: How to plan and implement from a PRP.
- `.claude/commands/ultimate_validate_command.md`: How to build a comprehensive validation command for this repo.
- `.claude/mcp.servers.json`: Shared MCP server config for any agent; adjust `command`/`args` to match your runtime (e.g., replace `uvx` with `npx` or a direct binary if needed).

Use this document as the single source of truth for agent workflow across platforms.
