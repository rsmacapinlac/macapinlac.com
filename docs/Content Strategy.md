# Macapinlac.com Content Strategy Document

**Version:** 3.0 — "Build Log" | **Date:** May 2026

## 1. Overview

**Purpose:** This content strategy defines the page structure, navigation, and content organization for the Build Log redesign of macapinlac.com. The site is a personal digital journal by Ritchie Macapinlac, focused on thoughtful reflections on technology, productivity, parenting, and experimentation.

---

## 2. Navigation

**New nav (Build Log):** `home` · `about` · `archive` · `tags` · `◐ light` (dark mode toggle)

| Old | New | Notes |
|---|---|---|
| Home | home | unchanged |
| Writing | archive | route TBD (see open questions) |
| Series | *(removed from nav)* | merged into Tags page |
| About | about | unchanged |
| Contact | *(removed)* | was already commented out |
| RSS | *(removed from nav)* | survives in footer socials |

---

## 3. Core Content Pages

### 3.1 Homepage

* **Path:** `/`
* **Priority:** Get readers to the latest post fast — no decorative hero.
* **Sections (in order):**
  1. **Terminal header** — sticky, `rgba(244,240,232,.92)` + `backdrop-filter: blur(8px)`. Shell prompt `macapinlac.com @ ritchie ~ %`, blinking cursor. Search input (expands 150px → 280px on focus) filters log feed live. Nav + `◐ light` toggle.
  2. **Hero block** — `$ whoami` eyebrow, large Lora headline, Crimson italic sub, mono metaline.
  3. **Latest-entry card** — `--cat`-colored left border (3px), mono tag row + date, Lora title (28px), excerpt, `cat latest-post.md →` CTA. Hover: lift + warm shadow.
  4. **Log-feed section** — Mono section header (`$ ls -la ~/posts — recent`), log-feed rows. Each row: `[no · date · title · tag chip · read-time]`. `--cat` rail grows on hover (left 3px), title shifts to category color.
  5. **Series strip** — dashed `--line-strong` border, sand tint background, series emoji + mono label + Lora title + description + `cd ./series →` CTA.
  6. **Status-bar footer** — motto line, uptime line, credit + socials row.
* **Relevant CTAs:** `cat latest-post.md →` · `ls -la → all N` · `cd ./series →`
* **Search:** Client-side JS filters log-feed rows by title/tag. Shows `grep "q" ~/posts → N matches` status when active.

---

### 3.2 Article (Reading page)

* **Path:** `/{year}/{month}/{day}/{slug}.html`
* **Layout:** `max-width: 720px` reading column, centered.
* **Elements (top to bottom):**
  1. **Reading progress bar** — 3px rust bar fixed at top of viewport, width tracks scroll.
  2. **Terminal header** — same as all pages.
  3. **TOC rail** — fixed, `left: 36px, top: 128px, width: 210px`. Mono links with `//` header, `on` class highlights active section in rust. Hidden below 1180px.
  4. **Breadcrumb** — `cd ~/posts / {tag} / {slug}.md` in mono.
  5. **Series badge** — sand-colored pill: `🤖 Series Name · part N of M` (only shown for series posts).
  6. **Post title** — Lora 600, 44px, tracking -.02em.
  7. **Lede** — Crimson italic, 23px.
  8. **Meta row** — `$ stat post.md — {date} · {N} min read · by ritchie`
  9. **Inline TOC** — shown only below 1180px, inside article, before body.
  10. **Body** — 19.5px / 1.78lh, `--read-ink`. Drop-cap on first paragraph (Lora 600, float left, 3.4em, rust). H2 with `## ` mono prefix. H3 with `### ` prefix. Blockquote: rust left border, Crimson italic 24px. Code: `--code-inline-bg` bg. Pre: dark terminal bg `#211f1a`, `$ label` header.
  11. **Sign-off** — Crimson italic, faint color.
  12. **Tags** — `# filed under` label + chip links.
  13. **Author card** — avatar (56px circle) + name (Lora 600) + bio.
  14. **Prev/next nav** — 2-column grid of nav cards. Each: mono direction label + Lora title. Hover: lift + rust border.

---

### 3.3 Archive

* **Path:** `/archive` (or `/writing/` — see open questions)
* **Eyebrow:** `$ ls -la ~/posts`
* **Title:** "The Archive"
* **Elements:**
  1. **Filter chips** — category-colored (`--c` per chip): `all N`, then each taxonomy. `fchip.on` = filled ink background. Active state toggled by JS.
  2. **Search stat** — hidden by default; shown when search is active: `grep "q" ~/posts → N matches`.
  3. **Year groups** — mono year with `~/` prefix + post count + horizontal rule. Posts inside as `.arow` rows.
  4. **Archive rows** — grid `[date · emoji+title · read-time]`. `--cat` rail on hover. Title shifts to category color on hover. Category emoji prefixed to title.

---

### 3.4 Tags & Series (combined page)

* **Path:** `/tags/` (or `/tags.html`)
* **Eyebrow:** `$ tree ~/topics`
* **Title:** "Rabbit holes"
* **Sections:**
  1. **Section label** — `## series — long-form experiments` (mono, rust, with rule)
  2. **Series grid** — 2 columns. Each card: emoji, status label (e.g., `featured · active`), Lora title, description, progress bar + fraction (`X / Y published`), `cd ./series-slug →` CTA. Featured series: rust left border (3px) + rust label. Hover: lift + warm shadow.
  3. **Section label** — `## tags — recurring obsessions`
  4. **Tags grid** — 2 columns. Each card: emoji + mono `#tag-name` + description + post count. `--c` colored left border (4px). Hover: lift.

---

### 3.5 Tag page

* **Path:** `/tags/{slug}.html`
* **`--c` variable:** set on `<body>` to the tag's category color.
* **Elements:**
  1. **Breadcrumb** — `cd ~/tags / {tag-name}` in mono.
  2. **Tag hero** — 64px rounded-square icon box (category color tint), `# Tag Name` (Lora with mono `#` in `--c`), post count in `--c`, Crimson italic description.
  3. **List header** — `grep -l "{tag-name}" ~/posts`
  4. **Post rows** — grid `[date · title+excerpt+secondary-tag-pills · read-time]`. `--c` rail on hover. Secondary tags shown as small mono pills below title.
  5. **Related tags** — `// often filed alongside` + tag chips with colored left border (`--tc` per chip).

---

### 3.6 Series page

* **Path:** `/series/{slug}.html`
* **`--c` variable:** set on `<body>` to the series' category color.
* **Elements:**
  1. **Breadcrumb** — `cd ~/series / {slug}` in mono.
  2. **Status badge** — `● active series` (or `● complete`) pill in `--c`.
  3. **Series hero** — 66px rounded-square icon, Lora title (38px), Crimson italic description.
  4. **Progress meter** — progress bar + `X of Y published` label.
  5. **Parts header** — `./parts — read in order`
  6. **Part rows (published)** — grid `[part 0N · date+title+excerpt · read →]`. `--c` rail on hover. Title shifts to `--c` on hover. `→` arrow translates on hover.
  7. **Part rows (planned)** — `.planned` class: opacity 0.6, italic title, `// coming soon` badge (dashed border pill).

---

### 3.7 About

* **Path:** `/about.html`
* **Layout:** `max-width: 720px` reading column, centered.
* **Elements:**
  1. **Portrait hero** — 2-column grid: 200px circle avatar (with `📍 vancouver, bc` location badge) + `$ whoami --verbose` eyebrow + Lora title + Crimson lede.
  2. **Prose** — 19px / 1.78lh, `--read-ink`. 3 paragraphs.
  3. **"Where I tend to wander"** — Lora H2 + mono sub (`// the recurring obsessions, roughly`) + 2×2 grid of topic cards. Each: emoji + mono tag name + description.
  4. **"Now" strip** — dashed sand border, sand tint background. `$ what I'm into right now` label. Current activity prose.
  5. **"Say hello"** — Lora H2 + row of mono link buttons (GitHub, LinkedIn, Instagram, Email, RSS). Hover: filled ink.

---

### 3.8 404

* **Path:** `/404.html`
* **Layout:** Vertically centered on full viewport.
* **Elements:**
  1. **Terminal card** — dark background `#211f1a`, macOS traffic-light dots, title bar `ritchie@vancouver — ~ — zsh`.
  2. **Card body** — `$ cd ~/the-page-you-wanted`, error message, large "404" in Lora (64px), two `//` comment lines.
  3. **Back navigation** — row of mono link buttons below card: `cd ~/home` (rust left border), `ls ~/posts`, `cat about.md`, `grep ~/tags`.

---

## 4. Content Organization

### 4.1 Navigation Structure

```
macapinlac.com/
├── /                    ← home (terminal log feed)
├── /archive/            ← all posts by year (route TBD)
├── /tags/               ← combined tags + series index
│   └── /tags/{slug}     ← individual tag filtered list
├── /series/{slug}       ← individual series page
└── /about.html          ← personal page
```

### 4.2 Tag Strategy

* Limit to **3–5 tags per post**; use existing tags from `data/tags.yml`
* Tags have category colors defined in `--cat-*` tokens
* Tags and series are co-located on the `/tags/` page (no separate series index)
* Emoji in system surfaces only (never in prose)
* Tags shown as secondary pills on tag-filtered post rows

### 4.3 Archive Strategy

* Year-based grouping with `~/YYYY` mono headings
* Client-side category filter chips (no page reload)
* Rows show: date, emoji + title, read-time
* No year-based URL sub-routes needed in nav (the `/YYYY.html` Middleman year links still work for SEO, just not in nav)

---

## 5. Content Quality and Editorial Standards

### Voice
Authentic, curious, self-deprecating, dry. See Brand Guidelines for tone signatures.

### Writing Guidelines
- Sentence case in post titles; lowercase in all mono chrome
- Em dashes liberally; parentheticals for asides
- Emoji only in system surfaces (tags, series, socials) — never in prose
- Sign-offs in Crimson italic: `— written in vancouver, between two cups of coffee and one questionable life choice.`

---

## 6. Implementation Decisions (resolved)

| Decision | Choice |
|---|---|
| Archive route | New `/archive` page; redirect `/writing/` → `/archive` |
| Series index | Remove `/series/` index page; individual `/series/{slug}` pages stay |
| "Now" section (About) | New data file: `data/now.yml` |
| Footer post count | Dynamic via `blog.articles.length`; uptime text static |
| Live search | Client-side JS with post data embedded as inline JSON in homepage template |
| Dark mode mechanism | Preserve existing `data-theme` + `localStorage`; update toggle UI to `◐ light` / `◑ dark` mono pill |

---

*Document v3.0 — Build Log direction. Supersedes v2.0.*
