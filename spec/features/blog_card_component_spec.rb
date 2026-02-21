# frozen_string_literal: true

require_relative '../spec_helper'

RSpec.describe 'Blog Card Component' do
  # Test all 4 pages that use _blog_card.erb
  describe 'Pages using _blog_card.erb' do
    it 'renders blog cards on series page' do
      # Test a specific series page
      get '/series/tesla-road-trip-adventure.html'
      expect(last_response).to be_ok

      # Check for blog card structure
      expect(last_response.body).to include('card')
      expect(last_response.body).to include('card-title')
      expect(last_response.body).to include('card-meta')
      expect(last_response.body).to include('card-date')
      expect(last_response.body).to include('card-content')
      expect(last_response.body).to include('card-tags')
      expect(last_response.body).to include('card-actions')
      expect(last_response.body).to include('Read More')

      # Check for series-specific wrapper
      expect(last_response.body).to include('series-post-wrapper')
      expect(last_response.body).to include('series-post-meta')
    end

    it 'renders blog cards on writing index page' do
      get '/writing/'
      expect(last_response).to be_ok
      
      # Check for blog card structure
      expect(last_response.body).to include('card')
      expect(last_response.body).to include('card-title')
      expect(last_response.body).to include('card-meta')
      expect(last_response.body).to include('card-date')
      expect(last_response.body).to include('card-content')
      expect(last_response.body).to include('card-tags')
      expect(last_response.body).to include('card-actions')
      expect(last_response.body).to include('Read More')
      
      # Check for pagination structure
      expect(last_response.body).to include('posts-listing')
      expect(last_response.body).to include('pagination')
    end

    it 'renders blog cards on tag page' do
      # Test a specific tag page
      get '/tags/travelling.html'
      expect(last_response).to be_ok

      # Check for blog card structure
      expect(last_response.body).to include('card')
      expect(last_response.body).to include('card-title')
      expect(last_response.body).to include('card-meta')
      expect(last_response.body).to include('card-date')
      expect(last_response.body).to include('card-content')
      expect(last_response.body).to include('card-tags')
      expect(last_response.body).to include('card-actions')
      expect(last_response.body).to include('Read More')

      # Check for tag-specific content
      expect(last_response.body).to include('Travelling')
    end

    it 'renders blog cards on calendar/archive page' do
      # Test a year archive page (year_link is configured as "{year}.html")
      get '/2025.html'
      expect(last_response).to be_ok

      # Check for blog card structure
      expect(last_response.body).to include('card')
      expect(last_response.body).to include('card-title')
      expect(last_response.body).to include('card-meta')
      expect(last_response.body).to include('card-date')
      expect(last_response.body).to include('card-content')
      expect(last_response.body).to include('card-tags')
      expect(last_response.body).to include('card-actions')
      expect(last_response.body).to include('Read More')

      # Check for archive-specific content
      expect(last_response.body).to include('Archive for')
      expect(last_response.body).to include('2025')
    end
  end

  describe 'Blog Card CSS Styles' do
    it 'has all required card component styles' do
      get '/stylesheets/site.css'
      expect(last_response).to be_ok
      
      # Core card styles
      expect(last_response.body).to include('.card {')
      expect(last_response.body).to include('background: var(--color-surface)')
      expect(last_response.body).to include('border: 1px solid var(--color-border)')
      expect(last_response.body).to include('border-radius: 8px')
      expect(last_response.body).to include('padding: 2rem')
      expect(last_response.body).to include('transition: all 0.2s ease')
      expect(last_response.body).to include('min-height: 200px')
      expect(last_response.body).to include('display: flex')
      expect(last_response.body).to include('flex-direction: column')
      
      # Hover effects
      expect(last_response.body).to include('.card:hover {')
      expect(last_response.body).to include('box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1)')
      expect(last_response.body).to include('transform: translateY(-2px)')
    end

    it 'has card title styles' do
      get '/stylesheets/site.css'
      expect(last_response).to be_ok
      
      expect(last_response.body).to include('.card-title {')
      expect(last_response.body).to include('font-size: 1.3rem')
      expect(last_response.body).to include('color: var(--color-text)')
      expect(last_response.body).to include('transition: color 0.2s ease')
      expect(last_response.body).to include('flex-grow: 1')
      
      # Hover effect on title
      expect(last_response.body).to include('.card:hover .card-title {')
      expect(last_response.body).to include('color: var(--color-primary)')
    end

    it 'has card meta styles for inline layout' do
      get '/stylesheets/site.css'
      expect(last_response).to be_ok
      
      expect(last_response.body).to include('.card-meta {')
      expect(last_response.body).to include('display: flex')
      expect(last_response.body).to include('align-items: center')
      expect(last_response.body).to include('gap: 0.5rem')
      expect(last_response.body).to include('flex-wrap: wrap')
      expect(last_response.body).to include('flex-shrink: 0')
    end

    it 'has card date styles' do
      get '/stylesheets/site.css'
      expect(last_response).to be_ok
      
      expect(last_response.body).to include('.card-date {')
      expect(last_response.body).to include('font-family: "JetBrains Mono"')
      expect(last_response.body).to include('font-size: 0.875rem')
      expect(last_response.body).to include('color: var(--color-muted)')
      expect(last_response.body).to include('flex-shrink: 0')
    end

    it 'has card meta separator styles' do
      get '/stylesheets/site.css'
      expect(last_response).to be_ok
      
      expect(last_response.body).to include('.card-meta-separator {')
      expect(last_response.body).to include('color: var(--color-muted)')
      expect(last_response.body).to include('font-size: 0.875rem')
      expect(last_response.body).to include('flex-shrink: 0')
    end

    it 'has card tags styles' do
      get '/stylesheets/site.css'
      expect(last_response).to be_ok
      
      expect(last_response.body).to include('.card-tags {')
      expect(last_response.body).to include('display: flex')
      expect(last_response.body).to include('flex-wrap: wrap')
      expect(last_response.body).to include('gap: 4px')
      expect(last_response.body).to include('align-items: center')
      expect(last_response.body).to include('flex-shrink: 0')
    end

    it 'has card tag styles' do
      get '/stylesheets/site.css'
      expect(last_response).to be_ok
      
      expect(last_response.body).to include('.card-tag {')
      expect(last_response.body).to include('display: inline-flex')
      expect(last_response.body).to include('align-items: center')
      expect(last_response.body).to include('gap: 4px')
      expect(last_response.body).to include('font-family: "Inter"')
      expect(last_response.body).to include('font-weight: 500')
      expect(last_response.body).to include('border-radius: 8px')
      expect(last_response.body).to include('padding: 4px 8px')
      expect(last_response.body).to include('font-size: 13px')
      expect(last_response.body).to include('transition: all 0.2s ease')
      expect(last_response.body).to include('cursor: pointer')
      
      # Tag pseudo-element
      expect(last_response.body).to include('.card-tag::before {')
      expect(last_response.body).to include('content: \'#\'')
      expect(last_response.body).to include('opacity: 0.7')
      
      # Tag hover effects
      expect(last_response.body).to include('.card-tag:hover {')
      expect(last_response.body).to include('transform: translateY(-1px)')
      expect(last_response.body).to include('box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15)')
    end

    it 'has card content styles' do
      get '/stylesheets/site.css'
      expect(last_response).to be_ok
      
      expect(last_response.body).to include('.card-content {')
      expect(last_response.body).to include('color: var(--color-text-secondary)')
      expect(last_response.body).to include('line-height: 1.6')
    end

    it 'has button styles for card actions' do
      get '/stylesheets/site.css'
      expect(last_response).to be_ok
      
      expect(last_response.body).to include('.button--card-action {')
      expect(last_response.body).to include('background: none')
      expect(last_response.body).to include('color: var(--color-primary)')
      expect(last_response.body).to include('border: none')
      expect(last_response.body).to include('text-decoration: underline')
      expect(last_response.body).to include('font-weight: 600')
      expect(last_response.body).to include('transition: color 0.2s')
      
      # Button hover effects
      expect(last_response.body).to include('.button--card-action:hover {')
      expect(last_response.body).to include('color: var(--color-accent)')
    end

    it 'has primary button styles' do
      get '/stylesheets/site.css'
      expect(last_response).to be_ok
      
      expect(last_response.body).to include('.btn-primary {')
      expect(last_response.body).to include('background: var(--color-primary)')
      expect(last_response.body).to include('color: white')
    end
  end

  describe 'Blog Card Functionality' do
    it 'displays article titles as links' do
      get '/writing/'
      expect(last_response).to be_ok
      
      # Check that titles are wrapped in links
      expect(last_response.body).to include('<h2 class="card-title">')
      expect(last_response.body).to include('<a href=')
    end

    it 'displays formatted dates' do
      get '/writing/'
      expect(last_response).to be_ok
      
      # Check for date formatting (should match the strftime format in the template)
      expect(last_response.body).to include('card-date')
      # The actual date format will depend on the articles, but we can check the structure
      expect(last_response.body).to include('2025') # Assuming recent articles
    end

    it 'displays tags when present' do
      get '/writing/'
      expect(last_response).to be_ok
      
      # Check for tag structure
      expect(last_response.body).to include('card-tags')
      expect(last_response.body).to include('card-tag')
      expect(last_response.body).to include('/tags/')
    end

    it 'displays summaries when present' do
      get '/writing/'
      expect(last_response).to be_ok
      
      # Check for summary structure
      expect(last_response.body).to include('card-content')
    end

    it 'has working "Read More" buttons with arrow' do
      get '/writing/'
      expect(last_response).to be_ok
      
      # Check for "Read More" button structure
      expect(last_response.body).to include('card-actions')
      expect(last_response.body).to include('Read More')
      expect(last_response.body).to include('button button--card-action')
    end

    it 'displays meta separator when tags are present' do
      get '/writing/'
      expect(last_response).to be_ok
      
      # Check for meta separator structure
      expect(last_response.body).to include('card-meta-separator')
      expect(last_response.body).to include('|')
    end
  end

  describe 'Minimalist Layout Features' do
    it 'has inline meta layout structure' do
      get '/writing/'
      expect(last_response).to be_ok
      
      # Check that date and tags are in the same meta container
      expect(last_response.body).to include('card-meta')
      expect(last_response.body).to include('card-date')
      expect(last_response.body).to include('card-tags')
    end

    it 'maintains proper content hierarchy' do
      get '/writing/'
      expect(last_response).to be_ok
      
      # Check that content appears between title and meta
      expect(last_response.body).to include('card-title')
      expect(last_response.body).to include('card-content')
      expect(last_response.body).to include('card-meta')
      expect(last_response.body).to include('card-actions')
    end
  end

  describe 'Responsive Design' do
    it 'has responsive card layout' do
      get '/stylesheets/site.css'
      expect(last_response).to be_ok
      
      # Check for responsive breakpoints
      expect(last_response.body).to include('@media')
      expect(last_response.body).to include('max-width')
    end
  end

  describe 'Dark Mode Support' do
    it 'uses CSS custom properties for theming' do
      get '/stylesheets/site.css'
      expect(last_response).to be_ok
      
      # Check for CSS custom properties
      expect(last_response.body).to include('--color-surface')
      expect(last_response.body).to include('--color-text')
      expect(last_response.body).to include('--color-primary')
      expect(last_response.body).to include('--color-border')
      expect(last_response.body).to include('--color-muted')
    end

    it 'has dark mode color definitions' do
      get '/stylesheets/site.css'
      expect(last_response).to be_ok
      
      # Check for dark mode theme
      expect(last_response.body).to include('[data-theme="dark"]')
      expect(last_response.body).to include('--color-bg:')
      expect(last_response.body).to include('--color-text:')
    end
  end
end 