require 'httparty'

class EdmamApiWrapper
  BASE_URL = "https://api.edamam.com"
  TOKEN = ENV["EDMAM_TOKEN"]

  def self.listRecipes(query = nil) # default query is nil

    fake_recipe = {
      "name" => "banana bread",
      "uri" => "a_b",
      "label" => "best banana bread",
      "image" => "foo",
      "source" => "bar",
      "url" => "foo"
    }

    recipe = Recipe.new(fake_recipe)

    return [recipe]

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
