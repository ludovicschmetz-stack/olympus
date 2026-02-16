# Project: {PROJECT_NAME}

## Architecture

{Describe the high-level architecture of your project.}

## Stack

{List your languages, frameworks, databases, and infrastructure.}

## Conventions

- Naming: {your naming convention}
- Testing: {your testing strategy}
- Git: {your branching model}
- Documentation: {your documentation approach}

## Domain Vocabulary (Ubiquitous Language)

| Term | Definition | Do NOT use |
|------|-----------|------------|
| | | |

## Task Management (Kanban)

Tasks live in `tasks/` as markdown files:
- `to-do/` → Ready to implement
- `in-progress/` → Maximum 1 task at a time
- `hold-on/` → Blocked
- `analyze/` → Needs investigation
- `done/` → Completed and reviewed

## Review Protocol (The Pantheon)

After completing any code modification:
1. Invoke **Athena** on all modified files
2. Invoke **Cassandra** on all modified files
3. Invoke **Hermes** on all modified files
4. Invoke **Apollo** on all modified files
5. Fix all CRITICAL findings before marking done
6. WARNING findings: fix or document explicit acceptance

## Rules

- {Add your project-specific rules here}
