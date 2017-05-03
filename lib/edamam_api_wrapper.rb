require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  APP_KEY = ENV["EDAMAM_TOKEN"]
  APP_ID = dc26f0f1

  def self.listRecipes(search_term)
    token ||= TOKEN
    url = BASE_URL + "?g=#{search_term.gsub(" ", "%20")}&" + APP_ID + "&" + APP_KEY

    response = HTTParty.get(url)

    recipes = []
    if response["hits"]
      response["hits"].each do |hit|
        label = hit["recipe"]["label"]
        image = hit["recipe"]["image"]
        uri = hit["recipe"]["uri"]
        url = hit["recipe"]["url"]

        recipes << Recipe.new(label, image, uri, url)
      end
    end

    return recipes
  end

def self.findRecipe(uri)
  url = BASE_URL + "r=%23#{uri}&" + APP_ID + "&" + APP_KEY
end

end
