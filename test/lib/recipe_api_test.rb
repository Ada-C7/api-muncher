require 'test_helper'

describe Recipe do
  describe "initialize" do
    it "Takes a name" do
      name = "TestRecipe"
      recipe = Recipe.new(name: name)
      recipe.name.must_equal name
    end

    it "Takes an image URL" do
      img_url = "Test"
      recipe = Recipe.new(img_url: img_url)
      recipe.img_url.must_equal img_url
    end

    it "Takes a uri" do
      uri = "Test"
      recipe = Recipe.new(uri: uri)
      recipe.uri.must_equal uri
    end

    it "Takes an id" do
      id = "Test"
      recipe = Recipe.new(id: id)
      recipe.id.must_equal id
    end

    it "Takes an URL" do
      url = "Test"
      recipe = Recipe.new(url: url)
      recipe.url.must_equal url
    end

    it "Takes ingredients in the form of an array" do
      ingredients = ["fish", "carrots"]
      recipe = Recipe.new(ingredients: ingredients)
      recipe.ingredients.must_equal ingredients
    end

    it "Takes nutritional information in the form of a hash" do
      total_nutrients = {:potassium => "20kg", :vitamin_d => "1mg"}
      recipe = Recipe.new(total_nutrients: total_nutrients)
      recipe.total_nutrients.must_equal total_nutrients
    end

    it "Requires information for a Recipe to be created" do
      proc {
        Recipe.new
      }.must_raise ArgumentError
    end
  end

  describe "search" do
    it "Can send a search for an ingredient term and return an array of recipes" do
      VCR.use_cassette("recipes") do
        cod_recipes = Recipe.search("cod")
        cod_recipes.must_be_instance_of Array
        cod_recipes[0].must_be_kind_of Recipe
      end
    end

    it "The individual recipe must contain a name" do
      VCR.use_cassette("recipes") do
        cod_recipes = Recipe.search("cod")
        cod_recipes.first.name.wont_be_nil
      end
    end

    it "The individual recipe must contain an img url" do
      VCR.use_cassette("recipes") do
        cod_recipes = Recipe.search("cod")
        cod_recipes.first.img_url.wont_be_nil
      end
    end

    it "The individual recipe must contain an uri" do
      VCR.use_cassette("recipes") do
        cod_recipes = Recipe.search("cod")
        cod_recipes.first.uri.wont_be_nil
      end
    end

    it "The individual recipe must contain an id" do
      VCR.use_cassette("recipes") do
        cod_recipes = Recipe.search("cod")
        cod_recipes.first.id.wont_be_nil
      end
    end
  end

  describe "single_search" do
    it "Can send a search for a recipe ID and return a recipe object" do
      VCR.use_cassette("recipes") do
        cod_recipes = Recipe.search("cod")
        first_cod_recipe_id = cod_recipes.first.id.to_s
        first_cod_recipe = Recipe.single_search(first_cod_recipe_id)
        first_cod_recipe.must_be_kind_of Recipe
      end
    end

    it "The Recipe object must contain a name" do
      VCR.use_cassette("recipes") do
        cod_recipes = Recipe.search("cod")
        first_cod_recipe_id = cod_recipes.first.id
        first_cod_recipe = Recipe.single_search(first_cod_recipe_id)
        first_cod_recipe.name.wont_be_nil
      end
    end

    it "The Recipe object must contain an img url" do
      VCR.use_cassette("recipes") do
        cod_recipes = Recipe.search("cod")
        first_cod_recipe_id = cod_recipes.first.id
        first_cod_recipe = Recipe.single_search(first_cod_recipe_id)
        first_cod_recipe.img_url.wont_be_nil
      end
    end

    it "The Recipe object must contain an uri" do
      VCR.use_cassette("recipes") do
        cod_recipes = Recipe.search("cod")
        first_cod_recipe_id = cod_recipes.first.id
        first_cod_recipe = Recipe.single_search(first_cod_recipe_id)
        first_cod_recipe.uri.wont_be_nil
      end
    end

    it "The Recipe object must contain an id" do
      VCR.use_cassette("recipes") do
        cod_recipes = Recipe.search("cod")
        first_cod_recipe_id = cod_recipes.first.id
        first_cod_recipe = Recipe.single_search(first_cod_recipe_id)
        first_cod_recipe.id.wont_be_nil
      end
    end

    it "The Recipe object must contain an url" do
      VCR.use_cassette("recipes") do
        cod_recipes = Recipe.search("cod")
        first_cod_recipe_id = cod_recipes.first.id
        first_cod_recipe = Recipe.single_search(first_cod_recipe_id)
        first_cod_recipe.url.wont_be_nil
      end
    end

    it "The Recipe object must contain a hash of total nutrients" do
      VCR.use_cassette("recipes") do
        cod_recipes = Recipe.search("cod")
        first_cod_recipe_id = cod_recipes.first.id
        first_cod_recipe = Recipe.single_search(first_cod_recipe_id)
        first_cod_recipe.total_nutrients.wont_be_nil
        first_cod_recipe.total_nutrients.must_be_instance_of Hash
      end
    end

    it "The Recipe object must contain an array of ingredients" do
      VCR.use_cassette("recipes") do
        cod_recipes = Recipe.search("cod")
        first_cod_recipe_id = cod_recipes.first.id
        first_cod_recipe = Recipe.single_search(first_cod_recipe_id)
        first_cod_recipe.ingredients.wont_be_nil
        first_cod_recipe.ingredients.must_be_instance_of Array
      end
    end
  end
end
