class RecipesController < ApplicationController

  def view_recipes
    @search_query = params[:search]
    @recipes_number = Recipe.count_all(@search_query)
    @recipes = Recipe.search(params[:search], params[:from])

    if @recipes.length == 0
      flash[:result_text] = "Could not find recipes. Try again"
      redirect_to root_path
    end


  end

  def new
  end

  def create
  end

  def show_recipe
    @recipe = Recipe.find_recipe(params[:uri])

  end




end
