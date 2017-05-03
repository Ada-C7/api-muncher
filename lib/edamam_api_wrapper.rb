require "httparty"

class EdamamApiWrapper


  URL = "https://api.edamam.com/search"
  KEY = ENV["APP_KEY"]
  ID = ENV["APP_ID"]
  ITEMS = 10

  def initialize
  end


  def find_recipes
    query_params = {
      "app_id" => ID,
      "app_key" => KEY,
      "q" => "rice"
    }
    data = HTTParty.get(URL, query_params)
  end

end
