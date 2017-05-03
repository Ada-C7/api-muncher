require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  EDAMAM_ID = ENV["EDAMAM_ID"]
  EDAMAM_KEY = ENV["EDAMAM_KEY"]

# method that takes search term, desired beginning and ending index
# and returns an array of recipe objects
# returns an empty array if search finds no match
  def self.searchRecipes(q, from, to)
    edamam_id ||= EDAMAM_ID
    edamam_key ||= EDAMAM_KEY

    url = BASE_URL + "?q=#{q.gsub(" ", "%20")}" + "&app_id=#{edamam_id}" + "&app_key=#{edamam_key}" + "&from=#{from}" + "&to=#{to}"
    recipes = []
    response = HTTParty.get(url)
    if response["count"] > 0
      response["hits"].each do |recipe_hash|
        recipes << Recipe.new(recipe_hash["recipe"]["label"],recipe_hash["recipe"]["uri"].gsub("#","%23"),recipe_hash["recipe"]["image"])
      end
    end
    return recipes
  end

end
