class RecipeResult

  attr_reader :name, :recipe_url, :image, :ingredients
  
  def initialize(name, recipe_url, image, ingredients)
    @name = name
    @recipe_url = recipe_url
    @image = image
    @ingredients = ingredients
  end

end
