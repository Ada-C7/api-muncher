class RecipesController < ApplicationController

  def index
    @recipes = Recipe.search(params[:search])
  end

end
