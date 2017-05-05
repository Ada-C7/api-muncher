require 'httparty'

class EdmamApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  APP_ID = ENV["EDMAM_ID"]
  TOKEN = ENV["EDMAM_TOKEN"]

  def self.listRecipes(query)
    if query == nil
      raise ArgumentError
    end

    url = "#{BASE_URL}?q=vegan+#{query}&app_id=#{APP_ID}&app_key=#{TOKEN}"

    response = HTTParty.get(url)
    recipes = []

    if response["hits"]
      response["hits"].each do | hit |
        recipes << Recipe.new(hit["recipe"])
      end
    end
    return recipes
  end

  def self.getRecipe

    # fake_ingredients ={
    #   "label" => "banana bread",
    #   "image" => "picture here",
    #   "source" => "source of recipe",
    #   "url" => "url here",
    #   "ingredientLines" => "lots of bananas",
    #   "totalNutrients" => "super healthy stuff"
    # }
    #
    # ingredients = Ingredient.new(fake_ingredients)

    # return ingredients

    url = "#{BASE_URL}?q=vegan+#{query}&app_id=#{APP_ID}&app_key=#{TOKEN}"

    response = HTTParty.get(url)

    ingredients = []

    if response["hits"]["recipe"]
      response["ingredients"].each do | ingredient |
        ingredients << Recipe.new(response["recipe"]["ingredients"])
      end
    end
    return ingredients
  end
end
