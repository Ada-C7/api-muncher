require 'httparty'

class SearchApiWrapper

  BASE_URL = "https://api.edamam.com/"
  APP_ID = ENV["APP_ID"]
  APP_KEY = ENV["APP_KEY"]

  def self.getRecipes(text)
    url = BASE_URL + "search?q=#{text}" + "&app_id=#{APP_ID}" + "&app_key=#{APP_KEY}"

    response = HTTParty.get(url)
    hits = response["hits"]

    recipes = []
    hits.each do |recipe|
      recipes << recipe["recipe"]["label"]
    end

    #raise



  end



end
