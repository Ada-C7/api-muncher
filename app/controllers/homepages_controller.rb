class HomepagesController < ApplicationController
  def index;end

  def list
    if params[:search_term] && params[:search_term] != ""
      @recipes = EdamamApiWrapper.listRecipes(params[:search_term], params[:page])
    else
      flash[:warning] = "please enter search term"
      redirect_to :root
      return
    end

    @search_term = params[:search_term]

    if !params[:page]
      page = 1
    else
      page = params[:page].to_i
    end

    if page == 1
      @previous_link = ""
    else
      @previous_link = "<a class=\"button\" href=\"" + list_recipes_path(:search_term => params[:search_term], :page => page - 1) + "\">Previous</a>"
    end

    if @recipes.length < 10
      @next_link = ""
    else
      @next_link = "<a class=\"button\" href=\"" + list_recipes_path(:search_term => params[:search_term], :page => page + 1) + "\">Next</a>"
    end
  end

  def show
    @recipe = EdamamApiWrapper.findRecipe(params[:recipe_id])
  end
end
