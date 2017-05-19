require_dependency '../../lib/edamam_api_wrapper.rb'
require_dependency '../../lib/recipe.rb'

class RecipesController < ApplicationController
  def index
    @search_results = EdamamApiWrapper::all({q: params[ingredients = :q], from: 0, to: 100})
    @results_page = @search_results.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @recipe = Recipe::one({r: recipe_uri = params[:uri]})
  end

  def new
  end

end
