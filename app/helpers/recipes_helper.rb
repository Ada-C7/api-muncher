module RecipesHelper

  def calories_per_serving
  return  (@recipe.options[:calories]/@recipe.options[:servings]).to_i
  end
end
