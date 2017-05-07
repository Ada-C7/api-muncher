class RecipesController < ApplicationController
  def search; end

  def index
    page = params[:page].nil? ? 1 : params[:page]
    @recipes = EdamamApiWrapper.get_recipes(params[:q], page)
  end

  def show
    @recipe = EdamamApiWrapper.find_by_uri(params[:uri])
  end
end
