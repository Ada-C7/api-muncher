class RecipesController < ApplicationController
  def index
    @results = EdamamApiWrapper.listRecipes(params[:query])
    @results_page = @results.paginate(:page => params[:page], :per_page => 10)
    # raise
  end

  def show
    @recipe = EdamamApiWrapper.getRecipe(params[:uri])
  end
end
