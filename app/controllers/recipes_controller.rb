class RecipesController < ApplicationController
require "will_paginate/array"

  def results
    #raise
    recipes = EdamamApiWrapper.findRecipes(params[:search])
    @recipes = recipes.paginate(:page => params[:page], :per_page => 10)
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
