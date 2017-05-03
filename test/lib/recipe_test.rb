require 'test_helper'

describe Recipe do

  before do
    @recipe_hash = {
      "id" => "recipe.com/recipe/ejfajfdn",
      "label" => "most delicious recipe",
      "image" => "recipe.com/recipe.jpg",
      "url" => "recipe.com/recipe",
      "ingredientLines" => ["yummyness", "chocolate bits", "savoury sweet flavor"],
      "calories" => 1000000,
      "fat" => 0.0001,
      "sugar" => 0.0000001,
      "protein" => 7000,
      "sodium" => 50
    }
  end

  it "requires a hash argument to initialize" do
    proc{
      Recipe.new
    }.must_raise ArgumentError

    proc{
      Recipe.new "recipe 1"
    }.must_raise ArgumentError
  end

  it "can create a Recipe instance" do
    recipe = Recipe.new(@recipe_hash)

    recipe.class.must_equal Recipe
  end

  it "has all accessor methods" do
    # recipe = Recipe.new "recipe 1", 1, {   purpose: "to be number 1", is_archived: false, is_general: true, members: "Brenna, Kelly, Olivia" }
    #
    # recipe.name.must_equal "recipe 1"
    # recipe.id.must_equal 1
    # recipe.purpose.must_equal "to be number 1"
    # recipe.is_archived.must_equal false
    # recipe.is_general.must_equal true
    # recipe.members.must_equal "Brenna, Kelly, Olivia"
    # end
  end
end
