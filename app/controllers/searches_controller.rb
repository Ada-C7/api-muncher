require_dependency '../../lib/edamam_api_wrapper'
require_dependency '../../lib/recipe'


class SearchesController < ApplicationController

  def results
    @recipes = EdamamApiWrapper.searchRecipes(params[:q]).paginate(params[:page], 10)
    @count = @recipes.count
  end

  def show
      @recipe = EdamamApiWrapper.getRecipe(params[:id])
  end

end
