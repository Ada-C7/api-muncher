require 'httparty'
# require 'awesome_print'
# require 'pry'

class Recipe
  class RecipeException < StandardError
  end

  BASE_URL = "https://api.edamam.com/search?"

  attr_accessor :label, :image, :uri, :calories, :dietLabels, :healthLabels, :ingredients

  def initialize(params)
    raise ArgumentError if params == nil
    @label = params[:label]
    @image = params[:image]
    @uri = params[:uri]
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
      list_of_recipes = response["hits"].map do |hit|
                        recipe_data = {
                          label: hit["recipe"]["label"],
                          image:hit["recipe"]["image"],
                          uri: hit["recipe"]["url"],
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
end
