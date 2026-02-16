# ⚡ Olympus

**A divine council of AI agents reviewing every line of your code.**

Olympus is a ready-to-use methodology kit for [Claude Code](https://docs.anthropic.com/en/docs/claude-code) that brings structured, multi-agent code review to your vibe coding workflow. Inspired by [Bernard Lambeau's approach](https://elo-lang.org) to building the Elo programming language with Claude Code.

No framework. No dependencies. No code to maintain.
Just battle-tested prompts, a proven workflow, and 4 divine reviewers.

---

## 🏛️ The Pantheon

| Agent | Domain | Role |
|-------|--------|------|
| **Athena** | Security | Detects vulnerabilities, injection flaws, exposed secrets, broken auth |
| **Hermes** | Domain-Driven Design | Guards ubiquitous language, bounded contexts, domain model integrity |
| **Cassandra** | Edge Cases & Bugs | Foresees production failures, missing error paths, race conditions |
| **Apollo** | Simplicity & Clarity | Fights complexity, over-engineering, and violations of SOLID/DRY/KISS |

Each agent runs in its own isolated context window, with read-only tool access — they analyze without modifying your code.

---

## 🚀 Quick Start

### 1. Clone into your project

```bash
# Option A: Clone as a new project
git clone https://github.com/ludovicschmetz-stack/olympus.git my-project
cd my-project
./init.sh --template data-platform --name "My Project"

# Option B: Add to an existing project
git clone https://github.com/ludovicschmetz-stack/olympus.git /tmp/olympus
cp -r /tmp/olympus/.claude /tmp/olympus/tasks /tmp/olympus/CLAUDE.md .
rm -rf /tmp/olympus
```

### 2. Customize CLAUDE.md

Edit `CLAUDE.md` at your project root to describe your architecture, stack, and conventions. Use one of the provided templates in `templates/` as a starting point.

### 3. Start working with Claude Code

```bash
claude
> Read CLAUDE.md and available agents.
> Then pick the first task in tasks/to-do/ and implement it.
```

Claude Code will automatically:
- Load your project context from `CLAUDE.md`
- Discover agents in `.claude/agents/`
- Invoke the Pantheon for review after each implementation
- Report findings with severity and fix suggestions

---

## 📂 Project Structure

```
olympus/
├── CLAUDE.md                          # Project context (customize this)
├── .claude/
│   ├── agents/
│   │   ├── athena.md                  # 🛡️ Security auditor
│   │   ├── hermes.md                  # 📐 DDD guardian
│   │   ├── cassandra.md               # 🔮 Edge case prophet
│   │   ├── apollo.md                  # ☀️ Simplicity arbiter
│   │   └── council.md                 # ⚡ Orchestrator (runs all 4)
│   └── safe-setup/
│       ├── Dockerfile                 # Alpine sandbox for autonomous mode
│       └── docker-compose.yml
├── tasks/
│   ├── to-do/
│   │   └── _template.md              # Task template
│   ├── in-progress/
│   ├── hold-on/
│   ├── analyze/
│   └── done/
├── templates/                         # Pre-built CLAUDE.md templates
│   ├── data-platform.md
│   ├── web-api.md
│   ├── dbt-project.md
│   └── generic.md
├── init.sh                            # Project scaffolding script
├── README.md
└── LICENSE
```

---

## 🎮 Three Modes of Operation

Following Bernard Lambeau's proven methodology:

| Mode | When | How |
|------|------|-----|
| **Accept-it** | Simple, low-risk changes | Claude proposes, you approve, agents review after |
| **Plan mode** | Complex features, architecture decisions | Claude asks design questions first, you agree on approach, then implement |
| **Autonomous** | Batch operations, refactoring, tests | Use `--dangerously-skip-permissions` inside Docker sandbox only |

---

## 📋 Kanban Workflow

Tasks are managed as markdown files in the `tasks/` directory:

```
tasks/
├── to-do/          → Ready to start
├── in-progress/    → Currently being worked on (max 1 at a time)
├── hold-on/        → Blocked, needs human decision
├── analyze/        → Needs investigation before implementation
└── done/           → Completed, reviewed by the Pantheon
```

### Task Lifecycle

1. Create task from template: `cp tasks/to-do/_template.md tasks/to-do/003-my-task.md`
2. Claude picks up the task, moves it to `in-progress/`
3. Claude implements the task
4. The Pantheon reviews (all 4 agents)
5. Fix all CRITICAL findings
6. Address or explicitly accept WARNING findings
7. Move to `done/` with review summary appended

---

## 🔧 Customization

### Adding Your Own Agents

Create a new `.md` file in `.claude/agents/`:

```markdown
---
name: your-agent-name
description: When this agent should be invoked
tools: Read, Grep, Glob
model: sonnet
---

You are a [role description]...

## Scope
...

## Output format
...
```

### Domain-Specific Templates

Use `templates/` to pre-configure CLAUDE.md for common project types. Run:

```bash
./init.sh --template data-platform --name "My Data Project"
```

Available templates: `data-platform`, `web-api`, `dbt-project`, `generic`

---

## 🏗️ For Freelancers

Olympus is designed to be part of your professional delivery:

> *"Every deliverable passes through a multi-agent review covering security (OWASP), domain consistency (DDD), edge cases, and complexity analysis. Clients receive a quality report with each delivery."*

Include the Pantheon review summary in your delivery documentation to demonstrate engineering rigor.

---

## 📖 References

- [Bernard Lambeau's Elo project](https://elo-lang.org/blog/20241225-building-elo-with-claude/)
- [Claude Code documentation](https://docs.anthropic.com/en/docs/claude-code)
- [Claude Code subagents](https://docs.anthropic.com/en/docs/claude-code/sub-agents)
- [VoltAgent awesome-claude-code-subagents](https://github.com/VoltAgent/awesome-claude-code-subagents)

---

## License

This project uses **dual licensing**:

| Component | License | Scope |
|-----------|---------|-------|
| Structure, scripts, templates, docs | **MIT** | `init.sh`, `templates/`, `tasks/`, `README.md`, `Dockerfile`, etc. |
| Agent definitions (the prompts) | **CC BY-NC-SA 4.0** | `.claude/agents/*.md` |

**In plain terms:**
- The project scaffolding is fully open — fork it, use it, sell it, whatever.
- The agent prompts (Athena, Hermes, Cassandra, Apollo, Council) are free for personal and educational use, but require a commercial license for business use (freelance delivery, SaaS, consulting).

See [LICENSE](LICENSE) and [.claude/agents/LICENSE](.claude/agents/LICENSE) for details.
