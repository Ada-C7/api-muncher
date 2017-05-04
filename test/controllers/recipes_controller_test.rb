require "test_helper"

describe RecipesController do
  describe 'index' do
    before do
      search_params = {
                        search_text: "cookies",
                        from: 0,
                        to: 0
                      }
    end
    it 'returns the index page/search results with results' do
      VCR.use_cassette("search_results") do
        get recipes_path("cookies")
        must_respond_with :success
      end
    end

    it 'returns the index page/search results with no results' do
      VCR.use_cassette("search_results") do
        get recipes_path("dlfjakldfjakldfjakl")
        must_respond_with :success
      end
    end
  end
end
