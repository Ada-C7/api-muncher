require 'recipe'

class RecipesController < ApplicationController


  def welcome
  end

  # List the recipes from a given search
  def index
    @recipes = Recipe.search(params[:search])

  end


end
