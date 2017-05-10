require_dependency "./lib/edmam_api_wrapper"
require_dependency "./lib/ingredient"
require_dependency "./lib/recipe"
require_dependency "./lib/recipe_response"

class ResultsController < ApplicationController

  def index
    from = 1
    to = 11

    if params["from"] && params["to"] # if this is in the url
      from = params["from"]
      to = params["to"]
    end
    @recipe_response = EdmamApiWrapper.listRecipes(params["q"], from, to)
  end

  def show
    @recipe = EdmamApiWrapper.getRecipe(params["recipe"])
  end

end
