
class RecipesController < ApplicationController
  def index
  end

  def recipes
    @ingredient = params[:search]
    @recipes = EdamamApiWrapper.findRecipes(params[:search])
  end

  def show
    @recipe = EdamamApiWrapper.findRecipe(params[:uri])
  end

end
