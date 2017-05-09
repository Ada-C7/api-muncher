require "test_helper"

describe RecipesController do
  describe 'index' do
    before do
      @params = {
                  search_text: "cookies",
                  from: "0"
                }
      @no_results = {
                      search_text: "fdjlfalkdjfklajdal",
                      from: "0"
                    }
    end

    it 'returns the index page/search results with good results' do
      VCR.use_cassette("search_results") do
        get recipes_path, params: @params
        must_respond_with :success
      end
    end

    it 'returns the index page/search results with no results' do
      VCR.use_cassette("search_results") do
        get recipes_path, params: @no_results
      end
      flash[:failure].wont_be_nil
      must_redirect_to recipes_path
    end
  end

  describe 'show' do
    before do
      @good_id = "_6ffeacec6d0c6f8bc9aee1de19065537"
      @bad_id = "_dfjakldjfakljd9080890akflja88908"
    end

    it 'returns the show page with wanted recipe' do
      VCR.use_cassette("search_results") do
        get recipe_path(@good_id)
      end
      must_respond_with :success
    end

    it 'redirect to homepage and flashes error message if given bad id' do
      VCR.use_cassette("search_results") do
         get recipe_path(@bad_id)
      end
      flash[:failure].wont_be_nil
      must_redirect_to recipes_path
    end
  end
end
