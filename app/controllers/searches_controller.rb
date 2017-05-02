class SearchesController < ApplicationController

  def results

    @results = EdamamApiWrapper.searchRecipes(params[:q])
    @count = @results["hits"].count
    @recipes = []

    @results["hits"].each do |recipe|
      uri = recipe["recipe"]["uri"]
      label = recipe["recipe"]["label"]
      image = recipe["recipe"]["image"]
      @recipes << Recipe.new(uri, label, image)
    end
    return @recipes
  end
end
