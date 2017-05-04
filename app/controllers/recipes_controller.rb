class RecipesController < ApplicationController

  def index
    @recipes = EdamamApiWrapper.search(params[:q])
  end

end
