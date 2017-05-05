require Rails.root.join("lib/edamam_api_wrapper.rb").to_s
require Rails.root.join("lib/recipe.rb").to_s

class HomepagesController < ApplicationController

  def root; end

  def index
    if params[:search_terms]
      @search_terms = params[:search_terms]
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

    if @recipe == nil
      redirect_to search_recipes_path
      flash[:warning] = "Could not find recipe"
    end

    @n_info = @recipe.parse_nutritional
  end

end
