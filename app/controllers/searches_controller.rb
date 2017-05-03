class SearchesController < ApplicationController

  def results

    @results = EdamamApiWrapper.searchRecipes(params[:q])
    @count = @results["hits"].count
    @recipes = []

    @results["hits"].each do |recipe|
      uri = recipe["recipe"]["uri"]
      label = recipe["recipe"]["label"]
      image = recipe["recipe"]["image"]
      url = recipe["recipe"]["url"]
      source = recipe["recipe"]["source"]
      ingredients = recipe["recipe"]["ingredients"]
      ingredientlines = recipe["recipe"]["ingredientlines"]
      dietlabels = recipe["recipe"]["dietlabels"]
      healthlabels = recipe["recipe"]["healthlabels"]
      calories = recipe["recipe"]["calories"]
      totalNutrients = recipe["recipe"]["totalNutrients"]


      @recipes << Recipe.new(uri, label, image, url, source, ingredients, ingredientlines, dietlabels, healthlabels, calories, totalNutrients)
    end
    return @recipes
  end
end
