require_dependency '../../lib/edamam_recipes'
# require 'edamam_recipes'

class RecipesController < ApplicationController

attr_reader :recipe_array, :recipe

  def index
    @recipe_array = EdamamRecipes.get_recipes(params[:search_request],params[:from],params[:to])
    if @recipe_array.length == 0
      flash[:status] = :failure
      flash[:result_text] = "Sorry, no results were found for your search.  Would you like to search for something else?"
      redirect_to root_path
    end
  end

  def show
    @recipe = EdamamRecipes.find_recipe(params[:uri])
  end


end
