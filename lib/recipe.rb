class Recipe
  attr_reader :label, :uri, :image, :url, :ingredients, :total_nutrients, :total_daily

  def initialize(recipe_hash)
    raise ArgumentError if recipe_hash["label"] == nil || recipe_hash["label"] == "" || recipe_hash["uri"] == nil || recipe_hash["uri"] == ""

    @uri = recipe_hash["uri"]
    @label = recipe_hash["label"]
    @image = recipe_hash["image"]
    @url = recipe_hash["url"]
    @ingredients = recipe_hash["ingredients"]
    @total_nutrients = recipe_hash["totalNutrients"]
    @total_daily = recipe_hash["totalDaily"]
  end
end
