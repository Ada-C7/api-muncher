require 'httparty'

class EdamamApiWrapper

  BASE_URL = "https://api.edamam.com/search?"
  APP_ID = ENV["EDAMAM_APP_ID"]
  APP_KEY = ENV["EDAMAM_APP_KEY"]

  def self.search(search_term)
    url = BASE_URL + "q=#{search_term}" + "&app_id=#{APP_ID}&app_key=#{APP_KEY}"

    response = HTTParty.get(url)
    recipes = []
    if response["hits"]
      response["hits"].each do |hit|
        name = ["recipe"]["label"]
        uri = ["recipe"]["uri"]
        image = ["recipe"]["image"]
        raise 
      return recipes << Recipe.new(name, uri, image)
      end
    else
      return nil
    end
    return recipes

  end
end
