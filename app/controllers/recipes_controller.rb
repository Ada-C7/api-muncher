require_dependency '../../lib/edamam_api_wrapper'

class RecipesController < ApplicationController
  def index
    @search_results = {
      q: params[:q],
      recipes: EdamamApiWrapper::all(params[:q])
    }
  end

  def show
  end

  def new
  end

end
