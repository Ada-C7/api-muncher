require 'edamam_api'

class RecipesController < ApplicationController

  def index
    @recipes = EdamamApi.list_recipes(params[:query])
  end

  def search
  end
end
