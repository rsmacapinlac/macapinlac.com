# frozen_string_literal: true

require 'simplecov'
require 'simplecov-console'

SimpleCov.start do
  # Set minimum coverage thresholds
  minimum_coverage 90
  minimum_coverage_by_file 80
  maximum_coverage_drop 5

  # Enable branch coverage
  enable_coverage :branch

  # Add coverage filters
  add_filter '/spec/'
  add_filter '/.bundle/'
  add_filter '/vendor/'
  add_filter '/config/'
  add_filter '/build/'
  add_filter '/.git/'

  # Configure coverage report formats
  formatter SimpleCov::Formatter::MultiFormatter.new([
    SimpleCov::Formatter::HTMLFormatter,
    SimpleCov::Formatter::Console
  ])

  # Track all files in source directory
  track_files "source/**/*.{rb,erb,builder,js,scss,css}"

  # Group files by type
  add_group 'Source', 'source'
  add_group 'Layouts', 'source/layouts'
  add_group 'Stylesheets', 'source/stylesheets'
  add_group 'JavaScripts', 'source/javascripts'
  add_group 'Images', 'source/images'
end 