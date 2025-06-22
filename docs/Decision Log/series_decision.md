# Series Functionality Technical Decision

**Status:** Approved  
**Type:** Technical Implementation

## 1. Context / Background

### 1.1 Current State
- Single blog with posts organized by tags only
- No concept of multi-part content or sequential navigation
- Basic chronological organization without content grouping
- Existing Tesla Road Trip posts that would benefit from series organization

### 1.2 Requirements
- Implement series organization for multi-part content following Middleman blog extension best practices
- Exclude series posts from main writing feed to maintain clean separation
- Provide sequential navigation and organization within series
- Maintain normal blog URLs for individual posts
- Support both chronological and explicit ordering within series
- Generate series collection pages automatically using Middleman's native functionality

## 2. Decision

**Selected Solution:** Middleman Blog Extension Custom Collections

### 2.1 Rationale
- Leverages native Middleman blog extension functionality with proven stability
- Follows Middleman convention over configuration principle
- Provides automatic page generation and helper methods without custom development
- Enables clean separation between series and regular posts
- Supports hybrid ordering (chronological by default, explicit override when needed)
- Maintains all existing post URLs while adding series organization
- Eliminates risk of data synchronization issues present in external file approaches

## 3. Solutions Considered

### 3.1 Option A: Middleman Custom Collections
- **Description:** Use native `blog.custom_collections` feature with series frontmatter
- **Pros:**
  - Native Middleman blog extension support with automatic page generation
  - Follows Middleman best practices for content organization
  - Clean separation between series and regular posts
  - Hybrid ordering: chronological by default, manual override when needed
  - Self-contained post management with immediate consistency
  - No external file dependencies or synchronization risks
  - Automatic helper method generation for navigation
  - Leverages Middleman's built-in sitemap and URL generation
- **Cons:**
  - Requires learning custom collections syntax
  - Series posts excluded from main chronological feed
  - Potential for series name inconsistencies across posts
  - No centralized series metadata management

### 3.2 Option B: Directory-based Organization
- **Description:** Organize series posts in subdirectories with custom routing
- **Pros:**
  - Clear file organization and intuitive structure
  - Easy to see related posts grouped together
  - Familiar folder-based approach for content management
- **Cons:**
  - Not natively supported by Middleman blog extension
  - Requires extensive custom routing and template logic
  - Breaks Middleman's expected file naming conventions
  - Complex URL generation and navigation implementation
  - Significant custom development required against Middleman best practices

### 3.3 Option C: Data File Approach
- **Description:** External YAML files defining series with post references and metadata
- **Pros:**
  - Centralized series configuration and metadata management
  - Easy bulk operations and reordering within series
  - Rich series metadata support (descriptions, status, completion tracking)
  - Clear overview of all series in single location
  - Leverages Middleman's data folder convention
- **Cons:**
  - No native blog extension integration requiring custom development
  - High risk of data/content synchronization issues
  - Dual workflow complexity: manage both posts and data files
  - Manual maintenance of post relationships and slug references
  - Goes against Middleman convention over configuration principle

### 3.4 Option D: Tag-based Organization
- **Description:** Use existing tag system with special series tags
- **Pros:**
  - Uses existing tag infrastructure with no additional configuration
  - Simple implementation within current system
  - Familiar tag-based workflow for content creators
  - Follows existing Middleman blog patterns
- **Cons:**
  - Mixes series organization with content tags creating confusion
  - No sequential navigation between series posts
  - Difficult to distinguish series tags from content tags
  - Limited series-specific functionality and features
  - No automatic series page generation

### 3.5 Option E: Multiple Blog Setup
- **Description:** Separate Middleman blog instances for series vs. regular posts
- **Pros:**
  - Complete separation of series and regular content
  - Independent configuration and styling capabilities
  - Full blog functionality available for each content type
- **Cons:**
  - Significant complexity in routing and cross-blog navigation
  - Duplicate configuration and maintenance overhead
  - Complex cross-blog linking and search implementation
  - Overkill complexity for basic content organization needs
  - Goes against Middleman single-site best practices

### 3.6 Option F: Manual Page Creation
- **Description:** Create series pages manually without automated collection features
- **Pros:**
  - Complete control over layout and organization
  - No dependency on blog extension features
  - Simple implementation for small numbers of series
- **Cons:**
  - Manual maintenance of all series relationships
  - No automatic page generation or updates
  - High maintenance burden that doesn't scale
  - No helper methods or automated navigation features
  - Contradicts Middleman automation principles