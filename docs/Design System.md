# Macapinlac.com Design System

**Version:** 2.0 | **Date:** December 2024

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
| **Crimson Text (Serif)** | Editorial/Narrative Content | Tagline quotes, post excerpts, narrative text |
| **Inter (Sans-serif)** | Functional Interface | Navigation, buttons, labels, dates, metadata, UI elements |

#### **Specific Applications:**
- **Tagline/Brand Quote**: Crimson Text, 28px, italic
- **Post Excerpts**: Crimson Text, 16px, regular
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

Based on a flexible spacing system using rem units:

| Token | Value | Pixels (16px base) |
|-------|-------|-------------------|
| xs    | 0.25rem | 4px   |
| sm    | 0.5rem  | 8px   |
| md    | 1rem    | 16px  |
| lg    | 2rem    | 32px  |
| xl    | 4rem    | 64px  |
| xxl   | 8rem    | 128px |

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
- Default: Light mode

### Content Cards

#### Article Preview Card
```
[Optional Image]
Date
Title (H3)
Brief excerpt (2-3 lines)
Read more → (or time estimate)
```

#### Featured Article Card
```
[Larger Optional Image]
Featured Badge
Date
Title (H2)
Extended excerpt (3-4 lines)
Read more → (or time estimate)
```

#### Series Card
```
[Visual Element/Icon]
Series Title (H3)
Brief description
x Articles in series
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
- **States:** Default, Hover, Active, Disabled, Loading
- **Padding:** Generous padding for comfortable touch targets (minimum 180px width for text-heavy buttons)

##### Button States and Behaviors
- **Default:** Primary blue (#3B5F7F) background, white text
- **Hover:** Darker blue (#2D4A5F), smooth 200ms transition
- **Active:** Pressed state with slightly darker background and 1px inset shadow
- **Disabled:** Light gray (#A0A0A0) background, disabled cursor
- **Loading:** Spinner icon replaces text, button remains same size
- **Focus:** 2px blue outline for keyboard navigation

#### Text Areas
```
Label
[                    ]
[                    ]
[                    ]
Helper text / Character count
```

### Utility Components

#### Tag System Components

#### Tags
```
[tag name]
```
- Unified earth tone styling: #F5F3F0 background, #7F6E56 border
- Small text size
- Hover effect
- Placement: Article footer, series pages

#### Tag Cards
- **Background:** #F5F3F0 (light earth tone)
- **Border:** #7F6E56 (earth tone), 1px width
- **Dimensions:** 110px × 90px
- **Border radius:** 8px
- **Layout:** Single row of 6 cards
- **Content:** Emoji icon, tag name, article count

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

### Writing Section

#### Writing Index Template
- **Header:**
  - Page title: "Writing"
  - Optional filter controls

- **Main:**
  - Article preview cards in reverse chronological order
  - Year-based navigation sidebar (desktop) or dropdown (mobile)
  - Pagination or load more option

- **Sidebar/Filter (Desktop):**
  - Year filter
  - Popular tags
  - Featured articles

#### Individual Article Template
- **Header:**
  - Series badge (if applicable)
  - Article title (H1)
  - Date
  - Reading time

- **Content:**
  - Clear typography
  - Image handling (wide)
  - Blockquote styling
  - Code block styling

- **Footer:**
  - Tags
  - Series navigation (if applicable)
  - Related articles

#### Minimalist Reading Layout ✅ IMPLEMENTED
**Status**: Complete (January 2025)

**Overview**: Reading-focused layout with enhanced typography, distinct navigation styling, and reading time integration.

##### Typography Specifications
- **Post Title**: Lora, 2.5rem (40px), 700 weight, 1.2 line height
- **Body Text**: Inter, 1.125rem (18px), 400 weight, 1.7 line height
- **Meta Information**: Inter, 0.875rem (14px), 500 weight, 1.5 line height
- **Reading Time**: Inter, 0.875rem (14px), 400 weight, integrated with meta

##### Meta Information Layout
```
Date • Reading Time • Tags
```
- **Separators**: Bullet points (•) for clean visual separation
- **Reading Time**: Calculated at 200 words per minute
- **Tags**: Minimal styling with subtle hover effects

##### Navigation Components

###### Series Navigation (Card-like)
- **Container**: Card-like appearance with background, borders, and left accent
- **Background**: `var(--color-bg-secondary)`
- **Border**: 1px solid with 4px left accent in primary color
- **Padding**: `$space-lg` (32px) with responsive adjustments
- **Buttons**: Solid background with hover animations
- **Center Button**: Primary color background for "View All Posts in Series"

###### Chronological Navigation (Text Links)
- **Container**: Minimal styling with no background
- **Buttons**: Underlined text links with subtle hover effects
- **Typography**: Inter, 1rem (16px), 600 weight
- **Hover**: Color change and text decoration thickness increase

##### Progress Indicators

###### Series Progress
- **Text**: "Part X of Y" with clear typography
- **Progress Bar**: Visual indicator with primary color fill
- **Animation**: Smooth width transitions for progress updates

##### Content Organization
- **Header**: Title, meta information, and optional summary
- **Content**: Main article content with optimized typography
- **Reply Context**: Styled reply links for webmention integration
- **Footer**: Navigation components and optional changelog

##### Responsive Behavior

###### Mobile Adaptations
- **Typography Scaling**: Reduced font sizes for mobile screens
- **Navigation Stacking**: Series and chronological navigation stack vertically
- **Spacing Adjustments**: Reduced padding and margins for mobile
- **Touch Targets**: Minimum 44px height for all interactive elements

###### Tablet and Desktop
- **Horizontal Navigation**: Navigation components display horizontally
- **Optimal Reading Width**: Maximum 800px content width
- **Generous Spacing**: Increased padding and margins for comfortable reading

##### Dark Mode Compatibility
- **Color Mapping**: All components use CSS custom properties
- **Background Contrast**: Maintains readability in both modes
- **Interactive States**: Hover and focus states work in both themes
- **Progress Indicators**: Adapt to dark mode color scheme

##### Accessibility Features
- **Semantic Structure**: Proper heading hierarchy and landmark roles
- **Focus Management**: Clear focus indicators for all interactive elements
- **Screen Reader Support**: Descriptive labels and ARIA attributes
- **Keyboard Navigation**: Full keyboard accessibility for all components

##### Performance Considerations
- **CSS Optimization**: Efficient selectors and minimal specificity conflicts
- **Loading Strategy**: Critical CSS inlined, non-critical deferred
- **Animation Performance**: Hardware-accelerated transitions and transforms
- **Bundle Size**: Minimal CSS footprint with component-based organization

**Implementation Details**:
- Uses `--minimal` modifier classes for all components
- Reading time helper methods in `config.rb`
- Comprehensive CSS styling in `site.css.scss`
- Full responsive design with mobile-first approach
- Dark mode compatibility maintained
- Comprehensive test coverage with 9 test scenarios

### Series Section

#### Series Landing Template
- **Header:**
  - Page title: "Series"
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
  - Sequential article listing
  - Progress indicator
  - Article previews with dates

### About Page

#### About Template ✅ IMPLEMENTED
**Status**: Complete (January 2025)

- **Header:**
  - ✅ Page title: "About"
  - ✅ Page description: "Personal introduction and professional background"

- **Main:**
  - ✅ Personal introduction section
  - ✅ Professional background with featured cards
  - ✅ Content areas overview (Technology, Parenting, Productivity, Personal Development)
  - ✅ Connection section with social links
  - ✅ Social media integration with icons

- **Footer:**
  - ✅ Connection options (social links)
  - ✅ Navigation buttons (Back to Home, Browse My Writing)
  - ✅ CV/Resume link (placeholder)

**Implementation Details**:
- Uses design system components and styling
- Responsive grid layouts for content areas
- Dynamic social links from data file
- SEO optimization with JSON-LD structured data
- Dark mode compatibility maintained
- Comprehensive test coverage implemented

### Contact Page

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

## 4. Tag System

### Tag Display
- Unified earth tone styling across all tags
- Group at bottom of articles
- Limited to 3-5 per article

### Tag Cards
- **Unified Design:** All tag cards use the same earth tone color scheme
- **Background:** #F5F3F0
- **Border:** #7F6E56, 1px stroke
- **Layout:** Single row of 6 cards (110px × 90px each)
- **Content:** Emoji icon at top, tag name center, article count bottom
- **Hover State:** Subtle interaction feedback

### Tag Index Page
- Alphabetical grid or list
- Article count per tag
- Most popular tags highlighted

---

## 5. Dark Mode Implementation

### Mode Switching
- System preference detection
- Manual toggle preserved in local storage
- Smooth transition animation (300ms)

### Dark Mode Defaults
- Default to light mode on first visit
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

## 6. Minimalist Reading Layout Components

### Post Layout (Minimalist)

#### Reading-Optimized Typography
- **Post Title**: Lora, 2.5rem (40px), 700 weight, 1.2 line height
- **Body Text**: Inter, 1.125rem (18px), 400 weight, 1.7 line height
- **Meta Information**: Inter, 0.875rem (14px), 500 weight, 1.5 line height
- **Reading Time**: Inter, 0.875rem (14px), 400 weight, integrated with meta

#### Meta Information Layout
```
Date • Reading Time • Tags
```
- **Separators**: Bullet points (•) for clean visual separation
- **Reading Time**: Calculated at 200 words per minute
- **Tags**: Minimal styling with subtle hover effects

#### Navigation Components

##### Series Navigation (Card-like)
- **Container**: Card-like appearance with background, borders, and left accent
- **Background**: `var(--color-bg-secondary)`
- **Border**: 1px solid with 4px left accent in primary color
- **Padding**: `$space-lg` (32px) with responsive adjustments
- **Buttons**: Solid background with hover animations
- **Center Button**: Primary color background for "View All Posts in Series"

##### Chronological Navigation (Text Links)
- **Container**: Minimal styling with no background
- **Buttons**: Underlined text links with subtle hover effects
- **Typography**: Inter, 1rem (16px), 600 weight
- **Hover**: Color change and text decoration thickness increase

#### Progress Indicators

##### Series Progress
- **Text**: "Part X of Y" with clear typography
- **Progress Bar**: Visual indicator with primary color fill
- **Animation**: Smooth width transitions for progress updates

#### Content Organization
- **Header**: Title, meta information, and optional summary
- **Content**: Main article content with optimized typography
- **Reply Context**: Styled reply links for webmention integration
- **Footer**: Navigation components and optional changelog

### Responsive Behavior

#### Mobile Adaptations
- **Typography Scaling**: Reduced font sizes for mobile screens
- **Navigation Stacking**: Series and chronological navigation stack vertically
- **Spacing Adjustments**: Reduced padding and margins for mobile
- **Touch Targets**: Minimum 44px height for all interactive elements

#### Tablet and Desktop
- **Horizontal Navigation**: Navigation components display horizontally
- **Optimal Reading Width**: Maximum 800px content width
- **Generous Spacing**: Increased padding and margins for comfortable reading

### Dark Mode Compatibility
- **Color Mapping**: All components use CSS custom properties
- **Background Contrast**: Maintains readability in both modes
- **Interactive States**: Hover and focus states work in both themes
- **Progress Indicators**: Adapt to dark mode color scheme

### Accessibility Features
- **Semantic Structure**: Proper heading hierarchy and landmark roles
- **Focus Management**: Clear focus indicators for all interactive elements
- **Screen Reader Support**: Descriptive labels and ARIA attributes
- **Keyboard Navigation**: Full keyboard accessibility for all components

### Performance Considerations
- **CSS Optimization**: Efficient selectors and minimal specificity conflicts
- **Loading Strategy**: Critical CSS inlined, non-critical deferred
- **Animation Performance**: Hardware-accelerated transitions and transforms
- **Bundle Size**: Minimal CSS footprint with component-based organization

---

## 7. Style Guide Usage

### Implementation Notes
- Component-based approach recommended
- CSS custom properties for theming
- Mobile-first responsive approach
- Progressive enhancement philosophy

### Governance
- Design system version tracking
- Component approval process
- Feedback loop for improvements

---

This document serves as the foundation for macapinlac.com's redesign and will evolve as the site grows and adapts to new content needs.