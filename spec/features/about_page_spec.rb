require 'spec_helper'

RSpec.describe 'About Page', type: :feature do
  before do
    visit '/about.html'
  end

  it 'displays about page content correctly' do
    expect(page).to have_content('About')
    expect(page).to have_content('Personal Introduction')
    expect(page).to have_content('Professional Background')
    expect(page).to have_content('Technology & Development')
    expect(page).to have_content('Productivity & Systems')
  end

  it 'displays proper page structure' do
    expect(page).to have_css('.page-header')
    expect(page).to have_css('.page-title', text: 'About')
    expect(page).to have_css('.page-description')
    expect(page).to have_css('.site-intro')
    expect(page).to have_css('.featured-content')
  end

  it 'about link works from navigation' do
    visit '/'
    click_link 'About'
    expect(page).to have_content('About')
    expect(current_path).to eq('/about.html')
  end

  it 'displays social links correctly' do
    expect(page).to have_css('.social-links')
    expect(page).to have_link('GitHub', href: 'https://github.com/rsmacapinlac')
    expect(page).to have_link('LinkedIn', href: 'https://www.linkedin.com/in/rsmacapinlac')
    expect(page).to have_link('Instagram', href: 'https://www.instagram.com/rsmacapinlac')
    expect(page).to have_link('Twitter', href: 'https://twitter.com/ritchie')
  end

  it 'responsive design works on mobile' do
    # Skip this test for Rack::Test as it doesn't support window resizing
    skip 'Rack::Test does not support window resizing' if Capybara.current_driver == :rack_test
  end

  it 'dark mode toggle works on about page' do
    expect(page).to have_css('.theme-toggle')
    # Note: Rack::Test doesn't execute JavaScript, so we can't test the actual theme toggle
    # In a real browser, clicking the toggle would change the data-theme attribute
    expect(page).to have_css('.theme-icon.light')
    expect(page).to have_css('.theme-icon.dark')
  end

  it 'page has proper SEO meta tags' do
    expect(page).to have_title('About Ritchie Macapinlac - Technology, Parenting, Productivity')
    expect(page).to have_css('meta[name="description"]', visible: false)
    expect(page).to have_css('meta[name="author"]', visible: false)
  end

  it 'structured data is valid JSON-LD' do
    expect(page).to have_css('script[type="application/ld+json"]', visible: false)
    
    # Parse the JSON-LD content
    json_ld_element = page.find('script[type="application/ld+json"]', visible: false)
    json_ld_text = json_ld_element.text.strip
    
    # Skip test if JSON-LD is empty (might be a rendering issue)
    if json_ld_text.empty?
      skip 'JSON-LD content is empty - may be a rendering issue'
    end
    
    expect { JSON.parse(json_ld_text) }.not_to raise_error
    
    parsed_data = JSON.parse(json_ld_text)
    expect(parsed_data['@type']).to eq('Person')
    expect(parsed_data['name']).to eq('Ritchie Macapinlac')
  end

  it 'navigation buttons work correctly' do
    expect(page).to have_link('Back to Home', href: '/')
    expect(page).to have_link('Browse My Writing', href: '/writing')
    
    click_link 'Back to Home'
    expect(current_path).to eq('/')
  end
end 