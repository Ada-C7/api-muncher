require 'test_helper'

describe EdamamSearch do

  before do
    @search_params = {
                      search_text: "cookies",
                      from: 0,
                      to: 10
                     }
    @no_results = {
                    search_text: "fadjkfaldjaflj",
                    from: 0,
                    to: 10
                   }
    @recipe = {
                recipe_id: "6ffeacec6d0c6f8bc9aee1de19065537"
              }
  end

  describe 'initialize' do

    it 'requires search info' do
      search = EdamamSearch.new(@search_params)
      search.must_be_instance_of EdamamSearch
    end

    it 'will raise an error if not given search info' do
      proc {
        EdamamSearch.new
      }.must_raise ArgumentError
    end
  end

  describe 'search_results' do
    it 'gets results from Edamam' do
      VCR.use_cassette("search_results") do
        search_input = EdamamSearch.new(@search_params)
        response = search_input.search_results
        # p response
        response.count.must_be :>, 0
      end
    end

    it 'response has count 0 when there are no results' do
      VCR.use_cassette("search_results") do
        search_input = EdamamSearch.new(@no_results)
        response = search_input.search_results
        response.must_be_nil
      end
    end

    it 'returns one recipe if there is a r search paramater' do
      VCR.use_cassette("search_results") do
        search_input = EdamamSearch.new(@recipe)
        response = search_input.search_results
        # p response
        response[:label].wont_be_nil
      end

    end

    # it 'raises an error if something goes wrong ' do
    # end
  end
end
