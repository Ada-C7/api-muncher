require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  APP_ID = ENV["APP_ID"]
  APP_KEY = ENV["APP_KEY"]

  def self.get_recipes(search_term)
    url = "#{BASE_URL}?q=#{search_term}&app_id=#{APP_ID}&app_key=#{APP_KEY}"
    data = HTTParty.get(url)

    data["hits"] ? data["hits"] : []
  end
end
