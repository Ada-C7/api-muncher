class RecipesController < ApplicationController
  def index
    @results = EdamamApiWrapper.listRecipes(params[:query])
  end

  def show
    @result = EdamamApiWrapper.getRecipe(params[:name])
  end
end
