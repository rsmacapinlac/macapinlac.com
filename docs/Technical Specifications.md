# Macapinlac.com Technical Specifications

**Version:** 1.0 | **Date:** December 2024

## Overview

This document provides detailed technical specifications for all components, files, and dependencies that need to be created, updated, or configured during the macapinlac.com redesign. Each specification includes the expected outcome and validation criteria.

---

## 1. Gem Dependencies

### 1.1 Core Middleman Gems

**Gem:** `middleman` (v4.x)
- **Purpose:** Static site generator core
- **Expected Outcome:** Site builds and serves correctly
- **Validation:** `bundle exec middleman server` starts without errors

**Gem:** `middleman-blog` (v4.x)
- **Purpose:** Blog functionality and content management
- **Expected Outcome:** Blog posts display with proper URLs and metadata
- **Validation:** Blog posts accessible at `/writing/[post-slug]/`, frontmatter parsed correctly

**Gem:** `middleman-autoprefixer` (v3.x)
- **Purpose:** Automatic CSS vendor prefixing
- **Expected Outcome:** CSS works across all target browsers
- **Validation:** CSS properties have appropriate vendor prefixes

**Gem:** `middleman-minify-html` (v3.x)
- **Purpose:** HTML minification for production
- **Expected Outcome:** Production HTML is minified and optimized
- **Validation:** HTML file sizes reduced, no rendering issues

### 1.2 Development and Testing Gems

**Gem:** `rspec` (v3.x)
- **Purpose:** Automated testing framework
- **Expected Outcome:** Comprehensive test coverage for site functionality
- **Validation:** All tests pass, broken links detected

**Gem:** `capybara` (v3.x)
- **Purpose:** Integration testing for web interactions
- **Expected Outcome:** Automated testing of user interactions
- **Validation:** Navigation, forms, and interactions tested automatically

**Gem:** `middleman-livereload` (v3.x)
- **Purpose:** Live reload during development
- **Expected Outcome:** Browser automatically refreshes on file changes
- **Validation:** Changes reflect immediately in browser during development

### 1.3 Asset Processing Gems

**Gem:** `sassc` (v2.x)
- **Purpose:** SASS compilation and processing
- **Expected Outcome:** SASS files compile to optimized CSS
- **Validation:** CSS output matches design system specifications

**Gem:** `middleman-imageoptim` (v1.x)
- **Purpose:** Image optimization during build
- **Expected Outcome:** Images automatically optimized for web
- **Validation:** Image file sizes reduced while maintaining quality

---

## 2. Configuration Files

### 2.1 Middleman Configuration

**File:** `config.rb`
- **Purpose:** Main Middleman configuration
- **Updates Required:**
  - Blog extension configuration
  - Custom collections for series
  - Asset pipeline settings
  - Build optimization settings
- **Expected Outcome:** Site builds with all features enabled
- **Validation:** All blog posts, series, and tags work correctly

**File:** `Gemfile`
- **Purpose:** Ruby gem dependencies
- **Updates Required:**
  - Add required gems with version constraints
  - Organize gems by environment (development, production)
- **Expected Outcome:** All dependencies installed and working
- **Validation:** `bundle install` completes without errors

**File:** `Gemfile.lock`
- **Purpose:** Locked gem versions
- **Expected Outcome:** Consistent gem versions across environments
- **Validation:** Gem versions match across development and production

### 2.2 Build and Deployment Configuration

**File:** `.github/workflows/deploy.yml`
- **Purpose:** GitHub Actions deployment pipeline
- **Updates Required:**
  - Build process configuration
  - Testing and validation steps
  - Deployment to hosting provider
- **Expected Outcome:** Automated build and deployment on push
- **Validation:** Site deploys automatically when code is pushed

**File:** `config.ru`
- **Purpose:** Rack configuration for development server
- **Expected Outcome:** Development server runs correctly
- **Validation:** `bundle exec middleman server` starts without errors

---

## 3. Layout and Template Files

### 3.1 Main Layout Files

**File:** `source/layouts/layout.erb`
- **Purpose:** Main site layout template
- **Updates Required:**
  - HTML5 semantic structure
  - Meta tags and SEO elements
  - Google Fonts integration
  - CSS and JavaScript includes
  - Dark/light mode toggle
- **Expected Outcome:** Consistent layout across all pages
- **Validation:** All pages use layout, meta tags present, fonts load

**File:** `source/layouts/post.erb`
- **Purpose:** Blog post layout template
- **Updates Required:**
  - Article-specific meta tags
  - Series navigation
  - Related articles section
  - Social sharing buttons
- **Expected Outcome:** Blog posts display with proper structure
- **Validation:** Posts render correctly, series navigation works

### 3.2 Page Templates

**File:** `source/index.html.erb`
- **Purpose:** Homepage template
- **Updates Required:**
  - Recent posts section
  - Featured content area
  - Newsletter signup
  - Site introduction
- **Expected Outcome:** Engaging homepage with clear navigation
- **Validation:** Recent posts display, navigation works, responsive design

**File:** `source/writing/index.html.erb`
- **Purpose:** Blog index page
- **Updates Required:**
  - Article listing with cards
  - Pagination or infinite scroll
  - Year-based navigation
  - Tag filtering
- **Expected Outcome:** Easy-to-navigate blog listing
- **Validation:** Articles display correctly, pagination works, filtering functional

**File:** `source/series/index.html.erb`
- **Purpose:** Series landing page
- **Updates Required:**
  - Series listing with cards
  - Series descriptions
  - Article counts per series
- **Expected Outcome:** Clear overview of all series
- **Validation:** Series display correctly, navigation to individual series works

**File:** `source/about.html.erb`
- **Purpose:** About page template
- **Updates Required:**
  - Personal introduction
  - Professional background
  - CV/resume links
  - Contact information
- **Expected Outcome:** Professional about page
- **Validation:** Content displays correctly, links work, responsive design

**File:** `source/contact.html.erb`
- **Purpose:** Contact page template
- **Updates Required:**
  - Contact form with validation
  - Alternative contact methods
  - Form submission handling
- **Expected Outcome:** Functional contact page
- **Validation:** Form validation works, submissions handled correctly

### 3.3 Component Templates

**File:** `source/layouts/_header.erb`
- **Purpose:** Site header component
- **Updates Required:**
  - Navigation menu
  - Mobile hamburger menu
  - Dark/light mode toggle
  - Site branding
- **Expected Outcome:** Responsive header with all functionality
- **Validation:** Navigation works on all devices, toggle functional

**File:** `source/layouts/_footer.erb`
- **Purpose:** Site footer component
- **Updates Required:**
  - Copyright information
  - Social links
  - RSS feed link
  - Newsletter signup
- **Expected Outcome:** Informative footer with useful links
- **Validation:** Links work correctly, responsive design

**File:** `source/layouts/_article.erb`
- **Purpose:** Article content component
- **Updates Required:**
  - Article metadata display
  - Series badges
  - Tag display
  - Social sharing
- **Expected Outcome:** Consistent article presentation
- **Validation:** All article elements display correctly

---

## 4. Stylesheet Files

### 4.1 Main Stylesheets

**File:** `source/stylesheets/site.css.scss`
- **Purpose:** Main stylesheet entry point
- **Updates Required:**
  - Import all component stylesheets
  - Global styles and resets
  - CSS custom properties for theming
- **Expected Outcome:** All styles load and apply correctly
- **Validation:** Styles render correctly, theming works

**File:** `source/stylesheets/_variables.scss`
- **Purpose:** Design system variables
- **Updates Required:**
  - Typography variables (fonts, sizes, line heights)
  - Color palette variables (light and dark mode)
  - Spacing and breakpoint variables
  - Component-specific variables
- **Expected Outcome:** Consistent design tokens across site
- **Validation:** Variables accessible in all stylesheets, values consistent

**File:** `source/stylesheets/_mixins.scss`
- **Purpose:** Reusable SASS mixins
- **Updates Required:**
  - Typography mixins
  - Responsive design mixins
  - Component mixins
  - Utility mixins
- **Expected Outcome:** Efficient, reusable styling patterns
- **Validation:** Mixins work correctly, reduce code duplication

### 4.2 Component Stylesheets

**File:** `source/stylesheets/_components/_navigation.scss`
- **Purpose:** Navigation component styles
- **Updates Required:**
  - Desktop navigation styles
  - Mobile hamburger menu styles
  - Active state styling
  - Hover effects
- **Expected Outcome:** Responsive navigation with smooth interactions
- **Validation:** Navigation works on all devices, states display correctly

**File:** `source/stylesheets/_components/_buttons.scss`
- **Purpose:** Button component styles
- **Updates Required:**
  - Primary, secondary, tertiary button styles
  - Hover, active, disabled states
  - Loading state with spinner
  - Touch target optimization
- **Expected Outcome:** Accessible, visually consistent buttons
- **Validation:** All button states work, touch targets meet 44px minimum

**File:** `source/stylesheets/_components/_forms.scss`
- **Purpose:** Form component styles
- **Updates Required:**
  - Input field styles
  - Textarea styles
  - Form validation styling
  - Label and helper text styles
- **Expected Outcome:** Accessible, user-friendly forms
- **Validation:** Forms are accessible, validation feedback clear

**File:** `source/stylesheets/_components/_cards.scss`
- **Purpose:** Content card styles
- **Updates Required:**
  - Article preview cards
  - Series cards
  - Tag cards
  - Hover effects and interactions
- **Expected Outcome:** Engaging, interactive content cards
- **Validation:** Cards display correctly, interactions work smoothly

**File:** `source/stylesheets/_components/_typography.scss`
- **Purpose:** Typography system styles
- **Updates Required:**
  - Heading hierarchy styles
  - Body text styles
  - Blockquote styles
  - Code block styles
- **Expected Outcome:** Consistent, readable typography
- **Validation:** Typography renders correctly across browsers

### 4.3 Layout Stylesheets

**File:** `source/stylesheets/_layouts/_main.scss`
- **Purpose:** Main layout styles
- **Updates Required:**
  - Grid system
  - Container styles
  - Responsive breakpoints
  - Content area styling
- **Expected Outcome:** Responsive, well-structured layout
- **Validation:** Layout adapts correctly to all screen sizes

**File:** `source/stylesheets/_layouts/_header.scss`
- **Purpose:** Header layout styles
- **Updates Required:**
  - Header positioning and sizing
  - Navigation layout
  - Mobile menu overlay
  - Branding area styling
- **Expected Outcome:** Professional, functional header
- **Validation:** Header displays correctly on all devices

**File:** `source/stylesheets/_layouts/_footer.scss`
- **Purpose:** Footer layout styles
- **Updates Required:**
  - Footer positioning and sizing
  - Link layout and spacing
  - Newsletter signup area
  - Copyright area styling
- **Expected Outcome:** Clean, informative footer
- **Validation:** Footer displays correctly, links work

### 4.4 Theme Stylesheets

**File:** `source/stylesheets/_themes/_light.scss`
- **Purpose:** Light theme color definitions
- **Updates Required:**
  - Light mode color variables
  - Background and surface colors
  - Text colors
  - Accent colors
- **Expected Outcome:** Consistent light theme appearance
- **Validation:** Light theme displays correctly, colors match design system

**File:** `source/stylesheets/_themes/_dark.scss`
- **Purpose:** Dark theme color definitions
- **Updates Required:**
  - Dark mode color variables
  - Dark background and surface colors
  - Dark text colors
  - Dark accent colors
- **Expected Outcome:** Consistent dark theme appearance
- **Validation:** Dark theme displays correctly, contrast ratios meet WCAG standards

---

## 5. JavaScript Files

### 5.1 Main JavaScript

**File:** `source/javascripts/site.js`
- **Purpose:** Main JavaScript entry point
- **Updates Required:**
  - Import all component scripts
  - Global utility functions
  - Event listeners setup
- **Expected Outcome:** All JavaScript functionality works
- **Validation:** No console errors, all interactions work

### 5.2 Component Scripts

**File:** `source/javascripts/components/theme-toggle.js`
- **Purpose:** Dark/light mode toggle functionality
- **Updates Required:**
  - Theme switching logic
  - localStorage persistence
  - System preference detection
  - Smooth transitions
- **Expected Outcome:** Smooth theme switching with persistence
- **Validation:** Toggle works, preference persists, transitions smooth

**File:** `source/javascripts/components/navigation.js`
- **Purpose:** Mobile navigation functionality
- **Updates Required:**
  - Hamburger menu toggle
  - Mobile menu overlay
  - Touch gesture support
  - Keyboard navigation
- **Expected Outcome:** Responsive navigation with smooth interactions
- **Validation:** Mobile menu works, keyboard navigation functional

**File:** `source/javascripts/components/forms.js`
- **Purpose:** Form validation and submission
- **Updates Required:**
  - Form validation logic
  - Error message display
  - Form submission handling
  - Accessibility enhancements
- **Expected Outcome:** User-friendly form validation and submission
- **Validation:** Validation works, error messages clear, submissions handled

---

## 6. Content Files

### 6.1 Blog Posts

**Directory:** `source/`
- **Purpose:** Blog post content files
- **Updates Required:**
  - Update frontmatter with new metadata structure
  - Add series information where applicable
  - Standardize tags
  - Fix any formatting issues
- **Expected Outcome:** All posts display correctly with new structure
- **Validation:** Posts render correctly, metadata parsed, links work

### 6.2 Static Content

**File:** `source/about.html.erb`
- **Purpose:** About page content
- **Updates Required:**
  - Personal introduction content
  - Professional background
  - Contact information
  - CV/resume links
- **Expected Outcome:** Professional about page content
- **Validation:** Content is accurate, links work, responsive design

**File:** `source/contact.html.erb`
- **Purpose:** Contact page content
- **Updates Required:**
  - Contact form content
  - Alternative contact methods
  - Privacy policy information
- **Expected Outcome:** Clear contact information and form
- **Validation:** Form works, contact methods accessible

### 6.3 Data Files

**File:** `data/socials.yml`
- **Purpose:** Social media links configuration
- **Updates Required:**
  - Social media platform links
  - Icon configurations
  - Display preferences
- **Expected Outcome:** Consistent social media integration
- **Validation:** Links work, icons display correctly

**File:** `data/series.yml`
- **Purpose:** Series metadata configuration
- **Updates Required:**
  - Series descriptions
  - Series ordering
  - Series status information
- **Expected Outcome:** Organized series information
- **Validation:** Series display correctly, metadata accessible

---

## 7. Asset Files

### 7.1 Images

**Directory:** `source/images/`
- **Purpose:** Site images and graphics
- **Updates Required:**
  - Optimize all images for web
  - Create responsive image versions
  - Add descriptive alt text
  - Organize by content type
- **Expected Outcome:** Optimized, accessible images
- **Validation:** Images load quickly, alt text present, responsive versions work

### 7.2 Favicon and Icons

**File:** `source/images/favicon.ico`
- **Purpose:** Site favicon
- **Expected Outcome:** Professional site favicon
- **Validation:** Favicon displays in browser tabs

**File:** `source/images/apple-touch-icon.png`
- **Purpose:** iOS home screen icon
- **Expected Outcome:** Professional iOS icon
- **Validation:** Icon displays correctly on iOS devices

**File:** `source/site.webmanifest`
- **Purpose:** Web app manifest
- **Updates Required:**
  - App metadata
  - Icon configurations
  - Display preferences
- **Expected Outcome:** Progressive Web App capabilities
- **Validation:** PWA features work correctly

---

## 8. Build and Deployment Files

### 8.1 Build Configuration

**File:** `middleman.rb`
- **Purpose:** Middleman build configuration
- **Updates Required:**
  - Build optimization settings
  - Asset compression settings
  - Output directory configuration
- **Expected Outcome:** Optimized production build
- **Validation:** Build completes successfully, assets optimized

### 8.2 Deployment Configuration

**File:** `.gitignore`
- **Purpose:** Git ignore rules
- **Updates Required:**
  - Build directory exclusions
  - Environment-specific files
  - Temporary files
- **Expected Outcome:** Clean repository without build artifacts
- **Validation:** Build files not committed, repository clean

**File:** `README.md`
- **Purpose:** Project documentation
- **Updates Required:**
  - Setup instructions
  - Development workflow
  - Deployment process
  - Contributing guidelines
- **Expected Outcome:** Clear project documentation
- **Validation:** New developers can set up and contribute

---

## 9. Testing Files

### 9.1 Test Configuration

**File:** `spec/spec_helper.rb`
- **Purpose:** RSpec test configuration
- **Updates Required:**
  - Test environment setup
  - Capybara configuration
  - Test helper methods
- **Expected Outcome:** Comprehensive test suite
- **Validation:** All tests run successfully

**File:** `spec/features/blog_spec.rb`
- **Purpose:** Blog functionality tests
- **Updates Required:**
  - Blog post display tests
  - Series navigation tests
  - Tag filtering tests
- **Expected Outcome:** Reliable blog functionality
- **Validation:** All blog features work correctly

**File:** `spec/features/layout_spec.rb`
- **Purpose:** Layout and navigation tests
- **Updates Required:**
  - Navigation functionality tests
  - Responsive design tests
  - Accessibility tests
- **Expected Outcome:** Reliable site navigation
- **Validation:** Navigation works on all devices

---

## 10. SEO and Analytics Files

### 10.1 SEO Configuration

**File:** `source/robots.txt`
- **Purpose:** Search engine crawling instructions
- **Updates Required:**
  - Allow/disallow rules
  - Sitemap location
  - Crawl rate settings
- **Expected Outcome:** Proper search engine indexing
- **Validation:** Search engines can crawl site effectively

**File:** `source/sitemap.xml.builder`
- **Purpose:** XML sitemap generation
- **Updates Required:**
  - Page priority settings
  - Update frequency settings
  - URL structure configuration
- **Expected Outcome:** Complete site index for search engines
- **Validation:** Sitemap includes all pages, validates correctly

### 10.2 Feed Configuration

**File:** `source/feed.xml.builder`
- **Purpose:** RSS/Atom feed generation
- **Updates Required:**
  - Feed metadata
  - Content inclusion settings
  - Update frequency
- **Expected Outcome:** Standards-compliant content feed
- **Validation:** Feed validates correctly, content displays in readers

---

## Expected Outcomes Summary

### Technical Outcomes
- **Build Process:** Automated, reliable build and deployment pipeline
- **Performance:** Page load times under 3 seconds on mobile, 2 seconds on desktop
- **Accessibility:** WCAG 2.1 AA compliance across all pages
- **SEO:** Comprehensive meta tags, structured data, and sitemap
- **Cross-browser:** Consistent functionality across all target browsers

### Content Outcomes
- **Blog Functionality:** Full blog with series, tags, and search
- **Content Organization:** Clear navigation and content discovery
- **Content Syndication:** RSS feed for content distribution
- **Content Migration:** All existing content preserved and enhanced

### User Experience Outcomes
- **Responsive Design:** Optimal experience on all devices
- **Dark/Light Mode:** Smooth theme switching with persistence
- **Navigation:** Intuitive navigation with clear information architecture
- **Forms:** Accessible, user-friendly contact and interaction forms

### Maintenance Outcomes
- **Code Quality:** Well-organized, maintainable codebase
- **Testing:** Comprehensive test coverage for reliability
- **Documentation:** Clear documentation for future development
- **Monitoring:** Performance and error monitoring in place

---

**Document Version History:**
- v1.0 (December 2024): Initial technical specifications document 