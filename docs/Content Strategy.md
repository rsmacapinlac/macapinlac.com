# Macapinlac.com Content Strategy Document

**Version:** 3.0 — "Build Log" | **Date:** May 2026

## 1. Overview

**Purpose:** This content strategy defines the page structure, navigation, and content organization for the Build Log redesign of macapinlac.com. The site is a personal digital journal by Ritchie Macapinlac, focused on thoughtful reflections on technology, productivity, parenting, and experimentation.

---

## 2. Content Organization

### 2.1 Navigation Structure

```
macapinlac.com/
├── /                    ← home (terminal log feed)
├── /archive/            ← all posts by year (route TBD)
├── /tags/               ← combined tags + series index
│   └── /tags/{slug}     ← individual tag filtered list
├── /series/{slug}       ← individual series page
└── /about.html          ← personal page
```

### 2.2 Tag Strategy

* Limit to **3–5 tags per post**; use existing tags from `data/tags.yml`
* Primary tag is the first one applied
* Tags have category colors defined in `--cat-*` tokens
* Tags and series are co-located on the `/tags/` page (no separate series index)
* Emoji in system surfaces only (never in prose)
* Tags shown as secondary pills on tag-filtered post rows

### 2.3 Archive Strategy

* Year-based grouping with `~/YYYY` mono headings
* Client-side category filter chips (no page reload)
* Rows show: date, emoji + title, read-time
* No year-based URL sub-routes needed in nav (the `/YYYY.html` Middleman year links still work for SEO, just not in nav)

---

*Document v3.0 — Build Log direction. Supersedes v2.0.*
