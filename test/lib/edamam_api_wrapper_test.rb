require 'test_helper'

describe EdamamApiWrapper do
  before do
    VCR.insert_cassette("recipe")
  end
  after do
    VCR.eject_cassette("recipe")
  end

  describe "listRecipes" do
    it "returns an array of Recipes" do
      recipes = EdamamApiWrapper.listRecipes("chocolate")
      recipes.must_be_instance_of Array

      recipes.each do |recipe|
        recipe.must_be_instance_of Recipe
      end
    end

    it "returns an empty array with a bad app_id, app_key, or invalid search term" do
      recipes = EdamamApiWrapper.listRecipes("chocolate", "bad id", "bad key")
      recipes.must_equal []

      recipes = EdamamApiWrapper.listRecipes("testing")
      recipes.must_equal []

      recipes = EdamamApiWrapper.listRecipes("testing", "bad id", "bad key")
      recipes.must_equal []
    end

    it "raises ArgumentError if no search term" do
      proc { EdamamApiWrapper.listRecipes }.must_raise ArgumentError
    end
  end

  describe "showRecipe" do
    it "can get a recipe given a valid recipe_id" do
      skip
      #   id = "C557BP9QE"
      #   recipe = EdamamApiWrapper.getRecipe(id)
      #
      #   recipe.must_be_instance_of Recipe
      #   recipe.name.must_equal "stacks_api_testing"
      #   recipe.id.must_equal id
    end

    it "can get a recipe given a valid recipe_id" do
      skip
      # id = ":("
      # recipe = EdamamApiWrapper.getRecipe(id)
      # recipe.must_equal false
      # end
    end
  end
end
