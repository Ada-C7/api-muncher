require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search?"
  API_ID = ENV['EDAMAM_ID']
  API_KEY = ENV['EDAMAM_KEY']

  def self.listRecipes(query, api_id = nil, api_key = nil)
    api_id ||= API_ID
    api_key ||= API_KEY
    #check query and make sure it's only letters and spaces
    url = BASE_URL + "q=" +
    query +
    "&app_id=" + api_id +
    "&app_key=" + api_key +
    "&from=0&to=100"

    response = HTTParty.get(url).parsed_response
    hits = response["hits"]
    recipes = []


    if hits
      hits.each do |recipe|
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
    end

    return recipes

  end


  def self.getRecipe(recipe_id, api_id = nil, api_key = nil)
    api_id ||= API_ID
    api_key ||= API_KEY

    url = BASE_URL +
    "&app_id=" + api_id +
    "&app_key=" + api_key +
    "&r=http://www.edamam.com/ontologies/edamam.owl%23recipe_" + recipe_id

    recipe = HTTParty.get(url).parsed_response

    #checking for bad API key or ID
    if recipe.include? "Error 401"
      return nil
    #bad recipe_id
    elsif recipe == []
      return nil
    else
      recipe_hash = Hash.new
      recipe_hash[:label] = recipe[0]["label"]
      recipe_hash[:image] = recipe[0]["image"]
      #external link to original recipe
      recipe_hash[:url] = recipe[0]["url"]
      recipe_hash[:uri] = recipe[0]["uri"]
      recipe_hash[:servings] = recipe[0]["yield"] #integer
      recipe_hash[:diet_labels] = recipe[0]["dietLabels"] #array
      recipe_hash[:health_labels] = recipe[0]["healthLabels"] #array
      recipe_hash[:ingredients] = recipe[0]["ingredientLines"] #array of strings
      return Recipe.new(recipe_hash)
    end



  end




end
