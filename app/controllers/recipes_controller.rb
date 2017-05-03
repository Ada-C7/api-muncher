class RecipesController < ApplicationController
  def index
    @recipes = EdamamApiWrapper.list_recipes(params[:search])
  end
end
