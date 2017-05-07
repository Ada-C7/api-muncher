require 'recipe'
require_dependency '../assets/images/music_plate.jpeg'

class RecipesController < ApplicationController

  def welcome
  end

  # List the recipes from a given search
  def index
    begin
      @recipes, @total_count  = Recipe.search(params[:search],params[:from],params[:to])

      if @recipes.empty?
        if params[:search] == ""
          flash[:message] = "Gimmie something to work with if you want some recipes."
        else
          flash[:message] = "Sorry, we have no recipes for #{params[:search]}."
        end
        return   @recipes, @total_count
      end
    rescue ArgumentError
      flash[:message] = "An internal error occured."
      render :index
    end
  end

  def show
    @recipe = Recipe.getRecipe(params[:recipe])
  end

end
