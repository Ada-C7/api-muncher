require 'test_helper'
describe Recipe_Api_Wrapper do
  before do
    VCR.insert_cassette("recipes")
  end
  after do
    VCR.eject_cassette("recipes")
  end
  
  it "Can get a list of recipes" do
    recipes = Recipe_Api_Wrapper.listRecipes("durian")
    recipes.must_be_instance_of Array
    recipes.each do |recipe|
      recipe.must_be_instance_of Recipe
    end

  end
end
