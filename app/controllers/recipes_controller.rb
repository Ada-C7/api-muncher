class RecipesController < ApplicationController

  def index

    if params[:search_term]
      @recipes =  EdamamWrapper.getRecipes(params[:search_term])
    end
  end


end
