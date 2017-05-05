require 'httparty'
# require 'pry-rails'
require 'uri'

class EdamamRecipes
  class EdamamException < StandardError
  end

  BASE_URL = "https://api.edamam.com/search"
  # https://api.edamam.com/search?
  BASE_URI = "https://api.edamam.com/search?r=http://www.edamam.com/ontologies/edamam.owl#"
  # https://api.edamam.com/search?r=http://www.edamam.com/ontologies/edamam.owl%23recipe_c9044642b3673039d454227917c51e11&app_key=b4133bf14265d1c28e3a38bb96909ca6&app_id=3c83c9fe

  attr_reader :uri, :label, :image

  def initialize(recipe_data)
    @uri = recipe_data[:uri]
    @label = recipe_data[:label]
    @image = recipe_data[:image]

  end

  def self.get_recipes(search_request)
    # query_params = {
    #   "app_id" => ENV["EDAMAM_APP_ID"],
    #   "app_key" => ENV["EDAMAM_APP_KEY"],
    #   "q" => search_request
    #   "from" => 0,
    #   "to" => 10,
    # }

    # url = "https://api.edamam.com/search?q=#{search_request}&app_id=#{ENV["EDAMAM_APP_ID"]}&app_key=#{ENV["EDAMAM_APP_KEY"]}"
    # recipes = HTTParty.get("https://api.edamam.com/search?q=#{search_request}&app_id=#{ENV["EDAMAM_APP_ID"]}&app_key=#{ENV["EDAMAM_APP_KEY"]}")
    recipes = HTTParty.get("https://api.edamam.com/search?q=#{search_request}&app_id=#{ENV["EDAMAM_APP_ID"]}&app_key=#{ENV["EDAMAM_APP_KEY"]}")
    recipe_array = []
     recipes["hits"].each do |recipe|
       recipe_array << self.new({ uri: recipe["recipe"]["uri"], label: recipe["recipe"]["label"], image: recipe["recipe"]["image"] })
     end
    return recipe_array
  end

  def self.find_recipe(uri)
    url = URI.escape("#{BASE_URI}#{uri}&app_id=#{ENV["EDAMAM_APP_ID"]}&app_key=#{ENV["EDAMAM_APP_KEY"]}")
    recipe = HTTParty.get(url)
    return recipe
  end

end
