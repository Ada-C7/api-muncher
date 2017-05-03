require 'edamam_api'

class RecipesController < ApplicationController
  def index
    @recipes = EdamamApi.all
  end

  def search
    @recipe = EdamamApi.list_recipes(params[:query])
  end
end
