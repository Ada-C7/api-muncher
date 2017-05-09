require 'test_helper'

describe Recipe do
  it "Cannot be initialized without at least 3 parameters" do
    proc {
      Recipe.new
    }.must_raise ArgumentError

    proc {
      Recipe.new "Name"
    }.must_raise ArgumentError
  end

  it "Must initialize name, uri and image properly" do
    recipe = Recipe.new("name", "uri", "image")
    recipe.name.must_equal "name"
    recipe.uri.must_equal "uri"
    recipe.image.must_equal "image"
  end

  it "Can create a recipe instance" do
    recipe = Recipe.new("name", "uri", "image")
    recipe.class.must_equal Recipe
  end

  it "Can create a recipe with optional parameters" do
    recipe = Recipe.new("name", "uri", "image", url: "testing for test")
    recipe.class.must_equal Recipe
    recipe.url.must_equal "testing for test"
  end


end
