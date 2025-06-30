---
status: approved
type: technical
---

# Series Data-Driven Architecture Decision

## 1. Context / Background

### 1.1 Current State
- Series functionality implemented using Middleman blog extension custom collections
- Series metadata scattered across individual blog post frontmatter
- Limited series metadata capabilities (name only)
- Manual maintenance of series relationships
- No centralized series management interface

### 1.2 Requirements
- Centralize series metadata management for better maintainability
- Provide rich series metadata (description, status, icon, color, slug)
- Follow established data file patterns (similar to `data/tags.yml`)
- Maintain backward compatibility with existing series functionality
- Enable easier series creation and management
- Support enhanced series display with icons and status indicators

## 2. Decision

**Selected Solution:** Data-Driven Series Architecture using `data/series.yml`

### 2.1 Rationale
- Follows established project patterns (tags.yml, socials.yml, homepage_hero.yml)
- Provides centralized series metadata management
- Enables rich series metadata without modifying individual posts
- Maintains backward compatibility with existing blog post frontmatter
- Reduces maintenance burden for series management
- Enables enhanced UI features (icons, status, colors)
- Supports dynamic proxy generation from data files
- Leverages Middleman's data folder convention

## 3. Solutions Considered

### 3.1 Option A: Data-Driven Approach (Selected)
- **Description:** Centralized `data/series.yml` file with series metadata and post references
- **Pros:**
  - Centralized series management following established patterns
  - Rich metadata support (description, status, icon, color, slug)
  - Easy bulk operations and series reordering
  - Dynamic proxy generation from data files
  - Enhanced UI capabilities with icons and status
  - Follows Middleman data folder convention
  - Maintains backward compatibility
  - Reduced maintenance burden
- **Cons:**
  - Requires data file and frontmatter synchronization
  - Slightly more complex initial setup
  - Need to maintain two sources of truth (data file + frontmatter)

### 3.2 Option B: Enhanced Frontmatter Approach
- **Description:** Expand series frontmatter in individual posts with rich metadata
- **Pros:**
  - Single source of truth in post frontmatter
  - No data synchronization issues
  - Follows existing blog post patterns
- **Cons:**
  - Metadata scattered across multiple files
  - Difficult to manage series-level information
  - No centralized series overview
  - High maintenance burden for series changes
  - Limited series metadata capabilities

### 3.3 Option C: Database-Driven Approach
- **Description:** Use external database or CMS for series management
- **Pros:**
  - Full database capabilities for complex queries
  - Rich metadata and relationship management
  - Web-based management interface potential
- **Cons:**
  - Overkill complexity for static site
  - Breaks static site generation principles
  - Requires external dependencies
  - Goes against Middleman philosophy

### 3.4 Option D: Hybrid Frontmatter + Data Approach
- **Description:** Use frontmatter for post relationships, data file for metadata
- **Pros:**
  - Clear separation of concerns
  - Flexible metadata management
  - Maintains post-level control
- **Cons:**
  - More complex architecture
  - Multiple data sources to maintain
  - Potential for inconsistencies

## 4. Consequences

### 4.1 Positive
- Centralized series management following established patterns
- Rich series metadata capabilities (description, status, icon, color)
- Enhanced UI with icons and status indicators
- Dynamic proxy generation from data files
- Reduced maintenance burden for series management
- Better developer experience for series creation
- Consistent with project's data file architecture

### 4.2 Negative
- Requires maintaining two sources of truth (data file + frontmatter)
- Slightly more complex initial setup
- Need for data synchronization validation

### 4.3 Risks
- Data synchronization issues between data file and frontmatter
- Potential for series name inconsistencies
- **Mitigation:** Implement validation helpers and clear documentation

## 5. Component Information

### 5.1 Repository Links
- **GitHub Repository**: [Link to GitHub repository]
- **Documentation**: `docs/implementation/series-refactor-feature.md`
- **Release Notes**: [Link to latest release notes]

### 5.2 Maintenance Status
- **Last Updated**: January 2025
- **Active Development**: Yes
- **Community Support**: Follows Middleman data folder conventions
- **Version Compatibility**: Compatible with current Middleman stack

### 5.3 Integration Verification
- **Compatibility Tested**: Yes - all tests passing
- **Existing Component Impact**: Minimal - backward compatibility maintained
- **Migration Path**: Seamless migration with enhanced functionality

## 6. Implementation Details

### 6.1 Data Structure
```yaml
---
series:
  - name: "Series Name"
    description: "Series description"
    status: "In Progress"
    icon: "🚗"
    color: "#e74c3c"
    slug: "series-slug"
    posts:
      - title: "Post Title"
        date: "2025-01-15"
        summary: "Post summary"
```

### 6.2 Helper Methods
- `get_series_metadata(series_name)` - Get series metadata from data file
- `all_series_metadata` - Get all series from data file
- `get_series_by_slug(slug)` - Get series by slug for URL generation
- Enhanced `series_navigation` with metadata support

### 6.3 URL Structure
- Series index: `/series/`
- Individual series: `/series/{slug}.html`
- Generated dynamically from data file slugs 