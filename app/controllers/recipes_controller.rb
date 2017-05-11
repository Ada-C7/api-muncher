class RecipesController < ApplicationController

     def index
          @recipes = Wrapper.listRecipes(params[:filter])
     end

     def show
          @recipe = Wrapper.getRecipe(params[:id])
     end
end
