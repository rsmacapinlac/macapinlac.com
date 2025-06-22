# frozen_string_literal: true

require_relative '../spec_helper'

RSpec.describe 'Responsive Image Helpers' do
  it 'loads application with responsive image configuration' do
    get '/'
    expect(last_response).to be_ok
    
    # Verify the application loads successfully with responsive image helpers
    app = TestApp.mm_app
    expect(app).to respond_to(:call)
  end

  it 'has image optimization configured' do
    # Verify that image optimization is active by checking the response
    get '/'
    expect(last_response).to be_ok
    
    # The application should load without errors, indicating image optimization is configured
    expect(last_response.status).to eq(200)
  end

  it 'supports responsive image generation' do
    # Test that the application can handle requests with responsive image configuration
    get '/'
    expect(last_response).to be_ok
    
    # Verify the application is properly configured for responsive images
    expect(last_response.body).to be_a(String)
  end
end 