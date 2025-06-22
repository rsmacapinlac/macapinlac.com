---
status: approved
type: technical
---

# Typography System Implementation Decision

## 1. Context / Background

### 1.1 Current State
- Two-font system using Inconsolata (monospace, dates) and JetBrains Mono (post body text)
- Limited typography hierarchy and visual distinction
- Inconsistent with design system requirements for professional presentation

### 1.2 Requirements
- Implement three-font typography system per design specifications
- Primary serif for authoritative headings and section headers
- Secondary serif for editorial and narrative content
- Sans-serif for functional interface elements
- Maintain performance while improving visual hierarchy
- Support future migration to self-hosted fonts if needed

## 2. Decision

**Selected Solution:** Google Fonts CDN

### 2.1 Rationale
- Provides immediate access to required fonts with minimal implementation complexity
- Offers automatic font optimization and global CDN delivery for performance
- Maintains flexibility for future migration to self-hosted approach
- Balances simplicity with functionality for initial implementation
- Eliminates need for asset pipeline modifications and font file management
- Follows Middleman best practice of leveraging external CDNs for asset delivery

## 3. Solutions Considered

### 3.1 Option A: Google Fonts CDN
- **Description:** Load fonts via Google Fonts service with CDN delivery
- **Pros:**
  - Simple integration following Middleman convention over configuration principle
  - Automatic font optimization and compression
  - Global CDN delivery for fast loading worldwide
  - No repository size impact
  - Automatic browser compatibility handling
  - Easy migration path to self-hosted fonts later
  - Aligns with Middleman asset pipeline best practices
- **Cons:**
  - External dependency on Google services
  - Requires internet connection for font loading
  - Less control over font loading behavior
  - Potential privacy concerns with Google tracking

### 3.2 Option B: Self-Hosted Fonts
- **Description:** Download and serve font files directly from the site
- **Pros:**
  - Complete control over font loading strategies and fallbacks
  - No external dependencies or tracking
  - Privacy-friendly approach
  - Guaranteed font availability regardless of external service status
  - Full integration with Middleman asset pipeline
- **Cons:**
  - Significant complexity for asset pipeline configuration
  - Manual font file management and updates required
  - Larger repository size with font assets
  - Requires font format optimization and serving configuration

### 3.3 Option C: System Font Stack
- **Description:** Use device-native fonts with carefully crafted font stacks
- **Pros:**
  - Fastest possible loading (no font downloads)
  - No external dependencies
  - Excellent performance across all devices
  - Zero bandwidth impact for font loading
- **Cons:**
  - Inconsistent visual appearance across platforms
  - Limited design control and brand consistency
  - Cannot achieve specific design system requirements
  - Insufficient typography hierarchy for professional presentation

### 3.4 Option D: Font Loading Service (Adobe Fonts)
- **Description:** Third-party font service with commercial font library
- **Pros:**
  - Professional font quality and extensive character sets
  - Commercial licensing management included
  - Advanced font loading controls and optimization
  - Access to premium typography options
- **Cons:**
  - Ongoing subscription costs
  - Additional vendor dependency and account management
  - Overkill complexity for current font needs
  - Unnecessary expense for available open-source alternatives