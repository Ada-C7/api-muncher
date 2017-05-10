require 'httparty'

class Recipe_Api_Wrapper
  BASE_URL = "https://api.edamam.com/search"
  ID = ENV["APP_ID"]
  KEY = ENV["APP_KEY"]


  def self.listRecipes()
    url = BASE_URL + "&" + "app_id=$#{ID}&" + "app_key=$#{KEY}"
    response = HTTParty.get(url)
  end
end
