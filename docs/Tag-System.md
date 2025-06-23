# Tag System Documentation

## Overview

The new tag system provides a comprehensive, flexible approach to displaying tags across the site with multiple variants, sizes, colors, and interactive features.

## Features

### ✅ **What's New**
- **Consistent styling** across all contexts
- **Multiple size variants** (small, medium, large)
- **Multiple style variants** (pill, rounded, square)
- **Multiple color variants** (primary, secondary, muted, success, warning, error)
- **Interactive features** (hover effects, removable tags, tag clouds)
- **Accessibility improvements** (better contrast, larger touch targets)
- **Responsive design** (works on all screen sizes)
- **Tag counts** and **tag icons** support
- **Tag filtering** and **tag suggestions** components

## Tag Variants

### Size Variants

```html
<!-- Small tags (11px) -->
<a href="/tags/tech" class="tag tag--small tag--pill tag--primary">tech</a>

<!-- Medium tags (13px) - Default -->
<a href="/tags/tech" class="tag tag--medium tag--pill tag--primary">tech</a>

<!-- Large tags (14px) -->
<a href="/tags/tech" class="tag tag--large tag--pill tag--primary">tech</a>
```

### Style Variants

```html
<!-- Square corners -->
<a href="/tags/tech" class="tag tag--medium tag--square tag--primary">tech</a>

<!-- Rounded corners -->
<a href="/tags/tech" class="tag tag--medium tag--rounded tag--primary">tech</a>

<!-- Pill shape (most popular) -->
<a href="/tags/tech" class="tag tag--medium tag--pill tag--primary">tech</a>
```

### Color Variants

```html
<!-- Primary (blue) -->
<a href="/tags/tech" class="tag tag--medium tag--pill tag--primary">tech</a>

<!-- Secondary (gray) -->
<a href="/tags/tech" class="tag tag--medium tag--pill tag--secondary">tech</a>

<!-- Muted (light gray) -->
<a href="/tags/tech" class="tag tag--medium tag--pill tag--muted">tech</a>

<!-- Success (green) -->
<a href="/tags/tech" class="tag tag--medium tag--pill tag--success">tech</a>

<!-- Warning (yellow) -->
<a href="/tags/tech" class="tag tag--medium tag--pill tag--warning">tech</a>

<!-- Error (red) -->
<a href="/tags/tech" class="tag tag--medium tag--pill tag--error">tech</a>
```

## Context-Specific Implementations

### 1. Homepage Blog Cards
```html
<div class="card-tags">
  <a href="/tags/tech" class="card-tag">tech</a>
  <a href="/tags/productivity" class="card-tag">productivity</a>
</div>
```
- **Size**: Medium
- **Style**: Pill
- **Color**: Primary
- **Features**: Hover effects, clickable

### 2. Individual Post Pages
```html
<div class="post-tags">
  <a href="/tags/tech" class="post-tag">tech</a>
  <a href="/tags/productivity" class="post-tag">productivity</a>
</div>
```
- **Size**: Medium
- **Style**: Rounded
- **Color**: Secondary
- **Features**: Hover effects, clickable

### 3. Series Pages
```html
<div class="series-post-tags">
  <a href="/tags/tech" class="series-post-tag">tech</a>
  <a href="/tags/productivity" class="series-post-tag">productivity</a>
</div>
```
- **Size**: Small
- **Style**: Square
- **Color**: Muted
- **Features**: Subtle hover effects

### 4. Homepage Post List
```html
<div class="post-item .post-tags">
  <a href="/tags/tech" class="post-item .tag">tech</a>
  <a href="/tags/productivity" class="post-item .tag">productivity</a>
</div>
```
- **Size**: Small
- **Style**: Pill
- **Color**: Primary
- **Features**: Compact display

## Advanced Features

### Tag with Count
```html
<a href="/tags/tech" class="tag tag--medium tag--pill tag--primary tag--with-count" data-count="15">tech</a>
```
Shows the number of posts with that tag.

### Tag with Icon
```html
<a href="/tags/tech" class="tag tag--medium tag--rounded tag--primary tag--with-icon">tech</a>
```
Includes a tag icon before the text.

### Removable Tags (for filters)
```html
<span class="tag tag--medium tag--pill tag--primary tag--removable">
  tech
  <button class="tag-remove" onclick="removeTag(this)"></button>
</span>
```
Includes a close button for removing filters.

### Tag Cloud
```html
<div class="tag-cloud">
  <a href="/tags/tech" class="tag tag--large tag--rounded tag--primary" data-weight="5">tech</a>
  <a href="/tags/productivity" class="tag tag--large tag--rounded tag--primary" data-weight="4">productivity</a>
  <a href="/tags/parenting" class="tag tag--large tag--rounded tag--primary" data-weight="3">parenting</a>
</div>
```
Tags with different sizes based on frequency (weight 1-5).

### Tag Filters
```html
<div class="tag-filters">
  <span class="tag-filter-label">Filter by:</span>
  <a href="/tags/tech" class="tag tag--small tag--rounded tag--primary">tech</a>
  <a href="/tags/productivity" class="tag tag--small tag--rounded tag--primary">productivity</a>
</div>
```
Container for tag filtering with label.

## Usage Guidelines

### When to Use Each Variant

**Small Tags (`tag--small`)**
- Limited space contexts
- Secondary information
- Series pages
- Homepage post lists

**Medium Tags (`tag--medium`)**
- Default choice
- Blog cards
- Individual posts
- Most general use cases

**Large Tags (`tag--large`)**
- Tag clouds
- Featured content
- When tags are the primary focus

### Color Guidelines

**Primary (`tag--primary`)**
- Main content areas
- Blog cards
- Homepage elements

**Secondary (`tag--secondary`)**
- Individual post pages
- Supporting content

**Muted (`tag--muted`)**
- Series pages
- Secondary information
- Less important contexts

**Success/Warning/Error**
- Status indicators
- Special categories
- When semantic meaning is important

### Style Guidelines

**Pill (`tag--pill`)**
- Most popular choice
- Modern, friendly appearance
- Good for most contexts

**Rounded (`tag--rounded`)**
- Clean, professional look
- Good for content-heavy areas

**Square (`tag--square`)**
- Minimal, technical appearance
- Good for series or technical content

## Accessibility Features

- **High contrast** colors for better visibility
- **Larger touch targets** on mobile devices
- **Keyboard navigation** support
- **Screen reader** friendly with proper ARIA labels
- **Focus indicators** for keyboard users

## Responsive Behavior

- **Flexible wrapping** on smaller screens
- **Adjusted spacing** for mobile devices
- **Touch-friendly** sizing on mobile
- **Consistent appearance** across all devices

## Implementation Examples

### Basic Tag Group
```html
<div class="tag-group">
  <a href="/tags/tech" class="tag tag--medium tag--pill tag--primary">tech</a>
  <a href="/tags/productivity" class="tag tag--medium tag--pill tag--primary">productivity</a>
  <a href="/tags/parenting" class="tag tag--medium tag--pill tag--primary">parenting</a>
</div>
```

### Compact Tag Group
```html
<div class="tag-group tag-group--compact">
  <a href="/tags/tech" class="tag tag--small tag--pill tag--primary">tech</a>
  <a href="/tags/productivity" class="tag tag--small tag--pill tag--primary">productivity</a>
</div>
```

### Spaced Tag Group
```html
<div class="tag-group tag-group--spaced">
  <a href="/tags/tech" class="tag tag--medium tag--rounded tag--primary">tech</a>
  <a href="/tags/productivity" class="tag tag--medium tag--rounded tag--primary">productivity</a>
</div>
```

## Future Enhancements

- **Tag suggestions** dropdown
- **Tag search** functionality
- **Tag analytics** display
- **Tag categories** and hierarchies
- **Custom tag colors** per category
- **Tag sharing** features

## Migration Guide

The new tag system is backward compatible. Existing tag classes will continue to work, but you can gradually migrate to the new system:

1. **Phase 1**: Update homepage blog cards (already done)
2. **Phase 2**: Update individual post pages
3. **Phase 3**: Update series pages
4. **Phase 4**: Add advanced features as needed

## Testing

To test the tag system, you can include the `_tag_examples.erb` partial in any page:

```erb
<%= partial 'layouts/_tag_examples' %>
```

This will display all tag variants for testing and reference. 