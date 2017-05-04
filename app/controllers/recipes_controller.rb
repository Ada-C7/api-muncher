class RecipesController < ApplicationController

  def index
    if params[:q]
      @recipes = EdamamApiWrapper.search(params[:q])
    end
  end

end
