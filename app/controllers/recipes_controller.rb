class RecipesController < ApplicationController

  def index
    @recipes = SearchApiWrapper.getRecipes(params[:q])
    # @recipes = SearchApiWrapper.getRecipes("chicken")

  end

  def show

  end

  def new

  end




end
