require 'recipe'

class RecipesController < ApplicationController

  def welcome
  end


  # List the recipes from a given search
  def index
    @recipes, @total_count  = Recipe.search(params[:search],params[:from],params[:to])

    if @recipes.empty?
      if params[:search] == ""
        flash[:message] = "Gimmie something to work with if you want some recipes."
      else
        flash[:message] = "Sorry, we have no recipes for #{params[:search]}."
      end
      return   @recipes, @total_count
    end
  end

  def show
    @recipe = Recipe.getRecipe(params[:recipe])
    if @recipe == nil
      flash[:message] = "Sorry, we cannot find that recipe."
    end
  end

end
