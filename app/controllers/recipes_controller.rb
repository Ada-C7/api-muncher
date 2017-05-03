class RecipesController < ApplicationController
  def index
    @recipes =  ApiRecipe.all
  end

  def find
    @recipe = ApiRecipe.find(params[:search])
  end
end
