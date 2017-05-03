require 'httparty'

class EdamamWrapper
  BASE_URL = "https://api.edamam.com/search?"
  KEY = ENV['EDAMAM_KEY']
  ID = ENV['APP_ID']

  def self.getRecipes(search_term)
    url = BASE_URL + "q=#{search_term}&app_id =#{ID}&app_key=#{KEY}&from=0&to=50"

    response = HTTParty.get(url)

    recipes = []
    if response["hits"]
      response["hits"].each do |hash|
        #hits is an array of hashes
        #each hash has "recipe" as key
        name = hash["recipe"]["label"]
        id = hash["recipe"]["uri"]
        image = hash["recipe"]["image"]
        recipes << Recipe.new(name, id, image)
      end
    end
    return recipes
  end

end
