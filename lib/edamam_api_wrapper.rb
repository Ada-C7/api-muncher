require 'httparty'
require 'uri'

class EdamamApiWrapper
  BASE_URL =  "https://api.edamam.com/search?"
  APP_ID = ENV["APP_ID"]
  APP_KEY = ENV["APP_KEY"]

  def self.search(search_terms, from=0)

    search = search_terms.gsub(' ','+')
    url = BASE_URL + "app_id=#{APP_ID}&" + "app_key=#{APP_KEY}&" + "q=#{search}&" + "from=#{from}"

    result = HTTParty.get(url)

    recipes = []
    if result["hits"]
      result["hits"].each do |result|
        name = result["recipe"]["label"]
        uri = result["recipe"]["uri"]
        image = result["recipe"]["image"]
          #Don't need everything just for search!

        recipes << Recipe.new(name, uri, image)
      end
    end
    return recipes
  end

  def self.getRecipe(uri)
    uri = URI.encode(uri)
    url = BASE_URL + "app_id=#{APP_ID}&" + "app_key=#{APP_KEY}&" + "r=#{uri}"

    begin
      result = HTTParty.get("#{url}")
      result = result.parsed_response
    rescue JSON::ParserError
      return nil
    end

    if result.length == 0
      return nil
    else
      info = result[0]

      recipe = Recipe.new(info["label"], info["uri"], info["image"], info["url"], info["ingredientLines"], info["totalNutrients"], info["yield"])
      return recipe
    end
  end
end
