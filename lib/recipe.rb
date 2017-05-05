class Recipe
  attr_reader :id, :label, :image_url, :ingredients, :dietary_information, :original_recipe

  def initialize(info)
    @id = info[:id]
    @label = info[:label]
    @image_url = info[:image_url]
    @ingredients = info[:ingredients]
    @dietary_information = info[:dietary_information]
    @original_recipe = info[:original_recipe]
  end

  def self.list_of_recipes(response)
    list = response.map do |info|
      recipe = Hash.new
      recipe[:id] = info["recipe"]["uri"][50..-1]
      recipe[:label] = info["recipe"]["label"]
      recipe[:image_url] = info["recipe"]["image"]
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
    info[:dietary_information] = response["totalNutrients"]
    return Recipe.new(info)
  end
end
