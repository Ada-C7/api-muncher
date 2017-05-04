require 'httparty'

class SearchApiWrapper

  BASE_URL = "https://api.edamam.com/search"
  APP_ID = ENV["APP_ID"]
  APP_KEY = ENV["APP_KEY"]

  def self.listRecipes(user_search)
    url = BASE_URL + "?q=#{user_search}" + "&app_id=#{APP_ID}" + "&app_key=#{APP_KEY}" + "&to=10"

    response = HTTParty.get(url)
    hits = response["hits"]
    recipes = []
    hits.each do |hit|
      recipe_details = hit["recipe"]

      label = recipe_details["label"]
      url = recipe_details["url"]
      uri = recipe_details["uri"]
      image = recipe_details["image"]
      ingredients = recipe_details["ingredientLines"]
      dietery_info = recipe_details["healthLabels"]
      nutrients = recipe_details["totalNutrients"]
      recipes << Recipe.new(label, url, image, ingredients, dietery_info, uri, nutrients)
    end
    return recipes
  end

  def self.showRecipe(uri)
    uri = BASE_URL + "?r=#{URI.encode(uri)}"

    response = HTTParty.get(uri)



    label = response[0]["label"]
    url = response[0]["url"]
    uri = response[0]["uri"]
    image = response[0]["image"]
    ingredients = response[0]["ingredientLines"]
    dietery_info =
     response[0]["healthLabels"]
     nutrients = response[0]["totalNutrients"]
    recipe = Recipe.new(label, url, image, ingredients, dietery_info, uri, nutrients)

    return recipe

  end

end

# 'https://api.edamam.com/search?r=http://www.edamam.com/ontologies/edamam.owl%23recipe_637913ec61d9da69eb451818c3293df2'
#
#
# => 'https://api.edamam.com/search?r=http://www.edamam.com/ontologies/edamam.owl#recipe_f1c853a77986214680bbdd424883499a'
