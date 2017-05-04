class RecipeResult

  attr_reader :name, :recipe_url, :image, :ingredients, :uri, :health_labels, :recipe_source, :nutrients

  def initialize(name, image, uri, recipe_url = nil, ingredients = nil, health_labels = nil, recipe_source = nil, nutrients = nil)
    @name = name
    @recipe_url = recipe_url
    @image = image
    @ingredients = ingredients
    @uri = uri
    @health_labels = health_labels
    @recipe_source = recipe_source
    @nutrients = nutrients
  end

end
