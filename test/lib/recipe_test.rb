require 'test_helper'

describe Recipe do
  describe "search" do
    it "Can find recipe(s) with a valid search" do
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
        # recipes = Recipe.search("fake")
        # recipes.must_equal 404
        proc {
          Recipe.search("from" => nil, "to" => nil, "q" => nil)
        }.must_raise Recipe::RecipeError
      end
    end

    #returns an empty array when no recieps are found

    #finds
  end
end
