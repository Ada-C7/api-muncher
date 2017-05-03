require 'recipe'

class RecipesController < ApplicationController

  def index
    @recipes
  end

  def search
    @recipes = Recipe.search(params[:recipe][:term])
    if @recipes.nil?
      head :not_found
    end
  end

  def show
    @recipe = Recipe.search(params[:recipe][:term][:id])
    if @recipe.nil?
      head :not_found
    end

  end

end
