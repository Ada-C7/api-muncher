class RecipesController < ApplicationController
  def index
    if params[:search] && params[:page]
      @recipes = EdamamApiWrapper.list_recipes(params[:search], params[:page])
    elsif params[:search]
      @recipes = EdamamApiWrapper.list_recipes(params[:search])
    else
      @recipes = []
    end
  end

  def show
    @recipe = EdamamApiWrapper.get_recipe(params[:uri])
  end
end
