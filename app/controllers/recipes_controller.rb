class RecipesController < ApplicationController
  def search
    recipe = Recipe.new
  end

  # def search
    # recipe = Recipe.new
    # recipe.send_search(params[:search_term])
    # redirect_to recipes_path(key_word: params[:search_term])
  # end

  def list
    recipe = Recipe.new
    @recipes = recipe.send_search(params[:search_term])

    #  b["hits"][0]["recipe"]["uri"]
    #  b["hits"][0]["recipe"]["ingredientLines"]
    #  b["hits"][0]["recipe"]["ingredients"]
    #   b["hits"][0]["recipe"]["totalNutrients"]

  end

  def show
  end
end
