require 'httparty'
require 'will_paginate/array'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search?"
  APP_KEY = ENV["EDAMAM_TOKEN"]
  APP_ID = ENV["APP_TOKEN"]

  def self.listRecipes(search_term, page)

    search = URI.encode(search_term)
    url = BASE_URL + "q=#{search}&" + "app_id=#{APP_ID}&" + "app_key=#{APP_KEY}"
    if page
      from_recipe = page.to_i * 10 - 10
      url += "&from=#{from_recipe}"
    end

    response = HTTParty.get(url)
    search_results = response["hits"]
    recipes = []
    if search_results
        search_results.each do |recipe|
        recipes << Recipe.new(recipe["recipe"]["label"], recipe["recipe"]["image"], recipe["recipe"]["uri"].partition("recipe_").last)
      end
    end
    return recipes
  end

  def self.findRecipe(id)
    url = BASE_URL + "r=http://www.edamam.com/ontologies/edamam.owl%23recipe_#{id}&" + "app_id=#{APP_ID}&" + "app_key=#{APP_KEY}"

    response = HTTParty.get(url)
    recipe = response.first
    if recipe
      recipe = Recipe.new(recipe["label"], recipe["image"], recipe["uri"].partition("recipe_").last, url: recipe["url"], ingredientLines: recipe["ingredientLines"], digest: recipe["digest"])
    end
  return recipe
  end
end
