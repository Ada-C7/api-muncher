class HomepagesController < ApplicationController
  def index
    @recipes = SlackApiWrapper.listRecipes
  end

  def show
    @recipe = SlackApiWrapper.findRecipe(params[:uri])
  end
end
