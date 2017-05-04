require "recipe_api_wrapper"
require "recipe"

class RecipesController < ApplicationController
  def search;end

  def index
    @query = params[:query]
    @data = Recipe_Api_Wrapper.listRecipes(@query)
  end

  def show
  end
end
