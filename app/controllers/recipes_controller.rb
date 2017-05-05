require 'edamam_api'

class RecipesController < ApplicationController

attr_reader :recipes

  def index
    @recipes = EdamamApi.list_recipes(params[:query])
  end

  def search
  end
end
