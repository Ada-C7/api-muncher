require 'test_helper'

describe EdmamApiWrapper do

  describe "List Recipes" do

    it "Can get a list of recipes" do
      VCR.use_cassette("edmam") do

        recipes = EdmamApiWrapper.listRecipes()

        recipes.must_be_instance_of Array

        recipes.each do | recipe |
          recipe.must_be_instance_of Recipe
        end
      end
    end

    it "Will return an empty array with a bad token" do
      VCR.use_cassette("edmam") do

        recipes = EdmamApiWrapper.listRecipes("Bad token")

        recipes.must_equal []
      end
    end
  end

  describe "Get Recipe" do

    it "Can get a recipe given a valid recipe id" do
      VCR.use_cassette("edmam") do

        recipe = SlackApiWrapper.getRecipe("??????????????????????")

        recipe.must_be_instance_of Recipe
      end
    end

    it "Returns false for an invalid id" do
      VCR.use_cassette("edmam") do

        recipe = SlackApiWrapper.getRecipe("?????????")

        recipe.must_equal false
      end
    end
  end
end
