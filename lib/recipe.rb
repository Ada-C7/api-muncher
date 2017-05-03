require 'httparty'

class Recipe
  BASE_URL = "https://api.edamam.com/"
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
  def self.search(search_term)
    query_params = {
      "q" => search_term,
      "app_id" => ID,
      "app_key" => KEY,
      "from" => 0,
      "to" => 2
    }

    url = "#{BASE_URL}search"
    response = HTTParty.get(url, query: query_params)
    if response.code == 200
      recipes = response["hits"].map do |recipe_data|
        self.new(recipe_data["recipe"])
      end
      return recipes
    else
      return response.code
    end
  end
end
