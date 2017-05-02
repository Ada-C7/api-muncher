require 'edamam_recipe'

class RecipesController < ApplicationController
    def index
        @recipes = EdamamRecipe.new(params[:search_term])
        @searched_recipes = @recipes.find
    end

    def show; end
end
