require 'httparty'

class SearchApiWrapper

  BASE_URL = "https://api.edamam.com/"
  APP_KEY = ENV[""]
  APP_ID = ENV[""]

  def self.getRecipes(q)
    url = BASE_URL

    response = HTTParty.get(url)

    if response[""]

  end



end
