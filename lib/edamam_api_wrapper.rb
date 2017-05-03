require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/"
  APP_ID = ENV["APP_ID"]
  APP_KEY = ENV["APP_KEY"]

  def self.search(search_term, app_id = nil, app_key = nil)
    app_id ||= APP_ID
    app_key ||= APP_KEY

    search_term = search_term.gsub(/\s/, '+')

    url = BASE_URL + "search?q=#{ search_term }&" + "app_id=#{ app_id }&" + "app_key=#{ app_key }"

    response = HTTParty.post(url) #,
    # body: {
    #   "text" => "#{ text }",
    #   "channel" => "#{ channel_id }",
    #   "as_user" => "true"
    # },
    # headers: {
    #   "Content-Type" => "application/x-www-form-urlencoded"
    # }
    # )

    return response["ok"]
  end

  def self.listRecipes(search_term, app_id = nil, app_key = nil)
    app_id ||= APP_ID
    app_key ||= APP_KEY

    url = BASE_URL + "search?q=#{ search_term }&" + "app_id=#{ app_id }&" + "app_key=#{ app_key }"

    response = HTTParty.get(url).parsed_response["hits"]

    recipes = []
    if response
      response.each_with_index do |recipe, i|
        recipe_hash = {
          "id" => i,
          "label" => response[i]["recipe"]["label"],
          "image" => response[i]["recipe"]["image"],
          "url" => response[i]["recipe"]["url"],
          "ingredientLines" => response[i]["recipe"]["ingredientLines"],
          "calories" => response[i]["recipe"]["calories"],
          "fat" => response[i]["recipe"]["totalNutrients"]["FAT"]["quantity"],
          "sugar" => response[i]["recipe"]["totalNutrients"]["SUGAR"]["quantity"],
          "protein" => response[i]["recipe"]["totalNutrients"]["PROCNT"]["quantity"],
          "sodium" => response[i]["recipe"]["totalNutrients"]["NA"]["quantity"]
        }
        recipes << Recipe.new(recipe_hash)
      end
    end

    # raise
    return recipes
  end

  def self.showRecipe(id)
    # url = BASE_URL + "channels.info?" + "token=#{ TOKEN }&" + "channel=#{ id }"
    #
    # response = HTTParty.get(url)
    #
    # if response["channel"]
    #   return Channel.new(response["channel"]["name"], response["channel"]["id"])
    # else
    #   return false
    # end
  end
end
