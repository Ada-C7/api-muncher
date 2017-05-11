require 'test_helper'

describe EdamamApiWrapper do

  describe "Testing self.search" do
    before do
      VCR.insert_cassette("edamam")
    end
    after do
      VCR.eject_cassette("edamam")
    end

    it "can get a list of recipes" do
      recipes = EdamamApiWrapper.search("apple")
      recipes.must_be_instance_of Array

      recipes.each do |recipe|
        recipe.must_be_instance_of Recipe
      end
    end

    it "will return an empty array with invalid arguments for edamam" do
      recipes = EdamamApiWrapper.search("a")
      recipes.must_equal []
    end
  end

  describe "Testing self.show_recipe" do
    before do
      VCR.insert_cassette("show_recipe")
    end
    after do
      VCR.eject_cassette("show_recipe")
    end

    it "Can find a recipe with a valid uri" do
      recipe = EdamamApiWrapper.show_recipe('http://www.edamam.com/ontologies/edamam.owl%23recipe_637913ec61d9da69eb451818c3293df2')

      recipe.name.must_equal "Dijon and Tarragon Grilled Chicken"
      recipe.uri.must_equal "http://www.edamam.com/ontologies/edamam.owl%23recipe_637913ec61d9da69eb451818c3293df2"
      recipe.url.must_equal "http://www.epicurious.com/recipes/food/views/Dijon-and-Tarragon-Grilled-Chicken-105171"
      recipe.r_yield.must_equal 6
      recipe.diet_labels.must_equal ["Low-Carb"]
      recipe.calories.must_equal 948
      recipe.ingredients.must_be_instance_of Array
      recipe.ingredients.must_equal ["1/3 cup chopped fresh tarragon", "1/4 cup dijon mustard", "1/4 cup dry white wine", "1 tablespoon olive oil", "1 tablespoon honey", "2 chickens (each about 3 1/4 pounds), each cut into 2 legs, thighs and wings and 4 breast pieces"]
    end

    it "Will return nil when given an invalid Edamam recipe uri" do
      recipe = EdamamApiWrapper.show_recipe('http://www.edamam.com/ontologies/edamam.owl/bad_recipe')

      recipe.must_equal nil
    end
  end
end
