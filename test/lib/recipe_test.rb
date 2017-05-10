require 'test_helper'

describe Recipe do
  it "requires x arguments to initialize" do
    proc {
      Recipe.new
    }.must_raise ArgumentError
  end

  it "can create a Recipe instance" do
    recipe = Recipe.new("uri", "label", "image", "url", "source", "ingredients", "ingredientlines", "dietlabels", "healthlabels", "calories", "totalNutrients", "id")

    recipe.class.must_equal Recipe
  end

  it "has the accessor methods" do
  end

end
