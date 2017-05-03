require 'httparty'

class RecipeApiWrapper
  BASE_URL = "https://api.edamam.com/search?"
  ID = ENV["APP_ID"]
  KEY = ENV["APP_KEY"]

  def self.findRecipes(search)
    url = BASE_URL + "app_key=#{KEY}&" + "app_id=#{ID}&" + "q=#{search}"

    r = HTTParty.get(url)

    recipes = []
    r.each do |recipe|
      recipe_info = Hash.new
      recipe_info["label"] = r["recipe"]["label"]
      recipe_info["image"] = r["recipe"]["image"]
      recipe_info["source"] = [r["recipe"]["source"], r["recipe"]["url"]]
      recipe_info["ingredients"] = r["recipe"]["ingredientLines"]
      recipe_info["nutrition"] = r["recipe"]["totalNutrients"]

      recipes << Recipe.new(recipe_info)
    end

    return recipes
  end
end
