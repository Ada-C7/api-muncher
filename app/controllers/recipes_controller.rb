require 'edamam_search'
class RecipesController < ApplicationController

  # can be homepage
  def index
  end

  def search
  end

  # will take data from search and call the lib API method
  def create
    new_search = EdamamSearch.new(params[:search_text])
    # raise
    results = new_search.search_results
    raise
  end

  # will show results from search
  def show
  end
end
