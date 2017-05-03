require'recipe' #FIXME: just changed

class RecipesController < ApplicationController

  def root; end

  def index; end

  def search_recipes
    @recipes = Recipe.search(params[:search])

    redirect_to recipes_path
  end

end
