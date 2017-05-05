require 'recipes'
class RecipesController < ApplicationController

  def homePage
  end
  # list of all recipes
  def index
    @list_of_recipes = Recipe.search(params[:name])
  end

  def show
  end
end
