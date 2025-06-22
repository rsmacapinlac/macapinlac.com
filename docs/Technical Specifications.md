# Macapinlac.com Technical Specifications

**Version:** 3.0 | **Date:** December 2024

## Overview

This document provides detailed technical specifications for all components, files, and dependencies that need to be created, updated, or configured during the macapinlac.com redesign. Each specification includes the expected outcome and validation criteria.

---

## 1. Gem Dependencies

### 1.1 Core Middleman Gems

**Gem:** `middleman` (v4.4.x)
- **Purpose:** Static site generator core
- **Current Status:** Already installed and configured
- **Updates Required:** Update to latest 4.4.x version
- **Expected Outcome:** Site builds and serves correctly
- **Validation:** `bundle exec middleman server` starts without errors

**Gem:** `middleman-blog` (v4.x)
- **Purpose:** Blog functionality and content management
- **Current Status:** Already installed and configured
- **Updates Required:** Update configuration for series support
- **Expected Outcome:** Blog posts display with proper URLs and metadata
- **Validation:** Blog posts accessible at `/2024/07/17/post-title.html`, frontmatter parsed correctly

**Gem:** `middleman-autoprefixer` (v3.x)
- **Purpose:** Automatic CSS vendor prefixing
- **Current Status:** Already installed and configured
- **Updates Required:** None - already working
- **Expected Outcome:** CSS works across all target browsers
- **Validation:** CSS properties have appropriate vendor prefixes

**Gem:** `middleman-minify-html` (v3.x)
- **Purpose:** HTML minification for production
- **Current Status:** Not installed
- **Updates Required:** Add to Gemfile and configure
- **Expected Outcome:** Production HTML is minified and optimized
- **Validation:** HTML file sizes reduced, no rendering issues

### 1.2 Development and Testing Gems

**Gem:** `rspec` (v3.12.x)
- **Purpose:** Automated testing framework
- **Current Status:** Already installed and configured
- **Updates Required:** Update to latest version, enhance test coverage
- **Expected Outcome:** Comprehensive test coverage for site functionality
- **Validation:** All tests pass, broken links detected

**Gem:** `capybara` (v3.39.x)
- **Purpose:** Integration testing for web interactions
- **Current Status:** Already installed and configured
- **Updates Required:** Update to latest version
- **Expected Outcome:** Automated testing of user interactions
- **Validation:** Navigation, forms, and interactions tested automatically

**Gem:** `middleman-livereload` (v3.x)
- **Purpose:** Live reload during development
- **Current Status:** Already installed and configured
- **Updates Required:** None - already working
- **Expected Outcome:** Browser automatically refreshes on file changes
- **Validation:** Changes reflect immediately in browser during development

### 1.3 Asset Processing Gems

**Gem:** `sassc` (v2.x)
- **Purpose:** SASS compilation and processing
- **Current Status:** Already installed and configured
- **Updates Required:** None - already working
- **Expected Outcome:** SASS files compile to optimized CSS
- **Validation:** CSS output matches design system specifications

**Gem:** `middleman-imageoptim` (v1.x)
- **Purpose:** Image optimization during build
- **Current Status:** Not installed
- **Updates Required:** Add to Gemfile and configure
- **Expected Outcome:** Images automatically optimized for web
- **Validation:** Image file sizes reduced while maintaining quality

---

## 2. Configuration Files

### 2.1 Middleman Configuration

**File:** `config.rb`
- **Purpose:** Main Middleman configuration
- **Current Status:** Already exists with basic blog configuration
- **Updates Required:**
  - Add series collections configuration
  - Enable CSS and JavaScript minification
  - Add image optimization configuration
  - Add RSS feed configuration
  - Update blog extension settings
- **Expected Outcome:** Site builds with all features enabled
- **Validation:** All blog posts, series, and tags work correctly

**File:** `Gemfile`
- **Purpose:** Ruby gem dependencies
- **Current Status:** Already exists with basic gems
- **Updates Required:**
  - Add `middleman-imageoptim` gem
  - Add `middleman-minify-html` gem
  - Update existing gem versions
  - Organize gems by environment (development, production)
- **Expected Outcome:** All dependencies installed and working
- **Validation:** `bundle install` completes without errors

**File:** `Gemfile.lock`
- **Purpose:** Locked gem versions
- **Current Status:** Already exists
- **Updates Required:** Update after Gemfile changes
- **Expected Outcome:** Consistent gem versions across environments
- **Validation:** Gem versions match across development and production

### 2.2 Build and Deployment Configuration

**File:** `.github/workflows/publish-prod.yml`
- **Purpose:** GitHub Actions deployment pipeline
- **Current Status:** Already exists with basic AWS S3 deployment
- **Updates Required:**
  - Add build validation and testing steps
  - Add performance monitoring integration
  - Add deployment notifications
  - Update Ruby version and dependencies
- **Expected Outcome:** Automated build and deployment on push
- **Validation:** Site deploys automatically when code is pushed

**File:** `config.ru`
- **Purpose:** Rack configuration for development server
- **Current Status:** Not present (not needed for Middleman)
- **Expected Outcome:** Development server runs correctly
- **Validation:** `bundle exec middleman server` starts without errors

### 2.3 Image Optimization Configuration

**File:** `config.rb` (Image Optimization Section)
- **Purpose:** Configure image optimization settings
- **Current Status:** Not configured
- **Updates Required:**
  - Configure `middleman-imageoptim` gem settings
  - Set up optimization for different image formats (JPEG, PNG, WebP)
  - Configure responsive image generation
  - Set quality and compression settings
- **Expected Outcome:** Images automatically optimized during build
- **Validation:** Image file sizes reduced by 30-50% while maintaining quality

### 2.4 Testing Configuration

**File:** `spec/spec_helper.rb`
- **Purpose:** RSpec test configuration
- **Current Status:** Already exists with basic configuration
- **Updates Required:**
  - Add Capybara configuration for integration testing
  - Add performance testing setup
  - Add accessibility testing configuration
  - Update test environment variables
- **Expected Outcome:** Comprehensive test suite configuration
- **Validation:** All tests run successfully with `bundle exec rspec`

---

## 3. Layout and Template Files

### 3.1 Main Layout Files

**File:** `source/layouts/layout.erb`
- **Purpose:** Main site layout template
- **Current Status:** Already exists with basic structure
- **Updates Required:**
  - Replace current fonts (Inconsolata, JetBrains Mono) with new font stack
  - Add dark mode toggle and system preference detection
  - Add RSS feed autodiscovery
  - Update meta tags and SEO elements
  - Add CSS and JavaScript includes
- **Expected Outcome:** Consistent layout across all pages
- **Validation:** All pages use layout, meta tags present, fonts load

**File:** `source/layouts/post.erb`
- **Purpose:** Blog post layout template
- **Current Status:** Already exists with basic structure
- **Updates Required:**
  - Add series navigation
  - Add structured data markup
  - Update typography and styling
  - Add related articles section
  - Add social sharing buttons
- **Expected Outcome:** Blog posts display with proper structure
- **Validation:** Posts render correctly, series navigation works

### 3.2 Page Templates

**File:** `source/index.html.erb`
- **Purpose:** Homepage template
- **Current Status:** Already exists with basic structure
- **Updates Required:**
  - Update with new design system
  - Add recent posts section with cards
  - Add featured content area
  - Add newsletter signup
  - Add site introduction
  - Add SEO meta tags
- **Expected Outcome:** Engaging homepage with clear navigation
- **Validation:** Recent posts display, navigation works, responsive design

**File:** `source/writing/index.html.erb`
- **Purpose:** Blog index page
- **Current Status:** Not present (using index.html.erb)
- **Updates Required:**
  - Create new file for dedicated blog listing
  - Add article listing with cards
  - Implement pagination or infinite scroll
  - Add year-based navigation
  - Add tag filtering
  - Add SEO optimization
- **Expected Outcome:** Easy-to-navigate blog listing
- **Validation:** Articles display correctly, pagination works, filtering functional

**File:** `source/series/index.html.erb`
- **Purpose:** Series landing page
- **Current Status:** Not present
- **Updates Required:**
  - Create new file for series listing
  - Add series listing with cards
  - Add series descriptions
  - Add article counts per series
  - Add SEO meta tags
- **Expected Outcome:** Clear overview of all series
- **Validation:** Series display correctly, navigation to individual series works

**File:** `source/about.html.erb`
- **Purpose:** About page template
- **Current Status:** Not present
- **Updates Required:**
  - Create new file with personal introduction
  - Add professional background
  - Add CV/resume links
  - Add contact information
  - Add SEO optimization
- **Expected Outcome:** Professional about page
- **Validation:** Content displays correctly, links work, responsive design

**File:** `source/contact.html.erb`
- **Purpose:** Contact page template
- **Current Status:** Not present
- **Updates Required:**
  - Create new file with contact form
  - Add form validation
  - Add alternative contact methods
  - Add form submission handling
  - Add SEO optimization
- **Expected Outcome:** Functional contact page
- **Validation:** Form validation works, submissions handled correctly

### 3.3 Component Templates

**File:** `source/layouts/_header.erb`
- **Purpose:** Site header component
- **Current Status:** Already exists with basic structure
- **Updates Required:**
  - Update with new design system
  - Add navigation menu
  - Add mobile hamburger menu
  - Add dark/light mode toggle
  - Add site branding
- **Expected Outcome:** Responsive header with all functionality
- **Validation:** Navigation works on all devices, toggle functional

**File:** `source/layouts/_footer.erb`
- **Purpose:** Site footer component
- **Current Status:** Already exists with basic structure
- **Updates Required:**
  - Update with new design system
  - Add copyright information
  - Add social media links
  - Add RSS feed link
  - Add site navigation
- **Expected Outcome:** Comprehensive footer with all links
- **Validation:** All links work correctly, responsive design

### 3.4 RSS and Feed Templates

**File:** `source/feed.xml.builder`
- **Purpose:** RSS/Atom feed generation
- **Current Status:** Already exists with basic configuration
- **Updates Required:**
  - Update feed metadata (title, description, language)
  - Add article content inclusion rules
  - Update feed item structure
  - Add update frequency settings
- **Expected Outcome:** Standards-compliant RSS feed
- **Validation:** Feed validates correctly, content displays in RSS readers

**File:** `source/sitemap.xml.builder`
- **Purpose:** XML sitemap generation
- **Current Status:** Not present
- **Updates Required:**
  - Create new file with page priority settings
  - Add update frequency settings
  - Add URL structure configuration
  - Add image sitemap inclusion
- **Expected Outcome:** Complete site index for search engines
- **Validation:** Sitemap includes all pages, validates correctly

**File:** `source/robots.txt`
- **Purpose:** Search engine crawling instructions
- **Current Status:** Already exists with basic content
- **Updates Required:**
  - Update with new crawling rules
  - Add sitemap location reference
  - Add crawl rate settings
- **Expected Outcome:** Proper search engine indexing
- **Validation:** Search engines can crawl site effectively

---

## 4. Stylesheets

### 4.1 Main Stylesheet

**File:** `source/stylesheets/site.css.scss`
- **Purpose:** Main site stylesheet
- **Current Status:** Already exists with basic styling
- **Updates Required:**
  - Replace existing typography (Inconsolata, JetBrains Mono)
  - Import design system variables
  - Import component stylesheets
  - Set up responsive breakpoints
  - Configure dark mode variables
- **Expected Outcome:** Complete site styling
- **Validation:** All styles compile correctly, responsive design works

### 4.2 Design System Files

**File:** `source/stylesheets/_variables.scss`
- **Purpose:** Design system variables
- **Current Status:** Not present
- **Updates Required:**
  - Create new file with typography variables (Lora, Crimson Text, Inter)
  - Add color palette variables (light and dark mode)
  - Add spacing and breakpoint variables
  - Add component-specific variables
- **Expected Outcome:** Centralized design tokens
- **Validation:** Variables accessible throughout stylesheets

**File:** `source/stylesheets/_typography.scss`
- **Purpose:** Typography system styles
- **Current Status:** Not present
- **Updates Required:**
  - Create new file with font family definitions
  - Add heading hierarchy styles
  - Add body text styles
  - Add component typography styles
- **Expected Outcome:** Consistent typography across site
- **Validation:** Typography renders correctly across browsers

**File:** `source/stylesheets/_components.scss`
- **Purpose:** Component-specific styles
- **Current Status:** Not present
- **Updates Required:**
  - Create new file with button component styles
  - Add form component styles
  - Add navigation component styles
  - Add tag system styles
- **Expected Outcome:** Reusable component styles
- **Validation:** Components display correctly, interactions work

### 4.3 Dark Mode Implementation

**File:** `source/stylesheets/_dark-mode.scss`
- **Purpose:** Dark mode color variables
- **Current Status:** Not present
- **Updates Required:**
  - Create new file with dark mode color mappings
  - Add theme transition styles
  - Add component dark mode variants
- **Expected Outcome:** Smooth dark mode functionality
- **Validation:** Dark mode toggle works, transitions are smooth

---

## 5. JavaScript Files

### 5.1 Main JavaScript

**File:** `source/javascripts/site.js`
- **Purpose:** Main site JavaScript
- **Current Status:** Already exists with minimal content
- **Updates Required:**
  - Add dark mode toggle functionality
  - Add mobile navigation functionality
  - Add form validation
  - Add performance monitoring
- **Expected Outcome:** Interactive site functionality
- **Validation:** All JavaScript functions work correctly

### 5.2 Dark Mode JavaScript

**File:** `source/javascripts/dark-mode.js`
- **Purpose:** Dark mode functionality
- **Current Status:** Not present
- **Updates Required:**
  - Create new file with theme toggle implementation
  - Add localStorage persistence
  - Add system preference detection
  - Add smooth transitions
- **Expected Outcome:** Seamless dark mode experience
- **Validation:** Theme switching works, preference persists

---

## 6. Content Files

### 6.1 Blog Posts

**Directory:** `source/`
- **Purpose:** Blog post content
- **Current Status:** 20+ existing posts with basic frontmatter
- **Updates Required:**
  - Update frontmatter with series information (e.g., Tesla road trip posts)
  - Add comprehensive meta tags
  - Implement consistent tagging
  - Add structured data markup
- **Expected Outcome:** Well-organized, SEO-optimized content
- **Validation:** All posts display correctly, metadata present

### 6.2 Static Pages

**File:** `source/about.html.erb`
- **Purpose:** About page content
- **Current Status:** Not present
- **Updates Required:**
  - Create new file with personal introduction content
  - Add professional background
  - Add contact information
  - Add SEO meta tags
- **Expected Outcome:** Professional about page
- **Validation:** Content displays correctly, SEO optimized

**File:** `source/contact.html.erb`
- **Purpose:** Contact page content
- **Current Status:** Not present
- **Updates Required:**
  - Create new file with contact form content
  - Add alternative contact methods
  - Add privacy policy information
- **Expected Outcome:** Clear contact information and form
- **Validation:** Form works, contact methods accessible

### 6.3 Data Files

**File:** `data/socials.yml`
- **Purpose:** Social media links configuration
- **Current Status:** Already exists with basic configuration
- **Updates Required:**
  - Update social media platform links
  - Add icon configurations
  - Add display preferences
- **Expected Outcome:** Consistent social media integration
- **Validation:** Links work, icons display correctly

**File:** `data/series.yml`
- **Purpose:** Series metadata configuration
- **Current Status:** Not present
- **Updates Required:**
  - Create new file with series descriptions
  - Add series ordering
  - Add series status information
- **Expected Outcome:** Organized series information
- **Validation:** Series display correctly, metadata accessible

---

## 7. Asset Files

### 7.1 Images

**Directory:** `source/images/`
- **Purpose:** Site images and graphics
- **Current Status:** Already exists with favicon and basic images
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
- **Current Status:** Already exists
- **Expected Outcome:** Professional site favicon
- **Validation:** Favicon displays in browser tabs

**File:** `source/images/apple-touch-icon.png`
- **Purpose:** iOS home screen icon
- **Current Status:** Already exists
- **Expected Outcome:** Professional iOS icon
- **Validation:** Icon displays correctly on iOS devices

**File:** `source/site.webmanifest`
- **Purpose:** Web app manifest
- **Current Status:** Referenced in layout but file may not exist
- **Updates Required:**
  - Create or update file with app metadata
  - Add icon configurations
  - Add display preferences
- **Expected Outcome:** Progressive Web App capabilities
- **Validation:** PWA features work correctly

---

## 8. Build and Deployment Files

### 8.1 Build Configuration

**File:** `middleman.rb`
- **Purpose:** Middleman build configuration
- **Current Status:** Not present (using config.rb)
- **Expected Outcome:** Optimized production build
- **Validation:** Build completes successfully, assets optimized

### 8.2 Deployment Configuration

**File:** `.gitignore`
- **Purpose:** Git ignore rules
- **Current Status:** Already exists with basic rules
- **Updates Required:**
  - Add build directory exclusions
  - Add environment-specific files
  - Add temporary files
- **Expected Outcome:** Clean repository without build artifacts
- **Validation:** Build files not committed, repository clean

**File:** `README.md`
- **Purpose:** Project documentation
- **Current Status:** Already exists with basic documentation
- **Updates Required:**
  - Update setup instructions
  - Update development workflow
  - Update deployment process
  - Add contributing guidelines
- **Expected Outcome:** Clear project documentation
- **Validation:** New developers can set up and contribute

---

## 9. Testing Files

### 9.1 Test Configuration

**File:** `spec/spec_helper.rb`
- **Purpose:** RSpec test configuration
- **Current Status:** Already exists with basic configuration
- **Updates Required:**
  - Add Capybara configuration for integration testing
  - Add performance testing setup
  - Add accessibility testing configuration
  - Update test environment variables
- **Expected Outcome:** Comprehensive test suite configuration
- **Validation:** All tests run successfully with `bundle exec rspec`

**File:** `spec/features/blog_spec.rb`
- **Purpose:** Blog functionality tests
- **Current Status:** Already exists with basic tests
- **Updates Required:**
  - Add series navigation tests
  - Add tag filtering tests
  - Add RSS feed tests
  - Enhance existing blog tests
- **Expected Outcome:** Reliable blog functionality
- **Validation:** All blog features work correctly

**File:** `spec/features/layout_spec.rb`
- **Purpose:** Layout and navigation tests
- **Current Status:** Already exists with basic tests
- **Updates Required:**
  - Add dark mode tests
  - Add responsive design tests
  - Add accessibility tests
  - Enhance existing layout tests
- **Expected Outcome:** Reliable site navigation
- **Validation:** Navigation works on all devices

**File:** `spec/features/performance_spec.rb`
- **Purpose:** Performance testing
- **Current Status:** Not present
- **Updates Required:**
  - Create new file with page load time tests
  - Add Core Web Vitals tests
  - Add image optimization tests
  - Add caching tests
- **Expected Outcome:** Performance meets targets
- **Validation:** All performance metrics pass

---

## 10. SEO and Analytics Files

### 10.1 SEO Configuration

**File:** `source/robots.txt`
- **Purpose:** Search engine crawling instructions
- **Current Status:** Already exists with basic content
- **Updates Required:**
  - Update with new crawling rules
  - Add sitemap location reference
  - Add crawl rate settings
- **Expected Outcome:** Proper search engine indexing
- **Validation:** Search engines can crawl site effectively

**File:** `source/sitemap.xml.builder`
- **Purpose:** XML sitemap generation
- **Current Status:** Not present
- **Updates Required:**
  - Create new file with page priority settings
  - Add update frequency settings
  - Add URL structure configuration
- **Expected Outcome:** Complete site index for search engines
- **Validation:** Sitemap includes all pages, validates correctly

### 10.2 Feed Configuration

**File:** `source/feed.xml.builder`
- **Purpose:** RSS/Atom feed generation
- **Current Status:** Already exists with basic configuration
- **Updates Required:**
  - Update feed metadata
  - Add content inclusion settings
  - Add update frequency
- **Expected Outcome:** Standards-compliant content feed
- **Validation:** Feed validates correctly, content displays in readers

### 10.3 Analytics Configuration

**File:** `source/layouts/layout.erb` (Analytics Section)
- **Purpose:** Google Analytics integration
- **Current Status:** Not present
- **Updates Required:**
  - Add Google Analytics 4 tracking code
  - Add custom event tracking
  - Add performance monitoring
- **Expected Outcome:** Comprehensive analytics tracking
- **Validation:** Analytics data is being collected correctly

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
- v3.0 (December 2024): Final version with comprehensive updates based on holistic audit, addressing all gaps and inconsistencies
- v2.0 (December 2024): Updated with missing implementation details from audit, added image optimization, RSS implementation, testing framework integration, and performance monitoring
- v1.0 (December 2024): Initial technical specifications document 