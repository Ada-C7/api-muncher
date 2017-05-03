require 'test_helper'

describe EdamamWrapper do

  describe "getRecipes" do
    it "can return a collection of recipes given a single search term" do
      VCR.use_cassette("recipes") do
        search_term = "banana"
        response = EdamamWrapper.getRecipes(search_term)
        response.first.class.must_equal Recipe
      end
    end

    it "doesn't freak out if there are spaces in the search term" do
      VCR.use_cassette("recipes") do
        search_term = "snow peas"
        response = EdamamWrapper.getRecipes(search_term)
        response.first.class.must_equal Recipe
      end

    end

    it "returns an empty array if the search doesn't return anything" do
      VCR.use_cassette("recipes") do
        search_term = "Martian snakes"
        response = EdamamWrapper.getRecipes(search_term)
        response.must_equal []
      end
    end


  end

end
