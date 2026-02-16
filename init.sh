#!/usr/bin/env bash
set -euo pipefail

# ⚡ Olympus — Project Initializer
# Usage: ./init.sh --template <template> --name "Project Name"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEMPLATES_DIR="$SCRIPT_DIR/templates"

# Defaults
TEMPLATE="generic"
PROJECT_NAME=""

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

usage() {
    echo -e "${CYAN}⚡ Olympus — Project Initializer${NC}"
    echo ""
    echo "Usage: $0 [OPTIONS]"
    echo ""
    echo "Options:"
    echo "  --template <name>   Template to use (default: generic)"
    echo "  --name <name>       Project name (required)"
    echo "  --help              Show this help"
    echo ""
    echo "Available templates:"
    for f in "$TEMPLATES_DIR"/*.md; do
        basename "$f" .md
    done
}

# Parse arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --template) TEMPLATE="$2"; shift 2 ;;
        --name) PROJECT_NAME="$2"; shift 2 ;;
        --help) usage; exit 0 ;;
        *) echo -e "${RED}Unknown option: $1${NC}"; usage; exit 1 ;;
    esac
done

# Validate
if [[ -z "$PROJECT_NAME" ]]; then
    echo -e "${RED}Error: --name is required${NC}"
    usage
    exit 1
fi

TEMPLATE_FILE="$TEMPLATES_DIR/$TEMPLATE.md"
if [[ ! -f "$TEMPLATE_FILE" ]]; then
    echo -e "${RED}Error: Template '$TEMPLATE' not found${NC}"
    echo "Available templates:"
    for f in "$TEMPLATES_DIR"/*.md; do
        echo "  $(basename "$f" .md)"
    done
    exit 1
fi

echo -e "${CYAN}⚡ Olympus — Initializing project${NC}"
echo -e "  Project:  ${GREEN}$PROJECT_NAME${NC}"
echo -e "  Template: ${GREEN}$TEMPLATE${NC}"
echo ""

# Apply template to CLAUDE.md
echo -e "${YELLOW}→ Applying template to CLAUDE.md...${NC}"
sed "s/{PROJECT_NAME}/$PROJECT_NAME/g" "$TEMPLATE_FILE" > "$SCRIPT_DIR/CLAUDE.md"

# Create first example task
FIRST_TASK="$SCRIPT_DIR/tasks/to-do/001-project-setup.md"
if [[ ! -f "$FIRST_TASK" ]]; then
    echo -e "${YELLOW}→ Creating first task...${NC}"
    cat > "$FIRST_TASK" << EOF
# Task: Project Setup

> ID: 001
> Created: $(date +%Y-%m-%d)
> Priority: HIGH
> Estimated effort: S

## Objective

Initialize the project structure, install dependencies, and verify
that the development environment works end-to-end.

## Acceptance Criteria

- [ ] Project runs locally without errors
- [ ] All dependencies are installed and documented
- [ ] A basic "hello world" or smoke test passes
- [ ] CLAUDE.md domain vocabulary section is filled in
- [ ] Git repository is initialized with .gitignore

## Interaction Mode

plan
EOF
fi

# Verify structure
echo -e "${YELLOW}→ Verifying project structure...${NC}"
CHECKS_PASSED=0
CHECKS_TOTAL=0

check() {
    CHECKS_TOTAL=$((CHECKS_TOTAL + 1))
    if [[ -e "$1" ]]; then
        echo -e "  ${GREEN}✓${NC} $2"
        CHECKS_PASSED=$((CHECKS_PASSED + 1))
    else
        echo -e "  ${RED}✗${NC} $2 — missing: $1"
    fi
}

check "$SCRIPT_DIR/CLAUDE.md" "CLAUDE.md (project context)"
check "$SCRIPT_DIR/.claude/agents/athena.md" "Athena (security agent)"
check "$SCRIPT_DIR/.claude/agents/hermes.md" "Hermes (DDD agent)"
check "$SCRIPT_DIR/.claude/agents/cassandra.md" "Cassandra (edge case agent)"
check "$SCRIPT_DIR/.claude/agents/apollo.md" "Apollo (simplicity agent)"
check "$SCRIPT_DIR/.claude/agents/council.md" "Council (orchestrator)"
check "$SCRIPT_DIR/.claude/safe-setup/Dockerfile" "Docker sandbox"
check "$SCRIPT_DIR/tasks/to-do" "Kanban: to-do"
check "$SCRIPT_DIR/tasks/in-progress" "Kanban: in-progress"
check "$SCRIPT_DIR/tasks/hold-on" "Kanban: hold-on"
check "$SCRIPT_DIR/tasks/analyze" "Kanban: analyze"
check "$SCRIPT_DIR/tasks/done" "Kanban: done"

echo ""
echo -e "${GREEN}✅ Olympus initialized ($CHECKS_PASSED/$CHECKS_TOTAL checks passed)${NC}"
echo ""
echo -e "Next steps:"
echo -e "  1. Edit ${CYAN}CLAUDE.md${NC} — fill in your architecture, stack, and domain vocabulary"
echo -e "  2. Run ${CYAN}claude${NC} to start Claude Code"
echo -e "  3. Ask Claude to ${CYAN}read CLAUDE.md and pick up the first task${NC}"
echo ""
echo -e "${CYAN}⚡ The Pantheon watches over your code.${NC}"
