#require "slack_api_wrapper"
#require "channel"

class HomepagesController < ApplicationController

  def index
    @search_recipes = EdamamApiWrapper.search(params[:search_term])
  end

  def show
    @top_ten_recipes 
  end

end
