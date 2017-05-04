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

      recipes = EdamamApiWrapper.listRecipes("abcdefghijklmnop")
      recipes.must_equal []

      recipes = EdamamApiWrapper.listRecipes("abcdefghijklmnop", "bad id", "bad key")
      recipes.must_equal []
    end

    it "raises ArgumentError if no search term" do
      proc { EdamamApiWrapper.listRecipes }.must_raise ArgumentError
    end
  end

  describe "showRecipe" do
    it "can get a recipe given a valid recipe_id" do
        id = "http://www.edamam.com/ontologies/edamam.owl%23recipe_014db7797cad02460ab565a740d56f2d"
        recipe = EdamamApiWrapper.getRecipe(id)

        recipe.must_be_instance_of Recipe
        recipe.id.must_equal id
        recipe.label.must_equal "Chocolate-Peanut Butter Terrine with Sugared Peanuts"
        recipe.image.must_equal "https://www.edamam.com/web-img/41a/41a0a57253138f0bd3fec5e091a3459d.jpg"
    end

    it "cannot get a recipe without a valid recipe_id" do
      id = ":("
      recipe = EdamamApiWrapper.getRecipe(id)
      recipe.must_equal false
    end
  end
end
