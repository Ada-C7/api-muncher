require 'edamam_api_wrapper'
require 'recipe'

class HomepagesController < ApplicationController

  def show
    @recipe = EdamamApiWrapper.getRecipe(params[:uri])
  end

  # search results list show 10 recipes at a time
  def list
    q = params[:q]
    page = params[:page].to_i
    from = 10 * ( page - 1 )

    response  = EdamamApiWrapper.searchRecipes(q, from)
    @recipes = response[0]
    @info = response[1]
  end

  # search form in the root page
  def search;end
end
