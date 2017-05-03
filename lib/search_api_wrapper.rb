require 'httparty'

class SearchApiWrapper

  BASE_URL = "https://api.edamam.com/"
  APP_ID = ENV["APP_ID"]
  APP_KEY = ENV["APP_KEY"]

  def self.listRecipes(user_search)
    url = BASE_URL + "search?q=#{user_search}" + "&app_id=#{APP_ID}" + "&app_key=#{APP_KEY}"

    response = HTTParty.get(url)
    hits = response["hits"]
    recipes = []
    hits.each do |hit|
      recipe_details = hit["recipe"]

      label = recipe_details["label"]
      url = recipe_details["url"]
      image = recipe_details["image"]
      ingredients = recipe_details["ingredientLines"]
      dietery_info = recipe_details["healthLabels"]
      recipes << Recipe.new(label, url, image, ingredients, dietery_info)
    end
    return recipes
  end



end
