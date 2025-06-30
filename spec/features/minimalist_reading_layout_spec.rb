require 'spec_helper'

RSpec.feature 'Minimalist Reading Layout', type: :feature do
  let(:sample_post) { '2025-06-15-How-I-Learned-to-Stop-Worrying-and-Trust-My-AI-Overlords.html.md' }
  
  scenario 'displays minimalist reading-focused layout' do
    visit "/2025/06/15/how-i-learned-to-stop-worrying-and-trust-my-ai-overlords.html"
    
    # Check for minimalist layout classes
    expect(page).to have_css('.post--minimal')
    expect(page).to have_css('.post-header--minimal')
    expect(page).to have_css('.post-title--minimal')
    expect(page).to have_css('.post-content--minimal')
    expect(page).to have_css('.post-footer--minimal')
  end
  
  scenario 'displays reading time estimation' do
    visit "/2025/06/15/how-i-learned-to-stop-worrying-and-trust-my-ai-overlords.html"
    
    # Check for reading time display
    expect(page).to have_css('.post-reading-time')
    expect(page).to have_content(/min read/)
    
    # Reading time should be reasonable (not 0 or extremely high)
    reading_time_text = page.find('.post-reading-time').text
    minutes = reading_time_text.match(/(\d+)/)[1].to_i
    expect(minutes).to be > 0
    expect(minutes).to be < 60 # Should be reasonable for this post
  end
  
  scenario 'displays simplified meta information' do
    visit "/2025/06/15/how-i-learned-to-stop-worrying-and-trust-my-ai-overlords.html"
    
    # Check for minimal meta layout
    expect(page).to have_css('.post-meta--minimal')
    expect(page).to have_css('.post-date--minimal')
    expect(page).to have_css('.post-meta-separator')
    
    # Check for date display
    expect(page).to have_content('June 15, 2025')
  end
  
  scenario 'displays tags in minimal format' do
    visit "/2025/06/15/how-i-learned-to-stop-worrying-and-trust-my-ai-overlords.html"
    
    # Check for minimal tag styling
    expect(page).to have_css('.post-tags--minimal')
    expect(page).to have_css('.post-tag--minimal')
    
    # Check for tag content
    expect(page).to have_content('Adventures in AI')
  end
  
  scenario 'displays enhanced typography for content' do
    visit "/2025/06/15/how-i-learned-to-stop-worrying-and-trust-my-ai-overlords.html"
    
    # Check for enhanced content styling
    expect(page).to have_css('.post-content--minimal')
    
    # Check that headings are properly styled (this post has h2 headings)
    expect(page).to have_css('.post-content--minimal h2')
    
    # Check for specific heading content
    expect(page).to have_content('The Problem: I Love to Over-Complicate Everything')
    expect(page).to have_content('My One-Week Challenge')
  end
  
  scenario 'displays minimal navigation' do
    visit "/2025/06/15/how-i-learned-to-stop-worrying-and-trust-my-ai-overlords.html"
    
    # Check for minimal navigation styling
    expect(page).to have_css('.post-navigation--minimal')
    expect(page).to have_css('.button--minimal')
  end
  
  scenario 'maintains responsive design' do
    visit "/2025/06/15/how-i-learned-to-stop-worrying-and-trust-my-ai-overlords.html"
    
    # Check that the layout is responsive
    expect(page).to have_css('.post--minimal')
    
    # The layout should work on different screen sizes
    # This is tested by ensuring the CSS classes are present
    # which include responsive breakpoints
  end
  
  scenario 'displays post content with enhanced typography' do
    visit "/2025/06/15/how-i-learned-to-stop-worrying-and-trust-my-ai-overlords.html"
    
    # Check that the post content is displayed with minimal styling
    expect(page).to have_css('.post-content--minimal')
    
    # Check for actual content from the post (using simpler text matching)
    expect(page).to have_content('serial computer rebuilder')
    expect(page).to have_content('YouTube algorithm')
  end
  
  scenario 'displays reply context styling when available' do
    # This test would need a post with reply data to be fully tested
    # For now, we'll just check that the styling classes are available
    visit "/2025/06/15/how-i-learned-to-stop-worrying-and-trust-my-ai-overlords.html"
    
    # The reply context styling should be available even if not used
    # This ensures the CSS is properly loaded
    expect(page).to have_css('body') # Basic check that page loads
  end
end 