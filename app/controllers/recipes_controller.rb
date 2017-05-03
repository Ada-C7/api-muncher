require 'edamam_search'
class RecipesController < ApplicationController

  def index
    new_search = EdamamSearch.new(params[:search_text])
    @results = new_search.search_results
    # raise
  end

  def search
  end

  # will take data from search and call the lib API method
  def search_results
    redirect_to recipes_path(params[:search_text])
  end

  # will show results from search
  def show
  end
private


end
