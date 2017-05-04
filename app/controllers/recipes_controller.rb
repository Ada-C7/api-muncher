class RecipesController < ApplicationController
  def index
    @results = EdamamApiWrapper.listRecipes(params[:query])
  end

  def show
    @recipe = EdamamApiWrapper.getRecipe(params[:uri])
  end
end
