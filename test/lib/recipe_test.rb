require 'test_helper'

describe Recipe do
  it "Requires 2 arguments to initialize" do
    proc { Recipe.new }.must_raise ArgumentError
    proc { Recipe.new("Beef")}.must_raise ArgumentError

    recipe = Recipe.new("http://www.edamam.com/ontologies/edamam.owl#recipe_637913ec61d9da69eb451818c3293df2", "Dijon and Tarragon Grilled Chicken")

    recipe.must_be_instance_of Recipe
  end

  # it "can be created with "
end
