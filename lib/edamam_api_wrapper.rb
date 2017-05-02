require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search?q="
  API_ID = ENV['EDAMAM_ID']
  API_KEY = ENV['EDAMAM_KEY']

  def self.getRecipes(query)
    url = BASE_URL +
    query +
    "&app_id=" + API_ID +
    "&app_key=" + API_KEY +
    "&from=0&to=100"

    response = HTTParty.get(url).parsed_response
    return response

  end





end
