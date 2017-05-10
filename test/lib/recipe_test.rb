require 'test_helper'

describe Recipe do

  before do
    recipe_info = {
      label: "test",
      image: "http://www.test.image",
      source: "a food place",
      ingredients: ["chicken", "more chicken"],
      nurition: { test: "testnutrient" }
    }

    @recipe = Recipe.new(recipe_info)
  end

  it "initializes with a hash" do
    @recipe.class.must_equal Recipe
  end

  it "can access recipe information" do
    @recipe.label.must_equal "test"
    @recipe.ingredients.must_equal ["chicken", "more chicken"]
  end
end
