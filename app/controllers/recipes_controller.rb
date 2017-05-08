require "recipe"
class RecipesController < ApplicationController
  def search
    recipe = Recipe.new
  end

  def list
    recipe = Recipe.new
    @search_word = params[:search_term] if @search_word == nil
    @recipes = recipe.send_search(params[:search_term], params[:from], params[:to], params[:health])
    @health = params[:health]
  end

  def show
    recipe = Recipe.new
    @uri = params[:uri]
    @recipe = recipe.find_this_recipe(@uri)[0]
    @nutrients = @recipe["totalNutrients"].map {|key, value| value}
  end
end
