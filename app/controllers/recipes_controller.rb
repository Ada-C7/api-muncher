class RecipesController < ApplicationController

    def index
      recipes = EdamamApiWrapper.getRecipes("hummus")
      @recipes = recipes["hits"]
    end
end
