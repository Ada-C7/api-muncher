require 'test_helper'

describe RecipesController do
  describe 'search' do
    it 'successful search term returns index page' do
      VCR.use_cassette('recipes') do
        post recipes_path, params: { search: 'arugula', page: 1 }
        assert_response :success
      end
    end

    it 'unsuccessful search term redirects to root page' do
      VCR.use_cassette('recipes') do
        post recipes_path, params: { search: 'fdsferfgghfjgbn', page: 1 }
        assert_response :redirect
        assert_redirected_to root_path
        flash[:messages].must_equal 'Search did not yield any results.'
      end
    end

    it 'empty search term redirects to root page' do
      VCR.use_cassette('recipes') do
        post recipes_path, params: { search: '' }
        assert_response :redirect
        assert_redirected_to root_path
        flash[:messages].must_equal 'Search did not yield any results.'
      end
    end
  end

  describe 'show_recipe' do
    it 'valid uri returns page' do
      VCR.use_cassette('recipes') do
        uri = '#recipe_5e7b278b580ccea8ab485607dff5416a'
        get show_recipe_path(uri)
        assert_response :success
      end
    end

    it 'invalid uri redirects to search page' do
      VCR.use_cassette('recipes') do
        uri = '#recipe_gfljkhfsgjlhksfgkjhdsfgfghf'
        get show_recipe_path(uri)
        assert_response :redirect
        flash[:messages].must_equal 'Something went wrong. Ramen for you.'
      end
    end
  end
end
