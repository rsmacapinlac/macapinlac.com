# frozen_string_literal: true

require_relative '../spec_helper'

RSpec.describe 'Homepage' do
  it 'contains macapinlac site branding in the terminal header' do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to include('macapinlac.com')
    expect(last_response.body).to include('term-bar')
    expect(last_response.body).to include('class="ps1"')
  end

  it 'serves a terminal-style shell prompt in the header' do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to include('@ ritchie')
    expect(last_response.body).to include('~ %')
  end
end
