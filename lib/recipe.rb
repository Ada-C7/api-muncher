require 'httparty'

class Recipe
  class RecipeError < StandardError
  end

  URL = "https://api.edamam.com/search"
  ID = ENV["EDAMOM_ID"]
  KEY = ENV["EDAMOM_KEY"]

  attr_reader :id, :name, :image, :source_url, :ingredients, :servings, :calories, :labels

  def initialize(data)
    @id = data["uri"].match(/#recipe\_(.*)/)[1]
    @name = data["label"]
    @image = data["image"]
    # @source = data["source"]
    @servings = data["yield"]
    @calories = data["calories"]
    @source_url = data["url"]
    @ingredients = data["ingredientLines"]
    @labels = data["healthLabels"]
  end

  # returns a collection of recipe objects that match the search conditions
  # if no range (to:, from:) is provided, defaults to first ten
  def self.search(recipe_params)
    query_params = generate_query_hash(recipe_params)

    response = HTTParty.get(URL, query: query_params)
    if response.code == 200
      recipes = response["hits"].map do |recipe_data|
        self.new(recipe_data["recipe"])
      end
      return recipes
    else
      raise RecipeError.new(response.code)
    end
  end

  def self.count_results(recipe_params)
    query_params = generate_query_hash(recipe_params)

    response = HTTParty.get(URL, query: query_params)
    # response.code == 200 ? response["count"] : RecipeError.new(response.code)
    if response.code == 200
      return response["count"]
    else
      raise RecipeError.new(response.code)
    end
  end

  private
  def self.generate_query_hash(recipe_params)
    {
      "q" => recipe_params["q"],
      "from" => recipe_params["from"] ||= 0,
      "to" => recipe_params["to"] ||= 12,
      "app_id" => ID,
      "app_key" => KEY
    }
  end
end
