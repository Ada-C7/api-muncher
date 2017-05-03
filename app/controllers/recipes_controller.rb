class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all_by_search_term(params[:search_term], params[:from], params[:to])
    @from = params[:from].to_i
    @to = params[:to].to_i
  end

  def show
    @recipe = Recipe.find_by_name(params[:uri])
  end

end
