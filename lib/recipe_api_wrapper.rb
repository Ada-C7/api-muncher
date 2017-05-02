require 'httparty'

class RecipeApiWrapper
  BASE_URL = "https://api.edamam.com/search?"
  ID = ENV["APP_ID"]
  KEY = ENV["APP_KEY"]
end
