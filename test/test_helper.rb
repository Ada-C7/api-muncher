require 'simplecov'
SimpleCov.start

ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/reporters"  # for Colorized output
require 'vcr'
require 'webmock/minitest'

Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new, Minitest::Reporters::JUnitReporter.new]

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
    VCR.configure do |config|
        config.cassette_library_dir = 'test/cassettes'
        config.hook_into :webmock
        config.default_cassette_options = {
            :record => :new_episodes,    # record new data when we don't have it yet
            :match_requests_on => [:method, :uri, :body] # The http method, URI and body of a request all need to match
        }
        config.filter_sensitive_data("<RECIPE_APP_ID>") do
            ENV['RECIPE_APP_ID']
        end

        config.filter_sensitive_data("<RECIPE_KEY>") do
            ENV['RECIPE_KEY']
        end
    end
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  # Add more helper methods to be used by all tests here...
end
