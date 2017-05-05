require'recipe'

class RecipesController < ApplicationController

  def root; end

  def search
    recipes_list = Recipe.search(params[:search])

    if recipes_list == []
      redirect_to root_path
      flash[:messages] = 'Search did not yield any results.'
    else
      @recipes_list = recipes_list
    end
  end
end
