# Macapinlac.com Documentation

This directory contains all permanent documentation for the macapinlac.com project, organized for ongoing maintenance and development.

## 📋 Documentation Overview

### 🏗️ Architecture & Design
- **[Design System](Design%20System.md)** - Complete visual design specifications, typography, colors, and component patterns

### 📝 Content & Strategy
- **[Content Strategy](Content%20Strategy.md)** - Content creation guidelines, brand voice, and editorial standards
- **[Brand Guidelines](Brand%20Guidelines.md)** - Brand identity, visual standards, and target audience
- **[Tag System](Tag-System.md)** - Content organization and discovery through tagging

### 🧠 Decision Making & Process
- **[ADR](ADR/)** - Architectural Decision Records with rationale and status
- **Feature Implementation Pattern** - Standard process for implementing new features (use the `plan-and-implement-feature` command)
- **[Implementation Plan Template](Implementation%20Plan%20Template.md)** - Reusable template for feature implementation documentation

## 🎯 Quick Reference

### For New Features
1. Use the **`plan-and-implement-feature`** command
2. Check **[ADR](ADR/)** for existing architectural decisions
3. Reference **[Design System](Design%20System.md)** for visual standards
4. Use **[Implementation Plan Template](Implementation%20Plan%20Template.md)** for documentation

### For Content Creation
1. Follow **[Content Strategy](Content%20Strategy.md)** guidelines
2. Reference **[Brand Guidelines](Brand%20Guidelines.md)** for brand consistency
3. Use **[Tag System](Tag-System.md)** for proper content organization
4. Reference **[Design System](Design%20System.md)** for visual consistency

### For Technical Decisions
1. Check **[ADR](ADR/)** for existing patterns
2. Use the **`plan-and-implement-feature`** command for structured implementation
3. Reference **[Design System](Design%20System.md)** for visual specifications

## 📁 Directory Structure

```
docs/
├── README.md                           # This file - documentation overview
├── Brand Guidelines.md                 # Brand identity and visual standards
├── Content Strategy.md                 # Content guidelines and brand voice
├── Design System.md                    # Visual design specifications
├── Implementation Plan Template.md     # Reusable implementation documentation template
├── Tag-System.md                       # Content organization system
└── ADR/                                # Architectural Decision Records
    ├── about_page_implementation.md
    ├── css_architecture.md
    ├── dark_mode_decision.md
    ├── development_tooling.md
    ├── error_handling.md
    ├── gem_dependencies.md
    ├── image_management.md
    ├── minimalist_reading_layout_decision.md
    ├── rss_syndication.md
    ├── series_data_driven_decision.md
    ├── series_decision.md
    ├── social_links_data_structure.md
    ├── testing_strategy_about_page.md
    └── typography_decision.md
```

### Documentation History
The docs folder has been streamlined to focus on permanent documentation. Project-specific redesign documentation has been archived, including implementation plans, technical specifications, and completed feature documentation.

## 🔄 Documentation Maintenance

### When to Update Documentation
- **New architectural decisions** → Create new ADR in ADR folder
- **New features** → Use the `plan-and-implement-feature` command
- **Design changes** → Update Design System
- **Content strategy changes** → Update Content Strategy
- **Brand changes** → Update Brand Guidelines

### Documentation Standards
- Keep documentation close to implementation
- Update documentation when code changes
- Use clear, consistent formatting
- Include examples and practical guidance
- Cross-reference related documentation

---

**Last Updated**: May 2026 — updated for Build Log v3 design system  
**Maintained By**: Project team following established patterns 