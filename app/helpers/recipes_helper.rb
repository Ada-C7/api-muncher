module RecipesHelper

  def calories_per_serving
  return  (@recipe.options[:calories]/@recipe.options[:servings]).to_i
  end

  def left_results
    midpoint = @recipes.length / 2
    return @recipes[0...midpoint]
  end

  def right_results
    midpoint = @recipes.length / 2
    return @recipes[midpoint..@recipes.length]
  end
end
