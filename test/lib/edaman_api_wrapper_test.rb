require "test_helper"

describe EdamamApiWrapper do

  it "should get index with a valid search term" do
    VCR.use_cassette("edamam") do
    recipes = EdamamApiWrapper.listRecipes("chicken")
    recipes.must_be_instance_of Array
   end
  end

  it "should get index with a valid search term AND health option" do
    VCR.use_cassette("edamam") do
    recipes = EdamamApiWrapper.listRecipes("cheese", "vegan")
    recipes.must_be_instance_of Array
   end
  end

  it "should return no recipes if given invalid health option" do
    VCR.use_cassette("edamam") do
    recipes = EdamamApiWrapper.listRecipes("cheese", "blah")
    recipes.length.must_equal 0
   end
  end

  it "should get index with a valid search term" do
    VCR.use_cassette("edamam") do
    recipes = EdamamApiWrapper.listRecipes("oihsdfo")
    recipes.must_be_instance_of Array
    recipes.length.must_equal 0
   end
  end

  it "should get show with a valid recipe url" do
    VCR.use_cassette("edamam") do
    recipe = EdamamApiWrapper.getRecipe("29f79e3691f3732cfb97c459fa925f65")
    recipe.must_be_instance_of Recipe
   end
  end

  it "should return nil with a invalid recipe url" do
    VCR.use_cassette("edamam") do
    recipe = EdamamApiWrapper.getRecipe("zzzzzzzzzzzz")
    recipe.must_be_nil
   end
  end

end
