class RecipesController < ApplicationController

  def search
    # @recipe = Recipe.new
  end

  def index
    @recipes = Recipe.search("q" => params["q"])
    @search_term = params["q"]
  end

  def show
    @recipe = Recipe.search("q" => params["id"]).first
    @search_term = params["q"]
  end

  #add strong params
end
