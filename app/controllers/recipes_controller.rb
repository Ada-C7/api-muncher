require 'recipe'

class RecipesController < ApplicationController

  def root; end

  def search
    @recipes_list = Recipe.search(params[:search], params[:page])

    if @recipes_list.empty?
      redirect_to root_path
      flash[:messages] = 'Search did not yield any results.'
    end
  end

  def show_recipe
    @recipe = Recipe.show_recipe(params[:recipe])

    if @recipe.nil?
      redirect_to recipes_path(params[:search])
      flash[:messages] = 'Something went wrong. Ramen for you.'
    else
      return @recipe
    end
  end
end
