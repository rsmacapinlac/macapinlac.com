# frozen_string_literal: true

require 'spec_helper'
require 'nokogiri'
require 'set'

# Crawls a handful of high-value index pages and asserts every internal href
# resolves to a 200. This catches data-driven regressions like a /tags/ card
# linking to a tag that has no posts (and therefore no generated page).
RSpec.describe 'Internal link integrity (Build Log)' do
  ENTRY_POINTS = [
    '/',
    '/archive.html',
    '/about.html',
    '/tags/',
    '/tags/playing-with-ai.html',
    '/series/building-with-ai-website-redesign.html',
    '/2025/08/01/ai-and-the-art-of-overcomplicating-simple-things.html',
    '/404.html',
  ].freeze

  # Don't follow these — they're either external, anchors, mailto links, or
  # have legitimate reasons not to return 200 directly.
  SKIP_PREFIXES = %w[http:// https:// mailto: # /__rack/].freeze

  def head_or_get(path)
    get path
    last_response.status
  end

  ENTRY_POINTS.each do |entry|
    it "resolves all internal links on #{entry}" do
      get entry
      expect(last_response.status).to eq(200), "expected #{entry} to be 200, was #{last_response.status}"

      doc = Nokogiri::HTML(last_response.body)
      hrefs = doc.css('a[href], link[rel="manifest"], link[rel="icon"], link[rel="apple-touch-icon"]')
                 .map { |el| el['href'] }
                 .compact
                 .map(&:strip)
                 .reject(&:empty?)
                 .reject { |h| SKIP_PREFIXES.any? { |p| h.start_with?(p) } }
                 .map { |h| h.split('#', 2).first }
                 .reject(&:nil?)
                 .reject(&:empty?)
                 .uniq

      broken = []
      hrefs.each do |href|
        status = head_or_get(href)
        broken << "#{href} → #{status}" unless status == 200
      end
      expect(broken).to be_empty,
        "Broken internal links on #{entry}:\n  " + broken.join("\n  ")
    end
  end

  it 'exposes the site manifest at the linked path' do
    get '/'
    doc = Nokogiri::HTML(last_response.body)
    href = doc.at_css('link[rel="manifest"]')&.[]('href')
    expect(href).not_to be_nil
    get href
    expect(last_response.status).to eq(200), "manifest #{href} returned #{last_response.status}"
  end

  it 'redirects /writing/ to the new archive route' do
    get '/writing/'
    expect(last_response.status).to eq(200)
    expect(last_response.body).to include('url=/archive.html')
    expect(last_response.body).to include('rel="canonical" href="/archive.html"')
  end

  it 'no longer serves a top-level /series.html template fallback' do
    get '/series.html'
    expect(last_response.status).to eq(404),
      "/series.html should not exist as a standalone page; it's only a proxy source"
  end

  it 'no longer serves the removed /series/ index' do
    get '/series/'
    expect(last_response.status).to eq(404)
    get '/series/index.html'
    expect(last_response.status).to eq(404)
  end
end
