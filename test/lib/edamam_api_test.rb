require 'test_helper'

describe EdamamApi do

  describe "initialize" do
    hash_params = {
      image: "https://www.edamam.com/web-img/18d/18dcf05995cb40e8ce4c077972341d7a.jpg",
      uri: "http://www.edamam.com/ontologies/edamam.owl#recipe_f1c853a77986214680bbdd424883499a",
      label: "Herbes de Provence Rotisserie Chickens",
      recipe_source_label: "Bon Appetit",
      recipe_source_url: "http://www.bonappetit.com/recipe/herbes-de-provence-rotisserie-chickens",
      health_label: [
        "Gluten-Free",
        "Egg-Free",
        "Peanut-Free",
        "Tree-Nut-Free",
        "Soy-Free",
        "Fish-Free",
        "Shellfish-Free"
      ],
      ingredient_lines: [
        "2 tablespoons (1/4 stick) butter, room temperature",
        "2 tablespoons dried herbes de provence*",
        "1 tablespoon coarse kosher salt",
        "2 (3 1/2-pound) chickens"
      ],
      calories: 7045.096938934326
    }
    it "instance of class" do
      query = EdamamApi.new(hash_params)
      query.must_be_instance_of EdamamApi
    end
    it "takes a hash" do skip
      query = EdamamApi.new(hash)
      query.label.must_equal :label
    end
    it "requires a hash" do
      proc {
        EdamamApi.new
      }.must_raise ArgumentError
    end
  end
  describe "list_recipes" do
    it "can retrieve a recipe" do
      VCR.use_cassette("recipes") do
        query = EdamamApi.list_recipes("chicken", 0)
      end
    end
    it "will raise argumenterror for missing recipe params" do
      VCR.use_cassette("recipes") do
        proc {
          EdamamApi.new
        }.must_raise ArgumentError
      end
    end
    it "can returns 10 recipes" do
      VCR.use_cassette("recipes") do
        query = EdamamApi.list_recipes("chicken", 0)
        query.length.must_equal 10
      end
    end
    it "returns an array" do
      VCR.use_cassette("recipes") do
        result = EdamamApi.list_recipes("chicken", 0)
        result.must_be_kind_of Array
        result[0].must_be_instance_of EdamamApi
      end
    end
  end
  describe "find_recipe" do
    it "find one recipe" do
      VCR.use_cassette("recipes") do
        recipe = EdamamApi.find_recipe("recipe_f1c853a77986214680bbdd424883499a")
        recipe[0]["label"].must_equal "Herbes de Provence Rotisserie Chickens"
      end
    end
    it "will return argument error if params missing" do
      VCR.use_cassette("recipes") do
        proc {
          EdamamApi.find_recipe()
        }.must_raise ArgumentError
      end
    end
  end
end
