require "test_helper"

describe RecipesController do
  describe 'index' do
    before do
      @params = {
                  search_text: "cookies",
                  from: "0"
                }
      @no_results = {
                      search_text: "cookies",
                      from: "0"
                    }
    end

    it 'returns the index page/search results with results' do
      VCR.use_cassette("search_results") do
        get recipes_path, params: @params
        must_respond_with :success
      end
    end

    it 'returns the index page/search results with no results' do
      VCR.use_cassette("search_results") do
        get recipes_path, params: @no_results
        must_respond_with :success
      end
    end
  end
end
