# frozen_string_literal: true

require_relative '../spec_helper'

RSpec.describe 'Blog' do
  it 'has blog posts' do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to include('Blog')
  end
end