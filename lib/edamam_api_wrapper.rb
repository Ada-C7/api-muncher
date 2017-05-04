require 'httparty'

class EdamamApiWrapper

  BASE_URL = "https://api.edamam.com/search?"
  API_KEY = ENV["API_KEY"]
  API_ID = ENV["API_ID"]


  def self.searchRecipes(q, token = nil)
    token ||= API_KEY

    recipe_num = 100
    url = BASE_URL + "&app_key=" + API_KEY + "app_id=" + API_ID + "&" + "q="+ q.to_s + "&from=0&to=" + recipe_num.to_s
    response = HTTParty.get(url)

    @recipes = []

    response["hits"].each do |recipe|
      uri = recipe["recipe"]["uri"]
      label = recipe["recipe"]["label"]
      image = recipe["recipe"]["image"]
      url = recipe["recipe"]["url"]
      source = recipe["recipe"]["source"]
      ingredients = recipe["recipe"]["ingredients"]
      ingredientlines = recipe["recipe"]["ingredientLines"]
      dietlabels = recipe["recipe"]["dietLabels"]
      healthlabels = recipe["recipe"]["healthLabels"]
      calories = recipe["recipe"]["calories"]
      totalNutrients = recipe["recipe"]["totalNutrients"]
      id = recipe["recipe"]["uri"].split('_')[1]


      @recipes << Recipe.new(uri, label, image, url, source, ingredients, ingredientlines, dietlabels, healthlabels, calories, totalNutrients, id)
    end

    return @recipes
  end

  def self.getRecipe(id, token = nil)
    token ||= API_KEY

    url = BASE_URL + "&app_key=" + API_KEY + "app_id=" + API_ID + "&" + "r=http://www.edamam.com/ontologies/edamam.owl%23recipe_" + id.to_s

    response = HTTParty.get(url)
      uri = response[0]["uri"]
      label = response[0]["label"]
      image = response[0]["image"]
      url = response[0]["url"]
      source = response[0]["source"]
      ingredients = response[0]["ingredients"]
      ingredientlines = response[0]["ingredientLines"]
      dietlabels = response[0]["dietLabels"]
      healthlabels = response[0]["healthLabels"]
      calories = response[0]["calories"]
      totalNutrients = response[0]["totalNutrients"]
      id = response[0]["uri"].split('_')[1]

      @recipe = Recipe.new(uri, label, image, url, source, ingredients, ingredientlines, dietlabels, healthlabels, calories, totalNutrients, id)


    return @recipe
  end

end
