require 'test_helper'

describe RecipesController do
  describe 'search' do
    it 'successful search term returns index page' do
      VCR.use_cassette('recipes') do
        post recipes_path, params: { search: 'arugula'}
        must_respond_with :success
      end
    end
    it 'unsuccessful search term redirects to root page' do
      VCR.use_cassette('recipes') do
        post recipes_path, params: { search: 'fdsferfgghfjgbn'}
        must_respond_with :redirect
        flash[:messages].must_equal 'Search did not yield any results.'
      end
    end
  end
end
