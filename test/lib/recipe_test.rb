require 'test_helper'

describe Recipe do
  it "Requires 2 arguments to initialize" do
    proc { Recipe.new }.must_raise ArgumentError
    proc { Recipe.new("Beef")}.must_raise ArgumentError

    recipe = Recipe.new("Dijon and Tarragon Grilled Chicken", "http://www.edamam.com/ontologies/edamam.owl#recipe_637913ec61d9da69eb451818c3293df2")

    recipe.must_be_instance_of Recipe
  end

  it "can be created with optional arguments as well" do
    recipe = Recipe.new( "Dijon Chicken", "http://www.edamam.com", options: {image: "image_url"})

    recipe.must_be_instance_of Recipe
  end

  it "must respond to uri, name, optionals" do
    recipe = Recipe.new("Dijon and Tarragon Grilled Chicken", "http://www.edamam.com/ontologies/edamam.owl#recipe_637913ec61d9da69eb451818c3293df2")

    recipe.must_respond_to :name
    recipe.must_respond_to :uri
    recipe.must_respond_to :image
  end
end
