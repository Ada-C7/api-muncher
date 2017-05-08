class RecipesController < ApplicationController
  def index
    page = params[:page] ? params[:page].to_i : 1
    @recipes = EdamamApiWrapper.list_recipes(params[:search], page)
  end

  def show
    @recipe = EdamamApiWrapper.get_recipe(params[:uri])
    render_404 if !@recipe
  end
end
