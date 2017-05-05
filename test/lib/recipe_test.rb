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

    # try to put this in your test_helper.rb file - calling same method in edamam_search_test.rb
    before do
        # ahhh you can't call test helper methods from these add lib test files
        # @response = good_api_search
        search_params = { search_text: "cookies", from: 0, to: 10 }

        VCR.use_cassette("search_results") do
          search_input = EdamamSearch.new(search_params)
          @response = search_input.search_results
        end
    end

    #make search_results just return raw API data and call formating methods later..
    it 'takes in api_data and returns array of recipe instances' do
      output = Recipe.list_of_recipes(@response)
      output.each { |recipe| recipe.must_be_instance_of Recipe }
    end

    it 'raises an arugment error if not given array of hashe(s)' do
      proc { Recipe.list_of_recipes }.must_raise ArgumentError
    end

  end

  describe 'individual_recipe' do

    before do
      search_params = { recipe_id: "_6ffeacec6d0c6f8bc9aee1de19065537" }
      VCR.use_cassette("search_results") do
        search_input = EdamamSearch.new(search_params)
        @response = search_input.search_results
      end

    end

    it 'takes in api data and returns one recipe object' do
      output = Recipe.individual_recipe(@response)
      output.must_be_instance_of Recipe
      output.label.wont_be_nil
      output.image_url.wont_be_nil
      output.ingredients.wont_be_nil
      output.dietary_information.wont_be_nil
      output.original_recipe.wont_be_nil
    end

    it 'raises an argument error if argument is not info_hash' do
      proc { Recipe.individual_recipe }.must_raise ArgumentError
    end
  end
end
