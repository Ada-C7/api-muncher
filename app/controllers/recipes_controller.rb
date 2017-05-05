require'recipe'

class RecipesController < ApplicationController

  def root; end

  def search
    @recipes_list = Recipe.search(params[:search])
  end
end
