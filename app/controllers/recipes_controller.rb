class RecipesController < ApplicationController
require "will_paginate/array"
require_dependency "../../lib/edamam_api_wrapper"
require_dependency "../../lib/recipe"





  def results
    #raise
    recipes = EdamamApiWrapper.findRecipes(params[:search])
    if recipes.present?
      @recipes = recipes.paginate(:page => params[:page], :per_page => 10)
    else
      flash[:error] = "Couldn't find recipes for #{params[:search]}."
      redirect_to root_path
    end
  end

  def show
    @recipe = EdamamApiWrapper.showRecipe(params[:uri])
    #raise
    if @recipe.nil?
      flash[:error] = "Whoops, That's embarrasing, but we couldn't find that recipe."
      redirect_back fallback_location: root_path
    end
  end

  def search;end

end
