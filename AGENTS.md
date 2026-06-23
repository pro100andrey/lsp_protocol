# AGENTS.md

Guidance for AI coding agents working in this repository.

## Agent skills

### Issue tracker

Issues and PRDs live as local markdown files under `.scratch/<feature>/` (no remote tracker; PRs are not a triage surface). See `agents/issue-tracker.md`.

### Triage labels

Five canonical roles recorded as a `Status:` line in each issue file, default strings (`needs-triage`, `needs-info`, `ready-for-agent`, `ready-for-human`, `wontfix`). See `agents/triage-labels.md`.

### Domain docs

Single root-level `CONTEXT.md` + `docs/adr/` (created lazily; proceed silently until they exist). See `agents/domain.md`.

### Spec docs

Living spec is the documentation tree under `packages/pro_lsp/doc/` — guides plus a per-method reference. See `agents/spec-map.md`.
