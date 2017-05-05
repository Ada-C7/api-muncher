require 'test_helper'

describe EdamamApiWrapper do
  describe "self.listRecipes(search_term, page)" do
    it "Gets a list of recipes" do
      VCR.use_cassette("recipe") do
        recipes = EdamamApiWrapper.listRecipes("carrot", "1")

        recipes.must_be_instance_of Array
        recipes.each do |recipe|
          recipe.must_be_instance_of Recipe
        end
        recipes.first.name.must_equal "Carrots Braised in Beer and Carrot Juice"
      end
    end

    it "Returns an empty array with a bad parameter" do
      VCR.use_cassette("recipe") do
        recipes = EdamamApiWrapper.listRecipes("stupid", 0)
        recipes.must_equal []
      end
    end
  end

  describe "self.findRecipe(id)" do
    it "Gets a recipe given a valid id" do
      VCR.use_cassette("recipe") do
        id = "79595042d41596f74364316e098a3741"
        recipe = EdamamApiWrapper.findRecipe(id)

        recipe.must_be_instance_of Recipe
        recipe.name.must_equal "Deborah Madison's Ivory Carrot Soup with a Fine Dice of Orange Carrots"
      end
    end

    it "Returns false for an invalid id" do
      VCR.use_cassette("recipe") do
        id = "bad id"
        recipe = EdamamApiWrapper.findRecipe(id)
        recipe.wont_be_instance_of Recipe
        recipe.must_be_nil
      end
    end
  end
end
