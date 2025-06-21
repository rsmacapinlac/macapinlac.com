# Macapinlac.com Content Strategy Document

**Version:** 1.3

## 1. Overview

**Purpose:** This content strategy guides the redesign and ongoing content development of macapinlac.com. The site is a personal digital journal and professional platform for Ritchie Macapinlac, focused on thoughtful reflections around technology, productivity, parenting, and experimentation.

## 2. Core Content Pages

### 2.1 Homepage

* **Path:** `/`
* **Sections:**

  * Intro blurb (short bio or welcome message)
  * Recent posts list (reverse chronological)
  * Optional newsletter signup
  * Light link to About or Series section
* **Relevant CTAs (in priority):**

  * "Read this post"
  * "Learn more about me"
  * "Subscribe to the newsletter"
* **Functionality:**

  * Lightweight post summaries
  * Reaction buttons on visible post previews (optional)
  * Responsive, clean layout with clear typography

### 2.2 Writing Section

* **Path:** `/writing`

#### 2.2.1 Index Pages

* **Path Examples:** `/writing/`, `/writing/2025/`
* **Sections:**

  * Reverse chronological list of posts
  * Yearly archive indexes (e.g., grouped by year)
  * Tag/topic filters (optional sidebar or top-nav UI)
* **Relevant CTAs:**

  * "Read more" on each post preview
  * Newsletter opt-in after list or pinned inline
* **Functionality:**

  * Pagination or infinite scroll
  * Filter by tag/year
  * Lightweight summaries per post

#### 2.2.2 Individual Posts

* **Path Example:** `/writing/planning-a-road-trip-in-a-tesla/`
* **Sections:**

  * Title and publish date
  * Optional series badge or navigation ("Part X of Y")
  * Main content body (text, images, links)
  * Tags for related content
  * Related posts (optional)
* **Relevant CTAs:**

  * "Helpful?" feedback buttons
  * Series navigation (if part of a collection)
  * "Subscribe to the newsletter" prompt (inline or footer)
* **Functionality:**

  * Reaction buttons (👍 💡 🤔)
  * Sticky header or back-to-top nav (optional)
  * SEO schema (title, meta description, social preview)

### 2.3 Projects and Series Section

* **Path:** `/series`
* **Sections:**

  * Series landing page (intro + list of series)
  * Individual series pages with intro and post index
* **Relevant CTAs:**

  * "Explore this series"
  * Links to next/previous entries in a series
* **Functionality:**

  * Filters by topic (e.g., Tech, Productivity, Experiments)
  * Series badge in post headers

### 2.4 Newsletter

* **Path:** `/newsletter`

#### 1. Sections:

* Intro text on what the newsletter is
* Email opt-in form
* Optional: archive of past issues (Substack/Buttondown depending)
* **Relevant CTAs:**

  * "Subscribe to the newsletter"
* **Functionality:**

  * Embedded sign-up form
  * Replies enabled for engagement

### 2.5 About Page

* **Path:** `/about`
* **Sections:**

  * Brief personal intro
  * Site purpose
  * What Ritchie does professionally
  * Résumé / CV links
  * Topics covered on the site
  * How to connect
* **Relevant CTAs:**

  * "View Résumé (PDF)"
  * "Contact me"
  * "Subscribe to the newsletter"
* **Functionality:**

  * Links to CV page, Contact form, and Newsletter

### 2.6 Community Policy

* **Path:** `/community/policy`
* **Sections:**

  * Why the policy exists
  * What engagement methods are available
  * Tone and behavior expectations
  * What’s coming next (e.g., comments)
* **Relevant CTAs:**

  * None for now (informational only)
* **Functionality:**

  * Static content page, may evolve with comment system

### 2.7 Contact Page

* **Path:** `/contact`
* **Sections:**

  * Brief invitation to connect
  * Form fields (Name, Email, Message)
* **Relevant CTAs:**

  * "Send Message"
* **Functionality:**

  * Form submission to email or backend processor

## 3. Newsletter Content Strategy

* **Content Type:** Enhanced reflections and dispatches, published alongside or in between blog posts.
* **Includes:**

  * Curated lists (e.g., favorite tools, book recommendations, media roundups)
  * Extended or behind-the-scenes context for recent posts
  * Experiments or drafts not ready for publication
  * Direct personal reflections exclusive to newsletter subscribers
  * Curated media (articles, tools, books, podcasts)
  * Occasional responses to reader feedback or questions
  * Extended or behind-the-scenes context for recent posts
  * Experiments or drafts not ready for publication
  * Direct personal reflections exclusive to newsletter subscribers
  * Curated media (articles, tools, books, podcasts)
  * Occasional responses to reader feedback or questions
* **Relationship to Blog Posts:**

  * May include post excerpts with commentary or expansion
  * May function independently as standalone essays
* **Tone:** Intimate, direct, slightly less polished than blog content but aligned in voice
* **Audience Benefit:** First look at new ideas, a more personal connection with Ritchie, and low-friction engagement via reply

## 4. Content Organization

### 4.3 Tag Strategy

* **Purpose:** Support discoverability, SEO, and reader exploration.
* **Structure:**

  * Tags will be applied to blog posts and series entries.
  * Tags should be specific but not overly granular (e.g., `docker`, `productivity`, `parenting`, `ev-road-trip`).
  * Avoid duplicate or ambiguous terms (e.g., don't mix `tech` and `technology`).
  * A curated tag index will be available at `/tags/`.
* **Editorial Guidance:**

  * Limit to 3–5 tags per post.
  * Use consistent lowercase formatting.
  * Tie tags into future curated collections (e.g., "Start here", "Most popular", "Reader favorites").

### 4.4 Engagement Template Notes

* **Helpful Reactions (Phase 1):**

  * Placement: Bottom of each post.
  * Options: 👍 (Helpful), 💡 (Interesting), 🤔 (Thought-provoking)
  * Display: Simple emoji-style toggle, no login required.
* **Newsletter Replies (Phase 1):**

  * Encourage replies in newsletter footer (e.g., "Have thoughts? Just hit reply.")
  * Funnel responses into curated highlights if desired.
* **Commenting (Future Phase):**

  * Placeholder block under posts (e.g., “Comments coming soon”)
  * Optional integration with Commento, Webmentions, or Cove.chat
  * Include tone guide in community policy (e.g., "Curious, kind, on-topic")

### 4.1 Navigation Structure

```
macapinlac.com/
├── Home (recent posts)
├── Writing
│   ├── Individual Posts
│   └── Tags
├── Projects & Series
│   ├── Series Pages
│   └── Filters (by topic)
├── About
├── Newsletter
├── Contact
├── Community
│   └── Policy
└── [Future: Archive, Uses, Podcast, Resources]
```

### 4.2 Archival Strategy

* Year-based archive (e.g. /writing/2025/)
* Tag and topic-based navigation
* Optional: "Start here" or curated collections

## 5. Future Considerations

* Expand commenting via Webmentions, Commento, or Cove (Phase 2+)
* Add full-text search and curated evergreen content
* Introduce Uses, Now, or Book List pages
* Add CV, Media Kit, or Speaking page as profile grows

## 6. Content Governance

* Content calendar driven by Ritchie's personal projects and reflections
* Newsletter cadence: biweekly or monthly
* Comments (when enabled): moderated with clear tone guide

---

This document is a living reference that will evolve as macapinlac.com grows. It is meant to guide decisions about content structure, tone, and functionality to ensure consistency, scalability, and alignment with Ritchie Macapinlac's brand.