class RecipesController < ApplicationController
  def index
    @recipes = EdamamApiWrapper.all("tacos")
  end

  def show
  end

  def new
    @recipe = Recipe.new
  end

end
