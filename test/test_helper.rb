ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require 'vcr'
require 'webmock/minitest'
require "minitest/reporters"  # for Colorized output

#  For colorful output!
# Minitest::Reporters.use!(
# Minitest::Reporters::SpecReporter.new,
# ENV,
# Minitest.backtrace_filter
# )
Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new, Minitest::Reporters::JUnitReporter.new, Minitest::Reporters::DefaultReporter.new(:color => true)]

# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
# require "minitest/rails/capybara"

# Uncomment for awesome colorful output
# require "minitest/pride"

class ActiveSupport::TestCase
  #setting up VCR
  VCR.configure do |config|
    config.cassette_library_dir = "test/cassettes"
    config.hook_into :webmock
    config.default_cassette_options = {
      record: :new_episodes,
      match_requests_on: [:method, :uri, :body]
    }
    config.filter_sensitive_data("<EDAMAM_APP_ID>") { ENV["EDAMAM_APP_ID"] }
    config.filter_sensitive_data("<EDAMAM_APP_KEY>") { ENV["EDAMAM_APP_KEY"] }
  end

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  # Add more helper methods to be used by all tests here...
end
