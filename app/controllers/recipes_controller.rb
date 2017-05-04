require 'recipes'
class RecipesController < ApplicationController
  # list of all recipes
  def index
    @list_of_recepies = Recipe.search(params[:name])
  end

  def show
  end
end
