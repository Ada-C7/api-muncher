class RecipesController < ApplicationController

    def index
      @recipes = EdamamApiWrapper.getRecipes("hummus")

    end
end
