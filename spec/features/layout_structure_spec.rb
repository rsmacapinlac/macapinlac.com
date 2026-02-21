# frozen_string_literal: true

require_relative '../spec_helper'

RSpec.describe 'Layout Structure' do
  it 'loads the main layout with proper structure' do
    get '/'
    expect(last_response).to be_ok
    
    # Check for main layout elements
    expect(last_response.body).to include('site-container')
    expect(last_response.body).to include('main-content')
    expect(last_response.body).to include('lang="en"')
  end

  it 'has header with navigation and dark mode toggle' do
    get '/'
    expect(last_response).to be_ok
    
    # Check for header elements
    expect(last_response.body).to include('site-header')
    expect(last_response.body).to include('main-navigation')
    expect(last_response.body).to include('nav-toggle')
    expect(last_response.body).to include('theme-toggle')
    expect(last_response.body).to include('toggleTheme()')
  end

  it 'has footer with social links and copyright' do
    get '/'
    expect(last_response).to be_ok
    
    # Check for footer elements
    expect(last_response.body).to include('site-footer')
    expect(last_response.body).to include('footer-social-icons')
    expect(last_response.body).to include('footer-copyright')
    expect(last_response.body).to include('Instagram')
    expect(last_response.body).to include('LinkedIn')
    expect(last_response.body).to include('GitHub')
  end

  it 'includes dark mode functionality' do
    get '/'
    expect(last_response).to be_ok
    
    # Check for dark mode elements
    expect(last_response.body).to include('data-theme')
    expect(last_response.body).to include('localStorage')
    expect(last_response.body).to include('prefers-color-scheme')
  end

  it 'has responsive navigation structure' do
    get '/'
    expect(last_response).to be_ok
    
    # Check for responsive navigation elements
    expect(last_response.body).to include('nav-menu')
    expect(last_response.body).to include('hamburger')
    expect(last_response.body).to include('aria-expanded')
    expect(last_response.body).to include('aria-controls')
  end

  it 'has button component styles in CSS' do
    get '/stylesheets/site.css'
    expect(last_response).to be_ok
    expect(last_response.body).to include('.button')
    expect(last_response.body).to include('.button--primary')
    expect(last_response.body).to include('.button--secondary')
    expect(last_response.body).to include('.button--card-action')
    expect(last_response.body).to include('background: var(--color-primary)')
  end

  it 'has card component styles in CSS' do
    get '/stylesheets/site.css'
    expect(last_response).to be_ok
    expect(last_response.body).to include('.card')
    expect(last_response.body).to include('.card-title')
    expect(last_response.body).to include('.card-meta')
    expect(last_response.body).to include('.card-content')
    expect(last_response.body).to include('.card-actions')
    expect(last_response.body).to include('box-shadow: 0 2px 8px')
  end

  it 'has form element styles in CSS' do
    get '/stylesheets/site.css'
    expect(last_response).to be_ok
    expect(last_response.body).to include('.form-group')
    expect(last_response.body).to include('.form-label')
    expect(last_response.body).to include('.form-input')
    expect(last_response.body).to include('.form-textarea')
    expect(last_response.body).to include('.form-error')
    expect(last_response.body).to include('border-color: var(--color-primary)')
  end

  it 'has post layout styles in CSS' do
    get '/stylesheets/site.css'
    expect(last_response).to be_ok
    expect(last_response.body).to include('.post')
    expect(last_response.body).to include('.post-header')
    expect(last_response.body).to include('.post-meta')
    expect(last_response.body).to include('.post-title')
    expect(last_response.body).to include('.post-content')
    expect(last_response.body).to include('.post-footer')
    expect(last_response.body).to include('.post-navigation')
  end
end 