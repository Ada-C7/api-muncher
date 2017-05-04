require Rails.root.join("lib/edamam_api_wrapper.rb").to_s
require Rails.root.join("lib/recipe.rb").to_s

class RecipesController < ApplicationController

  def root; end

  def index
    if params[:search_term]
      @recipes = EdamamApiWrapper.listRecipes(params[:search_term])
    end
  end

  def show
    @recipe = EdamamApiWrapper.getRecipe(params[:recipe_id])
  end

end
