require 'test_helper'

describe Recipe do

    before do
      @sample_name = "Hogwash"
      @sample_uri = "http://www.edamam.com/ontologies/edamam.owl#recipe_d8c5654fe0344398e622afc2584c0c1b"
      @sample_image = "image_link"
    end

    it "cannot be initialized with less than 3 parameters" do
      proc {
        Recipe.new
      }.must_raise ArgumentError

      proc {
        Recipe.new @sample_name
      }.must_raise ArgumentError

      proc {
        Recipe.new(@sample_name, @sample_uri)
      }.must_raise ArgumentError
    end

    it "must initialize successfully with name, uri and image" do
      recipe = Recipe.new(@sample_name, @sample_uri, @sample_image)
      recipe.name.must_equal "Hogwash"
      recipe.id.must_equal "d8c5654fe0344398e622afc2584c0c1b"
      recipe.image.must_equal "image_link"
    end

    it "can be initialized with optional parameters" do
      options_hash = {
        source: "Damn Fine Recipes",
        url: "http://damnfinerecipes.com",
        yield: 4,
        ingredientLines: "So many ingredients",
        dietLabels: ["totally bad for you", "lots of salt"],
        healthLabels: ["health-free", "fat-filled"],
        calories: 1200
      }
      recipe = Recipe.new(@sample_name, @sample_uri, @sample_image, options = options_hash)
      recipe.source.must_equal "Damn Fine Recipes"
      recipe.url.must_equal "http://damnfinerecipes.com"
      recipe.yield.must_equal 4
      recipe.dietLabels[0].must_equal "totally bad for you"
      recipe.healthLabels[1].must_equal "fat-filled"
      recipe.calories.must_equal 1200
      recipe.ingredientLines.must_equal "So many ingredients"
    end

end
