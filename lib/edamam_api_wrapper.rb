require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search?"
  ID = ENV["APP_ID"]
  KEY = ENV["APP_KEY"]

  def self.findRecipes(search)
    url = BASE_URL + "app_key=#{KEY}&" + "app_id=#{ID}&" + "q=#{search}"

    r = HTTParty.get(url)

    recipes = []
    r["hits"].each do |recipe|
      recipe_info = Hash.new
      recipe_info["label"] = recipe["recipe"]["label"]
      recipe_info["image"] = recipe["recipe"]["image"]
      recipe_info["source"] = [recipe["recipe"]["source"], recipe["recipe"]["url"]]
      recipe_info["ingredients"] = recipe["recipe"]["ingredientLines"]
      recipe_info["nutrition"] = recipe["recipe"]["totalNutrients"]

      recipes << Recipe.new(recipe_info)
    end

    return recipes
  end

end
