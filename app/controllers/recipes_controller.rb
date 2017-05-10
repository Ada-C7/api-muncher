require 'recipes'
class RecipesController < ApplicationController

  def homePage
  end

  # list of all recipes
  def index
    @list_of_recipes = Recipe.search(params[:name])
  end

  # individual recipe
  def show
    @recipe = Recipe.search1(params[:uri])
  end
end
