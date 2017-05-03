class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all_by_search_term(params[:search_term])
  end

  def show
    @recipe = Recipe.find_by_name(params[:uri])
  end

end
