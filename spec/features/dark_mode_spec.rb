# frozen_string_literal: true

require_relative '../spec_helper'

RSpec.describe 'Dark Mode Implementation' do
  it 'loads the CSS file with custom properties' do
    get '/stylesheets/site.css'
    expect(last_response).to be_ok
    
    # Check that CSS custom properties are defined
    expect(last_response.body).to include('--color-bg')
    expect(last_response.body).to include('--color-text')
    expect(last_response.body).to include('--color-primary')
  end

  it 'has dark mode color definitions in CSS' do
    get '/stylesheets/site.css'
    expect(last_response).to be_ok
    
    # Check for dark mode color variables
    expect(last_response.body).to include('[data-theme="dark"]')
    expect(last_response.body).to include('--color-bg: #181a1b')
    expect(last_response.body).to include('--color-text: #f9f9f9')
  end

  it 'includes theme toggle functionality in HTML' do
    get '/'
    expect(last_response).to be_ok
    
    # Check for theme toggle elements
    expect(last_response.body).to include('theme-toggle')
    expect(last_response.body).to include('toggleTheme()')
    expect(last_response.body).to include('data-theme')
  end

  it 'has responsive navigation structure in HTML' do
    get '/'
    expect(last_response).to be_ok
    
    # Check for responsive navigation elements
    expect(last_response.body).to include('nav-toggle')
    expect(last_response.body).to include('hamburger')
    expect(last_response.body).to include('nav-menu--open')
  end

  it 'uses design system typography in CSS' do
    get '/stylesheets/site.css'
    expect(last_response).to be_ok
    
    # Check for typography system implementation
    expect(last_response.body).to include('font-family')
    expect(last_response.body).to include('font-size')
    expect(last_response.body).to include('line-height')
  end
end 