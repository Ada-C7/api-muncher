require'recipe'

class RecipesController < ApplicationController

  def root; end

  def search
    recipes_list = Recipe.search(params[:search])

    if recipes_list.empty?
      redirect_to root_path
      flash[:messages] = 'Search did not yield any results.'
    else
      @recipes_list = recipes_list
    end

    def show_recipe
      # uri = params[:uri]
      @recipe = Recipe.show_recipe(params[:recipe])
      
      #How do I identify the specific object?
      #Could pass in uri as params too.
      #"send params[:uri] through link"
      #I'm creating a completely new object anyway
    end
  end
end
