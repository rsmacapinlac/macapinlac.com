# frozen_string_literal: true

require_relative '../spec_helper'

RSpec.describe 'Homepage Hero (Build Log)' do
  it 'renders the eyebrow, headline, sub copy and metaline' do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to include('<section class="hero">')
    expect(last_response.body).to include('whoami')
    expect(last_response.body).to include('over-engineer')
    expect(last_response.body).to include('class="sub"')
    expect(last_response.body).to include('class="metaline"')
  end

  it 'renders the search field inside the terminal header on the homepage' do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to include('id="searchForm"')
    expect(last_response.body).to include('id="q"')
    expect(last_response.body).to include('class="search"')
  end

  it 'shows a year-agnostic metaline (no hardcoded year)' do
    get '/'
    current_year = Time.now.year
    expect(last_response.body).not_to match(/#{current_year - 1}\s*entries/)
  end

  it 'shows the latest entry card with --cat color when posts exist' do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to match(/class="latest"[^>]*style="--cat:/)
    expect(last_response.body).to include('class="badge"')
    expect(last_response.body).to include('class="go"')
  end

  it 'renders a featured series strip below the log feed' do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to include('id="seriesBlock"')
    expect(last_response.body).to include('series-strip')
    expect(last_response.body).to include('Building with AI')
  end
end
