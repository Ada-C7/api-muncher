require 'httparty'

class EdamamApiWrapper
 # attr_reader :uri
  BASE_URL = "https://api.edamam.com/"
  APP_ID = ENV["EDAMAM_APP_ID"]
  APP_KEY = ENV["EDAMAM_APP_KEY"]

  # "https://api.edamam.com/search?q=chicken&app_id=${YOUR_APP_ID}&app_key=${YOUR_APP_KEY}&from=0&to=3&calories=gte%20591,%20lte%20722&health=alcohol-free"

  def self.search(search_term)
    url = BASE_URL + "search?q=#{search_term}" + "&app_id=#{APP_ID}&app_key=#{APP_KEY}" + "&to=60"

    response = HTTParty.get(url)
    # raise
    recipes = []
    #  raise
    if response["hits"]
      response["hits"].each do |hit|
        name = hit["recipe"]["label"]
        uri = hit["recipe"]["uri"]
        image = hit["recipe"]["image"]

      recipes << Recipe.new(name, uri, image)
      end
    else
      return nil
    end
    return recipes

  end


  def self.show_recipe(recipe_uri)

    # https://api.edamam.com/search?app_id=98890148&app_key=f45d95396610b94a0125add2218b269f&r=http://www.edamam.com/ontologies/edamam.owl%23recipe_637913ec61d9da69eb451818c3293df2
    url = BASE_URL + "search?" + "app_id=#{APP_ID}&app_key=#{APP_KEY}" + "&r=#{recipe_uri}"

    response = HTTParty.get(url)
    # raise
    if response[0]
      uri = response[0]["uri"]
      name = response[0]["label"]
      image = response[0]["image"]
      # img_source = response[0]["source"]
      url = response[0]["url"]
      r_yield = response[0]["yield"]
      diet_labels = response[0]["dietLabels"]
      health_labels = response[0]["healthLabels"]
      ingredients = response[0]["ingredientLines"]
      calories = response[0]["calories"]

      Recipe.new(uri, name, image, url, r_yield, diet_labels, health_labels, ingredients, calories)
    end

  end
end
