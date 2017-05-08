require 'test_helper'
require 'minitest/reporters'
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe Recipe do
  describe "initialize" do
    it "creates an instance" do
      recipe = Recipe.new
      recipe.must_be_instance_of Recipe
    end
  end

  describe "send_search" do
    it "can send search query" do
      VCR.use_cassette("recipes") do
        recipe = Recipe.new
        recipe.send_search("pasta", 0, 10, nil)
      end
    end

    it "raises ArgumentError when you try to search without a search word" do
      VCR.use_cassette("recipes") do
        recipe = Recipe.new
        proc {
          recipe.send_search()
        }.must_raise ArgumentError
      end
    end

    it "can return results with the specific search word" do
      VCR.use_cassette("recipes") do
        recipe = Recipe.new
        result = recipe.send_search("pasta", 0, 10, nil)
        result["q"].must_equal "pasta"
      end
    end

    it "returns search results with specific health options" do
      VCR.use_cassette("recipes") do
        recipe = Recipe.new
        result = recipe.send_search("pasta", 0, 10, ["vegetarian", "vegan"])
        result["hits"][0]["recipe"]["healthLabels"].must_include "Vegetarian"
      end
    end

    it "searches for recipes with health options not selected" do
      VCR.use_cassette("recipes") do
        recipe = Recipe.new
        health = nil
        result = recipe.send_search("pasta", 0, 10, health)
      end
    end
  end

  describe "find_this_recipe" do
    it "can send search query" do
      VCR.use_cassette("recipes") do
        recipe = Recipe.new
        uri = "test_uri"
        recipe.find_this_recipe(uri)
      end
    end

    it "raises ArgumentError when you try to find a recipe without a uri" do
      VCR.use_cassette("recipes") do
        recipe = Recipe.new
        proc {
          recipe.find_this_recipe()
        }.must_raise ArgumentError
      end
    end

    it "returns one recipe" do
      VCR.use_cassette("recipes") do
        recipe = Recipe.new
        uri = "http://www.edamam.com/ontologies/edamam.owl#recipe_1e43fbf22e7a7254d65d0ca58d0618b2"
        result = recipe.find_this_recipe(uri)
        result.length.must_equal 1
      end
    end
  end
end
