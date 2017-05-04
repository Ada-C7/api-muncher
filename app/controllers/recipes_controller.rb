class RecipesController < ApplicationController
  def search
    @query = params[:query]
    @data = Recipe_Api_Wrapper.listRecipes(@query)
    
  end

  def index
  end

  def show
  end
end
