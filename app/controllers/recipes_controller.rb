require 'edamam_search'
class RecipesController < ApplicationController

  def index
    search_params = {
                      search_text: params[:search_text],
                      from: params[:from].to_i,
                      to: params[:from].to_i + 10
                    }
    @new_search = EdamamSearch.new(search_params)
    @results = @new_search.search_results
  end

  # will show results from search
  def show
    # raise
    search_params = {
      recipe_id: params[:id]
    }
    recipe_info = EdamamSearch.new(search_params)
    @recipe = recipe_info.search_results
    raise
  end
private

end
