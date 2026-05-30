# frozen_string_literal: true

require_relative '../spec_helper'

RSpec.describe 'Typography Components (Build Log)' do
  it 'declares the four-font CSS custom properties' do
    get '/stylesheets/site.css'
    expect(last_response).to be_ok
    expect(last_response.body).to include('--font-serif:')
    expect(last_response.body).to include('--font-editorial:')
    expect(last_response.body).to include('--font-sans:')
    expect(last_response.body).to include('--font-mono:')
    expect(last_response.body).to include('Lora')
    expect(last_response.body).to include('Inter')
    expect(last_response.body).to include('JetBrains Mono')
    expect(last_response.body).to include('Crimson Text')
  end

  it 'styles article body blockquotes with rust border and editorial italic' do
    get '/stylesheets/site.css'
    expect(last_response).to be_ok
    expect(last_response.body).to include('.body blockquote')
    expect(last_response.body).to include('border-left: 3px solid var(--rust)')
    expect(last_response.body).to include('font-family: var(--font-editorial)')
  end

  it 'styles article pre/code blocks with the terminal dark surface' do
    get '/stylesheets/site.css'
    expect(last_response).to be_ok
    expect(last_response.body).to include('.body pre')
    expect(last_response.body).to include('background: var(--code-bg)')
    expect(last_response.body).to include('.body code')
    expect(last_response.body).to include('font-family: var(--font-mono)')
  end

  it 'has the mono `##` and `###` heading prefix decorations' do
    get '/stylesheets/site.css'
    expect(last_response).to be_ok
    expect(last_response.body).to include(".body h2::before")
    expect(last_response.body).to include(".body h3::before")
  end

  it 'has the drop-cap rule on the first paragraph' do
    get '/stylesheets/site.css'
    expect(last_response).to be_ok
    expect(last_response.body).to include('.body p:first-of-type::first-letter')
  end
end
