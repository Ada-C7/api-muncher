require "#{Rails.root}/lib/recipes.rb"

class RecipesController < ApplicationController

  def search
  end

  def index
    @search_term = params[:q]
    @list = Recipe.get_recipes(@search_term)
  end

  def show
    @params = params[:uri] + "." + params[:format].gsub(/#/,'%23')
    @recipe = Recipe.find(@params)

    # uri = params[:uri]
    #recipe[:uri]
  end

end
