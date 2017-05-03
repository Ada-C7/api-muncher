require 'httparty'
require 'pry-rails'

class EdamamRecipes
  class EdamamException < StandardError
  end

  BASE_URL = "https://api.edamam.com/search"

  # attr_reader :label

  def initialize
    @label
  end

  def self.get_recipes(search_request)

    # query_params = {
    #   # "q" => search_reques,
    #   "q" => "chicken",
    #   "app_id" => ENV['EDAMAM_APP_ID'],
    #   "app_key" => ENV['EDAMAM_APP_KEY']
    # }
    # url = "#{BASE_URL}"
    # response = HTTParty.get(url, query: query_params).parsed_response


    response = HTTParty.get("https://api.edamam.com/search?q=#{search_request}&app_id=#{ENV["EDAMAM_APP_ID"]}&app_key=#{ENV["EDAMAM_APP_KEY"]}").parsed_response

    # if response["ok"]
    #   puts "Everything went swell"
      return response
    # else
    #   raise EdamamException.new("no hits found")
    # end
  end

end

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
