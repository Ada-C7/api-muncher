require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search?q="
  API_ID = ENV['EDAMAM_ID']
  API_KEY = ENV['EDAMAM_KEY']


  # "https://api.edamam.com/search?q=chicken&app_id=${YOUR_APP_ID}&app_key=${YOUR_APP_KEY}&from=0&to=3&calories=gte%20591,%20lte%20722&health=alcohol-free"

  def self.getRecipes(query)
    url = BASE_URL +
    query +
    "&app_id=" + API_ID +
    "&app_key=" + API_KEY

    response = HTTParty.get(url)
    raise
    recipes = response.parsed_response
    return recipes

  end





end
