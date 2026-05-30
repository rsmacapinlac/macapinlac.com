# Tag System Documentation

**Version:** 3.0 — "Build Log" | **Date:** May 2026

## Overview

The Build Log tag system is intentionally simple: one chip style, taxonomy-keyed colors, JetBrains Mono throughout. The previous multi-variant BEM system (pill/rounded/square, primary/secondary/muted) is superseded.

---

## Tag Visual Style

Tags are mono chips — compact, readable, consistent.

**Default chip:**
```css
font-family: var(--font-mono);
font-size: 11.5px;
background: color-mix(in srgb, var(--cat, var(--faint)) 13%, transparent);
color: var(--cat, var(--ink-soft-2));
padding: 4px 10px;
border-radius: var(--radius-pill);   /* 20px */
border: none;
```

On hover:
```css
border: 1px solid var(--rust);
color: var(--rust);
```

### Category Color Keying (`--cat`)

Each tag/series sets a local `--cat` variable matched to its taxonomy. The chip automatically inherits that color for its text and background tint.

| Taxonomy | Token | Color |
|---|---|---|
| 💻 building-things | `--cat-building` | `#2a5d8f` |
| 🌱 figuring-things-out | `--cat-figuring` | `#4a90e2` |
| ⚡ making-things-work | `--cat-making` | `#e4572e` |
| 👨‍👩‍👧‍👦 family-adventures | `--cat-family` | `#e0a96d` |
| 🤖 playing-with-ai | `--cat-ai` | `#9b59b6` |
| 🚗 travelling | `--cat-travel` | `#27ae60` |
| 💬 conversations | `--cat-convo` | `#1abc9c` |
| 📧 random-thoughts | `--cat-random` | `#3498db` |
| 🖥️ homelab-experiments | `--cat-homelab` | `#8e44ad` |
| 📱 tech-life | `--cat-techlife` | `#34495e` |

Fallback when no `--cat` is set: `var(--rust)`.

---

## Context-Specific Use

### Log-feed index rows

Tags appear as a single chip on the right side of each row (right column of the grid). Always mono, 11.5px, category-keyed color.

```html
<span class="tg" style="--cat: var(--cat-ai)">playing-with-ai</span>
```

### Latest-entry card

The tag row above the title: mono uppercase, 11.5px, letter-spacing `.08em`, category badge + date.

```html
<div class="tagrow">
  <span class="badge" style="color: var(--cat-ai)">🤖 playing-with-ai</span>
  <span class="dt">May 18, 2026</span>
</div>
```

### Article page (post footer / meta)

Tags appear in the mono metadata row below the title: `date · read-time · tags`. Same chip style.

### Tag index page (`/tags/`)

Grid of category pill cards. Each shows: emoji icon, tag name in Lora 17px, post count in mono. Hover: `--rust` border + lift.

### Tag page (`/tags/tag-name`)

Eyebrow: `# filed under` in mono. Tag name in Lora page-title size. Body: log-feed rows filtered to that tag.

---

## Editorial Guidelines

- Limit to **3–5 tags per post**
- Use tags from `data/tags.yml`; propose new ones and get approval before adding
- Tags are case-sensitive — match exactly
- Use specific but not overly granular tags
- Emoji only in system surfaces (index, tag page header, series) — not in prose

---

## Data Structure

Tags are defined in `data/tags.yml` with name, description, icon, and color. The `about_page_tags.yml` file holds the curated list shown on the About page.

---

## Legacy Note

The previous multi-variant BEM tag system (`tag--pill`, `tag--small`, `tag--primary`, etc.) is removed as part of the Build Log redesign. Existing templates referencing those classes will need to be migrated to the single-chip pattern above during implementation.
