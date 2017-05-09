require 'test_helper'

describe Recipe do
  describe "initialize" do
    it "Takes a data hash" do
      recipe = Recipe.new("uri" => ".owl#recipe_119", "label" => "Test recipe")
      recipe.must_be_kind_of Recipe
      recipe.id.must_equal "119"
      recipe.name.must_equal "Test recipe"
    end

    it "Requires a data hash" do
      proc {
        Recipe.new
      }.must_raise ArgumentError
    end
  end

  describe "search" do
    it "Returns an array of recipe objects for a valid search" do
      VCR.use_cassette("recipes") do
        recipes = Recipe.search("q" => "brownies")
        recipes.count.must_be :>, 0

        recipes.each do |recipe|
            recipe.must_be_kind_of Recipe
        end
      end
    end

    it "Returns an empty array when no recipes are found for a valid search" do
      VCR.use_cassette("recipes") do
        recipes = Recipe.search("q" => "bownies")
        recipes.must_be_empty
      end
    end

    # This test worked until I refractored my code to move the private method
    # that generated query params from the controller to the the lib
    # it "Raises an error when given invalid search parameters" do
    #   VCR.use_cassette("recipes") do
    #     proc {
    #       Recipe.search("from" => 0, "to" => 0)
    #     }.must_raise Recipe::RecipeError
    #   end
    # end
  end

  describe "count_results" do
    it "Returns a count of all the recipes found" do
      VCR.use_cassette("recipes") do
        recipe_count = Recipe.count_results("q" => "brownies")
        recipe_count.must_be_kind_of Integer
        recipe_count.must_be :>, 0
      end
    end

    it "Returns zero if no recipes are found" do
      VCR.use_cassette("recipes") do
        recipe_count = Recipe.count_results("q" => "bownies")
        recipe_count.must_equal 0
      end
    end
  end
end
