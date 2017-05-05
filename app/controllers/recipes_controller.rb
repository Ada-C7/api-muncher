require 'edamam_api_wrapper'
require 'recipe'
require 'will_paginate/array'

class RecipesController < ApplicationController

  def show
    @show_recipe = EdamamApiWrapper.show_recipe(params[:recipe])
  end

end
