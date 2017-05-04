require 'test_helper'

describe Recipe do

  before do
    recipe_hash = {
      "id" => "recipe.com/recipe/ejfajfdn",
      "label" => "most delicious recipe",
      "image" => "recipe.com/recipe.jpg",
      "url" => "recipe.com/recipe",
      "ingredientLines" => ["yummyness", "chocolate bits", "savoury sweet flavor"],
      "dietLabels" => ["so healthy", "really we promise"],
      "healthLabels" => ["happiness", "delight", "full tummy"]
    }

      @recipe = Recipe.new(recipe_hash)
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
    @recipe.class.must_equal Recipe
  end

  it "has all accessor methods" do
    @recipe.id.must_equal "recipe.com/recipe/ejfajfdn"
    @recipe.label.must_equal "most delicious recipe"
    @recipe.image.must_equal "recipe.com/recipe.jpg"
    @recipe.url.must_equal "recipe.com/recipe"
    @recipe.ingredientLines.must_equal ["yummyness", "chocolate bits", "savoury sweet flavor"]
    @recipe.dietLabels.must_equal ["so healthy", "really we promise"]
    @recipe.healthLabels.must_equal ["happiness", "delight", "full tummy"]
    end
  end
