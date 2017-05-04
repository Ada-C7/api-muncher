class RecipeBook
  attr_reader :unformated_recipe_data

  def initialize(response)
    @unformated_recipe_data = response
  end

  def list_of_recipes
    # pass in recipe_data["hits"]
    results = unformated_recipe_data.map do |info|
    results = unformated_recipe_data["hits"].map do |info|
      recipe = Hash.new
      recipe[:id] = info["recipe"]["uri"].gsub("#", "%23")[53..-1]
      recipe[:label] = info["recipe"]["label"]
      recipe[:image_url] = info["recipe"]["image"]
      recipe
    end
    return results
  end

  def wanted_recipe_info
    recipe = Hash.new
    recipe[:label] = unformated_recipe_data["label"]
    recipe[:image_url] = unformated_recipe_data["image"]
    recipe[:original_recipe] = unformated_recipe_data["url"]
    # you want ingredientLines
    recipe[:ingredients] = unformated_recipe_data["ingredientLines"]
    recipe[:ingredients2] = unformated_recipe_data["ingredients"]
    recipe[:dietary_information] = unformated_recipe_data["totalNutrients"]
    recipe
  end

end
