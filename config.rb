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
  # Enable all optimizers for maximum compression
  options.pngout = false
  options.svgo = false
  options.gifsicle = true
  options.jpegoptim = true
  options.jpegrecompress = true
  options.optipng = true
  options.pngquant = true
  options.svgo = true
end

# Layout Configuration
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
# Configure specific file types to render without layout wrapper

# Feed and API files - no layout needed for machine-readable content
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false
page '/*.md', layout: false
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
  # blog.sources = "{year}-{month}-{day}-{title}.md"
  
  # Tag URL structure (commented out - using default)
  # blog.taglink = "tags/{tag}.html"
  
  # Layout template for all blog posts
  # Uses post.erb layout for consistent article presentation
  blog.layout = "post"
  
  # Content excerpt configuration (commented out - using default)
  # blog.summary_separator = /(READMORE)/
  # blog.summary_length = 250
  
  # Archive link structure (commented out - using default)
  # blog.year_link = "{year}.html"
  # blog.month_link = "{year}/{month}.html"
  # blog.day_link = "{year}/{month}/{day}.html"
  
  # Default file extension (commented out - using .html.md)
  # blog.default_extension = ".markdown"

  # Template configuration for tag and calendar pages
  # Enables tag-based content discovery and chronological browsing
  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"

  # Pagination configuration (commented out - single page for now)
  # Enable pagination for large article collections
  # blog.paginate = true
  # blog.per_page = 10
  # blog.page_link = "page/{num}"
end

# Build Configuration
# Settings that affect the final static site generation

# Relative Links and Assets
# Enables portable builds that work in any subdirectory or hosting environment
# Critical for deployment flexibility and CDN compatibility
set :relative_links, true
set :relative_assets, true

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
