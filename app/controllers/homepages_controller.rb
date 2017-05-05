require "edamam_api_wrapper"
require 'recipe'
require 'will_paginate/array'

class HomepagesController < ApplicationController
  def index
    orig_recipes = EdamamApiWrapper.listRecipes(params[:search_words])
    if params[:search_words]
      @recipes = orig_recipes.paginate :per_page => 10, :page => params[:page]
    end
    return @recipes
  end

  # def find_recipe(search_words)
  #   @recipes = EdamamApiWrapper.listRecipes
  # end
  def show
    uri = params[:uri]
    @recipe = EdamamApiWrapper.getRecipe(uri)
    if @recipe
      return @recipe
    else
      flash.now[:status] = :failure
      flash.now[:result_text] = "Recipe Not Found"
      render "index"
    end

  end


end
