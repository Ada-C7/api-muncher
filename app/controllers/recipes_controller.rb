class RecipesController < ApplicationController

    def results
      recipes = EdamamApiWrapper.getRecipes(params[:query])
      @recipes = recipes["hits"]
    end


end
