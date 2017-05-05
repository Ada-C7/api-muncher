require 'httparty'
require 'uri'

class Recipe_Api_Wrapper
  BASE_URL = "https://api.edamam.com/"
  ID = ENV["APP_ID"]
  KEY = ENV["APP_KEY"]


  def self.listRecipes(munch_id = nil, munch_key = nil, query)
    munch_id = ID if munch_id == nil
    munch_key = KEY if munch_key == nil

    url = BASE_URL + "search?" + "&app_id=#{ munch_id }" + "&app_key=#{ munch_key }" + "&q=#{ query }&" + "&from=0&to=100"

    response = HTTParty.get(url)

    recipes = []
    if response["hits"].length > 0
      response["hits"].each do |recipe|
        info = Recipe.new(recipe["recipe"]["uri"], recipe["recipe"]["label"], recipe["recipe"]["image"], recipe["recipe"]["url"], recipe["recipe"]["dietLabels"], recipe["recipe"]["healthLabels"], recipe["recipe"]["ingredientLines"])

        recipes << info
      end
      return recipes
    end
  end

  def self.showRecipe(uri)
    url = BASE_URL + "search?" + "app_id=#{ ID }" + "&app_key=#{ KEY }" + "&r=#{ URI.encode(uri) }"

    response = HTTParty.get(url)
    recipes = []
    response.parsed_response.each do |recipe|
      info = Recipe.new(recipe["uri"], recipe["label"], recipe["image"], recipe["url"], recipe["dietLabels"], recipe["healthLabels"], recipe["ingredientLines"])

      recipes << info
    end
    return recipes
  end
end
