require'recipe'

class RecipesController < ApplicationController

  def root; end

  def search
    @recipes = Recipe.search(params[:search])
  end

end
