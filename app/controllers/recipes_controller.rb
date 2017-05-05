require_dependency '../../lib/edamam_api_wrapper'
require_dependency '../../lib/recipe'

class RecipesController < ApplicationController
  def index
    @results = EdamamApiWrapper.listRecipes(params[:query])
    @results_page = @results.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @recipe = EdamamApiWrapper.getRecipe(params[:uri])
  end
end
