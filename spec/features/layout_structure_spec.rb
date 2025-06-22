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
    expect(last_response.body).to include('social-links')
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
end 