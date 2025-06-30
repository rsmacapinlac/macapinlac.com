# macapinlac.com

A personal blog and website built with Middleman, a Ruby-based static site generator. This site serves as a platform for sharing thoughts, experiences, and technical insights.

## Features

- Blog posts with markdown support
- Responsive design
- RSS feed
- Tag-based organization
- Series organization with data-driven metadata
- Calendar view
- Pagination
- Article previews

## Technical Stack

- [Middleman](https://middlemanapp.com/) - Static site generator
- Ruby - Programming language
- ERB - Template engine
- Markdown - Content format
- SASS - CSS preprocessor
- RSpec - Testing framework
- Rack::Test - HTTP testing
- SimpleCov - Code coverage

## Getting Started

### Prerequisites

- Ruby (version specified in `.ruby-version`)
- Bundler (`gem install bundler`)

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/macapinlac.com.git
   cd macapinlac.com
   ```

2. Install dependencies:
   ```bash
   bundle install
   ```

3. Start the development server:
   ```bash
   bundle exec middleman server
   ```

4. Visit `http://localhost:4567` in your browser

### Development Workflow
```bash
# Option 1: Use the development script (recommended)
./scripts/dev.sh server    # Start development server
./scripts/dev.sh test      # Run all tests
./scripts/dev.sh build     # Build for production

# Option 2: Manual commands
bundle exec middleman server  # Start development server
bundle exec rspec            # Run tests
bundle exec middleman build  # Build for production
```

**Note:** Tests use Rack::Test and don't require a running server. The development server is only needed for manual browser testing.

### Development Script
The `scripts/dev.sh` script provides a streamlined development workflow:

```bash
# Show help
./scripts/dev.sh help

# Start development server (automatically kills existing servers)
./scripts/dev.sh server

# Run all tests
./scripts/dev.sh test

# Run specific test file
./scripts/dev.sh test spec/features/blog_spec.rb

# Build for production
./scripts/dev.sh build

# Kill all Middleman servers
./scripts/dev.sh kill
```

**Benefits:**
- Prevents multiple server instances
- Provides colored output and clear status messages
- Automatically manages server lifecycle
- Streamlines common development tasks

### Development Tools

#### Ruby Version Management
```bash
# Switch to project Ruby version
rvm use

# Install Ruby version if not available
rvm install $(cat .ruby-version)
```

#### Development Server Options
```bash
# Standard development server
bundle exec middleman server

# Custom port (if 4567 is in use)
bundle exec middleman server -p 4568

# Network access (for device testing)
bundle exec middleman server -H 0.0.0.0

# Verbose output for debugging
bundle exec middleman server --verbose
```

#### Testing Tools
```bash
# Run all tests (uses Rack::Test - no server needed)
bundle exec rspec

# Run specific test files
bundle exec rspec spec/features/blog_spec.rb
bundle exec rspec spec/features/dark_mode_spec.rb

# Run tests with verbose output
bundle exec rspec --format documentation

# Run tests with coverage report
bundle exec rspec --format documentation --coverage
```

### Testing

This project uses RSpec with Rack::Test for automated testing. Tests run against an in-memory Middleman application, so no external server is required.

### Testing Approach
- **Rack::Test**: Tests run against an in-memory Middleman app instance
- **No External Server**: Tests don't require a running development server
- **Fast Execution**: In-memory testing is much faster than HTTP requests
- **Isolated**: Each test runs in isolation with a fresh app instance

### Running Tests
```bash
# Run all tests (uses Rack::Test - no server needed)
bundle exec rspec

# Run specific test files
bundle exec rspec spec/features/blog_spec.rb
bundle exec rspec spec/features/dark_mode_spec.rb

# Run tests with verbose output
bundle exec rspec --format documentation

# Run tests with coverage report
bundle exec rspec --format documentation --coverage
```

### Test Categories
- **Feature Tests**: Test complete user workflows and page functionality
- **Layout Tests**: Verify page structure and navigation
- **Component Tests**: Test individual components (dark mode, typography, etc.)
- **Blog Tests**: Verify blog functionality and post rendering

### Deployment

The site is deployed to macapinlac.com. The build process generates static files in the `build/` directory that can be deployed to any static hosting service.

## Project Structure

```
.
├── source/           # Source files
│   ├── layouts/     # Layout templates
│   ├── stylesheets/ # CSS/SASS files
│   ├── javascripts/ # JavaScript files
│   └── images/      # Image assets
├── data/            # Data files
│   ├── tags.yml     # Tag metadata
│   ├── series.yml   # Series metadata
│   └── socials.yml  # Social media links
├── spec/            # Test files
│   ├── features/    # Feature tests
│   └── support/     # Test support files
├── config.rb        # Middleman configuration
├── Gemfile          # Ruby dependencies
└── build/           # Generated static site (not in repo)
```

## Series Management

The site uses a data-driven approach for series management. Series metadata is centralized in `data/series.yml` following the same pattern as tags.

### Adding a New Series

1. **Add to `data/series.yml`**:
```yaml
---
series:
  - name: "My New Series"
    description: "Description of the series"
    status: "In Progress"
    icon: "🚗"
    color: "#ff6b6b"
    slug: "my-new-series"
    posts:
      - title: "First Post Title"
        date: "2025-01-15"
        summary: "Post summary"
```

2. **Add to blog post frontmatter**:
```yaml
---
title: "My Post Title"
date: 2025-01-15
series: "My New Series"
---
```

3. **The series page will be generated automatically at `/series/my-new-series.html`**

### Series Features

- **Centralized Management**: All series metadata in one file
- **Rich Metadata**: Description, status, icon, color, and slug
- **Dynamic URLs**: Slug-based URLs generated automatically
- **Enhanced Display**: Series cards show status, icons, and descriptions
- **Backward Compatibility**: Existing series functionality continues to work

## Contributing

Feel free to submit issues or pull requests for any improvements or bug fixes.

## License

This project is licensed under the terms specified in the LICENSE file.