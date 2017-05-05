class RecipesController < ApplicationController

  def results
    #raise
    @recipes = EdamamApiWrapper.findRecipes(params[:search])
  end

  def show
    @recipe = EdamamApiWrapper.showRecipe(params[:uri])
    raise
    if @recipe.nil?
      flash[:error] = "Whoops, That's embarrasing, but we couldn't find that recipe."
      redirect_back fallback_location: root_path
    end
  end

  def search;end

end
