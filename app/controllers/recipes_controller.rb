class RecipesController < ApplicationController
  def index
    @search_results = {
      q: params[:q],
      recipes: EdamamApiWrapper.all(params[:q])
    }
  end

  def show
    @recipe = params[:id]
  end

  def new
  end

end
