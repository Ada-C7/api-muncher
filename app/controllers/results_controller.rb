require_dependency "./lib/edmam_api_wrapper"
require_dependency "./lib/ingredient"
require_dependency "./lib/recipe"

class ResultsController < ApplicationController

  def index
    @recipes = EdmamApiWrapper.listRecipes(params["q"])
  end

  def show
    @recipe = EdmamApiWrapper.getRecipe(params["recipe"])
  end

end
