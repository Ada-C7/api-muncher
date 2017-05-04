class RecipesController < ApplicationController

  # def search; end

  def index
    if params[:search_term]
      @recipes = EdamamApiWrapper.listRecipes(params[:search_term])
    end
  end

  def show
    # raise
    @recipe = EdamamApiWrapper.getRecipe(params[:recipe_id])
  end

end
