---
status: approved
type: technical
---

# Social Links Data Structure Architecture

## 1. Context / Background

### 1.1 Current State
The `data/socials.yml` file contained a mixed structure of social media platforms and basic site links, with inconsistent data formats. The About page implementation required a clean, maintainable way to display social media links with icons and proper metadata.

### 1.2 Requirements
- Display social media links with icons on the About page
- Maintain clean separation between different types of links
- Ensure easy maintenance and updates
- Support multiple social platforms with consistent metadata
- Integrate with existing data structure

## 2. Decision

**Selected Solution:** Use `data.socials.except('sites')` filtering to separate social platforms from basic site links

### 2.1 Rationale
The existing `data/socials.yml` structure contained both social media platforms (with icons and display names) and basic site links (without icons). By using `except('sites')` filtering, we maintain the existing data structure while cleanly separating the two types of links for different use cases.

## 3. Solutions Considered

### 3.1 Option A: Restructure data/socials.yml completely
- **Pros:**
  - Clean, dedicated structure for social platforms
  - Clear separation of concerns
  - Better type safety and validation
- **Cons:**
  - Breaking change to existing data structure
  - Requires updates to all existing references
  - Additional migration complexity
  - Risk of breaking existing functionality

### 3.2 Option B: Use except('sites') filtering
- **Pros:**
  - Maintains existing data structure
  - No breaking changes
  - Simple implementation
  - Clear separation without restructuring
  - Backward compatible
- **Cons:**
  - Relies on specific key names
  - Less explicit than dedicated structure
  - Potential for confusion about data organization

### 3.3 Option C: Create separate social_platforms.yml file
- **Pros:**
  - Dedicated file for social platforms
  - Clear separation of concerns
  - Easy to maintain and extend
- **Cons:**
  - Additional file to manage
  - Duplication of social data
  - Inconsistency with existing patterns
  - More complex data management

## 4. Consequences

### 4.1 Positive
- **Backward Compatibility**: Existing functionality remains unchanged
- **Simple Implementation**: Minimal code changes required
- **Clear Separation**: Social platforms cleanly separated from site links
- **Maintainable**: Easy to add new social platforms
- **Consistent**: Follows existing data patterns

### 4.2 Negative
- **Data Structure Dependency**: Relies on specific key names
- **Less Explicit**: Data organization not immediately obvious
- **Potential Confusion**: Mixed data types in single file

### 4.3 Risks
- **Key Name Changes**: If 'sites' key is renamed, filtering would break
- **Data Structure Evolution**: Future changes might require updates
- **Documentation Requirements**: Need clear documentation of data structure

## 5. Component Information

### 5.1 Repository Links
- **GitHub Repository**: [macapinlac.com](https://github.com/rsmacapinlac/macapinlac.com)
- **Data File**: [data/socials.yml](data/socials.yml)
- **Implementation**: [About Page Template](source/about.html.erb)

### 5.2 Maintenance Status
- **Last Updated**: January 2025
- **Active Development**: Yes - structure is in use
- **Community Support**: N/A - internal implementation
- **Version Compatibility**: Compatible with current Middleman 4.x stack

### 5.3 Integration Verification
- **Compatibility Tested**: Yes - working in About page
- **Existing Component Impact**: No negative impact
- **Migration Path**: No migration required

## 6. Implementation Details

### 6.1 Data Structure
```yaml
# data/socials.yml
sites:
  - name: "Personal Site"
    url: "https://macapinlac.com"

github:
  url: "https://github.com/rsmacapinlac"
  icon: "🐙"
  display_name: "GitHub"

linkedin:
  url: "https://www.linkedin.com/in/rsmacapinlac"
  icon: "💼"
  display_name: "LinkedIn"

instagram:
  url: "https://www.instagram.com/rsmacapinlac"
  icon: "📸"
  display_name: "Instagram"

twitter:
  url: "https://twitter.com/ritchie"
  icon: "🐦"
  display_name: "Twitter"
```

### 6.2 Usage Pattern
```erb
<!-- In templates -->
<% data.socials.except('sites').each do |platform, social| %>
  <a href="<%= social.url %>" class="social-link" target="_blank" rel="noopener">
    <span class="social-icon"><%= social.icon %></span>
    <span class="social-name"><%= social.display_name %></span>
  </a>
<% end %>
```

### 6.3 Data Access Patterns
- **Social Platforms**: `data.socials.except('sites')` - returns hash of social platforms
- **Site Links**: `data.socials.sites` - returns array of basic site links
- **Individual Platform**: `data.socials.github` - direct access to specific platform

## 7. Related Decisions

### 7.1 Icon Usage
- **Decision**: Use emoji icons for social platforms
- **Rationale**: Simple, universal, no additional asset management
- **Impact**: Consistent icon display across platforms

### 7.2 Display Name Strategy
- **Decision**: Use `display_name` field for user-friendly names
- **Rationale**: Separates internal keys from display text
- **Impact**: Flexible naming without affecting data structure

### 7.3 URL Structure
- **Decision**: Use full URLs in data file
- **Rationale**: Consistent with existing patterns
- **Impact**: Direct linking without additional processing

## 8. Future Considerations

### 8.1 Potential Improvements
- **Validation**: Add data validation for required fields
- **Icons**: Consider SVG icons for better customization
- **Analytics**: Add tracking parameters to social links
- **Platform-Specific**: Add platform-specific metadata

### 8.2 Migration Path
If restructuring becomes necessary:
1. Create new dedicated social platforms file
2. Migrate data with validation
3. Update all template references
4. Remove old data structure
5. Update documentation

## 9. Validation

### 9.1 Success Criteria
- ✅ Social links display correctly on About page
- ✅ Icons render properly for all platforms
- ✅ Links open in new tabs with proper attributes
- ✅ Data structure maintains backward compatibility
- ✅ Easy to add new social platforms
- ✅ No breaking changes to existing functionality

### 9.2 Performance Metrics
- **Data Access**: Fast filtering with `except()`
- **Template Rendering**: Efficient iteration over social platforms
- **Maintenance**: Simple updates to data file
- **Memory Usage**: Minimal overhead

---

This decision provides a clean, maintainable approach to social links data management while preserving existing functionality and patterns. 