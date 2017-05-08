require_dependency '../../lib/recipe'

class RecipesController < ApplicationController

  def search
  end

  def index
    params = recipe_params
    @search_term = params["q"]
    @recipes = Recipe.search(params)
    @count = Recipe.count_results(params)
    @page = (params["to"] ||= 12).to_i / 12

  end

  def show
    @search_term = params["q"]
    @recipe = Recipe.search("q" => params["id"]).first
  end

  private

  def recipe_params
    params.require(:recipe).permit(:q, :to, :from)
  end

end
