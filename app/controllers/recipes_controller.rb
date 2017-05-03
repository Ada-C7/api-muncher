require 'edamam_wrapper'
require 'recipe'

class RecipesController < ApplicationController

  def index

    if params[:search_term]
      @recipe_results =  EdamamWrapper.getRecipes(params[:search_term])
      @recipes = @recipe_results.paginate(:page => params[:page], :per_page => 10)
    end
  end

  def show
  end


end
