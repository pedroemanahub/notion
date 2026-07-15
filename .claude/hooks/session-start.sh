#!/usr/bin/env bash
# SessionStart hook — injects a short routing reminder so Claude picks the
# right skill/MCP on the very first turn without the user asking.
# Output goes to stdout as an additional context message.

cat <<'EOF'
[session-start] 42-skill design pack loaded on this repo.

Routing quick reference (see CLAUDE.md for the full table):
  • Frontend/UI slop → invoke taste-skill, impeccable, or frontend-design
  • Motion / animation → animate + design-motion-principles
  • Browser verification loop → playwright MCP (open URL, screenshot,
    compare, iterate CSS)
  • Figma → code → figma MCP (figma-developer-mcp)
  • Cross-app orchestration → composio MCP
  • Product-AI behavior (context, turns, generative UI) → Camada 04 skills
  • Prompt architecture → Camada 05 skills
  • Trust / refusals / transparency → Camada 06 skills

Rule: invoke the matching Skill via the Skill tool BEFORE writing code.
Do not wait for the user to name it.
EOF
