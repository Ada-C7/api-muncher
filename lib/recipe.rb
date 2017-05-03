class Recipe
  attr_reader :label, :image, :source, :ingredients, :nutrition, :uri

  def initialize(recipe_hash)
    @uri = recipe_hash["uri"]
    @label = recipe_hash["label"]
    @image = recipe_hash["image"]
    @source = recipe_hash["source"]
    @ingredients = recipe_hash["ingredients"]
    @nutrition = recipe_hash["nutrition"]
  end
end
