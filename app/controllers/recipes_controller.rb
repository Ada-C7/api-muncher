
class RecipesController < ApplicationController
  def index
  end

  def recipes
    @ingredient = params[:search]
    @recipes = EdamamApiWrapper.findRecipes(params[:search])
  end

end
