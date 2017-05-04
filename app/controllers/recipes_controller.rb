class RecipesController < ApplicationController
  def search; end

  def index
    @recipes = EdamamApiWrapper.get_recipes(params[:q])
  end

  def show; end
end
