require 'httparty'

class EdamamApi

  class EdamamApiException < StandardError
  end

  attr_reader :label, :image, :uri, :url, :source, :health_label, :calories, :ingredient_lines, :recipe_source_url, :recipe_source_label

  BASE_URL = "https://api.edamam.com/search"

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

  def self.list_recipes(query)
    query_params = {
      "app_id" => ENV["APP_ID_SENSITIVE"],
      "app_key" => ENV["API_KEY_SENSITIVE"],
      "q" => query,
    }
    url = "#{BASE_URL}?"
    response = HTTParty.get(url, query: query_params)
    recipe_array = []
    if response["hits"]
      response["hits"].each do |recipe|
        recipe_array << self.new({label: recipe["recipe"]["label"], image: recipe["recipe"]["image"], source: recipe["recipe"]["source"], uri: recipe["recipe"]["uri"], url: recipe["recipe"]["url"], health_label: recipe["recipe"]["healthLabels"], calories: ((recipe["recipe"]["calories"])/4).round , ingredient_lines: recipe["recipe"]["ingredientLines"].length  })
      end
    else
      raise EdamamApiException.new(response["Error, no recipes resulted. "])
    end
    return recipe_array
  end

  # def self.find_recipe(url)
  #   query_params  = {
  #     "app_id" => ENV["APP_ID_SENSITIVE"],
  #     "app_key" => ENV["API_KEY_SENSITIVE"],
  #     "q" => query,
  #   }
  #   url = "#{BASE_URL}?"
  #   response = HTTParty.get(url, query: query_params)
  #
  #
  #
  #
  # end


end
