
class HomepagesController < ApplicationController

  def root; end

  def index
    if params[:search_terms]
      from = (params[:page]).to_i * 10
      @recipes = EdamamApiWrapper.search(params[:search_terms], from)
      page = params[:page].to_i
      page += 1
      params[:page] = page
    else
      flash[:warning] = "Please enter search terms"
      redirect_to :root
    end
  end

end
