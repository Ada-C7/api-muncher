class ResultsController < ApplicationController

  def index
    @recipes = EdmamApiWrapper.listRecipes(params["q"])
  end

end
