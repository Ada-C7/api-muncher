class RecipesController < ApplicationController

  def results
    #raise
    @recipes = EdamamApiWrapper.findRecipes(params[:search])

  end

  def show
    @recipe = EdamamApiWrapper.showRecipe(params[:uri])
  end

  def search
    #@recipes = EdamamApiWrapper.findRecipes(params[:search])
  end

end
