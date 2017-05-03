require 'test_helper'

describe Recipe do

  before do
    recipe_hash = {
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
    @recipe.calories.must_equal 1000000
    @recipe.fat.must_equal 0.0001
    @recipe.sugar.must_equal 0.0000001
    @recipe.protein.must_equal 7000
    @recipe.sodium.must_equal 50
    end
  end
