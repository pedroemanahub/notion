# Repo instructions — Notion + Claude Code

This file tells you (Claude) how to route work across **every** capability
attached to this session: skills, MCP tools, connectors, built-in tools, and
subagents. The rules apply globally — not just to the 42-skill design pack —
and are read at the start of every session.

## Proactive-use rule (applies to everything)

Default failure mode: generic output because no skill / MCP / tool was
selected. On every non-trivial task, work through this sequence before
touching code or writing prose:

1. **Match the task** against the routing tables below (skills → tools → MCPs
   → agents).
2. **Invoke the top match yourself.** Do not wait for the user to name a
   skill or turn on an MCP; the description matching in each `SKILL.md`
   already declares what triggers it.
3. **Layer additional capabilities** when the task spans rows (e.g.
   `taste-skill` + `animate` + `playwright` MCP for a landing page with
   motion and browser verification).
4. **Announce briefly** which skill/MCP/agent you invoked in one sentence,
   then proceed. No decision trees in prose.
5. If nothing in the tables fits, work directly — but consider whether a
   skill *should* fit and mention it once.

Never say "I don't have access to X" without first calling `ToolSearch`
for MCP tools with matching keywords or `SearchSkills` for skills. Deferred
tools appear in `<system-reminder>` blocks by name only; their schemas load
on demand.

---

## Skill routing

### Design & UI (in-repo, `.claude/skills/`)

#### Camada 01 · Frontend & UI

| Task pattern | Skill |
|---|---|
| Landing page, portfolio, redesign, hero, "make it not look AI" | `taste-skill` |
| Polish / critique / audit / animate on existing UI | `impeccable` |
| Aesthetic direction, kill default fonts, purpose+tone first | `frontend-design` |
| Any transition, hover, modal, page-swap, micro-interaction | `animate` |
| Motion audit — spot AI-slop animations | `design-motion-principles` |
| Apply color/type theme to slides, docs, HTML | `theme-factory` |
| Brand board, logo direction, identity deck | `brandkit` |
| Process work: research, UX strategy, handoff, QA — with 96 sub-skills | `designer-skills` |

#### Camada 02 · Pixels, 3D & Video

| Task pattern | Skill |
|---|---|
| Blog header, thumbnail, mockup, environment redesign | `nano-banana` |
| Image with intent-to-prompt + brand presets + multi-turn edits | `banana-claude` |
| Carousel, quote card, infographic exported as PNG/PDF | `canvas-design` |
| Flow fields, noise, particles, generative hero backgrounds | `algorithmic-art` |
| Video with voiceover, music, footage, captions, render loop | `remotion-superpowers` |
| Blender-driven 3D motion (bpy) | `blender-motion` |
| After Effects motion (ExtendScript / MCP) | `aftereffects-motion` |

#### Camada 04 · Product-AI behavior

| Task pattern | Skill |
|---|---|
| Token budgeting, summarize vs. retrieve, graceful degradation | `context-window-design` |
| Turn design, repair, alignment checkpoints | `conversation-patterns` |
| Deciding when to render a component vs. plain text | `generative-ui` |
| Staged reveal of AI capability across turns | `progressive-disclosure` |
| Sequencing text / image / tool calls in one flow | `multimodal-orchestration` |
| Handoff between agent-led and user-led moments | `mixed-initiative-flow` |
| Reading frustration from caps/punctuation/latency | `frustration-detection` |
| Correction & rating that change model behavior | `feedback-loops` |

#### Camada 05 · Prompt & persona

| Task pattern | Skill |
|---|---|
| Writing / restructuring a system prompt | `system-prompt-structure` |
| Character, voice, boundaries defined once | `persona-architecture` |
| Formality / warmth / confidence per context | `tone-calibration` |
| Response map for frustration, confusion, delight, distress | `emotional-design` |
| Parameterized templates with typed variables | `template-design` |
| Few-shot examples targeting recurring model errors | `few-shot-patterns` |
| Structured multi-step reasoning chains | `chain-of-thought-design` |
| Testable output limits (format, length, tone) | `constraint-specification` |

#### Camada 06 · Trust & Safety

| Task pattern | Skill |
|---|---|
| Explicit refusal patterns, behavioral boundaries | `guardrail-design` |
| Confidence & source signals — no over/under trust | `trust-calibration` |
| Show what model knows / doesn't / certainty | `transparency-patterns` |

### Anthropic built-in skills (account-level)

| Task pattern | Skill |
|---|---|
| Create web components, pages, apps with strong taste | `frontend-design` |
| Poster / static art / editable PNG or PDF | `canvas-design` |
| Anthropic brand colors, fonts, style | `brand-guidelines` |
| Any `.xlsx` / `.csv` / `.tsv` — read, edit, create, chart | `xlsx` |
| Any `.pptx` / `.potx` deck — read, create, edit | `pptx` |
| Any `.pdf` — read, merge, split, form-fill, OCR | `pdf` |
| Any `.docx` / `.dotx` — write reports, memos, letters | `docx` |
| Removing AI writing tics (em-dash overuse, rule of three, etc.) | `humanizer` |
| Structured documentation co-authoring workflow | `doc-coauthoring` |
| Create / edit / eval / benchmark a skill itself | `skill-creator` |
| User asks "how do I…" / "is there a skill for…" | `find-skills` |

### User-invocable `/slash-command` skills

Invoke only when the user types `/<name>` — do not auto-invoke.

| `/command` | Purpose |
|---|---|
| `/dataviz` | Read BEFORE writing any chart, plot, dashboard code |
| `/artifact-design` | Read BEFORE publishing an Artifact |
| `/verify` | End-to-end verify a code change actually works |
| `/code-review` | Review current diff for correctness + cleanup |
| `/simplify` | Cleanup pass (reuse, simplification) — no bug hunt |
| `/security-review` | Security review of pending changes |
| `/review` | Review a GitHub PR (not your own diff) |
| `/run` | Launch this project's app to observe a change |
| `/init` | Initialize a new CLAUDE.md |
| `/update-config` | Configure harness via `settings.json` |
| `/keybindings-help` | Customize keyboard shortcuts |
| `/fewer-permission-prompts` | Scan transcripts and allowlist read-only calls |
| `/loop` | Recurring task on an interval |
| `/claude-api` | Reference for Anthropic SDK / model IDs / pricing |
| `/session-start-hook` | Create SessionStart hooks for web sessions |

**Two skills that trigger themselves — never wait for `/`:**

- `dataviz` — read BEFORE the first line of chart code (matplotlib, plotly,
  Recharts, d3, or inline SVG), BEFORE choosing chart colors, BEFORE
  building a stat tile / meter / KPI row.
- `artifact-design` — read BEFORE calling the `Artifact` tool.

---

## MCP routing

### Local MCPs (`.mcp.json`)

| Task pattern | MCP |
|---|---|
| Open a URL, screenshot at 1920 & 390, compare with reference, iterate CSS | `playwright` |
| Import a Figma file, extract tokens, generate faithful production code | `figma` |
| Read a design in one app, open a PR in another (1000+ app connector) | `composio` |

### Claude.ai connectors (session-attached)

Tools appear as `mcp__<Server>__*`. Load schemas with `ToolSearch` when
needed — the connectors are always listed in system reminders even when
tools aren't yet in the tool list.

| Task pattern | Connector | Tool prefix |
|---|---|---|
| Draft email replies, label threads, summarize inbox | Gmail | `mcp__Gmail__*` |
| List / create / update calendar events, suggest times | Google Calendar | `mcp__Google_Calendar__*` |
| Search Drive, read file content, create files | Google Drive | `mcp__Google_Drive__*` |
| Search Notion pages, create pages, query databases, comment | Notion | `mcp__Notion__*` |
| Read / create issues, PRs, branches, commits, releases; CI jobs | github | `mcp__github__*` |
| YouTube channel analytics, viral video search, TTS, video analysis | Algrow | `mcp__Algrow__*` |
| Form data (needs OAuth before use) | Jotform | `mcp__Jotform__*` — user must authorize first |

### MCP registry / marketplace lookups

If a task is likely served by an MCP not yet installed, call
`SearchMcpRegistry` with keywords before saying it's unavailable. If a
match exists, tell the user how to connect it via claude.ai settings.

---

## Built-in tool routing

Prefer the dedicated tool over `Bash` whenever one fits.

| Task | Tool |
|---|---|
| Find files by name pattern | `Glob` (never `find` in Bash) |
| Search file contents (regex) | `Grep` (never `grep`/`rg` in Bash) |
| Read a file (whole or slice) | `Read` |
| Modify existing file (surgical) | `Edit` |
| Create a new file, or full rewrite | `Write` |
| Run shell command / build / test | `Bash` |
| Fetch a public URL and summarize | `WebFetch` |
| Web search for public info | `WebSearch` |
| Publish an HTML/Markdown page as a private artifact link | `Artifact` |
| Send a deliverable file to the user | `SendUserFile` |
| Ask the user a decision they alone can make | `AskUserQuestion` |
| Track multi-step work | `TaskCreate` + `TaskUpdate` |
| Search deferred tool schemas | `ToolSearch` |
| Wait for external state to change | `ScheduleWakeup` / `send_later` |
| Stream events from a background process | `Monitor` |

---

## Subagent routing

Spawn a subagent with `Agent` only when the task benefits from a fresh
context or a specialized tool set. Not for "thorough" reviews inline.

| Task | `subagent_type` |
|---|---|
| Locate files or symbols across many paths | `Explore` |
| Multi-step research where dependencies are known | `general-purpose` |
| Design an implementation strategy before coding | `Plan` |
| Independent second-opinion code review | `code-reviewer` (via `/code-review`) |
| Questions about Claude Code / SDK / API / Slack Tag | `claude-code-guide` |
| Configure status line | `statusline-setup` |
| Any task without a specialized fit | `claude` |

Parallelize independent agents in one message when the tasks don't depend
on each other.

---

## The verification loop (Felipe Tâmbara's "give the agent eyes")

For any frontend change: after the design skill runs, invoke `playwright`
MCP → screenshot at 1920 and 390 → compare with the reference → refactor
CSS → repeat until they match. This turns the agent from blind to sighted.
Without this loop, you are trusting a blind model. Use it by default on any
task that touches visible UI.

---

## Layering (how to stack)

The design pack is designed in six layers. Layer additively:

1. **Camada 01** — one taste-base (`frontend-design`, `impeccable`, or
   `taste-skill`) + motion (`animate` / `design-motion-principles`) +
   verification (`playwright` MCP).
2. **Camada 02** — generate assets in-agent.
3. **Camada 03** — Claude Design SaaS (not in this repo).
4. **Camada 04** — behavior, not pixels.
5. **Camada 05** — prompt architecture.
6. **Camada 06** — trust, refusals, transparency.

Cross-layer combos that work well:

- Landing page → `taste-skill` + `animate` + `nano-banana` (hero image) +
  `playwright` (verify).
- AI product feature → `persona-architecture` + `system-prompt-structure`
  + `guardrail-design` + `generative-ui`.
- Deck / report / doc → `docx` or `pptx` + `theme-factory` + `dataviz`
  (charts) + `humanizer` (final pass).

---

## Branch policy

Work on this repo happens on `claude/skills-installation-r6wr4o`. If a new
task diverges from that scope, ask before changing branches.

---

## When in doubt

- Simple task with obvious skill match → invoke it silently, one-line
  acknowledgement, go.
- Task spanning two layers → invoke the taste-base first, then layer the
  specialist(s).
- Ambiguous request → ask ONE short question with two candidate skills as
  options.
- Nothing fits → work directly, but mention if a skill *should* have fit.
