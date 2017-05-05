require_dependency '../../lib/edamam_api_wrapper'
require_dependency '../../lib/recipe'

class RecipesController < ApplicationController
  def index
  end

  def recipes
    @ingredient = params[:search]
    if (params[:page].to_i == 1)
      @recipes = EdamamApiWrapper.findRecipes(params[:search])
      @page = 1
    else
      @page = params[:page].to_i
      from = (@page * 10) - 10
      to = from + 9
      @recipes = EdamamApiWrapper.findRecipes(params[:search], from, to)
    end
  end



  def recipe
    @recipe = EdamamApiWrapper.findRecipe(params[:uri])
  end

end
