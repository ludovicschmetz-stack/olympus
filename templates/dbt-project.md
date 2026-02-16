# Project: {PROJECT_NAME}

## Architecture

dbt project following the staging → intermediate → mart pattern:
- **staging/** (stg_): 1:1 with source tables, renaming, type casting, basic cleaning
- **intermediate/** (int_): Joins, business logic, complex transformations
- **marts/** (fct_, dim_): Final business-ready models (facts and dimensions)

## Stack

- **dbt**: dbt-core 1.7+ or dbt Cloud
- **Warehouse**: Redshift Serverless / Snowflake / BigQuery
- **Testing**: dbt tests (schema + data), Great Expectations
- **CI/CD**: GitHub Actions + dbt Cloud CI
- **Documentation**: dbt docs, auto-generated from schema.yml

## Conventions

- Naming: snake_case, prefixed by layer (stg_, int_, fct_, dim_)
- SQL: lowercase keywords, CTEs over subqueries, one CTE per logical step
- Models: one model per file, max 200 lines (split into intermediate if longer)
- schema.yml: every model MUST have description + column descriptions + tests
- Sources: defined in _sources.yml, never reference raw tables directly
- Materializations: views for staging, incremental for large tables, tables for marts
- Git: feature branches, one model change per PR

## Domain Vocabulary (Ubiquitous Language)

| Term | Definition | Do NOT use |
|------|-----------|------------|
| {Define your terms} | | |

## Task Management (Kanban)

Tasks live in `tasks/` as markdown files:
- `to-do/` → Ready to implement
- `in-progress/` → Maximum 1 task at a time
- `hold-on/` → Blocked
- `analyze/` → Needs investigation
- `done/` → Completed and reviewed

## Review Protocol (The Pantheon)

After completing any code modification:
1. Invoke **Athena** — focus on: SQL injection in macros/Jinja, exposed PII in marts
2. Invoke **Cassandra** — focus on: null handling in joins, incremental logic gaps, timezone issues
3. Invoke **Hermes** — focus on: model names matching domain terms, column naming consistency
4. Invoke **Apollo** — focus on: CTE complexity, model length, unnecessary intermediate models
5. Fix all CRITICAL findings before marking done

## dbt-Specific Rules

- Every model MUST have at least: unique + not_null test on primary key
- Every source MUST have freshness checks configured
- Incremental models MUST handle late-arriving data (lookback window)
- All timestamps MUST be in UTC
- No SELECT * — always explicit column lists
- Jinja macros MUST have documentation in a comment block
- Every PR MUST include `dbt build --select state:modified+` passing
