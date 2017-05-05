require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search?"
  APP_KEY = ENV["EDAMAM_TOKEN"]
  APP_ID = ENV["APP_TOKEN"]

  def self.listRecipes(search_term)

    search = URI.encode(search_term)
    url = BASE_URL + "q=#{search}&" + "app_id=#{APP_ID}&" + "app_key=#{APP_KEY}"

    response = HTTParty.get(url)
    search_results = response["hits"]

    recipes = []
    if search_results
        search_results.each do |recipe|
        recipes << Recipe.new(recipe["recipe"]["label"], recipe["recipe"]["image"], recipe["recipe"]["uri"].partition("recipe_").last, recipe["recipe"]["url"])
      end
    end

    return recipes
  end

  def self.findRecipe(id)
    url = BASE_URL + "r=http://www.edamam.com/ontologies/edamam.owl%23recipe_#{id}&" + "app_id=#{APP_ID}&" + "app_key=#{APP_KEY}"

    response = HTTParty.get(url)
    recipe = response.first
    if recipe
      label = recipe["label"]
      image = recipe["image"]
      uri = recipe["uri"].partition("recipe_").last
      url = recipe["url"]
      options = {}
      options[:ingredientLines] = recipe["ingredientLines"]
      options[:totalNutrients] = recipe["totalNutrients"]
      options[:totalDaily] = recipe["totalDaily"]
      options[:digest] = recipe["digest"]

      recipe = Recipe.new(label, image, uri, url, options)
    end
  return recipe
  end
end
