require 'httparty'
BASE_URL = "https://api.edamam.com/search"

class Recipe
  attr_reader :url, :name, :img_url, :id

  class RecipeError < StandardError
  end

  def initialize(recipe_params)
    @name = recipe_params[:name]
    @img_url = recipe_params[:img_url]
    @url = recipe_params[:url]
    @id = recipe_params[:id]
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
        url: recipe["recipe"]["uri"],
        id: recipe["recipe"]["uri"].split("_").last
      }
      Recipe.new(recipe_params)
    end
  end

  def self.single_search(id)
    query_params = {
      "app_id" => ENV["EDAMAM_APP_ID"],
      "app_key" => ENV["EDAMAM_APP_KEY"],
      "q" => term,
      "from" => 0,
      "to" => 1,
      "uri" => id
    }
    response = HTTParty.get(BASE_URL, query: query_params)

    recipe_params =
    {
      name: recipe["recipe"]["label"],
      img_url: recipe["recipe"]["image"],
      url: recipe["recipe"]["uri"],
      id: recipe["recipe"]["uri"].split("_").last
    }
    recipe = Recipe.new(recipe_params)
  end
end
