class ResultsController < ApplicationController

  def index
    @recipes = EdmamApiWrapper.listRecipes(params["q"])
  end

  def show
    @recipe = EdmamApiWrapper.getRecipe(params["recipe"])
  end

end
