# macapinlac.com

A personal blog and website built with Middleman, a Ruby-based static site generator. This site serves as a platform for sharing thoughts, experiences, and technical insights.

## Features

- Blog posts with markdown support
- Responsive design
- RSS feed
- Tag-based organization
- Calendar view
- Pagination
- Article previews

## Technical Stack

- [Middleman](https://middlemanapp.com/) - Static site generator
- Ruby - Programming language
- ERB - Template engine
- Markdown - Content format
- SASS - CSS preprocessor

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

1. Create new blog posts in `source/` with the format `YYYY-MM-DD-title.html.md`
2. Use markdown for content
3. Add frontmatter for metadata (title, date, tags, etc.)
4. Preview changes locally using the development server
5. Build the site for production:
   ```bash
   bundle exec middleman build
   ```

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
├── config.rb        # Middleman configuration
├── Gemfile          # Ruby dependencies
└── build/           # Generated static site (not in repo)
```

## Contributing

Feel free to submit issues or pull requests for any improvements or bug fixes.

## License

This project is licensed under the terms specified in the LICENSE file.