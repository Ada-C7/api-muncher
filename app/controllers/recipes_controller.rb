require_dependency '../../lib/edamam_api_wrapper.rb'

class RecipesController < ApplicationController
  def index
    @search_results = {
      q: params[:q],
      recipes: EdamamApiWrapper::all({q: params[ingredients = :q]})
    }
  end

  def show
    @recipe = EdamamApiWrapper::all({r: recipe_uri = params[:uri]})
  end

  def new
  end

end
