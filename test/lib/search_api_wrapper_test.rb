require 'test_helper'

describe "SearchApiWrapper" do
  before do
    VCR.insert_cassette("recipe")
  end

  after do
    VCR.eject_cassette("recipe")
  end

  describe "Testing self.listRecipes" do

    it "Can get a list of recipes" do
        recipes = SearchApiWrapper.listRecipes("chicken" )
        recipes.must_be_instance_of Array
        recipes.each do |recipe|
          recipe.must_be_instance_of Recipe
        end
    end

    it "Will return an empty array with invalid APP_ID and KEY_ID" do
        recipes = SearchApiWrapper.listRecipes("chicken", "eee", "")
        recipes.must_equal []
    end

    it "Will return empty array when there is no user search input " do

        recipes = SearchApiWrapper.listRecipes("")
        recipes.must_equal []
    end

    it "Will get list of recipes when user enters integer " do

        recipes = SearchApiWrapper.listRecipes("")
        recipes.must_be_kind_of Array
    end
  end

  describe "self.showRecipe" do
    it "Can show a recipe for a specific uri" do
        uri = "https://api.edamam.com/search?r=http://www.edamam.com/ontologies/edamam.owl%23recipe_637913ec61d9da69eb451818c3293df2"
        recipe = SearchApiWrapper.showRecipe(uri)
        recipe.must_be_instance_of Recipe
    end

    it "Requires a uri to show a recipe" do
         SearchApiWrapper.showRecipe("").must_equal nil
    end
  end
end
