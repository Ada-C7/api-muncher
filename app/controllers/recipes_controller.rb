class RecipesController < ApplicationController

  def index
    @recipes = ApiRecipe.find(params[:search])
  end

end
