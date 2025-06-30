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
# Optimizes images for web performance and accessibility
activate :imageoptim do |options|
  # Enable supported optimizers for maximum compression
  options.gifsicle = true
  options.jpegoptim = true
  options.optipng = true
  options.svgo = true
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
  
  # Get articles for a specific series
  def series_articles(series_name)
    blog.articles.select { |article| article.data.series == series_name }
  end
  
  # Get series navigation for individual posts
  def series_navigation(current_article)
    return unless current_article.data.series
    
    series_metadata = get_series_metadata(current_article.data.series)
    series_posts = series_articles(current_article.data.series).sort_by(&:date)
    current_index = series_posts.index(current_article)
    
    {
      series_name: current_article.data.series,
      series_metadata: series_metadata,
      current_index: current_index,
      total_posts: series_posts.length,
      previous_post: current_index > 0 ? series_posts[current_index - 1] : nil,
      next_post: current_index < series_posts.length - 1 ? series_posts[current_index + 1] : nil,
      all_posts: series_posts
    }
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
end

# Proxy Pages for Series
# Create individual series pages using proxy functionality
# Generate proxies dynamically from series data
data.series.series.each do |series|
  proxy "/series/#{series[:slug]}.html", "/series.html", locals: {
    series_name: series[:name],
    series_description: series[:description],
    series_status: series[:status]
  }
end

# Build Configuration
# Settings that affect the final static site generation

# Relative Links and Assets
# Enables portable builds that work in any subdirectory or hosting environment
# Critical for deployment flexibility and CDN compatibility
set :relative_links, false
set :relative_assets, true
set :pretty_urls, true

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
