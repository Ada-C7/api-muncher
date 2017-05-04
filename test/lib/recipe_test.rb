require 'test_helper'

describe "Rescipe" do
    it "Can create a recipe instance when passing the required arguments" do
      test_raw_recipe_data = {
        "label" => "Rosted Chicken", "url" => "test url", "uri" => "test uri", "image" => "test_image", "ingredientLines" => ["chicken", "herbs", "butter"], "healthLabels" => ["soy free", "gluten free"], "totalNutrients" => {energy: 222, suger: "17g", calcuim: "400mg"}
      }
      test_recipe = Recipe.new(test_raw_recipe_data)

      test_recipe.class.must_equal Recipe
      test_recipe.label.must_equal "Rosted Chicken"
      test_recipe.url.must_equal "test url"
      test_recipe.ingredients.must_equal ["chicken", "herbs", "butter"]
      test_recipe.allergy_info.class.must_equal Array
      test_recipe.allergy_info.must_equal ["soy free", "gluten free"]

      test_recipe.nutrients.class.must_equal Hash
      # test_recipe.nutrients.must_equal {energy: 222, suger: "17g", calcuim: "400mg"}
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
