require 'edamam_search'
class RecipesController < ApplicationController

  def index
    search_params = {
                      search_text: params[:search_text],
                      from: params[:from].to_i,
                      to: params[:from].to_i + 10
                    }
    # raise
    @new_search = EdamamSearch.new(search_params)
    # raise
    @results = @new_search.search_results

  end

  # will show results from search
  def show
  end
private

end
