require 'test_helper'


describe EdamamApiWrapper do
  before do
    VCR.insert_cassette("edamam")
  end

  after do
    VCR.eject_cassette("edamam")
  end

  describe "Test self.listRecipes" do
    it "can get a list of Recipes" do
      recipes = EdamamApiWrapper.listRecipes("apple pie")
      recipes.must_be_instance_of Array
      recipes.each do |recipe|
        recipe.must_be_instance_of Recipe
      end
    end

    it "will return an empty Array with an empty string search" do
      recipes = EdamamApiWrapper.listRecipes("")
      recipes.must_be_instance_of Array
      recipes.length.must_equal 0
    end


  end

  describe "Test self.getRecipe" do

    it "returns a recipe with a valid id" do
      recipe = EdamamApiWrapper.getRecipe("86d1850abc8e15b20f0bdec30647839a")
      recipe.must_be_instance_of Recipe
      recipe.id.wont_be_nil
    end

    it "returns 404 for an invalid recipe id" do

    end

  end

end
