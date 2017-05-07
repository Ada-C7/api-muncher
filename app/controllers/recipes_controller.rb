class RecipesController < ApplicationController
  def search; end

  def index
    @recipes = EdamamApiWrapper.get_recipes(params[:q])
  end

  def show
    @recipe = EdamamApiWrapper.find_by_uri(params[:uri])
  end
end
