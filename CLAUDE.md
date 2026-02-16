# Project: {PROJECT_NAME}

> This file is read automatically by Claude Code at the start of every session.
> Customize it to match your project. See `templates/` for domain-specific examples.

## Architecture

{Describe the high-level architecture: main components, data flow, layers}

## Stack

{Languages, frameworks, databases, infrastructure, key dependencies}

## Conventions

- Naming: {snake_case / camelCase / etc.}
- Testing: {strategy — unit, integration, e2e, coverage target}
- Git: {branching model — trunk-based / gitflow / etc.}
- Documentation: {docstring style, ADR location, etc.}

## Domain Vocabulary (Ubiquitous Language)

> Used by Hermes (DDD agent) to enforce consistency.

| Term | Definition | Do NOT use |
|------|-----------|------------|
| {e.g. Transaction} | {A single business event recorded at a timestamp} | {record, entry, row} |

## Task Management (Kanban)

Tasks live in `tasks/` as markdown files:

- `to-do/` → Ready to implement. Pick the lowest-numbered file first.
- `in-progress/` → Currently being worked on. Maximum 1 task at a time.
- `hold-on/` → Blocked — needs a human decision. Add a comment explaining why.
- `analyze/` → Needs investigation before implementation. Produce a plan, not code.
- `done/` → Completed and reviewed by the Pantheon.

When completing a task:
1. Move the file from `in-progress/` to `done/`
2. Append the Pantheon review summary at the bottom of the task file

## Review Protocol (The Pantheon)

After completing any code modification:

1. Invoke **Athena** (security) on all modified files
2. Invoke **Cassandra** (edge cases) on all modified files
3. Invoke **Hermes** (DDD) on all modified files
4. Invoke **Apollo** (simplicity) on all modified files
5. **CRITICAL findings** → must be fixed before the task is considered done
6. **WARNING findings** → fix or document explicit acceptance with rationale
7. **INFO findings** → address if time permits, otherwise log for later

## Interaction Modes

| Mode | When to use | Command |
|------|-------------|---------|
| Accept-it | Simple, well-understood changes | Default mode |
| Plan mode | Complex features, architecture changes | "Let's plan this first" |
| Autonomous | Batch refactoring, test generation (Docker sandbox only) | `--dangerously-skip-permissions` |

## Rules

- Never modify files outside the project directory
- Never commit directly to main — always use a feature branch
- Never skip the Pantheon review for production-bound code
- Always run tests before moving a task to done/
- If unsure about a decision, move the task to hold-on/ and explain why
