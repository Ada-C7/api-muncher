require 'test_helper'

describe Recipe do

  it "Requires 1 argument to initialize" do
    proc {
      Recipe.new
    }.must_raise ArgumentError

    proc {
      Recipe.new
    }.must_raise ArgumentError

  end

  it "Can create a Recipe instance" do
    recipe_response = Recipe.new "data"

    recipe_response.class.must_equal Recipe
  end

end
