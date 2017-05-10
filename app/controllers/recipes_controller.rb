require "#{Rails.root}/lib/recipes.rb"

class RecipesController < ApplicationController

  def search
  end

  def index
    @search_term = params[:q]
    @list = Recipe.get_recipes(@search_term, params[:from])
  end

  #http://localhost:3000/recipes/index?utf8=%E2%9C%93&q=o&from=0&commit=Search
  def show
    @params = params[:uri] + "." + params[:format].gsub(/#/,'%23')
    @recipe = Recipe.find(@params)

    # uri = params[:uri]
    #recipe[:uri]
  end

end
