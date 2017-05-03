#require "slack_api_wrapper"
#require "channel"

class HomepagesController < ApplicationController

  def index
    @search_recipes = EdamamApiWrapper.search
  end

  def show
  end

end
