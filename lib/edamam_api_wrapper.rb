require 'httparty'

class EdamamApiWrapper
  BASE_URL =  "https://api.edamam.com/search?"
  APP_ID = ENV["APP_ID"]
  APP_KEY = ENV["APP_KEY"]

  def self.search(search_terms)
    search = search_terms.gsub(' ','+')
    url = BASE_URL + "app_id=#{APP_ID}&" + "app_key=#{APP_KEY}&" + "q=#{search}"

    result = HTTParty.get(url)

    recipes = []
    if result["hits"]
      result["hits"].each do |result|
        name = result["recipe"]["label"]
        uri = result["recipe"]["uri"]
        recipes << Recipe.new(name, uri)
      end
    end
    return recipes
  end

  def self.getRecipe(uri)
    url = BASE_URL + "app_id=#{APP_ID}&" + "app_key=#{APP_KEY}&" + "r=#{uri}"

    begin
      result = HTTParty.get(url).parsed_response
    rescue JSON::ParserError
      return nil
    end

    if result.length == 0
      return nil
    else
      info = result[0]

      recipe = Recipe.new(info["label"], info["uri"],
      options: {
        image: info["image"],
        url: info["url"],
        ingredients: info["ingredientLines"],
        nutritional_info: info["totalNutrients"]
        })
      return recipe
    end
  end
end
