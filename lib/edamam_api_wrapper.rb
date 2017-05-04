require "httparty"
class EdamamApiWrapper

  URL = "https://api.edamam.com/search"
  HEADERS = {
    "app_key" => ENV["APP_KEY"],
    "app_id" => ENV["APP_ID"]
  }

  attr_reader :name, :image, :url, :ingredients, :diet_info
  def initialize(recipe)
    @name = recipe["label"]
    @image = recipe["image"]
    @url = recipe["uri"]
    @ingredients = recipe["ingredientLines"]
    @diet_info = recipe["totalNutrients"]
  end

  def self.api_call(ingredients)
    url = "https://api.edamam.com/search"
    recipes = HTTParty.get(URL, headers: HEADERS, query: {q: ingredients}).parsed_response
    return recipes
  end

  def self.all(ingredients)
    recipe_array = []
    recipes = api_call(ingredients)

    if recipes["hits"]
      recipes["hits"].each do |recipe|
        recipe_array << EdamamApiWrapper.new(recipe["recipe"])
      end
    end
    return recipe_array
  end
end
