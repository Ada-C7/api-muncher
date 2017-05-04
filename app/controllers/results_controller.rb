class ResultsController < ApplicationController

  def index
    @ingredient = EdmamApiWrapper.listRecipes(params["q"])
  end

end
