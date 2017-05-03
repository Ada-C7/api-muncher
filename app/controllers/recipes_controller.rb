require 'recipe'

class RecipesController < ApplicationController

  def index
    @recipes
  end

  def search
    @recipes = Recipe.search(params[:recipe][:term])
    redirect_to root_path
  end

end
