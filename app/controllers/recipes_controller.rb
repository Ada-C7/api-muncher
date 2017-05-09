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
      # raise
      if results.nil? || results.empty?
        flash[:failure] = "Sorry - there are no results for that search"
        redirect_to recipes_path
      else
        @list_of_recipes = Recipe.list_of_recipes(results)
      end
    end
  end

  # will show individual recipe result
  def show
    search_params = { recipe_id: params[:id] }
    results = get_api_search(search_params)

    if results.nil?
      flash[:failure] = "Recipe Not Found"
      redirect_to recipes_path
    else
      return @recipe = Recipe.individual_recipe(results)
    end
  end

private

  def get_api_search(search_params)
    return EdamamSearch.new(search_params).search_results
  end
end
