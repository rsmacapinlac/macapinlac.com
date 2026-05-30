# frozen_string_literal: true

require_relative '../spec_helper'

RSpec.describe 'Series Functionality (Build Log)' do
  it 'renders the combined /tags page with a series grid' do
    get '/tags/'
    expect(last_response).to be_ok
    expect(last_response.body).to include('Rabbit holes')
    expect(last_response.body).to include('class="series-grid"')
    expect(last_response.body).to include('Tesla Road Trip Adventure')
    expect(last_response.body).to include('Building with AI')
  end

  it 'renders individual series pages with hero + progress meter + parts' do
    get '/series/tesla-road-trip-adventure.html'
    expect(last_response).to be_ok
    expect(last_response.body).to include('class="shero"')
    expect(last_response.body).to include('class="meter"')
    expect(last_response.body).to include('Tesla Road Trip Adventure')
    expect(last_response.body).to include('class="part"')
    expect(last_response.body).to include('Planning a Road Trip')
    expect(last_response.body).to include('The Actual Tesla Road Trip')
  end

  it 'shows series badge on articles that belong to a series' do
    get '/2024/07/17/planning-a-roadtrip-from-vancouver-to-edmonton-in-a-tesla-model-y.html'
    expect(last_response).to be_ok
    expect(last_response.body).to include('class="series-badge"')
    expect(last_response.body).to include('Tesla Road Trip Adventure')
    expect(last_response.body).to include('part 1 of 2')
  end

  it 'shows planned (coming-soon) parts on an active series' do
    get '/series/building-with-ai-website-redesign.html'
    expect(last_response).to be_ok
    expect(last_response.body).to include('part planned')
    expect(last_response.body).to include('// coming soon')
  end

  it 'no longer exposes a /series/ index page' do
    get '/series/'
    expect(last_response.status).to eq(404)
  end
end
