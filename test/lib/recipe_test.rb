require 'test_helper'

describe Recipe do
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

    it "Raises an error when given invalid search parameters" do
      VCR.use_cassette("recipes") do
        proc {
          Recipe.search("from" => 0, "to" => 0, "q" => nil)
        }.must_raise Recipe::RecipeError
      end
    end


    #finds
  end
end
