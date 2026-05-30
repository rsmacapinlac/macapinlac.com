# AGENTS.md

Source of truth for agents working on `macapinlac.com`. Read this before making changes. `CLAUDE.md` points here.

You wear two hats:

- **Site maintainer** — senior Ruby/Middleman engineer.
- **Content editor** — fluent in this site's voice (see `docs/Brand Guidelines.md` + `docs/Content Strategy.md`).

For how the system is wired (route map, layouts, CSS, helpers, data files, series system, testing strategy, build process), read **`docs/Architecture.md`** before changing code. This file covers role, commands, invariants, and process — the *how-to-work-here*, not the *how-it-works*.

## Commands

Always use `scripts/dev.sh` — it handles kill-then-restart, coloured output, and single-spec runs.

```bash
./scripts/dev.sh server                          # dev server (kills any running ones first)
./scripts/dev.sh test                            # full suite
./scripts/dev.sh test spec/features/blog_spec.rb # one file
./scripts/dev.sh build                           # build to build/
./scripts/dev.sh kill                            # kill all middleman servers
```

Other useful commands:

```bash
bundle install
rvm use
```

## Repo map

| Path                    | Purpose                                                   |
| ----------------------- | --------------------------------------------------------- |
| `config.rb`             | Middleman config, blog setup, helpers, series proxies     |
| `source/*.html.md`      | Dated blog posts                                          |
| `source/*.html.erb`     | Static pages + blog templates (tag/series/archive/about/404) |
| `source/layouts/`       | `layout.erb`, `post.erb`, `_header.erb`, `_footer.erb`, `_html_head.erb` |
| `source/stylesheets/`   | `site.css.scss` (canonical), `_variables.scss` (font + breakpoint constants only) |
| `source/javascripts/`   | `site.js` — search, reading progress, TOC, archive filters |
| `source/images/`        | Favicons, avatars, site images (manifest lives here)      |
| `source/files/`         | Downloadable/reference files linked from posts            |
| `data/`                 | YAML site data — see `docs/Architecture.md` for the catalogue |
| `spec/features/`        | RSpec feature + link-integrity specs                      |
| `spec/spec_helper.rb`   | In-memory Middleman test harness                          |
| `docs/`                 | Permanent docs and ADRs                                   |
| `build/`, `coverage/`   | Generated — never hand-edit                               |

## Tags

- Tag names are case-sensitive and must match `data/tags.yml` exactly.
- Reuse existing tags when possible. For new tags, propose first, then add to `data/tags.yml` with description, icon, colour.
- Keep posts to ~3–5 tags.

## Blog post format

```text
YYYY-MM-DD-title-with-hyphens.html.md
```

```yaml
---
title: "Post Title"
date: YYYY-MM-DD
tags:
  - Tag Name
  - Another Tag
layout: post   # optional; blog extension defaults to post
---
```

- Use `<!-- more //-->` to mark the homepage excerpt break.
- **Internal post links must use the permalink path** (`/YYYY/MM/DD/slug.html`), not the source filename. The link-integrity spec gates this.
- Downloadable files: `/files/YYYY-MM-DD/filename.txt`.
- Voice: follow `docs/Content Strategy.md` + `docs/Brand Guidelines.md`.

## Invariants

Hold these without being asked.

- **Prefer data over markup.** Site-wide content lives in `data/*.yml`. Update YAML for content-shaped changes, not templates.
- **Tag names are case-sensitive** and must match `data/tags.yml` exactly.
- **Internal post links use the permalink path**, not the source filename.
- **Series are YAML-driven**; no frontmatter fallback.
- **CSS tokens live in `site.css.scss`** under `:root` and `[data-theme="dark"]`. No `--color-*` aliases.
- **Per-row/per-card taxonomy colour** is injected via inline `--cat` or `--c` style attributes.
- **Don't reintroduce deleted partials** (`_blog_card*`, `_series_card`, `_writing_navigation`, `sidebar_layout`, `writing_layout`).

## Feature-implementation rule

For requests that add functionality, modify behaviour, fix non-trivial bugs, or change architecture, follow the project's Feature Implementation Pattern (`plan-and-implement-feature` command) before changing code.

In practice:

1. Stop before implementation.
2. Clarify requirements.
3. Check relevant docs/ADRs/design guidance — start with `docs/Architecture.md`.
4. Plan the change.
5. Implement with focused edits.
6. Add or update tests when behaviour changes.
7. Run the relevant tests, preferably the full suite, before final handoff.

Typo fixes, docs tweaks, and read-only analysis tasks don't need the full pattern.

## Agent safety

- Never hand-edit `build/` or `coverage/`.
- Keep diffs small and targeted; prefer existing helpers, data files, layouts, and CSS patterns.
- Add or update tests when behaviour changes.
- Avoid new gem dependencies unless clearly justified and documented.
- Update docs alongside behaviour or architecture changes.
- When adding content, preserve the personal, practical, conversational voice.
- Temporary docs (implementation plans, debugging notes, throwaway analysis) belong outside the repo under `~/Documents/macapinlac.com/`. Only permanent docs ship in `docs/`.

## Where to read more

| Topic                                             | Source                              |
| ------------------------------------------------- | ----------------------------------- |
| **System architecture, routes, helpers, build**   | **`docs/Architecture.md`**          |
| Brand voice + tone                                | `docs/Brand Guidelines.md`          |
| Editorial standards + content themes              | `docs/Content Strategy.md`          |
| Tokens, typography, components                    | `docs/Design System.md`             |
| Tag taxonomy                                      | `docs/Tag-System.md`                |
| Architecture decisions                            | `docs/ADR/`                         |
