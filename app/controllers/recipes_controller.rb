require "recipe_api_wrapper"
require "recipe"

class RecipesController < ApplicationController
  def search;end

  def index
    @query = params[:query]
    @data = Recipe_Api_Wrapper.listRecipes(@query)

    if @data != nil
      @data = @data.paginate(:page => params[:page], :per_page => 10)
    end
  end

  def show
    @uri = params[:uri]
    @recipe = Recipe_Api_Wrapper.showRecipe(@uri)
    # raise
  end
end
