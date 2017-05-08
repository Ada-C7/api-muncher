require_dependency '../../lib/edamam_api_wrapper.rb'
require_dependency '../../lib/recipe.rb'

class RecipesController < ApplicationController
  def index
    @search_results = {
      q: params[:q],
      recipes: EdamamApiWrapper::all({q: params[ingredients = :q]})
    }
  end

  def show
    @recipe = Recipe::one({r: recipe_uri = params[:uri]})
  end

  def new
  end

end
