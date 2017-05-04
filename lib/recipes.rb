require 'httparty'
# require 'awesome_print'
# require 'pry'

class Recipe
  class RecipeException < StandardError
  end

  attr_accessor :label, :image, :url, :calories, :dietLabels, :healthLabels, :ingredients

  def initialize(params)
    raise ArgumentError if params == nil
      @label = params[:label]
      @image = params[:image]
      @url = params[:url]
      @calories = params[:calories]
      @dietLabels = params[:dietLabels]
      @healthLabels = params[:healthLabels]
      @ingredients = params[:ingredients]
  end

  BASE_URL = "https://api.edamam.com/search"
  def self.search(name)
    # query_params = {
    #   "app_id" => ENV["APP_ID"],
    #   "app_key" => ENV["APP_KEY"],
    #   "q" => name
    # }
    url = "#{BASE_URL}?q=#{name}&app_id=#{ENV["APP_ID"]}&app_key=#{ENV["APP_KEY"]}"
    response = HTTParty.get(url) #.parsed_response

    list_of_recepies = []

    # binding.pry
    if response['more']
      response.parsed_response["hits"].each do |hit|
        recipe = hit["recipe"]
        # recipe_instance = self.new(hit.label, hit.image, hit.url, hit.calories, hit.dietLabels, hit.healthLabels, hit.ingredients)
        recipe_instance = self.new(hit)
          # ["label"], hit["image"],hit["url"],
          #       hit["calories"], hit["dietLabels"], hit["healthLabels"],
          #       hit["ingredients"])
        list_of_recepies << recipe_instance
      end
      list_of_recepies
    else
      raise RecipeException.new(response["error"])
    end
  end
end
