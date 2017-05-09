require 'test_helper'

describe Recipe do
  describe "Initialize" do
    it "can create a new recipe" do
      recipe_params = {
        name: "fried potatos",
        image: "stuff.jpg",
        original_recipe: "http://stuffandthigns.com",
        ingredients: {hash: "of food", more: "food"},
        health_labels: ["array", "of", "food"],
        uri: "http://stuffandrealthings.com"
      }
      r = Recipe.new(recipe_params)
      r.name.must_equal "fried potatos"
    end

    it "rejects things without the necessary params" do
      proc {
        Recipe.new
      }.must_raise ArgumentError
    end
  end
  it "can return a list of recipes based on one search term" do
    VCR.use_cassette("recipes") do
      Recipe.all_by_search_term("potato", 0, 10)
    end
  end
  describe "API call for multiple recipes" do
    it "returns only ten recipes at a time" do
      VCR.use_cassette("recipes") do
        r = Recipe.all_by_search_term("potato", 0, 10)
        r.length.must_equal 10
      end
    end

    it "doesn't return recipes if it's fed the wrong info" do
      VCR.use_cassette("recipes") do
        proc {
          Recipe.all_by_search_term("potato")
        }.must_raise ArgumentError
      end
    end
  end

  describe "API call for single recipes" do
    it "can pull up a single recipe" do
      VCR.use_cassette("single_recipe") do
        r = Recipe.find_by_name("http://www.edamam.com/ontologies/edamam.owl#recipe_f1c853a77986214680bbdd424883499a")
        r.must_be_kind_of Recipe
        r.name.must_equal "Herbes de Provence Rotisserie Chickens"
      end
    end

    it "doesn't pull up a recipe if not given a URI" do
      VCR.use_cassette("single_recipe") do
        proc {
          r = Recipe.find_by_name
        }.must_raise ArgumentError
      end
    end
  end

end
