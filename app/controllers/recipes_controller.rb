class RecipesController < ApplicationController

    def results
      results = EdamamApiWrapper.getRecipes(params[:query])
      @recipes = []
      results["hits"].each do |recipe|
        label = recipe["recipe"]["label"]
        image = recipe["recipe"]["image"]
        #external link to original recipe
        url = recipe["recipe"]["url"]
        @recipes << Recipe.new(label, image, url)
      end
      return
    end


end
