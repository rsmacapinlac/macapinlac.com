# frozen_string_literal: true

require_relative '../spec_helper'

RSpec.describe 'Google Fonts Integration (Build Log)' do
  it 'loads Lora, Inter, JetBrains Mono and Crimson Text' do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to include('fonts.googleapis.com')
    expect(last_response.body).to include('Lora')
    expect(last_response.body).to include('Inter')
    expect(last_response.body).to include('JetBrains+Mono')
    expect(last_response.body).to include('Crimson+Text')
    expect(last_response.body).to include('display=swap')
  end

  it 'has font preconnect links for performance' do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to include('rel="preconnect"')
    expect(last_response.body).to include('href="https://fonts.googleapis.com"')
    expect(last_response.body).to include('href="https://fonts.gstatic.com"')
  end
end
