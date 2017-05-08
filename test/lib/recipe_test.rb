require 'test_helper'

describe Recipe do
  describe "initialize" do
    it "creates an instance" do
      recipe = Recipe.new
      recipe.must_be_instance_of Recipe
    end
  end

  describe "send_search" do
    it "can send search query" do
        VCR.use_cassette("recipes") do
          recipe = Recipe.new
          recipe.send_search("pasta", 0, 10, nil)
        end
    end

    it "fails to search without a search word" do
        VCR.use_cassette("recipes") do
          recipe = Recipe.new
          recipe.send_search().must_raise Recipe::RecipeException
        end
    end
  end
end
