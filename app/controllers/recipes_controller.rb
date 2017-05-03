class RecipesController < ApplicationController

  def index
    if params[:q]
      @recipes = SearchApiWrapper.listRecipes(params[:q])
    # @recipes = SearchApiWrapper.getRecipes("chicken")
    else
      @recipes = []
    end

  end

  def show

  end

  def new

  end




end
