# Project: {PROJECT_NAME}

## Architecture

Layered architecture:
- **API Layer**: REST endpoints, request validation, authentication
- **Service Layer**: Business logic, orchestration, domain rules
- **Repository Layer**: Data access, database queries, external API calls
- **Domain Layer**: Entities, value objects, domain events

## Stack

- **Language**: Python 3.11+ / TypeScript 5+
- **Framework**: FastAPI / Express / NestJS
- **Database**: PostgreSQL
- **Cache**: Redis
- **Auth**: JWT + OAuth2
- **Testing**: pytest / Jest, httpx / supertest for integration
- **CI/CD**: GitHub Actions
- **Deployment**: Docker, AWS ECS / Kubernetes

## Conventions

- Naming: snake_case (Python) / camelCase (TypeScript)
- API: RESTful, versioned (/api/v1/), plural resource names
- HTTP methods: GET=read, POST=create, PUT=full update, PATCH=partial update, DELETE=soft delete
- Responses: consistent envelope `{ data, meta, errors }`
- Errors: RFC 7807 Problem Details format
- Git: feature branches, conventional commits, squash merge
- Testing: unit tests for services, integration tests for endpoints

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
1. Invoke **Athena** — focus on: auth bypass, injection, IDOR, rate limiting
2. Invoke **Cassandra** — focus on: missing error handling, pagination edge cases, concurrent requests
3. Invoke **Hermes** — focus on: endpoint naming, request/response field names, error messages
4. Invoke **Apollo** — focus on: controller/service complexity, abstraction layers, DRY violations
5. Fix all CRITICAL findings before marking done

## API-Specific Rules

- All endpoints MUST require authentication unless explicitly public
- All user input MUST be validated at the API layer before reaching services
- All database queries MUST use parameterized queries (never string concatenation)
- All responses MUST include appropriate cache headers
- Rate limiting MUST be configured on all public endpoints
- Pagination MUST be implemented for all list endpoints (default: 20, max: 100)
