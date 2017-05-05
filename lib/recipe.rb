class Recipe
  attr_reader :id, :label, :image_url, :ingredients, :dietary_information,
              :original_recipe, :diets, :health

  def initialize(info)
    @id = info[:id]
    @label = info[:label]
    @image_url = info[:image_url]
    @ingredients = info[:ingredients]
    @diets = info[:diets]
    @health = info[:health]
    @dietary_information = info[:dietary_information]
    @original_recipe = info[:original_recipe]
  end

  def self.list_of_recipes(response)
    list = response.map do |api_info|
      recipe = Hash.new
      recipe[:id] = api_info["recipe"]["uri"][50..-1]
      recipe[:label] = api_info["recipe"]["label"]
      recipe[:image_url] = api_info["recipe"]["image"]
      Recipe.new(recipe)
    end
    return list
  end

  def self.individual_recipe(response)
    info = Hash.new
    info[:label] = response["label"]
    info[:image_url] = response["image"]
    info[:original_recipe] = response["url"]
    # you want ingredientLines
    info[:ingredients] = response["ingredientLines"]
    info[:diets] = response["dietLabels"]
    info[:health] = response["healthLabels"]
    info[:dietary_information] = response["totalNutrients"]
    return Recipe.new(info)
  end
end
