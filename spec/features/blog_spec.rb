# frozen_string_literal: true

require_relative '../spec_helper'

RSpec.describe 'Blog' do
  let(:sample_post_url) { '/2025/04/20/i-asked-ai-to-pick-my-next-tablet.html' }
  let(:superman_post_url) { '/2025/07/14/this-week-s-obsessions-superman-prime-day-practicality-and-ai-code-adventures.html' }

  it 'renders the homepage with the log feed' do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to include('class="ix-row"')
    expect(last_response.body.scan('class="ix-row"').length).to eq(5)
    expect(last_response.body).to include('logsec')
    expect(last_response.body).to include('~/posts')
  end

  it 'surfaces the latest entry card on the homepage' do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to include('id="latestBlock"')
    expect(last_response.body).to include('latest entry')
    expect(last_response.body).to include('cat latest-post.md')
  end

  it 'renders individual blog posts with the article layout' do
    get sample_post_url
    expect(last_response).to be_ok
    expect(last_response.body).to include('<!doctype html>')
    expect(last_response.body).to include('I Asked AI to Pick My Next Tablet')
    expect(last_response.body).to include('class="phead"')
    expect(last_response.body).to include('class="body"')
    expect(last_response.body).to include('class="progress"')
    expect(last_response.body).to include('class="crumb"')
  end

  it 'shows article metadata in the post head' do
    get sample_post_url
    expect(last_response).to be_ok
    expect(last_response.body).to include('stat post.md')
    expect(last_response.body).to include('2025-04-20')
    expect(last_response.body).to include('min read · by ritchie')
  end

  it 'renders article meta descriptions as escaped plain text' do
    get superman_post_url
    expect(last_response).to be_ok

    description = last_response.body[/<meta name="description" content="([^"]*)" \/>/, 1]
    expect(description).to include('Superman')
    expect(description).not_to include('<p>')
    expect(description).not_to include('<ul>')
    expect(description).not_to include('<a href=')
  end

  it 'shows the chip tags and author card on the post' do
    get sample_post_url
    expect(last_response).to be_ok
    expect(last_response.body).to include('class="ptags"')
    expect(last_response.body).to include('# filed under')
    expect(last_response.body).to include('class="chip"')
    expect(last_response.body).to include('class="author"')
    expect(last_response.body).to include('Ritchie Macapinlac')
  end
end
