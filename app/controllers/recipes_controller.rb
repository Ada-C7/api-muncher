class RecipesController < ApplicationController

  def index
    @from = params[:from]
    @recipes = ApiRecipe.find(params[:search], @from)
  end

end
