require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  EDAMAM_ID = ENV["EDAMAM_ID"]
  EDAMAM_KEY = ENV["EDAMAM_KEY"]

  # method that takes search term, desired beginning and ending index
  # and returns an array of recipe objects
  # returns an empty array if search finds no match
  def self.searchRecipes(q, from)
    to = from + 10
    url = BASE_URL + "?q=#{q.gsub(" ", "%20")}" + "&app_id=#{EDAMAM_ID}" + "&app_key=#{EDAMAM_KEY}" + "&from=#{from}" + "&to=#{to}"
    recipes = []
    response = HTTParty.get(url)
    if response["count"] > 0
      response["hits"].each do |recipe_hash|
        recipes << Recipe.new(recipe_hash["recipe"])
      end
    end
    return recipes
  end

  # method that takes an uri of a specific recipe
  # and returns a recipe object
  def self.getRecipe(uri)
    url = BASE_URL + "?r=#{uri.gsub("#","%23")}"+ "&app_id=#{EDAMAM_ID}" + "&app_key=#{EDAMAM_KEY}"
    response = HTTParty.get(url)
    recipe = Recipe.new(response[0])
   raise
    return recipe
  end
end
