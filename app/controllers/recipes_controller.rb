require "#{Rails.root}/lib/recipes.rb"

class RecipesController < ApplicationController

  def search
  end

  def index
    @search_term = params[:q]
    @list = Recipe.get_recipes(@search_term)

  end

  def show
    uri = params[:uri]
    #recipe[:uri]
  end

end
