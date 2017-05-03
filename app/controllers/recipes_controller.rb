class RecipesController < ApplicationController

  def results
    #raise
    @recipes = EdamamApiWrapper.findRecipes(params[:search])

  end

  def show
    @recipe = EdamamApiWrapper.showRecipe(params[:recipe])
  end

  def search; end

end
