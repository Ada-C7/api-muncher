class RecipeResponse < ApplicationRecord

  def page_count
    @recipe_count = data["count"]
  end

end
