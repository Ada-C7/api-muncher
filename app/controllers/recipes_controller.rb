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
    # session[:search_word] = nil
    recipe = Recipe.new
    @search_word = params[:search_term] if @search_word == nil
    # @from = 0
    # @to = 10
    @recipes = recipe.send_search(session[:search_word], params[:from], params[:to], params[:health])
    @health = params[:health]

    #  b["hits"][0]["recipe"]["uri"]
    #  b["hits"][0]["recipe"]["ingredientLines"]
    #  b["hits"][0]["recipe"]["ingredients"]
    #   b["hits"][0]["recipe"]["totalNutrients"]

  end

  def show
    recipe = Recipe.new
    @uri = params[:uri]
    @recipe = recipe.find_this_recipe(@uri)[0]
    @nurients = @recipe["totalNutrients"].map {|key, value| value}
  end
end
