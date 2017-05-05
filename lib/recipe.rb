require 'httparty'

class Recipe
  URL = "https://api.edamam.com/search"
  ID = ENV["EDAMOM_ID"]
  KEY = ENV["EDAMOM_KEY"]

  attr_reader :id, :name, :image, :source_url, :ingredients\

  def initialize(data)
    @id = data["uri"].match(/#recipe\_(.*)/)[1]
    @name = data["label"]
    @image = data["image"]
    @source_url = data["url"]
    @ingredients = data["ingredientLines"]
  end

  # returns a collection of recipe objects that match the search conditions
  # if no range (to:, from:) is provided, defaults to first ten
  def self.search(query_params)
    query_params["app_id"] = ID
    query_params["app_key"] = KEY

    response = HTTParty.get(URL, query: query_params)
    if response.code == 200
      recipes = response["hits"].map do |recipe_data|
        self.new(recipe_data["recipe"])
      end
      return recipes
    else
      return response.code
    end
  end

  def self.count_results(search_term)
    query_params = {
      "q" => search_term,
      "app_id" => ID,
      "app_key" => KEY,
    }

    response = HTTParty.get(URL, query: query_params)
    return response["count"]
  end
end
