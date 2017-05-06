require 'test_helper'

describe RecipeResponse do

  it "Requires 2 arguments to initialize" do
    proc {
      RecipeResponse.new
    }.must_raise ArgumentError

    proc {
      RecipeResponse.new "recipe"
    }.must_raise ArgumentError

  end

  it "Can create a Recipe Response instance" do
    recipe_response = RecipeResponse.new "recipe", "recipe_count"

    recipe_response.class.must_equal RecipeResponse
  end

end
