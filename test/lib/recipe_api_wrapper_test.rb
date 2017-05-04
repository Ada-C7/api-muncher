require 'test_helper'
describe Recipe_Api_Wrapper do
  # before do
  #   VCR.insert_cassette("recipes")
  # end
  # after do
  #   VCR.eject_cassette("recipes")
  # end

  it "Can get a list of recipes" do
    VCR.use_cassette("edamam") do
      name = "chicken"
      recipes = Recipe_Api_Wrapper.getRecipeList(name)
      recipes.must_be_instance_of Array
      recipes.each do |recipe|
        recipe.must_be_instance_of Channel
      end
    end
  end
end
