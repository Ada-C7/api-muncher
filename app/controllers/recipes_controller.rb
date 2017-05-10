require 'edamam_api_wrapper'

class RecipesController < ApplicationController

    def index
        @recipes = EdamamApiWrapper.getRecipes(params[:search])
    end
end
