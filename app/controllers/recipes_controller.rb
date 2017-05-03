class RecipesController < ApplicationController

  def search
    # @recipe = Recipe.new
  end

  def index
    @recipes = Recipe.search("q" => params["q"])
  end

  def show
    @recipe = Recipe.search("q" => params["id"]).first
  end

  #add strong params
end
