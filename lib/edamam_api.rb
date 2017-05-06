require 'httparty'

class EdamamApi

  class EdamamApiException < StandardError
  end

  attr_reader :label, :image, :uri, :url, :source, :health_label, :calories, :ingredient_lines, :recipe_source_url, :recipe_source_label

  BASE_URL = "https://api.edamam.com/search"
  RECIPE_URI = "https://api.edamam.com/search?r=http://www.edamam.com/ontologies/edamam.owl%23"


  def initialize(hash_params)
    @image = hash_params[:image]
    @uri = hash_params[:uri]
    @label = hash_params[:label]
    @recipe_source_label = hash_params[:source]
    @recipe_source_url = hash_params[:url]
    @health_label = hash_params[:health_label]
    @ingredient_lines = hash_params[:ingredient_lines]
    @calories = hash_params[:calories]
  end

  def self.list_recipes(query, from)
    query_params = {
      "app_id" => ENV["APP_ID_SENSITIVE"],
      "app_key" => ENV["API_KEY_SENSITIVE"],
      "q" => query,
      "from" => from,
      "to" => (from.to_i + 10)
    }

    url = "#{BASE_URL}?"
    response = HTTParty.get(url, query: query_params)
    recipe_array = []
    if response["hits"]
      response["hits"].each do |recipe|
        recipe_array << self.new(
        { label: recipe["recipe"]["label"], image: recipe["recipe"]["image"], source: recipe["recipe"]["source"], uri: recipe["recipe"]["uri"], url: recipe["recipe"]["url"], health_label: recipe["recipe"]["healthLabels"], calories: recipe["recipe"]["calories"], ingredient_lines: recipe["recipe"]["ingredientLines"] })
      end
    else
      raise EdamamApiException.new(response["Error, no recipes resulted. "])
    end
    return recipe_array
  end

  def self.find_recipe(recipe_uri)
    query_params = {
      "app_id" => ENV["APP_ID_SENSITIVE"],
      "app_key" => ENV["API_KEY_SENSITIVE"]
    }
    uri = "#{RECIPE_URI}#{recipe_uri}"
    response = HTTParty.get(uri, query: query_params).parsed_response
    return response

  end


end
