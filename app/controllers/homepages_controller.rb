
class HomepagesController < ApplicationController

  def root; end

  def index
    if params[:search_terms]
      @recipes = EdamamApiWrapper.search(params[:search_terms])
    else
      flash[:warning] = "Please enter search terms"
      redirect_to :root
    end
  end

end
