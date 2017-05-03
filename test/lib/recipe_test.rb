require 'test_helper'

describe Recipe do
  it "initializes with a hash" do
    recipe_info = {
      label: "test",
      image: "http://www.test.image",
      source: "a food place",
      ingredients: ["chicken", "more chicken"],
      nurition: { test: "testnutrient" }
    }

    recipe = Recipe.new(recipe_info)
    recipe.class.must_equal Recipe
  end
end
