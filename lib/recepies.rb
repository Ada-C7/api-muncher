class Recipe
  require 'httparty'
  require 'awesome_print'

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
    }
  end

  def self.search(name)
    query_params = {
      "q" => name,
      "app_id" => ENV["APP_ID"],
      "app_key" => ENV["APP_KEY"]
    }
    # url = "#{BASE_URL}q=#{name}&app_id=#{ENV["EDAMAM_ID"]}&app_key=#{ENV["EDAMAM_KEY"]}"
    response = HTTParty.get("#{BASE_URL}", query: query_params).parsed_response

    list_of_recepies = []
    if response["ok"]
      puts "Everything went well"

      response["hits"].each do |hit|
        recipe = hit["recipe"]
        recipe_instance = self.new(recipe["label"], recipe["image"],recipe["url"],
                recipe["calories"], recipe["dietLabels"], recipe["healthLabels"],
                recipe["ingredients"])
        list_of_recepies << recipe_instance
      end
      list_of_recepies_object
    else
      raise RecipeException.new(response["error"])
    end
  end
end
