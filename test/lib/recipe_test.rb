require "test_helper"

describe Recipe do

  it "requires recipe label " do
    options = {
      label: nil,
      image: "www.url.com",
      uri: "www.recipe.com"
    }
    proc {
      Recipe.new(options)
    }.must_raise ArgumentError
  end

  it "creates recipe with valid options" do
    options = {
      label: "Food",
      image: "www.url.com",
      uri: "www.recipe.com"
    }
    recipe = Recipe.new(options)
    recipe.must_be_instance_of Recipe
  end
end
