require 'httparty'

class EdmamApiWrapper
  BASE_URL = "https://api.edamam.com"
  TOKEN = ENV["EDMAM_TOKEN"]

  def self.listRecipes(query = nil) # default query is nil

    fake_recipe = {
      "name" => "banana bread",
      "uri" => "http://www.edamam.com/ontologies/edamam.owl#recipe_f1c853a77986214680bbdd424883499a",
      "label" => "best banana bread",
      "image" => "fetch.jpg",
      "source" => "bar",
      "url" => "foo"
    }

    recipe = Recipe.new(fake_recipe)

    return [recipe]

    # token ||= token
    #
    # url = BASE_URL + "recipes.list?" + "token=#{token}"
    #
    # response = HTTParty.get(url)
    #
    # recipes = []
    #
    # if response ["recipes"]
    #   response["recipes"].each do | recipe |
    #     id = recipe["id"]
    #     name = recipe["name"]
    #     recipes << Recipe.new(name, id)
    #   end
    # end
    # return recipes
  end

  def self.getRecipe(id=nil)

    fake_ingredients ={
      "label" => "banana bread",
      "image" => "picture here",
      "source" => "source of recipe",
      "url" => "url here",
      "ingredientLines" => "lots of bananas",
      "totalNutrients" => "super healthy stuff"
    }

    ingredients = Ingredient.new(fake_ingredients)

    return ingredients

    #   url = BASE_URL + "recipes.info?" + "token=#{TOKEN}&recipe=#{id}"
    #
    #   response = HTTParty.get(url)
    #
    #   return Recipe.new(response["recipe"]["name"], response["recipe"]["id"])
  end
end
