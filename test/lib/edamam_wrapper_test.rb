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

  describe "findRecipe" do
    it "returns a single recipe given a valid recipe ID" do
      VCR.use_cassette("recipes") do
        id = "http://www.edamam.com/ontologies/edamam.owl%23recipe_a5306563833d2dc47dce23b814833124"
        response = EdamamWrapper.findRecipe(id)
        response.class.must_equal Recipe
      end
    end

    it "returns nil if no recipe is returned" do
      VCR.use_cassette("recipes") do
        id = "totally_made_up_id"
        response = EdamamWrapper.findRecipe(id)
        response.must_be_nil
      end

    end
  end

end
