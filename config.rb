# Middleman Configuration
# This file configures the static site generator, blog extension, and build settings
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

# Timezone Configuration
# Ensures consistent date handling across all environments - critical for blog post dates
Time.zone = "America/Vancouver"

# CSS Autoprefixer Configuration
# Automatically adds vendor prefixes for cross-browser CSS compatibility
# Supports last 2 versions of major browsers for optimal compatibility
activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

# Image Optimization Configuration
# Optimizes images for web performance and accessibility.
# Only enables optimizers whose binaries we ship in this environment —
# pngout and svgo are intentionally disabled because the binaries aren't
# installed (would otherwise emit a warning on every build).
activate :imageoptim do |options|
  options.gifsicle  = true
  options.jpegoptim = true
  options.optipng   = true
  options.pngout    = false
  options.svgo      = false
end

# Responsive Image Generation Configuration
# Generates multiple image sizes for responsive design
helpers do
  def responsive_image_tag(image_path, options = {})
    # Define responsive breakpoints
    sizes = options[:sizes] || {
      xs: '400px',
      sm: '600px', 
      md: '900px',
      lg: '1200px',
      xl: '1600px'
    }
    
    # Generate srcset for responsive images
    srcset = sizes.map do |breakpoint, width|
      "#{image_path} #{width}"
    end.join(', ')
    
    # Build image tag with responsive attributes
    image_tag(image_path, {
      srcset: srcset,
      sizes: options[:sizes_attr] || '(max-width: 600px) 100vw, (max-width: 900px) 50vw, 33vw',
      loading: 'lazy',
      alt: options[:alt] || 'Responsive image'
    }.merge(options.except(:sizes, :sizes_attr)))
  end
  
  def picture_tag(image_path, options = {})
    # Generate picture element with multiple sources
    content_tag(:picture) do
      # WebP format for modern browsers
      concat(content_tag(:source, '', {
        srcset: "#{image_path}.webp",
        type: 'image/webp'
      }))
      
      # Fallback image
      concat(image_tag(image_path, {
        loading: 'lazy',
        alt: options[:alt] || 'Image'
      }.merge(options.except(:sizes, :sizes_attr))))
    end
  end
end

# Layout Configuration
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
# Configure specific file types to render without layout wrapper

# Feed and API files - no layout needed for machine-readable content
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false
page "/feed.xml", layout: false

# Alternative layout example (commented out)
# page '/path/to/file.html', layout: 'other_layout'

# Static File Serving
# Serve files directory directly without layout - enables direct file downloads
page "/files/*", layout: false

# Proxy Pages Configuration
# https://middlemanapp.com/advanced/dynamic-pages/
# Enables dynamic page generation from templates (commented out for future use)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

# Blog Extension Configuration
# Core blog functionality including article management, tags, and pagination

activate :blog do |blog|
  # URL prefix configuration (commented out - using root domain)
  # This will add a prefix to all links, template references and source paths
  # blog.prefix = "notes"

  # SEO-friendly URL structure: /2024/01/15/post-title.html
  # Optimized for search engines and human readability
  blog.permalink = "{year}/{month}/{day}/{title}.html"
  
  # Source file matching pattern (commented out - using default)
  # blog.sources = "{year}-{month}-{day}-{title}.html.md"
  
  # Tag URL structure (commented out - using default)
  # blog.taglink = "tags/{tag}.html"
  
  # Layout template for all blog posts
  # Uses post.erb layout for consistent article presentation
  blog.layout = "post"
  
  # Content excerpt configuration (commented out - using default)
  # blog.summary_separator = /(READMORE)/
  # blog.summary_length = 250
  
  # Archive link structure (enabled for year-based navigation)
  blog.year_link = "{year}.html"
  # blog.month_link = "{year}/{month}.html"
  # blog.day_link = "{year}/{month}/{day}.html"
  
  # Default file extension (commented out - using .html.md)
  # blog.default_extension = ".markdown"

  # Template configuration for tag and calendar pages
  # Enables tag-based content discovery and chronological browsing
  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"

  # Pagination configuration (enabled to show articles on homepage)
  # Enable pagination for large article collections
  blog.paginate = true
  blog.per_page = 10
  blog.page_link = "page/{num}"
end

# Series Helper Methods
# Provides navigation and metadata for series content using data/series.yml
helpers do
  # Get series metadata from data file
  def get_series_metadata(series_name)
    data.series.series.find { |s| s[:name] == series_name }
  end
  
  # Get all series from data file
  def all_series_metadata
    data.series.series
  end
  
  # Get featured series from data file
  def featured_series_metadata
    data.series.series.select { |s| s[:featured] == true }
  end
  
  # Get articles for a specific series
  def series_articles(series_name)
    # First try to get articles from series metadata (YAML-driven approach)
    series_metadata = get_series_metadata(series_name)
    if series_metadata && series_metadata[:posts]
      # Get articles by matching titles and dates from YAML
      yaml_posts = series_metadata[:posts]
      blog.articles.select do |article|
        yaml_posts.any? do |yaml_post|
          article.title == yaml_post[:title] && 
          article.date.strftime('%Y-%m-%d') == yaml_post[:date]
        end
      end
    else
      # Fallback to frontmatter-based approach for backward compatibility
      blog.articles.select { |article| article.data.series == series_name }
    end
  end
  
  # Generate series URL helper
  def series_url(series_name_or_slug)
    if series_name_or_slug.is_a?(String)
      # Check if it's a slug by looking up in series metadata
      series_metadata = all_series_metadata.find { |s| s[:slug] == series_name_or_slug }
      if series_metadata
        "/series/#{series_metadata[:slug]}.html"
      else
        # Fallback to name-based URL generation
        "/series/#{series_name_or_slug.downcase.gsub(/\s+/, '-')}.html"
      end
    else
      # Handle series metadata object
      "/series/#{series_name_or_slug[:slug]}.html"
    end
  end
  
  # Get manually curated tags for the About page with full metadata from tags.yml
  def about_page_tags
    # Get the list of tag names to display on about page
    about_tag_names = data.about_page_tags.about_page_tags
    
    # Get full tag metadata from tags.yml
    tag_descriptions = data.tags.tags
    
    # Create a hash mapping tag names to their full metadata
    tag_map = tag_descriptions.each_with_object({}) do |tag, hash|
      hash[tag.name] = tag
    end
    
    # Return full tag objects for tags that exist in both lists
    about_tag_names.map { |tag_name| tag_map[tag_name] }.compact
  end

  # Get tag metadata by tag name
  def get_tag_metadata(tag_name)
    tag_descriptions = data.tags.tags
    tag_descriptions.find { |tag| tag.name == tag_name }
  end

  # Generate tag URL helper
  def tag_url(tag_name)
    "/tags/#{tag_name.downcase.gsub(/\s+/, '-')}.html"
  end

  # Get all unique tags from blog posts with their descriptions
  def all_tags_with_descriptions
    # Get all unique tags from blog posts
    blog_tags = blog.articles.flat_map { |article| article.data.tags || [] }.uniq.sort
    
    # Get tag descriptions from data file
    tag_descriptions = data.tags.tags
    
    # Create a hash mapping tag names to their descriptions
    tag_map = tag_descriptions.each_with_object({}) do |tag, hash|
      hash[tag.name] = tag
    end
    
    # Return tags that exist in both blog posts and descriptions
    blog_tags.map { |tag_name| tag_map[tag_name] }.compact
  end

  # Reading Time Helper Methods
  # Calculate and format reading time for blog posts
  
  # Average reading speed in words per minute
  WORDS_PER_MINUTE = 200

  # Calculate reading time for given content
  # @param content [String] The content to analyze
  # @return [Integer] Estimated reading time in minutes
  def reading_time(content)
    return 0 if content.nil? || content.empty?
    
    word_count = content.split(/\s+/).length
    minutes = (word_count.to_f / WORDS_PER_MINUTE).ceil
    
    # Ensure minimum of 1 minute
    [minutes, 1].max
  end

  # Format reading time for display
  # @param minutes [Integer] Reading time in minutes
  # @return [String] Formatted reading time string
  def format_reading_time(minutes)
    if minutes == 1
      "1 min read"
    else
      "#{minutes} min read"
    end
  end

  # Get reading time for current article
  # @return [String] Formatted reading time
  def article_reading_time
    return unless current_article
    
    content = current_article.body
    minutes = reading_time(content)
    format_reading_time(minutes)
  end

  # Get article excerpt with consistent fallback logic
  # @param article [Middleman::Blog::BlogArticle] The article to get excerpt for
  # @return [String, nil] The excerpt content or nil if none available
  def article_excerpt(article)
    return nil unless article

    excerpt = article.data.excerpt || article.summary
    return nil if excerpt.nil? || excerpt.strip.empty?

    excerpt
  end

  # Plain-text version of an excerpt for use in list rows / cards.
  # Strips HTML, collapses whitespace, optionally truncates.
  def article_excerpt_text(article, limit: nil)
    raw = article.data.summary || article_excerpt(article)
    return nil if raw.nil?
    text = raw.to_s.gsub(/<[^>]+>/, ' ').gsub(/&nbsp;/, ' ').gsub(/\s+/, ' ').strip
    return nil if text.empty?
    if limit && text.length > limit
      "#{text[0, limit].rstrip}…"
    else
      text
    end
  end

  # Build Log helpers ---------------------------------------------------------

  # Primary tag for an article (first tag with metadata in tags.yml).
  def primary_tag(article)
    return nil unless article && article.tags
    article.tags.map { |t| get_tag_metadata(t) }.compact.first
  end

  # Hex color for an article's primary tag — used as --cat custom property.
  def article_cat_color(article)
    tag = primary_tag(article)
    tag ? tag.color : '#c2451d'
  end

  # Emoji for an article's primary tag.
  def article_cat_icon(article)
    tag = primary_tag(article)
    tag ? tag.icon : ''
  end

  # Find the series metadata an article belongs to (or nil).
  def article_series(article)
    return nil unless article
    all_series_metadata.find do |series|
      next false unless series[:posts]
      series[:posts].any? do |yaml_post|
        article.title == yaml_post[:title] &&
          article.date.strftime('%Y-%m-%d') == yaml_post[:date]
      end
    end
  end

  # Index (1-based) of article within its series, plus series total.
  def article_series_part(article)
    series = article_series(article)
    return nil unless series
    posts = series_articles(series[:name]).sort_by(&:date)
    idx = posts.index(article)
    return nil unless idx
    {
      series: series,
      number: idx + 1,
      total: posts.length + (series[:planned_posts] ? series[:planned_posts].length : 0),
    }
  end

  # Group articles by year for the archive page.
  def articles_by_year(articles = nil)
    list = articles || blog.articles
    list.group_by { |a| a.date.year }.sort_by { |year, _| -year }
  end

  # All unique taxonomy filter chips for the archive — returns array of
  # { name:, slug:, color:, icon:, count: } sorted by post count desc.
  def archive_filter_chips
    tag_counts = Hash.new(0)
    blog.articles.each do |article|
      (article.tags || []).each { |t| tag_counts[t] += 1 }
    end
    chips = tag_counts.map do |name, count|
      meta = get_tag_metadata(name)
      next nil unless meta
      {
        name: name,
        slug: name.downcase.gsub(/\s+/, '-'),
        color: meta.color,
        icon: meta.icon,
        count: count,
      }
    end.compact
    chips.sort_by { |c| -c[:count] }
  end

  # All tags-with-metadata sorted by article count desc (for /tags/ index).
  # Tags with zero articles are excluded — they don't get a generated page,
  # so linking to them would produce a 404.
  def tags_with_counts
    counts = Hash.new(0)
    blog.articles.each { |a| (a.tags || []).each { |t| counts[t] += 1 } }
    data.tags.tags.map do |tag|
      {
        meta: tag,
        slug: tag.name.downcase.gsub(/\s+/, '-'),
        count: counts[tag.name],
      }
    end.reject { |t| t[:count].zero? }.sort_by { |t| -t[:count] }
  end

  # Articles that share at least one tag with the given tag (excluding it),
  # weighted by how many they share. Returns up to N tag-metadata entries.
  def related_tags(tag_name, limit = 4)
    co_counts = Hash.new(0)
    blog.articles.each do |a|
      tags = a.tags || []
      next unless tags.include?(tag_name)
      (tags - [tag_name]).each { |t| co_counts[t] += 1 }
    end
    co_counts.sort_by { |_, c| -c }.first(limit).map { |name, _| get_tag_metadata(name) }.compact
  end

  # Format an article's date for log rows (mono YYYY-MM-DD).
  def log_date(date)
    date.strftime('%Y-%m-%d')
  end

  # Format an article's date for archive rows (mono MMM DD).
  def archive_date(date)
    date.strftime('%b %d')
  end
end

# Proxy Pages for Series
# Create individual series pages using proxy functionality
# Generate proxies dynamically from series data
data.series.series.each do |series|
  proxy "/series/#{series[:slug]}.html", "/series.html", locals: {
    series_name: series[:name],
    series_description: series[:description],
    series_status: series[:status],
    page_title: "#{series[:name]} - Series - macapinlac.com",
    page_description: series[:description] || "Multi-part content series by Ritchie Macapinlac"
  }
end

# The series.html template is only used as a proxy source for /series/{slug}.html
# pages above — its own root output would render the "not found" fallback.
ignore "/series.html"

# Build Configuration
# Settings that affect the final static site generation

# Relative Links and Assets
# Enables portable builds that work in any subdirectory or hosting environment
# Critical for deployment flexibility and CDN compatibility
set :relative_links, false
set :relative_assets, true
set :pretty_urls, true

# Markdown Engine Configuration
# Redcarpet with GitHub-flavored extensions enabled.
set :markdown_engine, :redcarpet
set :markdown,
    fenced_code_blocks: true,
    smartypants: true,
    strikethrough: true,
    tables: true,
    autolink: true,
    no_intra_emphasis: true,
    space_after_headers: true

# Development Environment Configuration
# Settings applied only during development

configure :development do
  # Live Reload
  # Automatic browser refresh on file changes for improved development workflow
  activate :livereload
end

# Helper Methods Configuration
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

# Custom helper methods (commented out - using built-in helpers)
# helpers do
#   def some_helper
#     'Helping'
#   end
# end

# Production Build Configuration
# Settings applied only during production build
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

configure :build do
  # CSS Minification
  # Reduces file size for faster loading - enabled for production optimization
  activate :minify_css

  # JavaScript Minification
  # Reduces file size for faster loading - enabled for production optimization
  activate :minify_javascript

  # HTML Minification
  # Reduces file size for faster loading - enabled for production optimization
  activate :minify_html
end
