# frozen_string_literal: true

require_relative '../spec_helper'

RSpec.describe 'Series Functionality' do
  it 'has series index page' do
    get '/series'
    expect(last_response).to be_ok
    expect(last_response.body).to include('Series')
    expect(last_response.body).to include('Multi-part content exploring topics in depth')
  end

  it 'displays series posts with navigation' do
    get '/2024/07/17/planning-a-roadtrip-from-vancouver-to-edmonton-in-a-tesla-model-y.html'
    expect(last_response).to be_ok
    
    # Check for series information
    expect(last_response.body).to include('Tesla Road Trip Adventure')
    expect(last_response.body).to include('Part 1 of 2')
    expect(last_response.body).to include('progress-indicator')
    expect(last_response.body).to include('section-navigation')
  end

  it 'shows series navigation between posts' do
    get '/2024/07/18/the-actual-tesla-road-trip-vancouver-to-edmonton.html'
    expect(last_response).to be_ok
    
    # Check for series navigation
    expect(last_response.body).to include('Tesla Road Trip Adventure')
    expect(last_response.body).to include('Part 2 of 2')
    expect(last_response.body).to include('Previous: Planning a Road Trip')
    expect(last_response.body).to include('View All Posts in Series')
  end

  it 'has individual series page' do
    get '/series/tesla-road-trip-adventure.html'
    expect(last_response).to be_ok
    
    # Check for series page content
    expect(last_response.body).to include('Tesla Road Trip Adventure')
    expect(last_response.body).to include('2 posts')
    expect(last_response.body).to include('card')
    expect(last_response.body).to include('Planning a Road Trip')
    expect(last_response.body).to include('The Actual Tesla Road Trip')
  end

  it 'shows series progress indicators' do
    get '/2024/07/17/planning-a-roadtrip-from-vancouver-to-edmonton-in-a-tesla-model-y.html'
    expect(last_response).to be_ok
    
    # Check for progress bar
    expect(last_response.body).to include('progress-bar')
    expect(last_response.body).to include('progress-fill')
  end

  it 'includes series in navigation' do
    get '/'
    expect(last_response).to be_ok
    
    # Check for series link in navigation
    expect(last_response.body).to include('Series')
    expect(last_response.body).to include('/series')
  end
end 