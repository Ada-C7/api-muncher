require 'httparty'

class EdmamApiWrapper
  BASE_URL = "https://api.edamam.com"
  TOKEN = ENV["EDMAM_TOKEN"]

  def self.listRecipes(token = nil)
    token ||= token

    url = BASE_URL + "recipes.list?" + "token=#{token}"

    response = HTTParty.get(url)

    recipes = []

    if response ["recipes"]
      response["recipes"].each do | recipe |
        id = recipe["id"]
        name = recipe["name"]
        recipes << Recipe.new(name, id)
      end
    end
    return recipes
  end

  def self.getRecipe(id)
    url = BASE_URL + "recipes.info?" + "token=#{TOKEN}&recipe=#{id}"

    response = HTTParty.get(url)

    return Recipe.new(response["recipe"]["name"], response["recipe"]["id"])
  end


end
