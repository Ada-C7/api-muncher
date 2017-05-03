require 'httparty'

class EdamamApiWrapper

  BASE_URL = "https://api.edamam.com/search?"
  APP_ID = ENV["EDAMAM_APP_ID"]
  APP_KEY = ENV["EDAMAM_APP_KEY"]

  def self.getChannel(search_term)
    url = BASE_URL + "q=#{search_term}" + "&app_id=#{APP_ID}&app_key=#{APP_KEY}"
    response = HTTParty.get(url)
    raise 
  end
end
