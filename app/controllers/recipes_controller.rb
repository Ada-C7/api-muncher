require "recipe"
class RecipesController < ApplicationController
  def search
    session[:search_terms] = [] if session[:search_terms].nil?
    recipe = Recipe.new
  end

  def list
    recipe = Recipe.new
    if session[:search_terms].last != params[:search_term]
      session[:search_terms] << params[:search_term]
      if session[:search_terms].length > 7
        session[:search_terms].shift
      end
    end

    @search_word = params[:search_term] if @search_word == nil
    @recipes = recipe.send_search(params[:search_term], params[:from], params[:to], params[:health])
    @health = params[:health]
  end

  def recipe
    recipe = Recipe.new
    @uri = params[:uri]
    @recipe = recipe.find_this_recipe(@uri)[0]
    @nutrients = @recipe["totalNutrients"].map {|key, value| value}
  end
end
