require 'test_helper'
describe Recipe_Api_Wrapper do
  before do
    VCR.insert_cassette("recipes")
  end
  after do
    VCR.eject_cassette("recipes")
  end

  describe "Testing self.listRecipes" do
    it "Can get a list of recipes" do
      recipes = Recipe_Api_Wrapper.listRecipes("pie")
      recipes.must_be_instance_of Array
      recipes.each do |recipe|
        recipe.must_be_instance_of Recipe
      end
    end

    it "Will return nil with a bad token" do
      recipes = Recipe_Api_Wrapper.listRecipes("Bad token")
      recipes.must_equal nil
    end
  end

  describe "Testing self.showRecipe" do
    it "Can get a recipe given a valid recipe id" do
      recipes = Recipe_Api_Wrapper.listRecipes("pie")
      recipe = Recipe_Api_Wrapper.showRecipe(recipes[0].uri)
      recipe.each do |info|
        info.label.must_equal "Nectarine Hand Pies"
      end
    end
  end
end
