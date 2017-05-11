require 'test_helper'

describe "Recipe" do

  describe "initialize" do
    it "creates a new recipe" do
      recipe_hash_params = {
        uri: "d38d01540acb03fba45e4ac2660627ac",
        label: "Jerk Chicken",
        image: "onejerkofachicken.jpg",
        url: "morechickenplease",
        health_labels: ["Gluten-Free, Soy-Free"],
        ingredient_lines: ["chicken", "ingredients"]
      }
      new_recipe = Recipe.new(recipe_hash_params)
      new_recipe.label.must_equal "Jerk Chicken"
      new_recipe.uri.must_equal "d38d01540acb03fba45e4ac2660627ac"
    end

    it "throws an error with bad data" do
      proc { Recipe.new }.must_raise ArgumentError
    end
  end

  describe "self.all_recipes" do
    it "takes a search and returns recipes" do
      VCR.use_cassette("recipes") do
        Recipe.all_recipes("chicken")
      end
    end

    it "raises an error if the search result is invalid or doesn't have results" do
      VCR.use_cassette("recipe") do
        proc { Recipe.all_recipes() }.must_raise ArgumentError
      end
    end
  end

  describe "a_recipe" do
    it "shows an individual recipe" do
      #not sure why this test isn't passing 
      VCR.use_cassette("recipe") do
        indv_recipe = Recipe.a_recipe("http://www.edamam.com/ontologies/edamam.owl#recipe_e2549c3c0b77ba275fe64e623a4daea2")
        indv_recipe.label.must_equal "Pizza Pizzas"
      end
    end

  end

end
