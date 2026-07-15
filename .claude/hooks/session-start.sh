#!/usr/bin/env bash
# SessionStart hook — routing reminder covering skills, MCPs, connectors,
# built-in tools, and subagents. Read CLAUDE.md at repo root for the full
# tables. Fires on every new session in this repo.

cat <<'EOF'
[session-start] Full-stack routing loaded. See CLAUDE.md for tables.

Proactive-use rule: match the task, invoke the top match yourself,
announce briefly, proceed. Do NOT wait for the user to name a skill,
turn on an MCP, or select a tool.

Skill triggers (auto-invoked by description matching):
  • Frontend/UI slop → taste-skill · impeccable · frontend-design
  • Motion / animation / hover → animate · design-motion-principles
  • Charts, plots, dashboards → dataviz (read BEFORE any chart code)
  • Artifacts (HTML/MD pages) → artifact-design (read BEFORE Artifact tool)
  • Spreadsheets / decks / PDFs / Word → xlsx · pptx · pdf · docx
  • AI writing tics on prose → humanizer (final pass)
  • Prompt / persona / tone work → Camada 05 skills
  • Trust / refusals / transparency → Camada 06 skills

MCP triggers:
  • Screenshot a URL & compare with reference → playwright
  • Figma → production code → figma
  • Cross-app orchestration (1000+ apps) → composio
  • Email, calendar, drive, Notion, GitHub, YouTube analytics →
    Gmail · Google_Calendar · Google_Drive · Notion · github · Algrow

Subagent triggers:
  • Find files/symbols across many paths → Agent(Explore)
  • Design an implementation strategy → Agent(Plan)
  • Independent second-opinion review → /code-review
  • Anything else needing a fresh context → Agent(general-purpose)

Verification loop: after any UI change, use playwright MCP to screenshot
at 1920 & 390, compare with the reference, iterate CSS until they match.
That's "giving the agent eyes."
EOF
