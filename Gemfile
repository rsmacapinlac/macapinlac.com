source 'https://rubygems.org'

# Core Middleman Framework
# Static site generator - chosen for Ruby-first approach, excellent blog support, and mature ecosystem
gem 'middleman', '~> 4.4'
# Provides article management, tag system, pagination, and RSS feed generation
gem 'middleman-blog'
# Automatically adds vendor prefixes for cross-browser CSS compatibility
gem 'middleman-autoprefixer'
# Automatic browser refresh on file changes for improved development workflow
gem 'middleman-livereload'

# Asset Optimization
# HTML minification for production builds - reduces file size for faster loading
gem 'middleman-minify-html'
# Image optimization for web performance and accessibility
gem 'middleman-imageoptim'

# Git Integration
# Enables git-based features in templates including changelog generation and commit history
gem 'git'

# Markdown Processing
# Secure markdown parser with GitHub-flavored support - chosen for security and feature completeness
gem 'redcarpet', '~> 3.3', '>= 3.3.3'

# XML Generation
# Required for RSS feed generation via feed.xml.builder template
gem 'builder', '~> 3.0'

# Timezone Support
# Windows does not come with time zone data - provides timezone database for consistent date handling
gem 'tzinfo-data', platforms: [:mswin, :mingw, :jruby, :x64_mingw]

# Windows File Watching
# For faster file watcher updates on Windows - improves development server performance
gem 'wdm', '~> 0.1', platforms: [:mswin, :mingw, :x64_mingw]

# Testing Framework
group :test do
  # Ruby community standard testing framework - comprehensive feature and unit testing
  gem 'rspec', '~> 3.12'
  # Web application testing - enables browser simulation and integration testing
  gem 'capybara', '~> 3.39'
  # HTTP testing - enables rack-based testing for static site verification
  gem 'rack-test', '~> 2.1'
  # Browser automation - supports JavaScript testing and cross-browser validation
  gem 'selenium-webdriver', '~> 4.16'
  # Code coverage - tracks test coverage with 90% minimum threshold requirement
  gem 'simplecov', '~> 0.22.0'
  # Coverage reporting - provides console output for coverage results
  gem 'simplecov-console', '~> 0.9.1'
end
