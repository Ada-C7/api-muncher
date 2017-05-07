require 'httparty'

class EdmamApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  APP_ID = ENV["EDMAM_ID"]
  TOKEN = ENV["EDMAM_TOKEN"]

  def self.listRecipes(query, from = 1, to = 11)
    if query == nil
      raise ArgumentError
    end

    url = "#{BASE_URL}?q=vegan+#{query}&app_id=#{APP_ID}&app_key=#{TOKEN}&from=#{from}&to=#{to}"

    response = HTTParty.get(url) # JSON object
    recipes = []

    if response["hits"]
      response["hits"].each do | hit |
        recipes << Recipe.new(hit["recipe"])
      end
    end

    num_of_recipes = recipes.length

    if response["count"]
      num_of_recipes = response["count"]
    end
    RecipeResponse.new(recipes, num_of_recipes)
  end

  def self.getRecipe(uri)
    uri = URI.encode(uri)
    url = "#{BASE_URL}?r=" + uri + "&app_id=#{APP_ID}&app_key=#{TOKEN}"

    response = HTTParty.get(url)
    if response[0]
      return Recipe.new(response[0])
    end
  end
end
