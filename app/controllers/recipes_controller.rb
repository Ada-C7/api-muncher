class RecipesController < ApplicationController

     def index
          @recipes = Wrapper.listRecipes
     end

     def show
          @recipe = Wrapper.getRecipe(params[:id])
     end
end
