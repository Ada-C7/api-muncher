require 'httparty'

class Recipe_Api_Wrapper
  BASE_URL = "https://api.edamam.com/search/"
  ID = ENV["APP_ID"]
  KEY = ENV["APP_KEY"]


  def self.getRecipesList(name)
    url = BASE_URL + "app_id=$#{ID}&" + "app_key=$#{KEY}" + "?q=#{name}&"
    response = HTTParty.get(url)
  end
end

curl "https://api.edamam.com/search?q=chicken&app_id=${YOUR_APP_ID}&app_key=${YOUR_APP_KEY}&from=0&to=3&calories=gte%20591,%20lte%20722&health=alcohol-free"
