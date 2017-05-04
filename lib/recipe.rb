class Recipe

  attr_reader :id, :label, :image, :url, :ingredientLines, :dietLabels, :healthLabels

  def initialize(recipe_hash)
    raise ArgumentError if recipe_hash == nil || recipe_hash.class != Hash || recipe_hash["id"] == nil

    @id = recipe_hash["id"]
    @label = recipe_hash["label"]
    @image = recipe_hash["image"]
    @url = recipe_hash["url"]
    @ingredientLines = recipe_hash["ingredientLines"]
    @dietLabels = recipe_hash["dietLabels"]
    @healthLabels = recipe_hash["healthLabels"]
  end
end
