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
      ingredientlines = recipe["recipe"]["ingredientLines"]
      dietlabels = recipe["recipe"]["dietLabels"]
      healthlabels = recipe["recipe"]["healthLabels"]
      calories = recipe["recipe"]["calories"]
      totalNutrients = recipe["recipe"]["totalNutrients"]
      id = recipe["recipe"]["uri"].split('_')[1]


      @recipes << Recipe.new(uri, label, image, url, source, ingredients, ingredientlines, dietlabels, healthlabels, calories, totalNutrients, id)
    end

    @recipes = @recipes.paginate(params[:page], 5)

    return @recipes
  end

  def show
    response = EdamamApiWrapper.getRecipe(params[:id]).parsed_response
      uri = response[0]["uri"]
      label = response[0]["label"]
      image = response[0]["image"]
      url = response[0]["url"]
      source = response[0]["source"]
      ingredients = response[0]["ingredients"]
      ingredientlines = response[0]["ingredientLines"]
      dietlabels = response[0]["dietLabels"]
      healthlabels = response[0]["healthLabels"]
      calories = response[0]["calories"]
      totalNutrients = response[0]["totalNutrients"]
      id = response[0]["uri"].split('_')[1]

      @recipe = Recipe.new(uri, label, image, url, source, ingredients, ingredientlines, dietlabels, healthlabels, calories, totalNutrients, id)



    #initialize twice?
  end

end
