class RecipesController < ApplicationController
  def index
    @recipes = EdamamApiWrapper.list_recipes(params[:search])
  end

  def show
    @recipe = EdamamApiWrapper.show_recipe(params[:uri])
  end
end
