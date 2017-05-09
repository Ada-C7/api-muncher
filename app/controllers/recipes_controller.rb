require_dependency "./lib/edamam_api_wrapper"
require_dependency "./lib/recipe"

class RecipesController < ApplicationController

    def index
        @recipes = EdamamApiWrapper.getRecipes(params[:search])
        @recipes_paginate = @recipes.paginate(:page => params[:page], :per_page => 10)
    end

    def show
        @recipe = EdamamApiWrapper.showRecipe(params[:uri])
    end
end
