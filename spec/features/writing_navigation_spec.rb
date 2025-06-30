# frozen_string_literal: true

require_relative '../spec_helper'

RSpec.describe 'Writing Navigation Feature' do
  it 'loads the writing page with top navigation' do
    get '/writing/'
    expect(last_response).to be_ok
    
    # Check for writing navigation elements
    expect(last_response.body).to include('writing-navigation')
    expect(last_response.body).to include('nav-container')
    expect(last_response.body).to include('Browse by Category')
  end

  it 'displays tag filters in the navigation' do
    get '/writing/'
    expect(last_response).to be_ok
    
    # Check for tag filter elements
    expect(last_response.body).to include('filter-group')
    expect(last_response.body).to include('filter-label')
    expect(last_response.body).to include('filter-options')
    expect(last_response.body).to include('Tags')
  end

  it 'displays year filters in the navigation' do
    get '/writing/'
    expect(last_response).to be_ok
    
    # Check for year filter elements
    expect(last_response.body).to include('By Year')
    expect(last_response.body).to include('year-filter')
  end

  it 'uses the new writing layout instead of sidebar layout' do
    get '/writing/'
    expect(last_response).to be_ok
    
    # Should not have sidebar layout elements
    expect(last_response.body).not_to include('page-with-sidebar')
    expect(last_response.body).not_to include('page-sidebar')
    expect(last_response.body).not_to include('page-main-content')
    
    # Should use main-content for full width
    expect(last_response.body).to include('main-content')
  end

  it 'maintains blog card functionality' do
    get '/writing/'
    expect(last_response).to be_ok
    
    # Check that blog cards are still present
    expect(last_response.body).to include('posts-listing')
    expect(last_response.body).to include('card')
  end

  it 'maintains pagination functionality' do
    get '/writing/'
    expect(last_response).to be_ok
    
    # Check for pagination elements
    expect(last_response.body).to include('pagination')
  end

  it 'has proper accessibility attributes' do
    get '/writing/'
    expect(last_response).to be_ok
    
    # Check for accessibility attributes
    expect(last_response.body).to include('role="navigation"')
    expect(last_response.body).to include('aria-label="Writing filters"')
  end

  it 'includes proper semantic HTML structure' do
    get '/writing/'
    expect(last_response).to be_ok
    
    # Check for semantic HTML elements
    expect(last_response.body).to include('<nav class="writing-navigation"')
    expect(last_response.body).to include('<h3 class="nav-title"')
    expect(last_response.body).to include('<h4 class="filter-label"')
  end

  it 'generates proper filter links' do
    get '/writing/'
    expect(last_response).to be_ok
    
    # Check that filter links are generated
    expect(last_response.body).to include('filter-link')
    expect(last_response.body).to include('tag-filter')
    expect(last_response.body).to include('year-filter')
  end
end 