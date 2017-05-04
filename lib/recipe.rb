class Recipe
  attr_reader :label, :uri, :image, :url, :ingredients, :totalNutrients, :totalDaily

  def initialize(recipe_hash)
    raise ArgumentError if recipe_hash["label"] == nil || recipe_hash["label"] == "" || recipe_hash["uri"] == nil || recipe_hash["uri"] == ""

    @uri = recipe_hash["uri"]
    @label = recipe_hash["label"]
    @image = recipe_hash["image"]
    @url = recipe_hash["url"]
    @ingredients = recipe_hash["ingredients"]
    @totalNutrients = recipe_hash["totalNutrients"]
    @totalDaily = recipe_hash["totalDaily"]
  end
end
