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
      recipe_info["uri"] = recipe["recipe"]["uri"].gsub("#", "%23")
      recipe_info["label"] = recipe["recipe"]["label"]
      recipe_info["image"] = recipe["recipe"]["image"]

      recipes << Recipe.new(recipe_info)
    end

    return recipes
  end

  def self.findRecipe(uri)

    url = BASE_URL + "app_key=#{KEY}&" + "app_id=#{ID}&" + "r=#{uri}"

    r = HTTParty.get(url)

    recipe_info = Hash.new

    recipe_info["label"] = r["label"]
    recipe_info["image"] = r["image"]
    recipe_info["source"] = [r["source"], r["url"]]
    recipe_info["ingredients"] = r["ingredientLines"]
    recipe_info["nutrition"] = ["totalNutrients"]

    return Recipe.new(recipe_info)
  end

end
