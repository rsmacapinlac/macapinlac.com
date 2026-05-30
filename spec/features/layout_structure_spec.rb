# frozen_string_literal: true

require_relative '../spec_helper'

RSpec.describe 'Layout Structure (Build Log)' do
  it 'loads the main layout with proper structure' do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to include('site-container')
    expect(last_response.body).to include('main-content')
    expect(last_response.body).to include('lang="en"')
    expect(last_response.body).to include('class="bl grain"')
  end

  it 'has terminal header with nav and dark mode toggle' do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to include('term-bar')
    expect(last_response.body).to include('term-nav')
    expect(last_response.body).to include('class="toggle"')
    expect(last_response.body).to include('toggleTheme()')
    # Nav entries
    expect(last_response.body).to match(/href="\/"[^>]*>home/)
    expect(last_response.body).to include('about')
    expect(last_response.body).to include('archive')
    expect(last_response.body).to include('tags')
  end

  it 'has status-bar footer with motto, uptime, credits and socials' do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to include('statusbar')
    expect(last_response.body).to include('class="motto"')
    expect(last_response.body).to include('class="uptime"')
    expect(last_response.body).to include('class="credit"')
    expect(last_response.body).to include('class="socials"')
    expect(last_response.body).to include('GitHub'.downcase)
    expect(last_response.body).to include('LinkedIn'.downcase)
  end

  it 'serves dynamic post count and uptime years in footer' do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to match(/uptime: \d+ years · \d+ posts/)
  end

  it 'includes dark mode bootstrap script in head' do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to include('data-theme')
    expect(last_response.body).to include('localStorage')
    expect(last_response.body).to include('prefers-color-scheme')
  end

  it 'has terminal chrome styles in CSS' do
    get '/stylesheets/site.css'
    expect(last_response).to be_ok
    expect(last_response.body).to include('.term-bar')
    expect(last_response.body).to include('.term-nav')
    expect(last_response.body).to include('.cmdline')
    expect(last_response.body).to include('.statusbar')
  end

  it 'has page-head and reading layout styles in CSS' do
    get '/stylesheets/site.css'
    expect(last_response).to be_ok
    expect(last_response.body).to include('.page-head')
    expect(last_response.body).to include('.read')
    expect(last_response.body).to include('.phead')
    expect(last_response.body).to include('.body')
  end
end
