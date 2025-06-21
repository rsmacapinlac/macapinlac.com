# Macapinlac.com Design System

**Version:** 1.1 | **Date:** December 2024

## Overview

This design system serves as the foundation for macapinlac.com's redesign, creating a consistent visual language and component library that can be applied across all pages. The system prioritizes readability, minimalism, and thoughtful interaction design that aligns with Ritchie Macapinlac's personal brand and content strategy.

---

## 1. Core Foundation

### Typography

| Element | Font | Weight | Size (Desktop) | Size (Mobile) | Line Height |
|---------|------|--------|----------------|---------------|------------|
| Body    | Inter | 400    | 18px           | 16px          | 1.6        |
| H1      | Lora  | 700    | 40px           | 32px          | 1.2        |
| H2      | Lora  | 700    | 32px           | 28px          | 1.25       |
| H3      | Lora  | 600    | 24px           | 22px          | 1.3        |
| H4      | Inter | 600    | 20px           | 18px          | 1.35       |
| H5      | Inter | 600    | 18px           | 16px          | 1.4        |
| H6      | Inter | 600    | 16px           | 14px          | 1.4        |
| Editorial Text | Crimson Text | 400 | 16-18px | 14-16px | 1.5-1.6 |
| Caption | Inter | 400    | 14px           | 12px          | 1.5        |
| Code    | Mono  | 400    | 16px           | 14px          | 1.5        |

### Three-Font Typography System

#### **Font Usage Guidelines:**

| Font | Purpose | Applications |
|------|---------|-------------|
| **Lora (Serif)** | Authoritative Headings | Section headers ("Featured Post", "Topics"), page titles, post titles |
| **Crimson Text (Serif)** | Editorial/Narrative Content | Tagline quotes, post excerpts, newsletter descriptions, narrative text |
| **Inter (Sans-serif)** | Functional Interface | Navigation, buttons, labels, dates, metadata, UI elements |

#### **Specific Applications:**
- **Tagline/Brand Quote**: Crimson Text, 28px, italic
- **Post Excerpts**: Crimson Text, 16px, regular
- **Newsletter Descriptions**: Crimson Text, 16px, regular
- **Section Headers**: Lora, 28px, bold
- **Post Titles**: Lora, 22-24px, semi-bold
- **Navigation**: Inter, 16px, regular
- **Metadata (dates, counts)**: Inter, 12-14px, regular

### Color Palette

#### Primary Colors
- **Blue:** #3B5F7F (Text accents, links, primary buttons)
- **Earth:** #7F6E56 (Secondary accents, highlights)

#### Neutrals
- **Dark Gray:** #252525 (Primary text)
- **Mid Gray:** #474747 (Secondary text)
- **Light Gray 1:** #777777 (Tertiary text, icons)
- **Light Gray 2:** #A0A0A0 (Disabled text, borders)
- **Light Gray 3:** #E5E5E5 (Backgrounds, dividers)
- **Off-White:** #F7F7F7 (Page background)

#### Functional
- **Success/Positive:** #2E7D32
- **Warning:** #ED6C02
- **Error:** #D32F2F

#### Dark Mode Colors
- **Background:** #121212
- **Surface:** #1E1E1E
- **Surface Elevated:** #2D2D2D
- **Primary Text:** #F5F5F5
- **Secondary Text:** #C7C7C7
- **Dark Mode Blue:** #81A4C7
- **Dark Mode Earth:** #B8A38C

### Spacing

Based on an 8px grid system:

| Token | Value |
|-------|-------|
| xs    | 4px   |
| sm    | 8px   |
| md    | 16px  |
| lg    | 24px  |
| xl    | 32px  |
| xxl   | 48px  |
| xxxl  | 64px  |
| hero  | 80px  |

### Breakpoints

| Name    | Size       | Content Area |
|---------|------------|--------------|
| Mobile  | 0-639px    | 100% - 32px  |
| Tablet  | 640-1023px | 608px        |
| Desktop | 1024px+    | 800px        |
| Wide    | 1440px+    | 1000px       |

### Layout

- **Content Width:** Maximum 800px for optimal readability
- **Margins:** Minimum 16px on mobile, 5% on larger screens
- **Column System:** 12-column grid for flexibility

---

## 2. UI Components

### Navigation

#### Primary Navigation
- Simple horizontal menu on desktop
- Hidden behind hamburger on mobile
- Active state uses subtle underline or color change

```
Home | Writing | Series | About | Contact
```

#### Mobile Navigation
- Hamburger icon in header
- Expands to full-screen overlay
- Bold typography with clear tap targets
- Dark/light mode toggle included

#### Dark/Light Mode Toggle
- Positioned in header (desktop)
- In menu on mobile
- Sun/moon icons with smooth transition
- Default: Light mode (updated from dark mode default)

### Content Cards

#### Post Preview Card
```
[Optional Image]
Date
Title (H3)
Brief excerpt (2-3 lines)
Read more → (or time estimate)
```

#### Featured Post Card
```
[Larger Optional Image]
Featured Badge
Date
Title (H2)
Extended excerpt (3-4 lines)
Read more → (or time estimate)
```

#### Project/Series Card
```
[Visual Element/Icon]
Series Title (H3)
Brief description
x Posts in series
Explore →
```

### Typography Components

#### Links
- Default: Primary blue with subtle underline
- Hover: Darker blue with full underline
- Visited: Slightly desaturated
- External: Include external link icon

#### Blockquotes
```
|
| "Quoted text appears here with slightly
| larger font size and italics."
|
| — Attribution
```

#### Code Blocks
- Light gray background (#F1F1F1)
- Dark mode: #2D2D2D
- Border-radius: 4px
- Padding: 16px
- Language tag (optional)

### Form Elements

#### Text Inputs
```
Label
[                    ]
Helper text / Error message
```

#### Buttons
- **Primary:** Filled background, white text
- **Secondary:** Outline, colored text
- **Tertiary:** Text only with subtle hover
- **States:** Default, Hover, Active, Disabled
- **Padding:** Generous padding for comfortable touch targets (minimum 180px width for text-heavy buttons)

#### Text Areas
```
Label
[                    ]
[                    ]
[                    ]
Helper text / Character count
```

### Interactive Elements (Future Implementation)

#### Reaction Buttons
```
Was this helpful? 👍 💡 🤔
```
- Placement: End of articles
- Visual feedback on click
- No login required

#### Comment Section Placeholder
```
Comments coming soon
[Sign up for the newsletter to join the conversation]
```

#### Share Options
- Simple icon set: Twitter, LinkedIn, Email, Copy Link
- Placement: End of articles
- Tooltip on hover

### Utility Components

#### Tags
```
[tag name]
```
- Unified earth tone styling: #F5F3F0 background, #7F6E56 border
- Small text size
- Hover effect
- Placement: Post footer, series pages

#### Topic Cards
- **Background:** #F5F3F0 (light earth tone)
- **Border:** #7F6E56 (earth tone), 1px width
- **Dimensions:** 110px × 90px
- **Border radius:** 8px
- **Layout:** Single row of 6 cards
- **Content:** Emoji icon, topic name, post count

#### Badges
```
Part of: [Series Name]
```
- For identifying series or special content
- Distinguished from tags by shape/color

#### Dividers
- Thin line: 1px
- Medium line: 2px
- Visual divider: 3-5px with margin

#### Icons
- Minimal set for UI elements
- Consistent 24x24 viewbox
- Stroke-based for scalability
- Match to text color

---

## 3. Page Templates

### Writing Section (Priority 1)

#### Writing Index Template
- **Header:**
  - Page title: "Writing"
  - Optional filter controls

- **Main:**
  - Post preview cards in reverse chronological order
  - Year-based navigation sidebar (desktop) or dropdown (mobile)
  - Pagination or load more option

- **Sidebar/Filter (Desktop):**
  - Year filter
  - Popular tags
  - Featured posts

- **Footer:**
  - Newsletter signup (subtle)

#### Individual Post Template
- **Header:**
  - Series badge (if applicable)
  - Post title (H1)
  - Date
  - Reading time

- **Content:**
  - Clear typography
  - Image handling (wide)
  - Blockquote styling
  - Code block styling

- **Footer:**
  - Tags
  - Reaction placeholder
  - Series navigation (if applicable)
  - Related posts
  - Newsletter signup

### Projects and Series (Priority 2)

#### Series Landing Template
- **Header:**
  - Page title: "Series & Projects"
  - Brief introduction

- **Main:**
  - Series cards grid
  - Visual distinction between series types
  - Topic filters (optional)

#### Individual Series Template
- **Header:**
  - Series title (H1)
  - Series description

- **Main:**
  - Sequential post listing
  - Progress indicator
  - Post previews with dates

### About Page (Priority 3)

#### About Template
- **Header:**
  - Page title: "About"
  - Featured image (optional)

- **Main:**
  - Personal introduction
  - Professional background
  - Site purpose
  - Topics covered

- **Footer:**
  - Connection options
  - CV/Resume link
  - Newsletter signup

### Contact Page (Priority 4)

#### Contact Template
- **Header:**
  - Page title: "Contact"
  - Brief invitation

- **Main:**
  - Form with:
    - Name
    - Email
    - Message
    - Submit button
  - Alternative contact methods
  - Privacy notice

---

## 4. Special Components

### Newsletter Signup

#### Inline Variant
```
Join the Newsletter
[Email field] [Subscribe →]
```

#### Footer Variant
```
Stay in Touch
Get occasional updates on new posts and projects.
[Email field] [Subscribe →]
```

#### Dedicated Page Variant
```
Newsletter
Brief description of what subscribers receive
Frequency indication
[Name - Optional]
[Email - Required]
[Subscribe →]
```

### Tag System

#### Tag Display
- Unified earth tone styling across all tags
- Group at bottom of posts
- Limited to 3-5 per post

#### Topic Cards (Updated)
- **Unified Design:** All topic cards use the same earth tone color scheme
- **Background:** #F5F3F0
- **Border:** #7F6E56, 1px stroke
- **Layout:** Single row of 6 cards (110px × 90px each)
- **Content:** Emoji icon at top, topic name center, post count bottom
- **Hover State:** Subtle interaction feedback

#### Tag Index Page
- Alphabetical grid or list
- Post count per tag
- Most popular tags highlighted

### Search Component (Future)

#### Search Bar
```
[🔍 Search...]
```
- Placement: Header or navigation
- Expandable on mobile

#### Search Results Template
- Similar to writing index
- Highlighting of search terms
- Filters for result types

---

## 5. Dark Mode Implementation

### Mode Switching
- System preference detection
- Manual toggle preserved in local storage
- Smooth transition animation (300ms)

### Dark Mode Defaults
- Default to light mode on first visit (updated)
- Clear visual hierarchy maintained
- All interactive elements clearly visible
- Reduced brightness for comfortable reading

### Color Mapping

| Light Mode | Dark Mode |
|------------|-----------|
| #F7F7F7 (Background) | #121212 |
| #FFFFFF (Surface) | #1E1E1E |
| #252525 (Text) | #F5F5F5 |
| #3B5F7F (Primary) | #81A4C7 |

---

## 6. Accessibility Considerations

### Core Principles
- WCAG 2.1 AA compliance target
- Keyboard navigation support
- Screen reader friendly markup
- Sufficient color contrast (4.5:1 minimum)

### Focus States
- Visible focus indicators on all interactive elements
- Consistent style across components

### Motion and Animation
- Respect reduced motion preferences
- Subtle transitions (300ms maximum)
- No essential content in animations

---

## 7. Future Integration Points

### Commenting System
- Reserved space in post template footer
- Clear visual separation from post content
- Moderation UI considerations

### Enhanced Analytics
- Event tracking hooks in component design
- Non-invasive implementation

### Search Functionality
- Reserved UI space in navigation
- Search results page template

### Extended Media Types
- Video embed component
- Audio player component
- Interactive content frames

---

## 8. Style Guide Usage

### Implementation Notes
- Component-based approach recommended
- CSS custom properties for theming
- Mobile-first responsive approach
- Progressive enhancement philosophy

### Governance
- Design system version tracking
- Component approval process
- Feedback loop for improvements

### Updates from Version 1.0
- Added Crimson Text as third font for editorial content
- Updated typography hierarchy with three-font system
- Unified topic card design with earth tone color scheme
- Updated default mode preference to light mode
- Enhanced button padding specifications
- Refined color applications based on approved mockup

---

This document serves as the foundation for macapinlac.com's redesign and will evolve as the site grows and adapts to new content needs.