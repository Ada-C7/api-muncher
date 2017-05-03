require 'edamam_recipe'

class RecipesController < ApplicationController
    def index
        @recipes = EdamamRecipe.new(params[:search_term]).find

        if @recipes.empty?
            flash[:result_text] = 'Wrong Hunch. Nothing was found!'
            redirect_to root_path
        else
            @recipes
        end
    end

    def show
        @recipes = EdamamRecipe.new(params[:search_term]).find
        @recipe = @recipes.select { |recipe| recipe['recipe']['uri'].tr('http://www.edamam.com/ontologies/edamam.owl#recipe_', '') == params[:uri] }
    end
end
