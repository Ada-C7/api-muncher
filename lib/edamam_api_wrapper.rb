require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search?"
  ID = ENV["APP_ID"]
  KEY = ENV["APP_KEY"]

  # method to get recipes matching search query
  def self.listRecipes(q)
    url = BASE_URL + "q=#{q}" + "&app_id=" + ID + "&app_key=" + KEY + "&to=80"

    response = HTTParty.get(url).parsed_response["hits"]

    recipes = []
    if response
      response.each_with_index do | recipe, index |
        name = response[index]["recipe"]["label"]
        image = response[index]["recipe"]["image"]
        uri = response[index]["recipe"]["uri"]
        ingredients = response[index]["recipe"]["ingredientLines"]
        link = response[index]["recipe"]["url"]
        diet = response[index]["recipe"]["totalNutrients"]

        recipes << Recipe.new(name, image, uri, ingredients: ingredients, link: link, diet: diet)
      end
    end
    return recipes
  end

  # method to get one recipe
  def self.getRecipe(uri)
    url = BASE_URL + "r=#{uri}"

    response = HTTParty.get(url).parsed_response[0]

    name = response["label"]
    image = response["image"]
    uri = response["uri"]
    ingredients = response["ingredientLines"]
    link = response["url"]
    diet = response["totalNutrients"]

    recipe = Recipe.new(name, image, uri, ingredients: ingredients, link: link, diet: diet)
  end
end
