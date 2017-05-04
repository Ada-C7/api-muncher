class HomepagesController < ApplicationController
  def index;end

  def list
    @recipes = EdamamApiWrapper.listRecipes(params[:search_term])
    #if params[:food]
    # else
    #   flash[:warning] = "please enter search term"
    #   redirect_to :root
  end

  def show
    @recipe = EdamamApiWrapper.findRecipe(params[:uri])
  end
end
