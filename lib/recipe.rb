require 'httparty'
BASE_URL = "https://api.edamam.com/search"

class Recipe
  attr_reader :url, :name, :img_url, :id, :ingredients, :uri, :total_nutrients

  class RecipeError < StandardError
  end

  def initialize(recipe_params)
    @name = recipe_params[:name]
    @img_url = recipe_params[:img_url]
    @uri = recipe_params[:uri]
    @id = recipe_params[:id]
    @url = recipe_params[:url]
    @ingredients = recipe_params[:ingredients]
    @total_nutrients = recipe_params[:total_nutrients]
  end

  def self.search(term)
    query_params = {
      "app_id" => ENV["EDAMAM_APP_ID"],
      "app_key" => ENV["EDAMAM_APP_KEY"],
      "q" => term
    }

    response = HTTParty.get(BASE_URL, query: query_params)
    recipe_list = response.parsed_response["hits"]
    recipe_array = []

    recipe_list.map do |recipe|
      recipe_params =
      {
        name: recipe["recipe"]["label"],
        img_url: recipe["recipe"]["image"],
        uri: recipe["recipe"]["uri"],
        id: recipe["recipe"]["uri"].split("_").last
      }
      Recipe.new(recipe_params)
    end
  end

  def self.single_search(id)
    query_params = {
      "app_id" => ENV["EDAMAM_APP_ID"],
      "app_key" => ENV["EDAMAM_APP_KEY"],
      "r" => "http://www.edamam.com/ontologies/edamam.owl%23recipe_" + id
    }
    response = HTTParty.get(BASE_URL, query: query_params)
    nutrient_list = {}
    response[0]["totalNutrients"].each do |key, value|
      nutrient_list[value["label"]] = value["quantity"].round(2).to_s + " " + value["unit"].to_s
    end

    recipe_params =
    {
      name: response[0]["label"],
      img_url: response[0]["image"],
      uri: response[0]["uri"],
      id: response[0]["uri"].split("_").last,
      url: response[0]["url"],
      total_nutrients: nutrient_list,
      ingredients: response[0]["ingredientLines"]
    }
    Recipe.new(recipe_params)
  end
end
