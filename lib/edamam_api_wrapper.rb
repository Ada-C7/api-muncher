require 'httparty'

class EdamamApiWrapper

  BASE_URL = "https://api.edamam.com/search?"
  API_KEY = ENV["API_KEY"]
  API_ID = ENV["API_ID"]

  def self.searchRecipes(q, token = nil)
    url = BASE_URL + "&app_key=" + API_KEY + "app_id=" + API_ID + "&" + "q="+ q.to_s
    response = HTTParty.get(url)
    
    return response
  end

end
