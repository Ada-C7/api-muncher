require 'httparty'

class Recipe
  class RecipeException < StandardError
  end

  BASE_URL = "https://api.edamam.com/search?"

  attr_accessor :label, :image, :uri, :url, :calories, :dietLabels, :healthLabels, :ingredients

  def initialize(params)
    raise ArgumentError if params == nil
    @label = params[:label]
    @image = params[:image]
    @uri = params[:uri]
    @url = params[:url]
    @calories = params[:calories]
    @dietLabels = params[:dietLabels]
    @healthLabels = params[:healthLabels]
    @ingredients = params[:ingredients]
  end

  def self.search(name)
    raise ArgumentError if name == nil || name == " " || name == ""
    query_params = {
      "app_id" => ENV["APP_ID"],
      "app_key" => ENV["APP_KEY"],
      "q" => name
    }
    response = HTTParty.get(BASE_URL, query: query_params).parsed_response

    if response['hits']
    response["hits"].map do |hit|
      recipe_data = {
        label: hit["recipe"]["label"],
        image:hit["recipe"]["image"],
        uri: hit["recipe"]["uri"],
        url: hit["recipe"]["url"],
        calories: hit["recipe"]["calories"],
        dietLabels: hit["recipe"]["dietLabels"],
        healthLabels: hit["recipe"]["healthLabels"],
        ingredients: hit["recipe"]["ingredients"]
      }
      self.new(recipe_data)
      end
    else
      raise RecipeException.new(response["error"])
    end
  end

  def self.search1(uri)
    query_params = {
      "app_id" => ENV["APP_ID"],
      "app_key" => ENV["APP_KEY"],
      "r" => uri
    }
    response = HTTParty.get(BASE_URL, query: query_params)

    if response != nil
     response.map do |recipe|
      recipe_data = {
        label: recipe["label"],
        image:recipe["image"],
        uri: recipe["uri"],
        url: recipe["url"],
        calories: recipe["calories"],
        dietLabels: recipe["dietLabels"],
        healthLabels: recipe["healthLabels"],
        ingredients: recipe["ingredients"]
      }
      self.new(recipe_data)
     end
    else
      raise RecipeException.new(response["error"])
    end
  end
end
