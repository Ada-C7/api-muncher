class RecipesController < ApplicationController

  def search
    # @recipe = Recipe.new
  end

  def index
    @recipes = Recipe.search("q" => params["q"])
  end

  #add strong params
end
