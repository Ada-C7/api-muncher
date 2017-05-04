require 'httparty'

class EdamamApiWrapper

  BASE_URL = "https://api.edamam.com/"
  APP_ID = ENV["EDAMAM_APP_ID"]
  APP_KEY = ENV["EDAMAM_APP_KEY"]

  # "https://api.edamam.com/search?q=chicken&app_id=${YOUR_APP_ID}&app_key=${YOUR_APP_KEY}&from=0&to=3&calories=gte%20591,%20lte%20722&health=alcohol-free"

  def self.search(search_term)
    url = BASE_URL + "search?q=#{search_term}" + "&app_id=#{APP_ID}&app_key=#{APP_KEY}"

    response = HTTParty.get(url)
    # raise
    recipes = []
    # raise
    if response["hits"]
      response["hits"].each do |hit|
        name = hit["recipe"]["label"]
        uri = hit["recipe"]["uri"]
        image = hit["recipe"]["image"]

      recipes << Recipe.new(name, uri, image)
      end
    else
      return nil
    end
    return recipes

  end
end
