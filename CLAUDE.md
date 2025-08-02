# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Development Commands

### Start Development Server
```bash
# Always use the development script
./scripts/dev.sh server

```

### Run Tests
```bash
# All tests (uses Rack::Test - no server needed)
./scripts/dev.sh test

# Specific test file
./scripts/dev.sh test spec/features/blog_spec.rb

```

### Build for Production
```bash
./scripts/dev.sh build
```

### Other Development Commands
```bash
# Kill all Middleman servers
./scripts/dev.sh kill

# Install dependencies
bundle install

# Ruby version management
rvm use
```

## Architecture Overview

### Technology Stack
- **Static Site Generator**: Middleman (Ruby-based)
- **Template Engine**: ERB with markdown support
- **CSS**: SASS with CSS custom properties for theming
- **Testing**: RSpec with Rack::Test (in-memory testing)
- **Coverage**: SimpleCov (90% minimum threshold)

### Data-Driven Content Management
The site uses YAML files in `data/` for centralized management of components:

- `data/series.yml`: Series metadata with rich information (description, status, icon, color, slug)
- `data/tags.yml`: Tag metadata with descriptions, icons, and colors
- `data/socials.yml`: Social media links
- `data/about_page_tags.yml`: Curated tags for About page

### Series System Architecture
The series system supports both YAML-driven and frontmatter-based approaches:

1. **YAML-driven** (preferred): Series metadata in `data/series.yml` with automatic proxy page generation
2. **Frontmatter-based** (only for backward compatibility): Series name in blog post frontmatter

Key helper methods in `config.rb`:
- `series_articles(series_name)`: Get articles for a series
- `series_navigation(current_article)`: Navigation between series posts
- `series_url(series_name_or_slug)`: Generate series URLs

### Layout System
- `layouts/layout.erb`: Main site layout with dark mode support
- `layouts/post.erb`: Blog post layout
- `layouts/writing_layout.erb`: Writing section layout
- `layouts/sidebar_layout.erb`: Layout with sidebar

Partial components in `layouts/`:
- `_header.erb`, `_footer.erb`: Site navigation
- `_blog_card.erb`, `_blog_card_homepage.erb`: Article cards
- `_series_card.erb`: Series display cards

### CSS Architecture
- CSS custom properties for light/dark mode theming
- SASS variables in `_variables.scss`
- Single responsive stylesheet `site.css.scss`
- Dark mode toggle via `data-theme` attribute

### Testing Strategy
- **In-memory testing**: Tests run against Middleman app instance (no external server)
- **Feature tests**: Complete user workflows (`spec/features/`)
- **Component tests**: Individual features (dark mode, typography, etc.)
- **Coverage**: 90% minimum with SimpleCov

### Image Management
- Responsive image helpers in `config.rb`
- WebP format support with fallbacks
- Lazy loading and optimized srcsets
- Image optimization via middleman-imageoptim

### Build Process
Production builds include:
- CSS/JS/HTML minification
- Asset optimization
- Image optimization
- Relative asset paths for deployment flexibility

## Important Notes

### Testing Approach
Tests use Rack::Test and run against an in-memory Middleman application. No development server is required for testing - they run independently and much faster than HTTP-based tests.

### Series Management
When adding new series / modifying an existing series:
1. Add metadata to `data/series.yml` with slug, description, status, icon, and color
2. Proxy pages are automatically generated at `/series/{slug}.html`
3. Blog posts can reference series by name in frontmatter

### Writing Blog Posts

#### File Naming Convention
Blog posts use the format: `YYYY-MM-DD-title-with-hyphens.html.md`

Example: `2025-07-14-this-week-s-obsessions-superman-prime-day-practicality-and-ai-code-adventures.html.md`

#### Required Frontmatter
```yaml
---
title: "Post Title"
date: YYYY-MM-DD
tags:
  - Tag Name
  - Another Tag
layout: post  # Optional, defaults to post layout
---
```

#### Content Structure
- Use `<!-- more //-->` to create excerpt break for homepage
- Markdown content follows standard syntax
- Links can reference local files: `/files/YYYY-MM-DD/filename.txt`
- Images go in `source/images/` directory

#### Series Integration
When writing posts for a series:
1. Add the series metadata to `data/series.yml` first
2. Reference the series by exact name in the post frontmatter
3. Series navigation is automatically generated

#### Tag Management
- Use existing tags from `data/tags.yml` when possible
- Propose new tags and request approval before incorporating into the site
- Approved tags should be added to `data/tags.yml` with description, icon, and color
- Tags are case-sensitive and should match exactly
- Limit to 3-5 tags per article for focus
- Use specific but not overly granular tags

## Brand Guidelines and Content Strategy

For comprehensive brand voice, content guidelines, and design specifications, refer to:

- **Content Strategy**: @docs/Content Strategy.md - Writing guidelines, editorial standards, content themes
- **Redesign Brief**: @docs/Redesign Brief.md - Brand essence, tone, target audience, objectives
- **Design System**: @docs/Design System.md - Typography, colors, UI components, layout specifications

### Content Organization
- Blog posts: `source/*.html.md` with date-based naming
- Static pages: `source/*.html.erb`
- Assets: `source/images/`, `source/stylesheets/`, `source/javascripts/`
- Data files: `data/*.yml`

### Development Workflow
The `scripts/dev.sh` script provides streamlined workflow management:
- Kiil existing servers before starting new ones
- Colored output for clear status messages
- Supports running individual test files
- Handles common development tasks with simple commands
