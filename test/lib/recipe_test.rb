require 'test_helper'

describe "Rescipe" do
    it "Can create a recipe instance when passing the required arguments" do
      label = "Rosted Chicken"
      url = "test url"
      uri = "test uri"
      image = "test image"
      ingredients = ["chicken", "herbs", "butter"]
      allergy_info = ["soy free", "gluten free"]
      nutrients = {energy: 222, suger: "17g", calcuim: "400mg"}
      test_recipe = Recipe.new(label, url, image, ingredients, allergy_info, uri, nutrients)

      test_recipe.class.must_equal Recipe
      test_recipe.label.must_equal "Rosted Chicken"
      test_recipe.url.must_equal "test url"
      test_recipe.ingredients.must_equal ["chicken", "herbs", "butter"]
      test_recipe.allergy_info.class.must_equal Array
      test_recipe.allergy_info.must_equal ["soy free", "gluten free"]

      test_recipe.nutrients.class.must_equal Hash
      # test_recipe.nutrients.must_equal "{energy: 222, suger: "17g", calcuim: "400mg"}"
    end


    it "Raises argument error if not passing all the required arguments" do

      proc {
      label = "Rosted Chicken"
      url = "test url"
      uri = "test uri"
      image = "test image"
      test_recipe = Recipe.new(label, url, image, uri)}.must_raise ArgumentError

    end

end
