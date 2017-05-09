ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/reporters"  # for Colorized output
require 'webmock/minitest'
require 'vcr'

Minitest::Reporters.use!(
  Minitest::Reporters::SpecReporter.new,
  ENV,
  Minitest.backtrace_filter
)

VCR.configure do |config|
  config.cassette_library_dir = 'test/cassettes' # folder where casettes will be located
  config.hook_into :webmock # tie into this other tool called webmock
  config.default_cassette_options = {
    :record => :new_episodes,    # record new data when we don't have it yet
    :match_requests_on => [:method, :uri, :body] # The http method, URI and body of a request all need to match
  }

  # filter_sensitive_data is a method that comes from the VCR gem
  config.filter_sensitive_data("<KEY>") do
    ENV['EDAMAM_KEY']
  end
  config.filter_sensitive_data("<ID>") do
    ENV['EDAMAM_ID']
  end
end

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  # Add more helper methods to be used by all tests here...

  def good_api_search
    search_params = { search_text: "cookies", from: 0, to: 10 }

    VCR.use_cassette("search_results") do
      search_input = EdamamSearch.new(search_params)
      return search_input.search_results
    end
  end
end
