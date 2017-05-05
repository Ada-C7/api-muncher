require 'edamam_search'
class RecipesController < ApplicationController

  def index
    if params[:search_text]

      search_params = {
                        search_text: params[:search_text],
                        from: params[:from].to_i,
                        to: params[:from].to_i + 10,
                        health: params[:health],
                        diet: params[:diet]
                      }
      # raise
      new_search = EdamamSearch.new(search_params)
      search_results = new_search.search_results
      @list_of_recipes = Recipe.list_of_recipes(search_results)
    end
  end

  # will show results from search
  def show
    # raise
    search_params = {
                      recipe_id: params[:id]
                    }

    recipe_info = EdamamSearch.new(search_params)
    search_results = recipe_info.search_results
    @recipe = Recipe.individual_recipe(search_results)
    # raise
  end
private

end
