# frozen_string_literal: true

# Load SimpleCov configuration
require 'simplecov'
require 'simplecov-console'
load File.join(File.dirname(__FILE__), '..', '.simplecov')

require 'middleman'
require 'middleman-core'
require 'middleman-core/rack'
require 'middleman-autoprefixer'
require 'middleman-blog'
require 'middleman-imageoptim'
require 'middleman-minify-html'
require 'middleman-livereload'
require 'rack/test'
require 'rspec'

# Load the Middleman application configuration
module TestApp
  def self.mm_app
    @app ||= begin
      root = File.expand_path(File.join(File.dirname(__FILE__), '..'))
      middleman = ::Middleman::Application.new do
        config[:root] = root
        config[:environment] = :test
        config[:watcher_disable] = true
        # Disable livereload in test environment
        config[:livereload] = false
      end
      Middleman::Rack.new(middleman).to_app
    end
  end
end

RSpec.configure do |config|
  config.include Rack::Test::Methods
  
  # Make the app method globally available
  config.include Module.new {
    def app
      TestApp.mm_app
    end
  }

  # Add coverage reporting to RSpec
  config.after(:suite) do
    SimpleCov.result.format!
  end
end
