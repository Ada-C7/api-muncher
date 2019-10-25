require "test_helper"

describe Recipe do
  it "requires 3 arguments to initialize" do
    proc { Recipe.new }.must_raise ArgumentError

    proc {
      Recipe.new("label")
    }.must_raise ArgumentError

    proc {
      Recipe.new("label", "uri")
    }.must_raise ArgumentError
  end

  it "can create a Recipe instance" do
    recipe = Recipe.new("label", "id", "image")
    recipe.must_be_instance_of Recipe
    recipe.label.must_equal "label"
  end

  it "can create a Recipe with optional params" do
    recipe = Recipe.new("label", "id", "image", {
      recipe_link: "url",
      ingredients: ["ingredient1", "ingredient2"]
    })
    recipe.must_be_instance_of Recipe
    recipe.recipe_link.must_equal "url"
  end

  it "has accessor methods" do
    recipe = Recipe.new("label", "id", "image", {
      recipe_link: "url",
      ingredients: ["ingredient1", "ingredient1"],
      diet_labels: ["diet1", "diet2"],
      health_labels: ["health1", "health2"],
      calories: "300"
    })
    recipe.label.must_equal "label"
    recipe.id.must_equal "id"
    recipe.image.must_equal "image"
    recipe.recipe_link.must_equal "url"
    recipe.ingredients.must_equal ["ingredient1", "ingredient1"]
    recipe.diet_labels.must_equal ["diet1", "diet2"]
    recipe.health_labels.must_equal ["health1", "health2"]
    recipe.calories.must_equal "300"
  end
end
