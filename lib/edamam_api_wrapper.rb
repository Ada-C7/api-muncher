require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/"
  APP_ID = ENV["EDAMAM_APP_ID"]
  APP_KEY = ENV["EDAMAM_APPLICATION_KEY"]

  def self.search(search_term)
    #raise
    url = BASE_URL + "search?" + "app_id=#{APP_ID}" + "&app_key=#{APP_KEY}" + "&q=#{search_term}" + "&to=10"

    response = HTTParty.get(url).parsed_response

    recipes = []
    if response["hits"]
      response["hits"].each do |recipe|
        label = recipe["recipe"]["label"]
        uri = recipe["recipe"]["uri"]
        options = {}
        options["image"] = recipe["recipe"]["image"]
        options["url"] = recipe["recipe"]["url"]
        options["source"] = recipe["recipe"]["source"]
        options["ingredients"] = recipe["recipe"]["ingredients"]
        #raise
        recipes << Recipe.new(label, uri, options)


      end
    end
    #raise
    return recipes
  end

  def self.getRecipe(uri)
    url = BASE_URL + "search?" + "app_id=#{APP_ID}" + "&app_key=#{APP_KEY}" + "&r=#{uri}"

    response = HTTParty.get(url).parsed_response

    if response != nil
      label = response[0]["label"]
      uri = response[0]["uri"]
      options = {}
        options["image"] = response[0]["image"]
        options["url"] = response[0]["url"]
        options["source"] = response[0]["source"]
        options["ingredients"] = response[0]["ingredients"]
      recipe = Recipe.new(label, uri, options)
    else
      return nil
    end
    # raise
    return recipe
  end
end
