# frozen_string_literal: true

require_relative '../spec_helper'

RSpec.describe 'Homepage' do
  it 'contains macapinlac site branding' do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to include('macapinlac')
    expect(last_response.body).to include('site-title')
  end
end 