require_dependency '../../lib/api_recipe'

class RecipesController < ApplicationController

  def index
    @from = params[:from]
    @recipes = ApiRecipe.find(params[:search], @from)
  end

  def show
    @recipe = ApiRecipe.find_recipe(params[:uri])
  end

end
