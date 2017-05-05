require_dependency '../../lib/recipe'
require_dependency '../../lib/edamam_api_wrapper'

class RecipesController < ApplicationController

  def root; end

  def index
    if params[:search_term]
      @recipes = EdamamApiWrapper.listRecipes(params[:search_term])

      @results = @recipes.paginate(:page => params[:page], :per_page => 10)
    end
  end

  def show
    @recipe = EdamamApiWrapper.getRecipe(params[:recipe_id])
  end

end
