require 'will_paginate/array'

class RecipesController < ApplicationController

  def index
    if params[:q]
      @recipes = EdamamApiWrapper.search(params[:q]).paginate(:page => params[:page], :per_page => 10)

    end
  end

end
