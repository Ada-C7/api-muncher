require_dependency '../../lib/edamam_api_wrapper'
require_dependency '../../lib/recipe'

class RecipesController < ApplicationController
  def search; end

  def index
    @search_term = params[:q]
    @page = params[:page].nil? ? 1 : params[:page].to_i
    @recipes = EdamamApiWrapper.get_recipes(params[:q], @page)
  end

  def show
    @recipe = EdamamApiWrapper.find_by_uri(params[:uri])

    if @recipe.nil?
      render_404
    end
  end
end
