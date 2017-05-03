require 'edamam_search'
class RecipesController < ApplicationController

  def index
    new_search = EdamamSearch.new(params[:search_text])
    @results = new_search.search_results
    # raise
  end

  # will show results from search
  def show
  end
private

end
