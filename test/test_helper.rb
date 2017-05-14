ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/reporters"
require 'vcr'
require 'webmock/minitest'

require 'simplecov'
SimpleCov.start

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
     fixtures :all

     VCR.configure do |config|
          config.cassette_library_dir = 'test/cassettes'
          config.hook_into :webmock
          config.default_cassette_options = {
          :record => :new_episodes,
          :match_requests_on => [:method, :uri, :body]
          }

          config.filter_sensitive_data("<EDAMAM_ID>") do
            ENV['EDAMAM_ID']
          end

          config.filter_sensitive_data("<EDAMAM_KEY>") do
            ENV['EDAMAM_KEY']
          end
     end
end
