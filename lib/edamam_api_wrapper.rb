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
    return response

  end


  def self.getRecipe(recipe_id)

    url = BASE_URL +
    "&app_id=" + API_ID +
    "&app_key=" + API_KEY +
    "&r=http://www.edamam.com/ontologies/edamam.owl%23recipe_" + recipe_id

    response = HTTParty.get(url).parsed_response
    return response

  end




end
