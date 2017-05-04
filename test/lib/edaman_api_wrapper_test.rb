require "test_helper"

describe EdamamApiWrapper do

  it "should get root page w/ no recipes yet" do
    VCR.use_cassette("edamam") do
    recipes = EdamamApiWrapper.listRecipes("chicken")
    recipes.must_be_instance_of Array
   end
  end

  it "should get index with a valid search term" do
    VCR.use_cassette("edamam") do
    recipes = EdamamApiWrapper.listRecipes("chicken")
    recipes.must_be_instance_of Array
   end
  end

  it "should get show with a valid recipe url" do
    VCR.use_cassette("edamam") do
    recipe = EdamamApiWrapper.getRecipe("29f79e3691f3732cfb97c459fa925f65")
    recipe.must_be_instance_of Recipe
   end
  end

end
