require_dependency '../../lib/recipe'
require_dependency '../../lib/edamam_api_wrapper'

class RecipesController < ApplicationController

  def root; end

  def index
    if params[:search_term]
      result_recipes = EdamamApiWrapper.listRecipes(params[:search_term])

      @recipes = Kaminari.paginate_array(result_recipes, total_count: 120).page(params[:page]).per(12)
    end
  end

  def show
    @recipe = EdamamApiWrapper.getRecipe(params[:recipe_id])
  end

end
