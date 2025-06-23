# frozen_string_literal: true

require_relative '../spec_helper'

RSpec.describe 'Blog' do
  it 'has blog posts on homepage' do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to include('card')
    expect(last_response.body).to include('card-title')
  end

  it 'renders individual blog posts correctly' do
    # Test a specific blog post
    get '/2025/04/20/i-asked-ai-to-pick-my-next-tablet.html'
    expect(last_response).to be_ok
    
    # Check for proper HTML structure
    expect(last_response.body).to include('<!doctype html>')
    expect(last_response.body).to include('<html')
    expect(last_response.body).to include('<head>')
    expect(last_response.body).to include('<body>')
    
    # Check for post-specific content
    expect(last_response.body).to include('post')
    expect(last_response.body).to include('post-header')
    expect(last_response.body).to include('post-title')
    expect(last_response.body).to include('I Asked AI to Pick My Next Tablet')
    
    # Check for layout elements
    expect(last_response.body).to include('site-header')
    expect(last_response.body).to include('site-footer')
    expect(last_response.body).to include('main-content')
    
    # Check for stylesheets
    expect(last_response.body).to include('stylesheet')
    expect(last_response.body).to include('site.css')
  end

  it 'renders blog posts with proper metadata' do
    get '/2025/04/20/i-asked-ai-to-pick-my-next-tablet.html'
    expect(last_response).to be_ok
    
    # Check for post metadata
    expect(last_response.body).to include('post-meta')
    expect(last_response.body).to include('post-date')
    expect(last_response.body).to include('April 20, 2025')
    expect(last_response.body).to include('post-tags')
    expect(last_response.body).to include('Adventures in AI')
  end

  it 'renders blog posts with proper navigation' do
    get '/2025/04/20/i-asked-ai-to-pick-my-next-tablet.html'
    expect(last_response).to be_ok
    
    # Check for navigation elements
    expect(last_response.body).to include('post-navigation')
    expect(last_response.body).to include('post-nav-link')
  end
end