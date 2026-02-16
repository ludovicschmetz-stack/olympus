# Project: {PROJECT_NAME}

## Architecture

Medallion architecture with three layers:
- **Bronze** (raw): Landing zone for raw data, minimal transformation, append-only
- **Silver** (cleaned): Validated, deduplicated, typed, SCD2 where applicable
- **Gold** (business): Aggregated, business-ready datasets and KPIs

Data flows: Sources → Ingestion → Bronze → Silver → Gold → Consumers

## Stack

- **Language**: Python 3.11+
- **Orchestration**: Apache Airflow / dbt
- **Storage**: S3 (data lake), Redshift Serverless / Snowflake (warehouse)
- **Infrastructure**: AWS (Lambda, Glue, Step Functions)
- **IaC**: Terraform / CloudFormation
- **Testing**: pytest, Great Expectations / dbt tests
- **CI/CD**: GitHub Actions

## Conventions

- Naming: snake_case everywhere (Python, SQL, file names)
- SQL: lowercase keywords, CTEs over subqueries, explicit column lists (no SELECT *)
- Python: type hints mandatory, numpy-style docstrings
- Git: trunk-based development, squash merge to main
- Testing: every transformation has at least one unit test + one data quality test
- dbt: one model per file, schema.yml for every model, incremental where > 1M rows

## Domain Vocabulary (Ubiquitous Language)

> ⚠️ Fill this section with YOUR domain terms before starting.
> Hermes (DDD agent) uses this table to enforce naming consistency.

| Term | Definition | Do NOT use |
|------|-----------|------------|
| {e.g. Transaction} | {A single business event recorded at a timestamp} | {record, entry, row} |
| {e.g. Entity} | {The primary business object being tracked} | {item, object, thing} |
| {e.g. Source System} | {An external system that produces data} | {feed, origin, provider} |
| {e.g. Ingestion} | {The process of loading raw data into Bronze layer} | {import, load, fetch, extract} |
| {e.g. Transformation} | {The process of moving data between layers} | {processing, ETL, pipeline step} |

## Task Management (Kanban)

Tasks live in `tasks/` as markdown files:
- `to-do/` → Ready to implement. Pick the lowest-numbered file first.
- `in-progress/` → Currently being worked on. Maximum 1 task at a time.
- `hold-on/` → Blocked — needs a human decision.
- `analyze/` → Needs investigation before implementation.
- `done/` → Completed and reviewed by the Pantheon.

## Review Protocol (The Pantheon)

After completing any code modification:
1. Invoke **Athena** — focus on: SQL injection in dynamic queries, secrets in config, IAM permissions
2. Invoke **Cassandra** — focus on: null handling in transformations, timezone issues, schema evolution, empty datasets
3. Invoke **Hermes** — focus on: column names matching domain vocabulary, model naming consistency
4. Invoke **Apollo** — focus on: SQL query complexity, Python function length, dbt model readability
5. Fix all CRITICAL findings before marking done

## Data-Specific Rules

- All timestamps MUST be stored in UTC with explicit timezone info
- All monetary values MUST use DECIMAL, never FLOAT
- All IDs from external systems MUST be stored as VARCHAR (never assume numeric)
- Schema changes MUST be backward-compatible (additive only)
- Deletions MUST be soft-deletes (is_deleted flag + deleted_at timestamp)
- Every table MUST have: created_at, updated_at, source_system columns
