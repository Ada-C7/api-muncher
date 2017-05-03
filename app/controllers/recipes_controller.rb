class RecipesController < ApplicationController
  def index
  end

  def list
    @recipes = EdamamApiWrapper.findRecipes(params[:search])
  end

end
