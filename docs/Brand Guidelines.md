# Brand Guidelines

## 1. Brand Overview

**macapinlac.com** is a personal blog by Ritchie Macapinlac that mixes thoughtful, often humorous reflections on technology, parenting, productivity, and personal development. 

The site balances clarity, authenticity, and sophistication, reflecting Ritchie's evolving professional identity while supporting a growing body of writing and new content formats. The tone and presentation remain grounded, personal, and accessible—never overly polished or corporate.

## 2. Brand Identity

**Brand Essence**
A grounded, relatable digital journal by a tech-savvy father who writes with curiosity, humility, and insight.

**Brand Adjectives**
Curious · Thoughtful · Clever · Relatable · Minimal · Grounded

**Tone**
Professional and insightful, yet warm and conversational — approachable, never corporate.

**Tone Signatures (lift these, don't reinvent):**
- *The self-roast:* "…my tendency to over-engineer everything." / "Classic me."
- *The reality-check parenthetical:* "(spoiler: it didn't work)" / "(citation needed)"
- *The mock-grandiose framing:* "How I Learned to Stop Worrying and Trust My AI Overlords."
- *The dry punchline:* "My wife questions most of these life choices."

**Casing:** Sentence case in post titles; lowercase in all mono chrome. Never Em dashes. Parentheticals for asides. Emoji only in system surfaces (tags, series, socials) — never in prose.

## 3. Visual Identity Guidelines — "Build Log" (v3)

**Color Palette:**
Warm, papery, confident. One dominant accent (rust) instead of the old blue split.
- **Background:** warm cream `#f4f0e8` (`--paper`)
- **Primary accent:** rust `#c2451d` (`--rust`) — links, prompts, active states
- **Secondary:** sand `#d49a4f` — series surfaces
- **Ink:** near-black `#1d1b17`
- **Dark mode:** warm "espresso" brown-tinted near-black `#1a1714`, never cold charcoal

**Typography:**
Four-family system. JetBrains Mono is now the connective voice of the interface — not just for code.

| Family | Role |
|---|---|
| **Lora** (serif) | Headings, post titles, reading |
| **JetBrains Mono** | Nav, dates, tags, CTAs, footer, code — the "system voice" |
| **Inter** (sans) | Body prose, UI labels |
| **Crimson Text** (editorial serif) | Ledes, pull quotes, sign-offs (italic) |

**Layout:**
* Terminal-forward chrome: sticky header with shell prompt, mono navigation
* Clean wide margins; pages breathe with large spacing jumps
* Log-feed index rows for post lists (not cards)
* Mobile-first; single column at ≤760px

**Imagery & Graphics:**
* Icon-light: emoji for tags/series/socials, Unicode glyphs for affordances (`→`, `›`, `◐`)
* No icon font or SVG sprite — substitute Lucide (24×24, stroke 2) only if truly needed
* Avatar is the only branded visual; no stock photography
* Subtle paper grain texture on `--paper` backgrounds

**Terminal Layer (new in v3):**
A thin layer of playful sysadmin framing sits *on top of* the brand voice — in chrome and metadata only, never in prose:
- Header prompt: `macapinlac.com @ ritchie ~ %`
- Eyebrows as shell commands: `$ whoami`, `$ stat post.md`, `# filed under`
- CTAs as commands: `cat latest-post.md →`, `cd ./series →`, `ls -la → all N`
- Footer status line: `uptime: 26 years · N posts · 0 regrets (citation needed)`
- Search as grep: `grep "ai" ~/posts → N matches`

**Branding:**
* Light personal branding — avatar, favicon, footer mark
* No formal RM monogram; the shell prompt is the identity marker

