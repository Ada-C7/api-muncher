require 'httparty'
require 'pry-rails'

class EdamamRecipes
  class EdamamException < StandardError
  end

  BASE_URL = "https://api.edamam.com/search"

  attr_reader :uri, :label, :image

  def initialize(auth_hash)
    @uri = auth_hash[:uri]
    @label = auth_hash[:label]
    @image = auth_hash[:image]
  end

  def self.get_recipes(search_request)
    # url = "https://api.edamam.com/search?q=#{search_request}&app_id=#{ENV["EDAMAM_APP_ID"]}&app_key=#{ENV["EDAMAM_APP_KEY"]}"
    recipes = HTTParty.get("https://api.edamam.com/search?q=#{search_request}&app_id=#{ENV["EDAMAM_APP_ID"]}&app_key=#{ENV["EDAMAM_APP_KEY"]}")
    recipe_array = []
     recipes["hits"].each do |recipe|
       recipe_array << self.new({ uri: recipe["recipe"]["uri"], label: recipe["recipe"]["label"], image: recipe["recipe"]["image"] })
     end
    return recipe_array
  end

  def self.find_recipe
    uri = EdamamRecipes.uri
    return uri

  end

end

# recipes["hits"].each do |recipe|

# response = HTTParty.get("https://api.edamam.com/search?q=#{search_request}&app_id=#{ENV["EDAMAM_APP_ID"]}&app_key=#{ENV["EDAMAM_APP_KEY"]}").parsed_response

# else
#   raise EdamamException.new("no hits found")
# end

# puts EdamamRecipes.get_recipes("chicken")

# seven_wonders = ["Great Pyramind of Giza", "Hanging Gardens of Babylon", "Colossus of Rhodes", "Lighthouse of Alexandria", "Statue of Zeus at Olympia", "Temple of Artemis", "Mausoleum at Halicarnassus"]
#
# BASE_URL = "http://maps.google.com/maps/api/geocode/json?address="
#
# output = {}
#
# seven_wonders.each do |wonder|
#   @response = HTTParty.get("#{BASE_URL}#{wonder}").parsed_response #don't seem to need the .parsed_response
#     output[wonder] = @response["results"][0]["geometry"]["location"]
# end
#
# puts output
