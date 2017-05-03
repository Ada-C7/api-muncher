require 'test_helper'

describe EdamamSearch do

  describe 'initialize' do
    it 'requires search text' do
      text = "mushrooms"
      search = EdamamSearch.new(text)
      search.must_be_instance_of EdamamSearch
      search.search_text.must_equal text
    end

    it 'will raise error if not given search text' do
      proc {
        EdamamSearch.new
      }.must_raise ArgumentError
    end
  end

  describe 'search_results' do
    it 'gets results from Edamam' do
      VCR.use_cassette("search_results") do
        search_input = EdamamSearch.new("duck")
        response = search_input.search_results
        # p response["count"]
        # p response["hits"].count

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
        search_input = EdamamSearch.new("dafjkaljdaklj")
        response = search_input.search_results
        p response
        response.must_equal "Sorry there are no results for that search"

      end
    end

    # it 'raises an error if something goes wrong ' do
    # end
  end
end
