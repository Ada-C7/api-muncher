
class RecipesController < ApplicationController
  def index
  end

  def recipes
    @ingredient = params[:search]
    if (params[:page].to_i == 1)
      @recipes = EdamamApiWrapper.findRecipes(params[:search])[0]
      @page = 1
    else
      @page = params[:page].to_i
      from = (@page * 10) - 10
      @recipes = EdamamApiWrapper.findRecipes(params[:search], from)[0]
    end
  end



  def recipe
    @recipe = EdamamApiWrapper.findRecipe(params[:uri])
  end

end
