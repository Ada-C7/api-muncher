require 'httparty'


class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/"
  APP_ID = ENV["EDAMAM_ID"]
  APP_KEY = ENV["EDAMAM_KEY"]

  def self.search(search_term)
    url = BASE_URL + "search?" + "app_id=#{APP_ID}&" + "app_key=#{APP_KEY}&" + "q=#{search_term}&" + "to=100"

    response = HTTParty.get(url)

    recipes = []
    if response["hits"]

      response["hits"].each do |recipe|
        options = {
          label: recipe["recipe"]["label"],
          uri: recipe["recipe"]["uri"],
          image: recipe["recipe"]["image"]
        }
        recipes << Recipe.new(options)
      end
      return recipes
    end
  end

  def self.show_recipe(uri)
    uri = URI.encode(uri)
    url = "https://api.edamam.com/search?r=" + uri + "&app_id=#{APP_ID}&" + "app_key=#{APP_KEY}"
    response = HTTParty.get(url)
    options = {
      label: response[0]["label"],
      image:  response[0]["image"],
      uri:  response[0]["uri"],
      recipe_source: response[0]["source"],
      totalNutrients: response[0]["totalNutrients"],
      ingredientLines: response[0]["ingredientLines"]
    }
    return Recipe.new(options)

  end
end
