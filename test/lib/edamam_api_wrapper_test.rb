require 'test_helper'

describe EdamamApiWrapper do
  before do
    VCR.insert_cassette("edamam")
  end

  after do
    VCR.eject_cassette("edamam")
  end

  describe "self.list_recipes" do
    it "can get a list of recipes" do
      recipes = EdamamApiWrapper.list_recipes("broccoli")
      recipes.must_be_instance_of Array

      recipes.each do |recipe|
        recipe.must_be_instance_of Recipe
      end
    end

    it "will return an empty array if no recipes are found" do
      recipes = EdamamApiWrapper.list_recipes("asdfjkl")
      recipes.must_equal []
    end
  end

  describe "self.get_recipe" do
    it "can get a recipe with a valid id" do
      recipe = EdamamApiWrapper.get_recipe("938758bcb9dc1de7953ee80525102921")
      recipe.must_be_instance_of Recipe
      recipe.label.must_equal "Chocolate Sorbet"
    end

    it "returns nil with an invalid recipe id" do
      recipe = EdamamApiWrapper.get_recipe("badID")
      recipe.must_be_nil
    end
  end
end
