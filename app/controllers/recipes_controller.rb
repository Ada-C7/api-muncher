class RecipesController < ApplicationController

     def index
          @recipes = Wrapper.listRecipes
     end

end
