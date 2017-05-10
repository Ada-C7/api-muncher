require_dependency '../../lib/edamam_api_wrapper'
require_dependency '../../lib/recipe'


class SearchesController < ApplicationController

  def results
    @recipes = EdamamApiWrapper.searchRecipes(params[:q]).paginate(params[:page], 10)
    @count = @recipes.count
  end

  def filter_by_diet
    response = EdamamApiWrapper.searchRecipes(params[:id]).paginate(params[:page], 10)
    @recipes = []
    response.each do |recipe|
      if recipe.dietlabels.include?(params[:label])
        @recipes << recipe
      end
    end
      return @recipes
  end

  def show
      @recipe = EdamamApiWrapper.getRecipe(params[:id])
  end

end
