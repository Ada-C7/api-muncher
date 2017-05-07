require 'test_helper'

describe Recipe do

  let(:recipe_params) { {name: "food", image:"picture of food", id: 2345, original_url: "url", ingredients: ["food", "more food"], health_labels: ["food", "more food"], diet_labels: ["food", "more food"], calories: 234, yield: 33, calories_per_serving:333}}

  let(:new_recipe) {Recipe.new(recipe_params)}

  describe "initialize" do
    it "Takes a hash, and assigns name, image, id, original_url, ingredients, health_labels, diet_labels, calories, yield, calories_per_serving" do
      new_recipe.name.must_equal recipe_params[:name]
    end

    it "Requires a hash" do
      proc {
        Recipe.new
      }.must_raise ArgumentError
    end
  end

  describe "search" do
    it "Can search for recipes based on a search term and range and returns and array of recipes, and a total count" do
      VCR.use_cassette("recipes") do
        recipes, count = Recipe.search("blueberry", 4, 12)
        recipes.class.must_equal Array
        count.class.must_equal Integer

        recipes.each do |recipe|
          recipe.class.must_equal Recipe
        end
      end
    end

    it "Returns an empty array and a count of 0, if given a bogus search term" do
      VCR.use_cassette("recipes") do
      recipes, count = Recipe.search("XXXXXXX", 2, 10)
        recipes.class.must_equal Array
        recipes.length.must_equal 0
        count.must_equal 0
      end
    end

    it "Raises an ArgumentError if less than 3 parameters are given" do
      VCR.use_cassette("recipes") do
        proc {
          Recipe.search("food")
        }.must_raise ArgumentError
      end
    end
  end

  describe "getRecipe" do
    it "Can search for a specific recipe based on an id, and returns a Recipe" do
      VCR.use_cassette("recipes") do
        id = 'c92c402e57d06df096adbffc393010c5'
        steamed_salmon = Recipe.getRecipe(id)
        steamed_salmon.class.must_equal Recipe
        steamed_salmon.id.must_equal id
      end
    end
   end
 end
