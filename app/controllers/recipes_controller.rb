require 'edamam_recipes'

class RecipesController < ApplicationController

attr_reader :recipe_array, :recipe

  def index
    @recipe_array = EdamamRecipes.get_recipes(params[:search_request])
  end

  def new
  end


  def show
    @recipe = EdamameRecipes.find_recipe(params[:uri])
  end


end
