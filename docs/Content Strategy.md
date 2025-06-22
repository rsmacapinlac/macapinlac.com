# Macapinlac.com Content Strategy Document

**Version:** 2.0

## 1. Overview

**Purpose:** This content strategy guides the redesign and ongoing content development of macapinlac.com. The site is a personal digital journal and professional platform for Ritchie Macapinlac, focused on thoughtful reflections around technology, productivity, parenting, and experimentation.

## 2. Core Content Pages

### 2.1 Homepage

* **Path:** `/`
* **Sections:**
  * Intro blurb (short bio or welcome message)
  * Recent posts list (reverse chronological)
  * Light link to About or Series section
* **Relevant CTAs (in priority):**
  * "Read this post"
  * "Learn more about me"
* **Functionality:**
  * Lightweight post summaries
  * Responsive, clean layout with clear typography

### 2.2 Writing Section

* **Path:** `/writing`

#### 2.2.1 Index Pages

* **Path Examples:** `/writing/`, `/writing/2025/`
* **Sections:**
  * Reverse chronological list of articles
  * Yearly archive indexes (e.g., grouped by year)
  * Tag filters (optional sidebar or top-nav UI)
* **Relevant CTAs:**
  * "Read more" on each article preview
* **Functionality:**
  * Pagination or infinite scroll
  * Filter by tag/year
  * Lightweight summaries per article

#### 2.2.2 Individual Articles

* **Path Example:** `/writing/planning-a-road-trip-in-a-tesla/`
* **Sections:**
  * Title and publish date
  * Optional series badge or navigation ("Part X of Y")
  * Main content body (text, images, links)
  * Tags for related content
  * Related articles (optional)
* **Relevant CTAs:**
  * Series navigation (if part of a collection)
* **Functionality:**
  * SEO schema (title, meta description, social preview)

### 2.3 Series Section

* **Path:** `/series`
* **Sections:**
  * Series landing page (intro + list of series)
  * Individual series pages with intro and article index
* **Relevant CTAs:**
  * "Explore this series"
  * Links to next/previous entries in a series
* **Functionality:**
  * Filters by tag (e.g., Tech, Productivity, Experiments)
  * Series badge in article headers

### 2.4 About Page

* **Path:** `/about`
* **Sections:**
  * Brief personal intro
  * Site purpose
  * What Ritchie does professionally
  * Résumé / CV links
  * Tags covered on the site
  * How to connect
* **Relevant CTAs:**
  * "View Résumé (PDF)"
  * "Contact me"
* **Functionality:**
  * Links to CV page and Contact form

### 2.5 Contact Page

* **Path:** `/contact`
* **Sections:**
  * Brief invitation to connect
  * Form fields (Name, Email, Message)
* **Relevant CTAs:**
  * "Send Message"
* **Functionality:**
  * Form submission to email or backend processor

## 3. Content Organization

### 3.1 Navigation Structure

```
macapinlac.com/
├── Home (recent articles)
├── Writing
│   ├── Individual Articles
│   └── Tags
├── Series
│   ├── Series Pages
│   └── Filters (by tag)
├── About
└── Contact
```

### 3.2 Archival Strategy

* Year-based archive (e.g. /writing/2025/)
* Tag-based navigation
* Optional: "Start here" or curated collections

### 3.3 Tag Strategy

* **Purpose:** Support discoverability, SEO, and reader exploration.
* **Structure:**
  * Tags will be applied to articles and series entries.
  * Tags should be specific but not overly granular (e.g., `docker`, `productivity`, `parenting`, `ev-road-trip`).
  * Avoid duplicate or ambiguous terms (e.g., don't mix `tech` and `technology`).
  * A curated tag index will be available at `/tags/`.
* **Editorial Guidance:**
  * Limit to 3–5 tags per article.
  * Use consistent lowercase formatting.
  * Tie tags into future curated collections (e.g., "Start here", "Most popular", "Reader favorites").

## 4. Content Quality and Editorial Standards

### Writing Guidelines
- **Tone**: Professional yet warm and conversational
- **Voice characteristics**: Authentic, curious, thoughtful, clever, relatable
- **Approach**: Minimal, grounded, personal digital journal style
- **Balance**: Approachable expertise - knowledgeable without being intimidating

### Content Themes and Focus
- **Primary topics**: Technology, parenting, productivity, personal development
- **Content style**: Thoughtful reflections and experimental insights
- **Narrative approach**: Personal experiences with broader applications
- **Technical content**: Accessible explanations with practical examples

## 5. Series and Content Organization

### Series Content Structure
- **Series landing pages**: Introduction and sequential post index
- **Post navigation**: Clear next/previous within series
- **Progress indicators**: Show completion status for multi-part content
- **Series badges**: Visual identification in post headers

### Content Documentation Patterns
- **Process documentation**: Steps, decisions, and lessons learned
- **Resource sharing**: Tools, references, and helpful materials
- **Follow-up content**: Updates, iterations, and refined insights

## 6. SEO and Content Discoverability

### On-Page SEO Practices
- **Title optimization**: Descriptive, search-friendly titles under 60 characters
- **Meta descriptions**: Compelling summaries for social sharing
- **Internal linking**: Connect related posts and topics naturally
- **Image optimization**: Descriptive alt text and meaningful file names

### Content Discoverability Strategy
- **Tag strategy**: Consistent taxonomy for exploration
- **Series organization**: Logical grouping of related content
- **Cross-referencing**: Link to related articles and external resources
- **Archive structure**: Year-based and tag-based navigation

## 7. Content Governance

* Content calendar driven by Ritchie's personal projects and reflections
* Editorial standards focused on clarity, authenticity, and value

---

This document is a living reference that will evolve as macapinlac.com grows. It is meant to guide decisions about content structure, tone, and functionality to ensure consistency, scalability, and alignment with Ritchie Macapinlac's brand.