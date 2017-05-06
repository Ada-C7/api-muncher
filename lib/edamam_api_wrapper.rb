require "httparty"
class EdamamApiWrapper < ApplicationController

  URL = "https://api.edamam.com/search"
  HEADERS = {
    "app_key" => ENV["APP_KEY"],
    "app_id" => ENV["APP_ID"]
  }

  attr_reader :name, :image, :url, :ingredients, :diet_info, :uri
  def initialize(recipe)
    @uri = recipe["uri"]
    @name = recipe["label"]
    @image = recipe["image"]
    @url = recipe["url"]
    @ingredients = recipe["ingredientLines"]
    @diet_info = recipe["totalNutrients"]
  end


  def self.all(search_terms)
    recipe_array = []
    recipes = api_call(search_terms)

    if recipes.is_a? Array
      return self.new(recipes.first)
    end

    if recipes["hits"]
      recipes["hits"].each do |recipe|
        recipe_array << EdamamApiWrapper.new(recipe["recipe"])
      end
    end
    return recipe_array
  end

  private
  def self.api_call(search_terms)
    url = "https://api.edamam.com/search"
    recipes = HTTParty.get(URL, headers: HEADERS, query: search_terms).parsed_response
    return recipes
  end
end
