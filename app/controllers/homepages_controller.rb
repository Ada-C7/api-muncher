require 'will_paginate'

class HomepagesController < ApplicationController

  def index
    recipes = EdamamApiWrapper.search(params[:search_term])

    @search_recipes = recipes.paginate(:page => params[:page], :per_page => 10)
  end

end
