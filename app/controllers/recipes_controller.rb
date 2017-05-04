class RecipesController < ApplicationController

  def search; end

  def index
    @recipes = EdamamApiWrapper.listRecipes(params[:search_term])
  end

  def show
    @recipe = EdamamApiWrapper.getRecipe(params[:recipe_id])
  end

end
