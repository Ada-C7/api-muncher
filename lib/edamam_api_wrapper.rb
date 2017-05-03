require 'httparty'

class EdamamApiWrapper

  BASE_URL = "https://api.edamam.com/search?"
  APP_ID = ENV["APP_ID"]
  APP_KEY = ENV["APP_KEY"]


  def self.findRecipes(query)

    url = BASE_URL + "q=#{query.gsub(" ", "+")}" + "&from=0&to=3" + "&app_id=#{APP_ID}" + "&app_key=#{APP_KEY}"

    response = HTTParty.get(url)

    recipes =[]
    if response["hits"]
      response["hits"].each do |hit|
        name = hit["recipe"]["label"]
        image = hit["recipe"]["image"]
        uri = hit["recipe"]["uri"]
        url = hit["recipe"]["url"]
        servings = hit["recipe"]["yield"]
        dietLabels = hit["recipe"]["dietLabels"]
        healthLabels = hit["recipe"]["healthLabels"]
        ingredients = hit["recipe"]["ingredientList"]

        recipes << Recipe.new(name, image, uri, options =
        {
          url: url,
          servings: servings,
          diet: dietLabels,
          healthLabels: healthLabels,
          ingredients: ingredients
          }
        )
      end
    end
    #raise
    return recipes
  end

  def self.showRecipe(uri)

    url = BASE_URL + "r=#{uri.gsub("#", "%23")}" + "&app_id=#{APP_ID}" + "&app_key=#{APP_KEY}"

    response = HTTParty.get(url)
    raise
    return response
  end

end
