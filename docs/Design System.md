# Macapinlac.com Design System

**Version:** 3.0 — "Build Log" | **Date:** May 2026

## Overview

This design system defines the visual language and component library for macapinlac.com. Version 3 ("Build Log") replaces the previous cool-grey/blue system with a warmer, terminal-forward identity: warm cream paper, near-black ink, a single confident rust accent, and JetBrains Mono promoted from "dates and code" to the connective voice of the entire interface.

The canonical token file is `source/stylesheets/site.css.scss` (with `_variables.scss` providing SCSS-time font and breakpoint constants). All CSS custom properties below live under `:root` at the top of that file, and dark-mode overrides under `[data-theme="dark"]`.

---

## 1. Core Foundation

### Color Palette (Light — default)

| Token | Hex | Use |
|---|---|---|
| `--paper` | `#f4f0e8` | Page background (warm cream) |
| `--paper-2` | `#efe9dd` | Footer, hover fills, inline code |
| `--surface` | `#fbf9f4` | Raised cards / panels |
| `--ink` | `#1d1b17` | Primary text |
| `--ink-soft-2` | `#5c554a` | Secondary text, nav |
| `--faint` | `#938b7b` | Dates, meta, placeholders |
| `--read-ink` | `#2a261f` | Long-form reading body |
| `--line` | `#e0d8c8` | Hairlines, card borders |
| `--line-strong` | `#cabfa9` | Inputs, chips, stronger borders |
| `--rust` | `#c2451d` | **Primary accent** — links, prompts, marks, active states |
| `--rust-d` | `#a23816` | Rust pressed / inline-code text |
| `--sand` | `#d49a4f` | Secondary — series, sand-keyed surfaces |
| `--blue` | `#2a5d8f` | Taxonomy color (sparing use only) |
| `--green` | `#3f7a52` | Terminal ok-green — status, sparingly |

#### Legacy aliases

The legacy `--color-*` aliases from v2 have been **removed**. All templates use the short Build Log token names (`--paper`, `--ink`, `--rust`, etc.) directly. If you need backwards compatibility while migrating an old asset, add an alias declaration in `site.css.scss` rather than reintroducing the v2 names site-wide.

### Dark Mode — "Espresso"

Warm, brown-tinted near-black. Never cold charcoal.

| Token | Dark value |
|---|---|
| `--paper` | `#1a1714` |
| `--surface` | `#242019` |
| `--ink` | `#efe9dd` |
| `--rust` | `#e0673b` |
| `--sand` | `#e0b06a` |

Default is light, persisted to `localStorage`. `prefers-color-scheme` detection applies on first visit. 300ms ease cross-fade. Toggle is a mono pill: `◐ light` / `◑ dark`.

### Taxonomy Colors

Each tag and series carries a `--cat` variable that keys to a category color. Used for:
- Left border of the latest-entry card
- Hover rail on log-feed index rows
- Category pill backgrounds

Defined as `--cat-ai`, `--cat-building`, `--cat-making`, etc. in `site.css.scss`. Per-element override is via inline `style="--cat: <hex>"` on log feed rows and `style="--c: <hex>"` on tag / series surfaces — the Ruby helpers `article_cat_color(article)` and the `color` field on `data/tags.yml` / `data/series.yml` produce the hex value.

---

## 2. Typography

**Four families:**

| Family | Role | Where |
|---|---|---|
| **Lora** (serif, 400/600/700) | Authoritative headings & reading | Hero, post titles, H2/H3, card titles |
| **JetBrains Mono** (400–700) | **The system voice** | Header prompt, nav, eyebrows, dates, reading-time, tags, CTAs, footer, code |
| **Inter** (sans, 300–700) | Body & UI prose | Body copy, ledes fallback, labels |
| **Crimson Text** (editorial serif) | Editorial italic | Ledes under titles, pull quotes, sign-offs |

Via Google Fonts CDN — no self-hosted woff2 in the repo.

**Scale (desktop):**

| Use | Size | Family |
|---|---|---|
| Hero / page title | 44–46px | Lora 600, tracking -0.018em |
| Post title | 44px | Lora 600 |
| H2 | 30px | Lora 600 |
| H3 | 22px | Lora 600 |
| Card / H4 title | 20px | Lora 600 |
| Lede / pull | 23px | Crimson Text italic |
| Reading body | 19.5px / 1.78lh | Inter 400 |
| UI body | 17px / 1.6lh | Inter 400 |
| Meta / eyebrow | 12.5–11.5px | JetBrains Mono, uppercase |

**Reading heads** get a mono prefix via CSS `::before`: H2 → `## `, H3 → `### ` in `--line-strong`. The first paragraph of an article gets a **rust serif drop-cap**.

---

## 3. Spacing, Radii & Shadows

### Spacing

| Token | rem | px |
|---|---|---|
| `--space-xs` | 0.25rem | 4px |
| `--space-sm` | 0.5rem | 8px |
| `--space-md` | 1rem | 16px |
| `--space-lg` | 2rem | 32px |
| `--space-xl` | 4rem | 64px |
| `--space-xxl` | 8rem | 128px |

Pages breathe — prefer bigger jumps.

### Radii

| Use | Value |
|---|---|
| Inputs, chips, code | 4px |
| Cards / panels (workhorse) | 8px |
| Featured / hero | 14px |
| Category pills | 20px |
| Avatars | 50% |

### Shadows

Warm-tinted `rgba(60,40,20,…)` — restrained. Borders separate surfaces at rest; shadows appear only on hover.

| Token | Value | Use |
|---|---|---|
| `--shadow-sm` | `0 4px 12px rgba(60,40,20,.08)` | Card / row hover |
| `--shadow-md` | `0 10px 30px rgba(60,40,20,.10)` | Latest / featured hover |
| `--shadow-lg` | `0 14px 40px rgba(60,40,20,.14)` | Overlay |
| `--focus-ring` | `0 0 0 3px rgba(194,69,29,.18)` | Rust-tinted keyboard focus |

### Line Heights

| Token | Value | Use |
|---|---|---|
| `--lh-tight` | `1.12` | Hero / post titles |
| `--lh-snug` | `1.25` | Section heads |
| `--lh-normal` | `1.6` | UI body |
| `--lh-read` | `1.78` | Long-form reading |

### Layout Widths

| Token | Value | Use |
|---|---|---|
| `--wrap` | `980px` | Page chrome max-width |
| `--read-width` | `720px` | Article reading column |

### Motion

| Token | Value |
|---|---|
| `--ease` | `ease` |
| `--dur-fast` | `150ms` |
| `--dur` | `200ms` |
| `--dur-slow` | `300ms` |

Transitions: cheap and quick, never bouncy.

### Code Surfaces

| Token | Light | Dark |
|---|---|---|
| `--code-bg` | `#211f1a` | `#14110e` |
| `--code-text` | `#ece6da` | `#ece6da` |
| `--code-inline-bg` | `#efe9dd` | `#2a251e` |

Terminal code blocks use `--code-bg` (near-black) on both themes for consistent terminal look. Inline code uses `--code-inline-bg` (a shade of `--paper-2`) with `--rust-d` text.

### Functional Colors

| Token | Light | Dark |
|---|---|---|
| `--success` | `#3f7a52` | `#6fae84` |
| `--warning` | `#b9791f` | `#d99a3f` |
| `--error` | `#b23a2b` | `#e07a5f` |

All warm-toned, never cold/saturated. Used sparingly for status indicators only.

---

## 4. Signature Components

### Terminal Header

Sticky, blurred. Contains:
- Shell prompt: `macapinlac.com @ ritchie ~ %` with blinking cursor (rust)
- Nav links in JetBrains Mono
- Search field that expands on focus and filters the log feed live with a `grep` status line
- Dark mode toggle pill: `◐ light` / `◑ dark`

### Latest-Entry Card

- `--cat`-colored left border (4px)
- Mono uppercase tag row
- `cat latest-post.md →` CTA
- Hover: lift + warm shadow (`--shadow-md`)

### Log-Feed Index Row

Grid layout: `[no · date · title/desc · meta]`

On hover: a `--cat`-colored rail grows on the left and the title shifts to the category color.

### Series Strip

Dashed `--line-strong` border on a faint sand tint (`--sand` at low opacity).

### Status-Bar Footer

Mono motto line, uptime stat (`uptime: 26 years · N posts · 0 regrets (citation needed)`), "made with ♥" credit.

### Reading Page

- Fixed mono TOC rail with scroll-spy
- Rust reading-progress bar (top of viewport)
- Breadcrumb: `cd ~/posts / …`
- Series badge
- Rust serif drop-cap on first paragraph
- Mono-prefixed H2/H3 (`## ` / `### `)
- Terminal code blocks with `$ label` header
- Author card
- Prev/next article cards

---

## 5. UI Components

### Navigation

Primary nav links: JetBrains Mono, sentence case. Items: `home` · `about` · `archive` · `tags` · `◐ light` (dark-mode toggle). The Build Log removed the standalone `Series` and `RSS` nav entries — series are surfaced on `/tags/` and the homepage strip; RSS lives in the status-bar footer socials row.

Mobile: there is no hamburger — the nav is implemented as a horizontal flex row that hides `about` and `archive` (the `.about-link` / `.archive-link` classes) below 720px while keeping `home`, `tags`, and the theme toggle visible. The full archive remains reachable via the `ls -la → all N` link in the log-feed header.

### Content Cards

#### Latest-Entry Card (homepage featured)
```
[--cat left border]
[mono tag row]
Title (Lora 600)
Lede (Crimson italic)
cat latest-post.md →
```

#### Log-Feed Index Row (archive/writing list)
```
[no]  [date]  [title + one-line desc]  [tag · read-time]
                     ↑ --cat rail grows on hover
```

#### Series Strip
```
[dashed border, sand tint]
  Series title · description · N posts  cd ./series →
```

### Buttons & CTAs

CTAs use mono command syntax: `cat latest-post.md →`, `cd ./series →`, `ls -la → all N`.

Standard buttons:
- **Primary:** rust background, cream text, hover darkens to `--rust-d`
- **Secondary:** `--surface` background, `--ink` text, `--line-strong` border
- **Text/CTA:** mono, rust color, underline on hover

### Tags & Chips

Mono font, 12px, `--paper-2` background, `--line-strong` border, 4px radius. On hover: `--rust` border and text. Category pills use `--cat` as background at 15% opacity with full-opacity border.

### Blockquote

Left border in `--sand` (4px). Body in Crimson italic 20px. Attribution in mono 12.5px faint.

### Code Blocks

Terminal aesthetic: `--ink` background (near-black), cream text. Optional `$ label` header in rust mono. Inline code: `--paper-2` background, `--rust-d` text, 4px radius.

### Form Elements

Inputs: `--surface` background, `--line-strong` border (1px, 4px radius). Focus: `--rust` border 2px. Labels: mono uppercase 11.5px faint.

---

## 6. Shared CSS Files

All pages import two shared files:

**`base.css`** — CSS custom properties (all tokens), `*` reset, `body` defaults (17px Inter, `--paper` bg), `a` reset, `::selection` rust, `.grain` paper texture.

**`chrome.css`** — `.wrap` (980px max, 32px padding), `.term-bar` (sticky header), `.cmdline`, `.term-nav`, `.toggle`, `.page-head` (60px top padding, eyebrow + H1 + sub), `.statusbar` (footer).

---

## 7. Page Templates

### 7.1 Homepage

**Class inventory:** `.term-bar`, `.cmdline`, `.ps1`, `.fakecur`, `.search`, `.term-nav`, `.toggle`, `.hero`, `.eyebrow`, `.latest`, `.latest a`, `.tagrow`, `.badge`, `.logsec`, `.ix-row`, `.no`, `.dt`, `.t`, `.d`, `.meta-r`, `.rt`, `.tg`, `.searchstat`, `.series`, `.statusbar`

**Key markup patterns:**
- Search input inside `.cmdline`, expands on focus
- Latest card: `border-left: 3px solid var(--cat, var(--rust))`
- Log rows: 4-col grid `44px 116px 1fr auto`; `::before` pseudo-element is the `--cat` rail (width 0 → 3px on hover)
- Tag chip on row: `color-mix(in srgb, var(--cat) 13%, transparent)` background, 20px border-radius

### 7.2 Article

**Additional CSS (page-local):** `.progress` (3px rust bar fixed top), `.toc-rail` (fixed left rail, hidden <1180px), `.toc-inline` (shown <1180px), `.crumb`, `.phead`, `.series-badge`, `.body`, `.ptags`, `.chip`, `.author`, `.pnav`, `.ncard`

**Key markup patterns:**
- Reading column: `.read { max-width: 720px; margin: 0 auto; padding: 0 32px; }`
- Progress bar: `<div class="progress" id="prog"></div>` — JS writes `style.width`
- Drop-cap: `.body p:first-of-type::first-letter` — Lora 600, 3.4em, rust, float left
- H2 prefix: `.body h2::before { content: '## '; font-family: var(--font-mono); color: var(--line-strong); }`
- H3 prefix: `.body h3::before { content: '### '; }`
- Pre block: `::before` pseudo with `content: '$ ' attr(data-label)`
- Series badge: sand bg/border pill with `🤖 Series Name · part N of M`
- Prev/next: 2-col grid; `.ncard.next { text-align: right; }`
- TOC scroll-spy: JS toggles `.on` class; smooth scroll on click

### 7.3 Archive

**Additional CSS (page-local):** `.filters`, `.fchip`, `.fchip.on`, `.yeargroup`, `.yhead`, `.arow`

**Key markup patterns:**
- Filter chips: `border-left: 3px solid var(--c, var(--line-strong))` — `--c` set per chip via inline style
- `fchip.on`: `background: var(--ink); color: var(--paper)` (inverted)
- Year head: `~/` prefix in faint, then year bold, then count faint, then flex rule
- Archive row: 3-col grid `92px 1fr auto`; emoji prefixed to title span

### 7.4 Tags & Series (combined)

**Path:** `/tags/` · **Additional CSS:** `.sec-label`, `.series-grid`, `.scard`, `.scard.feat`, `.tags-grid`, `.tcard`

**Key markup patterns:**
- Section label: mono, rust, with flex `::after` rule line
- Series card: flex-column; `.scard.feat { border-left: 3px solid var(--rust); }`
- Progress bar inside scard: `flex: 1; height: 4px; background: var(--line)`; inner `<i>` in rust with inline `width: X%`
- Tag card: 3-col grid `auto 1fr auto`; `border-left: 4px solid var(--c)`; `h4::before { content: '#'; color: var(--c); }`

### 7.5 Tag Page

**Path:** `/tags/{slug}.html` · `<body style="--c:{category-color}">` · **Additional CSS:** `.taghero`, `.listhead`, `.prow`, `.tpill`, `.relatedtags`, `.tlink`

**Key markup patterns:**
- `--c` on `<body>`: drives icon box bg, hash color, count color, left rail color, secondary pill colors
- Icon box: 64px, border-radius 16px, `color-mix(in srgb, var(--c) 14%, transparent)` bg
- Title: `<h1><span class="hash">#</span> Tag Name</h1>` — `.hash { color: var(--c); font-family: var(--font-mono); }`
- Post rows: 3-col grid `116px 1fr auto`; `--c` rail on hover
- Secondary tag pills: `.tpill` with `--c2` variable for each pill's color
- Related tags: `.tlink { border-left: 3px solid var(--tc); }` — `--tc` per link

### 7.6 Series Page

**Path:** `/series/{slug}.html` · `<body style="--c:{category-color}">` · **Additional CSS:** `.shero`, `.meter`, `.partshead`, `.part`, `.part.planned`

**Key markup patterns:**
- `--c` on `<body>`: drives badge, icon, progress bar, part number, rail color
- Status badge: pill with `color-mix(in srgb, var(--c) 13%, transparent)` bg
- Icon box: 66px, border-radius 16px
- Progress meter: `max-width: 360px; height: 6px; background: var(--line)`; inner `<i style="width:X%">` in `--c`
- Part rows: 3-col grid `54px 1fr auto`; `--c` rail on hover; `→` arrow translates 4px on hover
- Planned parts: `.planned { opacity: .6; }`, italic title, dashed `// coming soon` pill badge

### 7.7 About

**Additional CSS (page-local):** `.ahero`, `.prose`, `.holes`, `.hgrid`, `.hole`, `.now`, `.contact`, `.links`, `.lk`

**Key markup patterns:**
- Hero: `grid-template-columns: 200px 1fr; gap: 44px; padding: 58px 0 44px`
- Portrait: 200px circle, `border: 1px solid var(--line-strong)`; location badge positioned absolute bottom-right
- Reading column: `.read { max-width: 720px; margin: 0 auto; padding: 0 32px; }`
- Topic grid: `.hgrid { grid-template-columns: 1fr 1fr; gap: 12px; }`
- Now strip: `border: 1px dashed var(--line-strong); background: rgba(212,154,79,.07)`; `$ what I'm into right now` label
- Contact links: `.lk` — mono font, border button; hover: `background: var(--ink); color: var(--paper)`

### 7.8 404

**Additional CSS (page-local):** `.fill`, `.term`, `.term-card`, `.chrome`, `.dot`, `.backrow`

**Key markup patterns:**
- Layout: `body { min-height: 100vh; display: flex; flex-direction: column; }`, `.fill { flex: 1; display: flex; align-items: center; }`
- Terminal card: `background: #211f1a; border-radius: var(--radius-lg); box-shadow: 0 20px 50px rgba(60,40,20,.16)`
- Chrome bar: `#2b2823` bg, traffic dots (red `#e0625a`, yellow `#e0b14f`, green `#5aae6a`)
- "404" text: Lora 700, 64px, `#ece6da`, on dark background
- Back nav: `border-left: 3px solid var(--rust)` on primary link; hover = filled ink

---

## 7. Iconography & Imagery

Deliberately icon-light:
- Emoji as system icons for tags, series, socials
- Unicode glyphs for affordances (`→`, `›`, `●`, `◐`)
- No icon font or SVG sprite in the base system

The avatar is the only branded visual (no stock photography, no SVG illustrations). If a richer icon set is needed, substitute **Lucide** (24×24, stroke 2) and flag the substitution.

---

## 8. Paper Grain

A subtle two-radial CSS background grain (`.grain` class) adds texture to `--paper` surfaces. Applied to `<body>` and hero sections. No visible on `--surface` cards — depth comes from warm borders and shadows, not the grain.

---

## 9. Breakpoints

| Name | Size |
|---|---|
| Mobile | 0–760px |
| Desktop | 760px+ |

At mobile: single-column, TOC rail hidden (inline `.toc-inline` fallback renders instead at ≤1180px), term-bar drops the `~ %` path and the about / archive nav items.

---

## 10. Implementation Notes

- All tokens live in `source/stylesheets/site.css.scss` under `:root` and `[data-theme="dark"]`.
- Reference HTML prototypes (read-only) live in the design handoff bundle archived under `~/Documents/macapinlac.com/design-bundle/` (not checked into the repo). The implemented pages mirror them — see the live templates for the source of truth: `source/index.html.erb`, `source/layouts/post.erb`, `source/archive.html.erb`, `source/tags/index.html.erb`, `source/tag.html.erb`, `source/series.html.erb`, `source/about.html.erb`, `source/404.html.erb`.
- Legacy `--color-*` aliases from v2 have been **removed** — see the matching note in the Color Palette section. New work must use the short token names.
- Web fonts are loaded via Google Fonts CDN; no woff2 assets are stored in the repo.
- Dark mode: toggle writes `data-theme="dark"` to `<html>`, persisted to `localStorage`. `prefers-color-scheme` is read on first visit.

---

*Design system v3 — "Build Log" direction. Supersedes v2 (December 2024). Source of truth: `source/stylesheets/site.css.scss` + this document.*
