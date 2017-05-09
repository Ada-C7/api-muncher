require 'edamam_recipe'

class RecipesController < ApplicationController
    def index
        @health_labels = ['vegan', 'vegetarian', 'sugar-conscious', 'alcohol-free', 'peanut-free', 'tree-nut-free']

        @diet_labels = ['balanced', 'high-protein', 'low-fat', 'low-carb']

        @recipes = EdamamRecipe.new(params[:search_term]).find(params[:page_num].to_i)

        if @recipes.empty?
            flash[:result_text] = 'Wrong Hunch. Nothing was found!'
            redirect_to root_path
        elsif params[:dietary_labels]
            @recipes = EdamamRecipe.new(params[:search_term]).find(params[:page_num].to_i, params[:dietary_labels])
            if @recipes.empty?
                flash[:result_text] = 'Oh hunch! No munch matches that criteria'
                return @recipes = []
            else
                flash[:result_text] = 'What a hunch! We found some munchies!'
                return @recipes
            end
        else
            return @recipes
        end
    end

    def show
        @recipe = EdamamRecipe.show(params[:uri])
    end
end
