require 'test_helper'

describe Recipe do

  it "requires at least 3 arguments to initialize" do
    proc {
      Recipe.new
    }.must_raise ArgumentError

    proc {
      Recipe.new "name"
    }.must_raise ArgumentError

    proc {
      Recipe.new "name", "image"
    }.must_raise ArgumentError
  end

  it "Can create a Recipe instance" do
    recipe = Recipe.new "name", "image", "uri"

    recipe.class.must_equal Recipe
  end

  it "Can create a Recipe with optional params" do
    recipe = Recipe.new("Name", "image", "uri", { ingredients: "Testing testing" } )

    recipe.class.must_equal Recipe
    recipe.ingredients.must_equal "Testing testing"
  end

  it "has the accessor methods" do
    recipe = Recipe.new "name", "image", "uri"

    recipe.name.must_equal "name"
    # recipe.name = "shouldn't_work" ## how do i test that can only read, not write?
    # recipe.name.must_equal "name"
  end

end
