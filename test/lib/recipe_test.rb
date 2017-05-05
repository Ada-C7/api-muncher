require 'test_helper'

describe Recipe do
  let (:good_recipe) {Recipe.new( "Dijon Chicken", "http://www.edamam.com", "image_url")}

  it "Requires 2 arguments to initialize" do
    proc { Recipe.new }.must_raise ArgumentError
    proc { Recipe.new("Beef")}.must_raise ArgumentError

    recipe = Recipe.new("Dijon and Tarragon Grilled Chicken", "http://www.edamam.com/ontologies/edamam.owl#recipe_637913ec61d9da69eb451818c3293df2")

    recipe.must_be_instance_of Recipe
  end

  it "can be created with optional arguments as well" do
    good_recipe.must_be_instance_of Recipe
  end

  it "must respond to uri, name, optionals" do
    good_recipe.must_respond_to :name
    good_recipe.must_respond_to :uri
    good_recipe.must_respond_to :image
  end

  describe "#parse_nutritional" do
    it "returns an array" do
      response = good_recipe.parse_nutritional
      response.must_be_instance_of Array
    end

    it "if nutritional_info or daily info in recipe object are nil, returns an epty array" do
      response = good_recipe.parse_nutritional
      response.must_equal []
    end

    it "if any of the values in the hash of nutritional_info or daily info are nil, it will return an empty string for that value" do
      nutritional_info = {
        "ENERC_KCAL"=> {"quantity": 12},
        "FAT"=> {"quantity"=> 12, "unit"=> "kcal"} }
      daily = {
        "ENERC_KCAL"=> {"quantity": 12},
        "FAT"=> {"quantity"=> 12, "unit"=> "kcal"} }

      full_recipe = Recipe.new("new", "stuff", "image",
      "", ["tomatoes", "lettuce"], nutritional_info , 2, daily)

      response = full_recipe.parse_nutritional
      response.each do |string|
        string.wont_be_nil
      end
    end
  end
end
