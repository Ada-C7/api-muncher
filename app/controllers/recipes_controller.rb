require 'edamam_api'

class RecipesController < ApplicationController

attr_reader :recipes, :recipe

  def index
    @from = params[:from]
    @recipes = EdamamApi.list_recipes(params[:query], @from )
  end

  def search
  end

  def show
    @recipe = EdamamApi.find_recipe(params[:uri])
  end

end
