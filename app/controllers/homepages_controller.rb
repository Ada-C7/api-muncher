require "edamam_api_wrapper"
require 'recipe'


class HomepagesController < ApplicationController
  def index
    @recipes = EdamamApiWrapper.listRecipes(params[:search_words])

  end

  # def find_recipe(search_words)
  #   @recipes = EdamamApiWrapper.listRecipes
  # end

  def show
  end
end
