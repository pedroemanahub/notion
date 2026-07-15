# Repo instructions — Notion + Claude Code

This repo carries a 42-skill design pack. When you start a task, **match it
against the routing table below and invoke the matching skill(s) yourself** —
do not ask permission and do not wait for the user to name them. Skills live
under `.claude/skills/`; MCP servers are wired in `.mcp.json`.

## Proactive-use rule

The default failure mode is "generic output because no skill was invoked."
Before touching frontend code, images, prompts, or product-AI behavior:

1. Read the task through the routing table below.
2. Invoke the top matching skill via the `Skill` tool immediately.
3. Layer additional skills only when the task spans multiple rows (e.g.
   design + motion + browser verification).
4. Announce which skill you invoked in one short sentence, then proceed.

If nothing in the routing table fits, ask — but only then.

## Routing table — task → skill

### Frontend & UI (Camada 01)

| Task pattern | Invoke first | Layer on top |
|---|---|---|
| New landing page, portfolio, redesign, hero section | `taste-skill` | `impeccable`, `animate` |
| Component polish / audit / critique (single word: polish, critique, audit) | `impeccable` | — |
| Aesthetic direction, first-pass typography, banning defaults | `frontend-design` | `taste-skill` |
| Any animation, transition, hover, page transition, modal, motion | `animate` | `design-motion-principles` |
| Auditing existing motion, spotting AI-slop animation | `design-motion-principles` | — |
| Applying a color/type theme to slides, docs, HTML | `theme-factory` | — |
| Brand board, logo direction, identity deck, category mockups | `brandkit` | — |
| Process work — research, UX strategy, handoff specs, QA checklists | `designer-skills` | pick sub-skill under the matching category |

### Pixels, Graphics, 3D, Video (Camada 02)

| Task pattern | Invoke first |
|---|---|
| Blog header, thumbnail, mockup, environment redesign (single image) | `nano-banana` |
| Image with intent-to-prompt translation, brand presets, multi-turn edits | `banana-claude` |
| Carousel, quote card, infographic exported as PNG/PDF | `canvas-design` |
| Generative visuals — flow fields, noise, particles, hero backgrounds | `algorithmic-art` |
| Video production — voiceover, music, stock footage, captions, render loop | `remotion-superpowers` |
| Blender-driven 3D motion (Python/bpy) | `blender-motion` |
| After Effects motion (ExtendScript / MCP) | `aftereffects-motion` |

### Product AI behavior (Camada 04)

| Task pattern | Invoke first |
|---|---|
| Token budgeting, summarize-vs-retrieve, graceful degradation | `context-window-design` |
| Turn design, repair sequences, alignment checkpoints | `conversation-patterns` |
| Deciding when to render a component vs. plain text | `generative-ui` |
| Staged reveal of AI power across turns | `progressive-disclosure` |
| Sequencing text / image / tool calls in a single flow | `multimodal-orchestration` |
| Handoff between agent-led and user-led moments | `mixed-initiative-flow` |
| Detecting frustration from caps/punctuation/latency; adapting | `frustration-detection` |
| Correction & rating mechanisms that change behavior | `feedback-loops` |

### Prompt & persona (Camada 05)

| Task pattern | Invoke first |
|---|---|
| Writing / restructuring a system prompt | `system-prompt-structure` |
| Defining character, voice, boundaries once for cross-session consistency | `persona-architecture` |
| Formality / warmth / confidence knobs per context | `tone-calibration` |
| Response map for frustration, confusion, delight, distress | `emotional-design` |
| Parameterized prompt templates, typed variables, conditional sections | `template-design` |
| Few-shot examples that target recurring model errors | `few-shot-patterns` |
| Structured multi-step reasoning chains | `chain-of-thought-design` |
| Testable output limits (format, length, tone, prohibited content) | `constraint-specification` |

### Trust & Safety (Camada 06)

| Task pattern | Invoke first |
|---|---|
| Explicit refusal patterns, behavioral boundaries | `guardrail-design` |
| Confidence & source signals so users neither over- nor under-trust | `trust-calibration` |
| Showing what the model knows / doesn't / how sure it is | `transparency-patterns` |

## MCP routing — task → server

| Task pattern | MCP server | Loads from |
|---|---|---|
| Open a URL, screenshot at 1920 & 390, compare with reference, iterate CSS | `playwright` | `@playwright/mcp` |
| Import a Figma file, extract tokens, generate faithful production code | `figma` | `figma-developer-mcp` |
| Read a design in one app, open a PR in another, span 1000+ apps | `composio` | `@composio/mcp` |

If the task mentions Figma, a browser check, or cross-app orchestration and
the corresponding MCP is present, use it. Do not simulate what the MCP would do.

## Layering (how to stack skills)

The pack is designed in six layers. Use them additively, not exclusively:

1. **Camada 01** — pick ONE taste-base (`frontend-design`, `impeccable`, or `taste-skill`),
   add movement (`animate` / `design-motion-principles`), add a feedback loop
   (`playwright` MCP). Most "generic AI look" bugs die here.
2. **Camada 02** — generate assets in-agent instead of exporting.
3. **Camada 03** — Claude Design (SaaS at claude.ai/design) — not in this repo.
4. **Camada 04** — behavior, not pixels: how the AI product feels.
5. **Camada 05** — the prompt is the product.
6. **Camada 06** — trust, refusals, transparency.

## Verification loop

For frontend changes: after applying the design skill and generating code,
invoke `playwright` MCP to screenshot and compare against the target. This
turns the agent from blind to sighted — Felipe Tâmbara calls it "give the
agent eyes." Iterate CSS until screenshots match.

## Branch policy

Development on this repo happens on `claude/skills-installation-r6wr4o` unless
told otherwise. All 42 skills, `.mcp.json`, and this file live on that branch.

## When in doubt

- Small task with obvious skill match → invoke it silently and go.
- Task spanning two layers → invoke the taste-base skill first, then layer the specialist.
- Ambiguous request → ask ONE short question with the two candidate skills as options.
- No skill fits → work directly, but consider whether a skill *should* fit and mention it.
