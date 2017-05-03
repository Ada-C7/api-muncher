class RecipesController < ApplicationController

  def index
    @recipes = SearchApiWrapper.getRecipes(params[:q])

  end

  def show

  end

  def new

  end




end
