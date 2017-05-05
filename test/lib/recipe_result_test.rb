require 'test_helper'

describe "RecipeResult" do

  it "requires 3 arguments to initialize" do
    proc {
      RecipeResult.new
    }.must_raise ArgumentError

    proc {
      RecipeResult.new("name")
    }.must_raise ArgumentError

    proc {
      RecipeResult.new("name", "image")
    }.must_raise ArgumentError
  end

  it "can create a RecipeResult instance" do
    recipe = RecipeResult.new("name", "image", "uri")

    recipe.class.must_equal RecipeResult

  end

  it "can create a recipe with optional params" do

    recipe = RecipeResult.new("name", "id", "uri", "recipe_url", "ingredients", "health_labels", "recipe_source", "nutrients")

    recipe.class.must_equal RecipeResult
  end

  it "has the accessor methods" do
    recipe = RecipeResult.new("name", "image", "uri", "recipe_url", "ingredients", "health_labels", "recipe_source", "nutrients")

    recipe.name.must_equal "name"
    recipe.image.must_equal "image"
    recipe.uri.must_equal "uri"
    recipe.recipe_url.must_equal "recipe_url"
    recipe.ingredients.must_equal "ingredients"
    recipe.health_labels.must_equal "health_labels"
    recipe.recipe_source.must_equal "recipe_source"
    recipe.nutrients.must_equal "nutrients"

  end


end
