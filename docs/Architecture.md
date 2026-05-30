# Architecture

How `macapinlac.com` is wired together. `AGENTS.md` covers role, commands, invariants, and process; this file covers the system.

## Stack

Middleman 4.x · Ruby (pinned in `.ruby-version`) · ERB + Markdown · SASS with CSS custom properties · RSpec/Capybara/Rack::Test (in-memory, no server needed).

## Route map

```
/                                               source/index.html.erb            (terminal log feed)
/about.html                                     source/about.html.erb            (portrait hero + now strip)
/archive.html                                   source/archive.html.erb          (year groups + filter chips)
/2025.html  /2025/06.html  /2025/06/30.html     source/calendar.html.erb         (year/month/day archives)
/tags/                                          source/tags/index.html.erb       (combined series + tags index)
/tags/{slug}.html                               source/tag.html.erb              (per-tag; Middleman blog tag_template)
/series/{slug}.html                             source/series.html.erb           (proxy only; root render is ignore'd)
/{YYYY}/{MM}/{DD}/{slug}.html                   source/layouts/post.erb          (article reading layout)
/404.html                                       source/404.html.erb              (dark terminal card)
/writing/                                       meta-refresh → /archive.html
/feed.xml                                       source/feed.xml.builder
```

## Layout system

- `source/layouts/layout.erb` — main wrapper for every page except articles. Terminal header, main content slot, status-bar footer, dark-mode toggle script.
- `source/layouts/post.erb` — article layout. Reading column (720px), progress bar, fixed TOC rail (left), inline TOC fallback, breadcrumb, series badge, mono-prefixed headings, drop-cap, chip tags, author card, prev/next.
- `source/layouts/_header.erb` — terminal bar partial. Renders `macapinlac.com @ ritchie ~ %` shell prompt; the homepage variant adds the live `<input id="q" class="search">`.
- `source/layouts/_footer.erb` — status-bar partial. Dynamic post count via `blog.articles.length`; uptime years via `Time.now.year - 2000`.
- `source/layouts/_html_head.erb` — `<head>` partial. Google Fonts (Lora, Inter, JetBrains Mono, Crimson Text), site CSS/JS, manifest at `/images/site.webmanifest`, early-load dark-mode bootstrap script.

There are **no** `_blog_card`, `_series_card`, `_writing_navigation`, `sidebar_layout`, or `writing_layout` partials. Article/series/tag rendering is inline in templates by design — don't reintroduce them.

## CSS architecture

- `source/stylesheets/site.css.scss` is the canonical Build Log stylesheet — all design tokens (CSS custom properties), components, and dark-mode overrides live here.
- `source/stylesheets/_variables.scss` holds only SCSS-time constants (font fallbacks + breakpoints).
- Dark mode toggles via `data-theme="dark"` on `<html>`, persisted in `localStorage`. Token overrides scoped under `[data-theme="dark"]`.
- Per-row / per-card taxonomy colours are injected via inline `style="--cat: #hex"` (log feed) or `style="--c: #hex"` (tag / series surfaces).
- Legacy `--color-*` aliases have been **removed** — use the short Build Log token names (`--paper`, `--ink`, `--rust`, etc.).
- Visual changes: consult `docs/Design System.md` before editing.

## Data files

Prefer updating YAML over hardcoding content in templates.

| File                       | Contents                                                  |
| -------------------------- | --------------------------------------------------------- |
| `data/series.yml`          | Series metadata: name, description, status, icon, color, slug, category, posts, planned_posts |
| `data/tags.yml`            | Tag metadata: name, description, icon, color (category colour) |
| `data/socials.yml`         | Social media links                                        |
| `data/about_page_tags.yml` | Curated tag names for the About page rabbit-holes grid    |
| `data/now.yml`             | "what I'm into right now" strip on /about                 |
| `data/homepage_hero.yml`   | Hero copy (eyebrow / title_html / sub / metaline)         |

## Helpers in `config.rb`

| Helper                                 | Purpose                                                  |
| -------------------------------------- | -------------------------------------------------------- |
| `series_articles(name)`                | Articles in a series, sorted                             |
| `series_url(name_or_slug)`             | Generate `/series/{slug}.html` URL                       |
| `article_series(article)`              | The series an article belongs to (or nil)                |
| `article_series_part(article)`         | `{series:, number:, total:}` for the in-page series badge |
| `primary_tag(article)`                 | First tag with metadata in tags.yml                      |
| `article_cat_color(article)`           | Hex colour for the primary tag (used as `--cat`)         |
| `article_cat_icon(article)`            | Emoji for the primary tag                                |
| `articles_by_year(articles = nil)`     | `[[year, [articles…]], …]` for the archive               |
| `archive_filter_chips`                 | Filter-chip data for `/archive.html` (slug/colour/icon/count) |
| `tags_with_counts`                     | Tag metadata + post count for `/tags/` — zero-count tags filtered out |
| `related_tags(tag_name, limit)`        | Co-occurring tags for the per-tag page                   |
| `article_excerpt_text(a, limit:)`      | Plain-text HTML-stripped excerpt for rows / cards        |
| `reading_time(content)` / `article_reading_time` | Minutes; used in meta lines                    |
| `log_date(date)` / `archive_date(date)` | `YYYY-MM-DD` / `MMM DD` mono formatting                  |

## Series system

YAML-driven only.

1. Add or update metadata in `data/series.yml` with `slug`, `description`, `status`, `icon`, `color`, `category`, and `posts` / `planned_posts` entries.
2. Individual `/series/{slug}.html` pages are generated via the Middleman proxy in `config.rb`.
3. The `source/series.html.erb` template itself is `ignore`d — only the proxies render. (Removing the `ignore` would emit a "Series not found" fallback at the root.)
4. There is no `/series/` index page; series surface in two places: the homepage featured series strip (first `featured: true`) and the `## series` section on `/tags/`.

Frontmatter-based series support has been removed.

## Testing strategy

- **In-memory**: tests run against a Middleman app instance via Rack::Test/Capybara; no dev server needed. Configured in `spec/spec_helper.rb`.
- **Feature tests** in `spec/features/` cover homepage, about, blog, dark mode, layout, hero, minimalist reading layout, series, typography, fonts, responsive images, SASS compilation.
- **Link integrity**: `spec/features/link_integrity_spec.rb` crawls 8 entry pages and asserts every internal `href` resolves to a 200. This is the regression gate against broken data-driven links (e.g., a tag card pointing at a tag with no generated page). It also covers the `/writing/` redirect, the `/series.html` 404, and the `/series/` 404.
- **Coverage**: SimpleCov runs but currently reports 0% — ERB/SCSS/JS aren't instrumented, so the 90% threshold isn't meaningful here. Treat the feature + link specs as the correctness signal.

## Build process

Production builds (`./scripts/dev.sh build`) include CSS/JS/HTML minification, asset optimization, image optimization (`middleman-imageoptim`), and relative asset paths. Image optimisation runs `gifsicle`, `jpegoptim`, and `optipng`; `pngout` and `svgo` are disabled in `config.rb` because their binaries aren't installed in this environment.

### Known build noise (upstream)

`bundle exec middleman build` and `middleman server` emit one line on startup:

```
:image_optim is deprecated. Please use `:imageoptim` instead.
```

This comes from **middleman-imageoptim 0.3.0**, not from our config. The gem registers both the new `:imageoptim` extension and a deprecated `:image_optim` alias; Middleman's `ExtensionManager` calls `load_settings` on every registered extension at boot — earlier than `config.rb` is evaluated — which runs the alias's registration block and triggers its `warn`. We activate the correct `:imageoptim` symbol; there is no in-config way to silence this without monkey-patching the gem. Resolving it requires an upstream fix or a gem bump.
