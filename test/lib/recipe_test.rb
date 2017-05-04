require 'test_helper'

describe Recipe do


  let(:recipe_params) { {name: "food", image:"picture of food", id: 2345, original_url: "url"} }
  let(:new_recipe) {Recipe.new(recipe_params)}

  describe "initialize" do
    it "Takes a hash, and assigns name, image, id, original_url" do
      new_recipe.name.must_equal recipe_params[:name]
    end

    it "Requires a hash" do
      proc {
        Recipe.new
      }.must_raise ArgumentError
    end
  end

  describe "search" do
    it "Can search for recipes based on a search term, and returns and array of recipes" do
      VCR.use_cassette("recipes") do
        recipes = Recipe.search("blueberry")
        recipes.class.must_equal Array

        recipes.each do |recipe|
          recipe.class.must_equal Recipe
        end
      end
    end

    it "Returns an empty array of if given a bogus search term" do
      VCR.use_cassette("recipes") do
        recipes = Recipe.search("XXXXXXX")
        recipes.class.must_equal Array
        recipes.length.must_equal 0
      end
    end

    it "Raises an ArgumentError if no parameter is given" do
      VCR.use_cassette("recipes") do
        proc {
          Recipe.search
        }.must_raise ArgumentError
      end
    end
  end

end
