require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  APP_ID = ENV["APP_ID"]
  APP_KEY = ENV["APP_KEY"]

  def self.get_recipes(search_term)
    url = "#{BASE_URL}?q=#{search_term}&app_id=#{APP_ID}&app_key=#{APP_KEY}"
    results = HTTParty.get(url)

    Recipe.create_from_edamam(results["hits"])
  end
end
