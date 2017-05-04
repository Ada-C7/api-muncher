class RecipesController < ApplicationController

  def index
    if params[:search_term]
      @recipes = EdamamApiWrapper.listRecipes(params[:search_term])
    end
  end

  def show
    @recipe = EdamamApiWrapper.getRecipe(params[:recipe_id])
  end

end
