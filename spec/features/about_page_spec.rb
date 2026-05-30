# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'About Page (Build Log)', type: :feature do
  before { visit '/about.html' }

  it 'renders the portrait hero with eyebrow and headline' do
    expect(page).to have_css('.ahero')
    expect(page).to have_content('whoami --verbose')
    expect(page).to have_css('h1', text: /tech professional, parent, and serial rebuilder/i)
    expect(page).to have_content('perfectly functional')
  end

  it 'renders the rabbit-holes grid backed by data/about_page_tags.yml' do
    expect(page).to have_css('.holes h2', text: /Where I tend to wander/i)
    expect(page).to have_css('.hgrid')
    expect(page).to have_css('a.hole', minimum: 1)
    expect(page).to have_content('🤖')
    expect(page).to have_content('💻')
  end

  it 'renders the now strip from data/now.yml' do
    expect(page).to have_css('.now')
    expect(page).to have_css('.now .lbl')
    expect(page).to have_content("what I'm into right now")
  end

  it 'renders contact links from data/socials.yml plus email + rss' do
    expect(page).to have_css('.contact')
    expect(page).to have_link(href: 'https://github.com/rsmacapinlac')
    expect(page).to have_link(href: 'https://www.linkedin.com/in/rsmacapinlac')
    expect(page).to have_link(href: 'https://www.instagram.com/rsmacapinlac')
    expect(page).to have_link(href: 'mailto:ritchie@macapinlac.com')
    expect(page).to have_link(href: '/feed.xml')
  end

  it 'has proper SEO meta tags' do
    expect(page).to have_title('About — macapinlac.com')
    expect(page).to have_css('meta[name="description"]', visible: false)
  end

  it 'includes valid JSON-LD person data' do
    # Capybara's .text on a hidden <script> returns empty — pull the raw text
    # straight from the parsed page HTML via Nokogiri instead.
    doc = Nokogiri::HTML(page.html)
    node = doc.at_css('script[type="application/ld+json"]')
    expect(node).not_to be_nil
    parsed = JSON.parse(node.content)
    expect(parsed['@type']).to eq('Person')
    expect(parsed['name']).to eq('Ritchie Macapinlac')
    expect(parsed['url']).to eq('https://macapinlac.com')
  end

  it 'has no legacy sidebar / content-areas markup' do
    expect(page).not_to have_css('.sidebar-section')
    expect(page).not_to have_css('.page-main-content')
    expect(page).not_to have_css('.content-areas')
  end
end
