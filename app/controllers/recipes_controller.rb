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
      results = get_api_search(search_params)
      @list_of_recipes = Recipe.list_of_recipes(results)
    end
  end

  # will show results from search
  def show
    search_params = { recipe_id: params[:id] }
    recipe_results = get_api_search(search_params)
    @recipe = Recipe.individual_recipe(recipe_results)
  end
private

  def get_api_search(search_params)
    return EdamamSearch.new(search_params).search_results
  end
end
