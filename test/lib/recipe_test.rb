require 'test_helper'

describe Recipe do

  # @id = info[:id]
  # @label = info[:label]
  # @image_url = info[:image_url]
  # @ingredients = info[:ingredients]
  # @dietary_information = info[:dietary_information]
  # @original_recipe = info[:original_recipe]

  describe 'initialize' do
    before do
      @info_hash = {
                     id: "_abladjfkaljdlaj",
                     label: "cookies",
                     image_url: "www.google.com",
                     ingredients: ["sugar", "flour", "butter"],
                     dietary_information: ["fats: 24g", "sugar: 12g", "protein: 7g"],
                     original_recipe: "www.google.com",
                   }
    end
    it 'requires an hash argument' do
      output = Recipe.new(@info_hash)
      output.must_be_instance_of Recipe
    end

    it 'raises an argument error with out argument' do
      proc { Recipe.new }.must_raise ArgumentError
    end

    it 'creates reader methods that can be used' do
      recipe = Recipe.new(@info_hash)
      recipe.id.wont_be_nil
      recipe.label.wont_be_nil
      recipe.image_url.wont_be_nil
      recipe.ingredients.wont_be_nil
      recipe.dietary_information.wont_be_nil
      recipe.original_recipe.wont_be_nil
    end
  end

  describe 'list_of_recipes' do

    #make search_results just return raw API data and call formating methods later..

    it 'takes in api_data and returns array of recipe instances' do

    end

    it 'raises an arugment error if not given array of hashe(s)' do

    end

  end

  describe 'individual_recipe' do

    it 'takes in api data and returns one recipe object' do

    end

    it 'raises an argument error if argument is not info_hash' do

    end
  end
end
