class RecipesController < ApplicationController

    def results
      if !session[:searches]
        session[:searches] = [params[:query]]
      else
        session[:searches] << params[:query]
      end
      results = EdamamApiWrapper.listRecipes(params[:query])
      recipes = []
      results["hits"].each do |recipe|
        label = recipe["recipe"]["label"]
        image = recipe["recipe"]["image"]
        #external link to original recipe
        url = recipe["recipe"]["url"]
        uri = recipe["recipe"]["uri"]
        servings = recipe["recipe"]["yield"] #integer
        diet_labels = recipe["recipe"]["dietLabels"] #array
        health_labels = recipe["recipe"]["healthLabels"] #array
        ingredients = recipe["recipe"]["ingredientLines"] #array of strings

        recipes << Recipe.new(label, image, url, uri, servings, diet_labels, health_labels, ingredients)
      end
      @recipes = recipes.paginate(:page => params[:page], :per_page => 10)
      return @recipes
    end

    def show
      recipe = EdamamApiWrapper.getRecipe(params[:recipe_id])[0]
      label = recipe["label"]
      image = recipe["image"]
      #external link to original recipe
      url = recipe["url"]
      uri = recipe["uri"]
      servings = recipe["yield"] #integer
      diet_labels = recipe["dietLabels"] #array
      health_labels = recipe["healthLabels"] #array
      ingredients = recipe["ingredientLines"] #array of strings
      @recipe = Recipe.new(label, image, url, uri, servings, diet_labels, health_labels, ingredients)

    end

    def searches; end

end
