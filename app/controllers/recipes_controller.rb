require_dependency '../../lib/edamam_recipes'
# require 'edamam_recipes'

class RecipesController < ApplicationController

attr_reader :recipe_array, :recipe

  def index
    @recipe_array = EdamamRecipes.get_recipes(params[:search_request])
  end

  def new
  end


  def show
    @recipe = EdamamRecipes.find_recipe(params[:uri])
  end


end
