require 'test_helper'

describe Recipe do
  it "cannot be initialized with less than 3 parameters" do
    proc {
      Recipe.new
    }.must_raise ArgumentError

    proc {
      Recipe.new "Hogwash"
    }.must_raise ArgumentError

    proc {
      Recipe.new("Hogwash", "ID")
    }.must_raise ArgumentError
  end

  it "must initialize successfully with name, id and image" do
    recipe = Recipe.new("Hogwash", "ID", "image_link")
    recipe.name.must_equal "Hogwash"
    recipe.id.must_equal "ID"
    recipe.image.must_equal "image_link"
  end

  it "can be initialized with optional parameters" do
    options_hash = {
      source: "Damn Fine Recipes",
      url: "http://damnfinerecipes.com",
      yield: 4,
      ingredientLines: "So many ingredients",
      dietLabels: ["totally bad for you", "lots of salt"],
      healthLabels: ["health-free", "fat-filled"],
      calories: 1200
    }
    recipe = Recipe.new("Hogwash", "ID", "image_link", options = options_hash)
    recipe.source.must_equal "Damn Fine Recipes"
    recipe.url.must_equal "http://damnfinerecipes.com"
    recipe.yield.must_equal 4
    recipe.dietLabels[0].must_equal "totally bad for you"
    recipe.healthLabels[1].must_equal "fat-filled"
    recipe.calories.must_equal 1200
    recipe.ingredientLines.must_equal "So many ingredients"
  end


end
