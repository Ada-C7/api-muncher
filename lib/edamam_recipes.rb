require 'httparty'
require 'uri'

class EdamamRecipes
  class EdamamException < StandardError
  end

  BASE_URL = "https://api.edamam.com/search"
  BASE_URI = "https://api.edamam.com/search?r=http://www.edamam.com/ontologies/edamam.owl#"

  attr_reader :uri, :label, :image

  def initialize(recipe_data)
    @uri = recipe_data[:uri]
    @label = recipe_data[:label]
    @image = recipe_data[:image]
  end

  def self.get_recipes(search_request, from, to)

    # tried to make query_params work, but it was buggy
    # query_params = {
    #   "app_id" => ENV["EDAMAM_APP_ID"],
    #   "app_key" => ENV["EDAMAM_APP_KEY"],
    #   "q" => search_request
    #   "from" => "from",
    #   "to" => "to"
    # }

    recipes = HTTParty.get("https://api.edamam.com/search?q=#{search_request}&app_id=#{ENV["EDAMAM_APP_ID"]}&app_key=#{ENV["EDAMAM_APP_KEY"]}&from=#{from}&to=#{to}")
    recipe_array = []
     recipes["hits"].each do |recipe|
       recipe_array << self.new({ uri: recipe["recipe"]["uri"], label: recipe["recipe"]["label"], image: recipe["recipe"]["image"] })
     end
    return recipe_array
    # end
  end

  def self.find_recipe(uri)
    url = URI.escape("#{BASE_URI}#{uri}&app_id=#{ENV["EDAMAM_APP_ID"]}&app_key=#{ENV["EDAMAM_APP_KEY"]}")
    recipe = HTTParty.get(url)
    return recipe
  end

end
