class HomepagesController < ApplicationController
  def index;end

  def list
    if params[:search_term] && params[:search_term] != nil
      @recipes = EdamamApiWrapper.listRecipes(params[:search_term], params[:page])
      if @recipes == []
        flash[:status] = :warning
        flash[:result_text] = "no results found, please enter new search term"
        redirect_to :root
        return
      end
    else
      flash[:status] = :warning
      flash[:result_text] = "please enter search term"
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
