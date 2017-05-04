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
  end
  describe 'initialize' do

    it 'requires search hash' do
      search = EdamamSearch.new(@search_params)
      search.must_be_instance_of EdamamSearch
      # p search
      # search.search_text.must_equal text
    end

    it 'will raise an error if not given search_text' do
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
        # p response["count"]
        # p response

        # array of recipe results names with image url
        # x = response["hits"].map do |info|
        #   recipe = Hash.new
        #   recipe[:label] = info["recipe"]["label"]
        #   recipe[:image_url] = info["recipe"]["image"]
        #   recipe
        # end
        # p x
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

    # it 'raises an error if something goes wrong ' do
    # end
  end
end
