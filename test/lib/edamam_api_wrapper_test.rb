require 'test_helper'

describe EdamamApiWrapper do
  describe "Testing self.searchRecipes" do
    it "Can get a list of recipes, 10(or less) at a time" do
      VCR.use_cassette("recipes") do
        response  = EdamamApiWrapper.searchRecipes("chicken", 0)
        recipes = response[0]
        recipes.each do | recipe |
          recipe.must_be_instance_of Recipe
        end
        recipes.length.must_be :<=, 10

        response  = EdamamApiWrapper.searchRecipes("pig snout", 0)
        recipes = response[0]
        recipes.each do | recipe |
          recipe.must_be_instance_of Recipe
        end
        recipes.length.must_be :<=, 10
      end
    end

    it "default the beginning index to 0, when parameter for from is nil" do
      VCR.use_cassette("recipes") do
        response  = EdamamApiWrapper.searchRecipes("mango", nil)
        recipes = response[0]
        recipes.each do | recipe |
          recipe.must_be_instance_of Recipe
        end
        recipes.length.must_be :<=, 10
      end
    end

    it "Returns an empty array with bad search term" do
      VCR.use_cassette("recipes") do
        response  = EdamamApiWrapper.searchRecipes("xqy$", 0)
        recipes = response[0]
        recipes.must_equal []
      end
    end
  end

  describe "Testing self.getRecipe" do
    it "can get a recipe given a valid recipe uri" do
      VCR.use_cassette("recipes") do
        recipe = EdamamApiWrapper.getRecipe("http://www.edamam.com/ontologies/edamam.owl#recipe_c748acc6945e3ed9b8e46d6f6489f781")
        recipe.must_be_instance_of Recipe
        recipe.label.must_equal "Ham, Cheese, and Pickle Skewers"
        recipe.uri.must_equal "http://www.edamam.com/ontologies/edamam.owl#recipe_c748acc6945e3ed9b8e46d6f6489f781"
      end
    end

    it "returns nil for an invalid recipe" do
      VCR.use_cassette("recipes") do
        recipe = EdamamApiWrapper.getRecipe("bad uri")
        recipe.must_be_nil
      end
    end
  end
end
