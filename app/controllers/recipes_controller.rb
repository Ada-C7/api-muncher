require_dependency '../../lib/recipe'

class RecipesController < ApplicationController

  def search
  end

  def index
    params = recipe_params
    @search_term = params["q"]
    @page = (params["to"] ||= 12).to_i / 12

    begin
      @recipes = Recipe.search(params)
      @count = Recipe.count_results(params)
    rescue RecipeError => error
      flash[:error_message] = "Application Error: #{error}."
    end

    if @recipes.empty?
      flash[:error_message] = "No results found. Please try again."
      redirect_to root_path
    end
  end

  def show
    @search_term = params["q"]

    begin
      @recipe = Recipe.search("q" => params["id"]).first
    rescue RecipeError => error
      flash[:error_message] = "Application Error: #{error}."
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:q, :to, :from)
  end

end
