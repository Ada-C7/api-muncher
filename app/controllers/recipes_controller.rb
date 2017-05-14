class RecipesController < ApplicationController
  attr_reader :pg_recipes, :page

  def home
  end

  def index
    @page = params[:page].to_i # increment page here
    @recipes = EdamamApiWrapper.find_recipes(params[:q], @page)
  end

  def show
    @recipe = EdamamApiWrapper.find(params[:index])
  end
end
