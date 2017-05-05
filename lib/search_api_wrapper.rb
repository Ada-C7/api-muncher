require 'httparty'
require "recipe"
class SearchApiWrapper

  BASE_URL = "https://api.edamam.com/search"
  APP_ID = ENV["APP_ID"]
  APP_KEY = ENV["APP_KEY"]

  def self.listRecipes(user_search,app_id = nil, app_key = nil)

    app_id ||= APP_ID
    app_key ||= APP_KEY

    url = BASE_URL + "?q=#{user_search}" + "&app_id=#{app_id}" + "&app_key=#{app_key}" + "&to=40"

    response = HTTParty.get(url).parsed_response
    hits = response["hits"]
    recipes = []

      if hits
        hits.each do |hit|
        recipe_details = hit["recipe"]

        # label = recipe_details["label"]
        # url = recipe_details["url"]
        # uri = recipe_details["uri"]
        # image = recipe_details["image"]
        # ingredients = recipe_details["ingredientLines"]
        # allergy_info = recipe_details["healthLabels"]
        # nutrients = recipe_details["totalNutrients"]

        recipes << Recipe.new(recipe_details)
      end
    end
    return recipes
  end

  def self.showRecipe(uri)

    uri = BASE_URL + "?r=#{URI.encode(uri)}"
    response = HTTParty.get(uri).parsed_response
    # label = response[0]["label"]
    # url = response[0]["url"]
    # uri = response[0]["uri"]
    # image = response[0]["image"]
    # ingredients = response[0]["ingredientLines"]
    # allergy_info =
    #  response[0]["healthLabels"]
    #  nutrients = response[0]["totalNutrients"]
    if response
      recipe = Recipe.new(response[0])
      return recipe
    else
      return nil
    end
  rescue JSON::ParserError => e
    return nil
  end
end
