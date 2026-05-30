# frozen_string_literal: true

require_relative '../spec_helper'

RSpec.describe 'Dark Mode Implementation' do
  it 'loads the CSS file with Build Log design tokens' do
    get '/stylesheets/site.css'
    expect(last_response).to be_ok
    expect(last_response.body).to include('--paper:')
    expect(last_response.body).to include('--ink:')
    expect(last_response.body).to include('--rust:')
    expect(last_response.body).to include('--line:')
  end

  it 'has dark mode token overrides' do
    get '/stylesheets/site.css'
    expect(last_response).to be_ok
    expect(last_response.body).to include('[data-theme="dark"]')
    expect(last_response.body).to include('--paper:        #1a1714')
    expect(last_response.body).to include('--rust:         #e0673b')
  end

  it 'includes theme toggle in HTML' do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to include('id="themeToggle"')
    expect(last_response.body).to include('toggleTheme()')
    expect(last_response.body).to include('data-theme')
  end

  it 'serves the early-loaded theme bootstrap script' do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to include("localStorage.getItem('theme')")
    expect(last_response.body).to include('prefers-color-scheme')
  end
end
