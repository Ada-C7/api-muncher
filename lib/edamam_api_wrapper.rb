require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search?"
  API_ID = ENV['EDAMAM_ID']
  API_KEY = ENV['EDAMAM_KEY']

  def self.listRecipes(query)

    url = BASE_URL + "q=" +
    query +
    "&app_id=" + API_ID +
    "&app_key=" + API_KEY +
    "&from=0&to=100"

    response = HTTParty.get(url).parsed_response

    recipes = []
    response["hits"].each do |recipe|
      recipe_hash = Hash.new
      recipe_hash[:label] = recipe["recipe"]["label"]
      recipe_hash[:image] = recipe["recipe"]["image"]
      #external link to original recipe
      recipe_hash[:url] = recipe["recipe"]["url"]
      recipe_hash[:uri] = recipe["recipe"]["uri"]
      recipe_hash[:servings] = recipe["recipe"]["yield"] #integer
      recipe_hash[:diet_labels] = recipe["recipe"]["dietLabels"] #array
      recipe_hash[:health_labels] = recipe["recipe"]["healthLabels"] #array
      recipe_hash[:ingredients] = recipe["recipe"]["ingredientLines"] #array of strings
      recipes << Recipe.new(recipe_hash)
    end


    return recipes

  end


  def self.getRecipe(recipe_id)

    url = BASE_URL +
    "&app_id=" + API_ID +
    "&app_key=" + API_KEY +
    "&r=http://www.edamam.com/ontologies/edamam.owl%23recipe_" + recipe_id

    recipe = HTTParty.get(url).parsed_response[0]
    if recipe
      recipe_hash = Hash.new
      recipe_hash[:label] = recipe["label"]
      recipe_hash[:image] = recipe["image"]
      #external link to original recipe
      recipe_hash[:url] = recipe["url"]
      recipe_hash[:uri] = recipe["uri"]
      recipe_hash[:servings] = recipe["yield"] #integer
      recipe_hash[:diet_labels] = recipe["dietLabels"] #array
      recipe_hash[:health_labels] = recipe["healthLabels"] #array
      recipe_hash[:ingredients] = recipe["ingredientLines"] #array of strings
    else
      return nil
    end

    return Recipe.new(recipe_hash)

  end




end
