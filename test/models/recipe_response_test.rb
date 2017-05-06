require "test_helper"

describe RecipeResponse do
  let(:recipe_response) { RecipeResponse.new }

  it "must be valid" do
    value(recipe_response).must_be :valid?
  end
end
