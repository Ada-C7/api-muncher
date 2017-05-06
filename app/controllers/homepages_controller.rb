class HomepagesController < ApplicationController
  def index;end

  def list
    if params[:search_term] && params[:search_term] != ""
      @recipes = EdamamApiWrapper.listRecipes(params[:search_term], params[:page])
      if @recipes == []
        flash[:error] = "please enter search term"
        return
      end
    else
      flash[:warning] = "please enter search term"
      redirect_to :root
      return
    end

    @search_term = params[:search_term]
  end

  def show
    @recipe = EdamamApiWrapper.findRecipe(params[:recipe_id])
    render_404 if !@recipe
  end
end
