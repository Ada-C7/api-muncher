require 'httparty'
require 'awesome_print'
require 'pry'

class Recipe
  class RecipeException < StandardError
  end

  BASE_URL = "https://api.edamam.com/search?"
  attr_accessor :label, :image, :url, :calories, :dietLabels, :healthLabels, :ingredients

  def initialize(params)
      @label = params[:label]
      @image = params[:image]
      @url = params[:url]
      @calories = params[:calories]
      @dietLabels = params[:dietLabels]
      @healthLabels = params[:healthLabels]
      @ingredients = params[:ingredients]
  end

  def self.search(name)
    query_params = {
      "app_id" => ENV["APP_ID"],
      "app_key" => ENV["APP_KEY"],
      "q" => name
    }
    url = "#{BASE_URL}q=#{name}&app_id=#{ENV["APP_ID"]}&app_key=#{ENV["APP_KEY"]}"
    response = HTTParty.get(url).parsed_response

    list_of_recepies = []

    # binding.pry
    if response['hits']
      response["hits"].each do |hit|
        recipe = hit["recipe"]
        recipe_instance = self.new(recipe["label"], recipe["image"],recipe["url"],
                recipe["calories"], recipe["dietLabels"], recipe["healthLabels"],
                recipe["ingredients"])
        list_of_recepies << recipe_instance
      end
      list_of_recepies
    else
      raise RecipeException.new(response["error"])
    end
  end
end
