ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/reporters"  # for Colorized output
require 'vcr'
require 'webmock/minitest'
require 'simplecov'

SimpleCov.start do
  add_filter "/test/"
end


#  For colorful output!
Minitest::Reporters.use!(
  Minitest::Reporters::SpecReporter.new,
  ENV,
  Minitest.backtrace_filter
)


# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
# require "minitest/rails/capybara"

# Uncomment for awesome colorful output
# require "minitest/pride"

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  VCR.configure do |config|
  #where to store the recorded tests (some people put them in fixtures)
  config.cassette_library_dir = 'test/cassettes'

  #tell VCR to use webmock to simultate
  config.hook_into :webmock
  #if no cassette, record a new episode
    #decides which cassette to use based on HTTP verb, uri and body of message
  config.default_cassette_options = {record: :new_episodes, match_requests_on: [:method, :uri, :body] }

  #how to hide all tokens??
  config.filter_sensitive_data( "<EDAMAM_ID>" ) do
    ENV[ "EDAMAM_ID" ]
  end
  config.filter_sensitive_data( "<EDMAM_KEY>" ) do
    ENV[ "EDAMAM_KEY" ]
  end
end
  # Add more helper methods to be used by all tests here...
end
