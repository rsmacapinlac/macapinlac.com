# frozen_string_literal: true

require_relative '../spec_helper'

RSpec.describe 'Google Fonts Integration' do
  it 'loads the new font stack correctly' do
    get '/'
    expect(last_response).to be_ok
    
    # Check that Google Fonts are loaded
    expect(last_response.body).to include('fonts.googleapis.com')
    expect(last_response.body).to include('Lora')
    expect(last_response.body).to include('Crimson+Text')
    expect(last_response.body).to include('Inter')
    
    # Verify font-display: swap is configured
    expect(last_response.body).to include('display=swap')
  end

  it 'has proper font preconnect links' do
    get '/'
    expect(last_response).to be_ok
    
    # Check preconnect links for performance optimization
    expect(last_response.body).to include('rel="preconnect"')
    expect(last_response.body).to include('href="https://fonts.googleapis.com"')
    expect(last_response.body).to include('href="https://fonts.gstatic.com"')
  end
end 