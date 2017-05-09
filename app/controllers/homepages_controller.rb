require 'will_paginate/array'

class HomepagesController < ApplicationController

  def index
    recipes = EdamamApiWrapper.search(params[:search_term])
    if recipes.length > 0
      @search_recipes = recipes.paginate(:page => params[:page], :per_page => 10)
    end
  end

end
