class RecepiesController < ApplicationController

  def view_recepies
    @search_query = params[:search]
    @recepies_number = Recipe.count_all(@search_query)
    @recepies = Recipe.search(params[:search], params[:from])

    if @recepies.length == 0
      flash[:result_text] = "Could not find recepies. Try again"
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
