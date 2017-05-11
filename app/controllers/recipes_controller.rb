class RecipesController < ApplicationController

     def index
          @recipes = Wrapper.listRecipes(params[:filter])
          @recipes = Kaminari.paginate_array(@recipes).page(params[:page]).per(10)

     end

     def show
          @recipe = Wrapper.getRecipe(params[:id])
     end
end
