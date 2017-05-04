require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search?"
  APP_KEY = ENV["EDAMAM_TOKEN"]
  APP_ID = ENV["APP_TOKEN"]

  def self.listRecipes(search_term)

    search = URI.encode(search_term)
    url = BASE_URL + "q=#{search}&" + "app_id=#{APP_ID}&" + "app_key=#{APP_KEY}"

    response = HTTParty.get(url)
    recipes = []
    if response["hits"]
      response["hits"].each do |hit|
        label = hit["recipe"]["label"]
        image = hit["recipe"]["image"]
        uri = hit["recipe"]["uri"].partition("recipe_").last
        url = hit["recipe"]["url"]
        recipes << Recipe.new(label, image, uri, url)
      end
    end

    return recipes
  end

  def self.findRecipe(id)
    url = BASE_URL + "r=http://www.edamam.com/ontologies/edamam.owl%23recipe_#{id}&" + "app_id=#{APP_ID}&" + "app_key=#{APP_KEY}"

    response = HTTParty.get(url)
    if response["hits"]
      label = ["hits"][0]["recipe"]["label"]
      image = ["hits"][0]["recipe"]["image"]
      uri = ["hits"][0]["recipe"]["uri"]
      url = ["hits"][0]["recipe"]["url"]

      Recipe.new(label, image, uri, url)
    end
  return recipe
  end
end
