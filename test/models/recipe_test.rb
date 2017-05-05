require "test_helper"

describe Recipe do

  it "can create a valid recipe" do
    recipe = Recipe.create(user_id: 1, name: "a tasty recipe", recipe_url: "a url")
    recipe.must_be_instance_of Recipe

  end

  it "must fail without recipe_url" do
      recipe = Recipe.new()
      recipe.save.must_equal false
  end

  it "must fail without name" do
    recipe = Recipe.new(recipe_url: "recipe_url")
    recipe.save.must_equal false
  end

  it "must fail without user_id" do
    recipe = Recipe.new(recipe_url: "recipe_url", name: "name")
    recipe.save.must_equal false
  end



  it "must have attributes" do
    recipe = Recipe.create(recipe_url: "recipe_url", name: "name", user_id: 1)
    recipe.recipe_url.must_equal "recipe_url"
    recipe.name.must_equal "name"
    recipe.user_id.must_equal 1

  end
end
