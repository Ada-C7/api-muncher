class RecipesController < ApplicationController

     def index
          @recipes = Wrapper.listRecipes(params[:filter])
          @recipes = Kaminari.paginate_array(@recipes).page(params[:page]).per(10)
     end

     def show
          @recipe = Wrapper.getRecipe(params[:id])

          if @recipe.nil?
               flash[:error] = "We haven't that chocolate recipe on file."
               redirect_to root_path
          else
               return @recipe
          end
     end
end
