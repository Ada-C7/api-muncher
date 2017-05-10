class HomepagesController < ApplicationController

  def index
    @recipes = EdmamApiWrapper.listRecipes
  end

end
