require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/"
  APP_ID = ENV["EDAMAM_APP_ID"]
  APP_KEY = ENV["EDAMAM_APPLICATION_KEY"]

  def self.search(search_term)
    #raise
    url = BASE_URL + "search?" + "app_id=#{APP_ID}" + "&app_key=#{APP_KEY}" + "&q=#{search_term}" + "&to=10"

    response = HTTParty.get(url).parsed_response

    recipes = []
    if response["hits"]
      response["hits"].each do |recipe|
        label = recipe["recipe"]["label"]
        uri = recipe["recipe"]["uri"]
        recipes << Recipe.new(label, uri)
      end
    end
    #raise
    return recipes
  end
end
