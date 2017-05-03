require 'edamam_recipes'

class RecipesController < ApplicationController

  def index
    @list = EdamamRecipes.get_recipes(params[:search_request])
  end

  def new
  end


  def show
  end


end
