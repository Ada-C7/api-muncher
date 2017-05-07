class RecipesController < ApplicationController
  def index
    @recipes = EdamamApiWrapper.list_recipes(params[:search], params[:page].to_i)
  end

  def show
    @recipe = EdamamApiWrapper.get_recipe(params[:uri])
    render_404 if !@recipe
  end
end
