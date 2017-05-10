class RecipeResponse
attr_reader :recipe, :recipe_count

  def initialize(recipe, recipe_count)
    @recipe = recipe
    @recipe_count = recipe_count
  end

end
