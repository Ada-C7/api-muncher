require 'edamam_api_wrapper'
require 'recipe'
require 'will_paginate/array'

class RecipesController < ApplicationController

  def show
    @recipe = EdamamApiWrapper.search(params[:search_term])
  end

end
