class Recipe
  attr_reader :label, :image, :source, :ingredients, :nutrition

  def initialize(recipe_hash)
    @label = recipe_hash[:label]
    @image = recipe_hash[:image]
    @source = recipe_hash[:source]
    @ingredients = recipe_hash[:ingredients]
    @nutrition = recipe_hash[:nutrition]
  end
end
