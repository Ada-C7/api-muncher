
class HomepagesController < ApplicationController

  def root; end

  def index
    if params[:search_terms]
      from = (params[:page]).to_i * 10
      @recipes = EdamamApiWrapper.search(params[:search_terms], from)
      @page = params[:page].to_i
    else
      flash[:warning] = "Please enter search terms"
      redirect_to :root
    end
  end

  def show
    uri = params[:uri]
    @recipe = EdamamApiWrapper.getRecipe(uri)
    raise
  end

end
