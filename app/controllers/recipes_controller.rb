class RecipesController < ApplicationController
  def index
    @recipes = EdamamApiWrapper.all
  end

  def show
  end

  def new

  end
end
