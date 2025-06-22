# frozen_string_literal: true

require_relative '../spec_helper'

RSpec.describe 'Typography Components' do
  it 'has blockquote styles defined' do
    get '/stylesheets/site.css'
    expect(last_response).to be_ok
    
    # Check for blockquote styling
    expect(last_response.body).to include('blockquote {')
    expect(last_response.body).to include('border-left: 4px solid')
    expect(last_response.body).to include('font-style: italic')
  end

  it 'has code block styles defined' do
    get '/stylesheets/site.css'
    expect(last_response).to be_ok
    
    # Check for code block styling
    expect(last_response.body).to include('pre {')
    expect(last_response.body).to include('background: var(--color-code-bg)')
    expect(last_response.body).to include('font-family: "JetBrains Mono"')
  end

  it 'has inline code styles defined' do
    get '/stylesheets/site.css'
    expect(last_response).to be_ok
    
    # Check for inline code styling
    expect(last_response.body).to include('code {')
    expect(last_response.body).to include('border-radius: 3px')
    expect(last_response.body).to include('padding: 0.2em 0.4em')
  end

  it 'has caption styles defined' do
    get '/stylesheets/site.css'
    expect(last_response).to be_ok
    
    # Check for caption styling
    expect(last_response.body).to include('.caption {')
    expect(last_response.body).to include('text-align: center')
    expect(last_response.body).to include('font-style: italic')
  end

  it 'has list styles defined' do
    get '/stylesheets/site.css'
    expect(last_response).to be_ok
    
    # Check for list styling
    expect(last_response.body).to include('ul, ol {')
    expect(last_response.body).to include('padding-left: 2rem')
    expect(last_response.body).to include('li {')
  end

  it 'has system preference detection for dark mode' do
    get '/stylesheets/site.css'
    expect(last_response).to be_ok
    
    # Check for system preference detection
    expect(last_response.body).to include('@media (prefers-color-scheme: dark)')
    expect(last_response.body).to include(':root:not([data-theme])')
  end
end 