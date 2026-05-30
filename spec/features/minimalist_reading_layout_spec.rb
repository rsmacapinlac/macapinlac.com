# frozen_string_literal: true

require 'spec_helper'

RSpec.feature 'Article Reading Layout (Build Log)', type: :feature do
  let(:post_url) { '/2025/06/15/how-i-learned-to-stop-worrying-and-trust-my-ai-overlords.html' }

  scenario 'renders the Build Log reading column structure' do
    visit post_url
    expect(page).to have_css('.read')
    expect(page).to have_css('.progress')
    expect(page).to have_css('.crumb')
    expect(page).to have_css('.phead h1')
    expect(page).to have_css('.body')
  end

  scenario 'shows reading time + ISO date in post meta' do
    visit post_url
    expect(page).to have_css('.phead .meta')
    expect(page).to have_content('min read · by ritchie')
    expect(page).to have_content('2025-06-15')
  end

  scenario 'shows tag chips below the article body' do
    visit post_url
    expect(page).to have_css('.ptags')
    expect(page).to have_css('.chip', minimum: 1)
  end

  scenario 'shows the author card and (when applicable) prev/next nav' do
    visit post_url
    expect(page).to have_css('.author')
    expect(page).to have_content('Ritchie Macapinlac')
    # At least one of prev or next should exist for a mid-archive post
    expect(page).to have_css('.pnav .ncard', minimum: 1)
  end

  scenario 'includes both the rail and inline TOC containers' do
    visit post_url
    expect(page).to have_css('.toc.toc-rail', visible: false)
    expect(page).to have_css('.toc.toc-inline', visible: false)
  end

  scenario 'has no legacy --minimal BEM markup' do
    visit post_url
    expect(page).not_to have_css('.post--minimal')
    expect(page).not_to have_css('.post-header--minimal')
    expect(page).not_to have_css('.post-tag--minimal')
  end
end
