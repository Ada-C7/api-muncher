require 'httparty'

class Recipe
  attr_reader :servings, :uri, :label, :link, :ingredients, :image, :servings, :health_labels, :bookmarked
  APP_ID = ENV["APP_ID"]
  APP_KEY = ENV["APP_KEY"]

  BASE_URL = "https://api.edamam.com/search"
  MAX_HITS = 200

  def self.get_recipes(search_term)
    result = []
    url = BASE_URL + "?app_id=#{APP_ID}" + "&app_key=#{APP_KEY}" + "&q=#{search_term}"
    data = HTTParty.get(url)
    10.times do |i|
      label = data["hits"][i]["recipe"]["label"]
      image = data["hits"][i]["recipe"]["image"]
      uri = data["hits"][i]["recipe"]["uri"]
      result.push({:label => label, :image => image, :uri => uri})
    end
    return result
  end

  def self.find(uri)
    url = BASE_URL + "?app_id=#{APP_ID}" + "&app_key=#{APP_KEY}" + "&r=#{uri}"
    # url = BASE_URL + "r=#{uri}"
    @recipe = HTTParty.get(url)
  end
end
# https://api.edamam.com/search?app_id=a2ff8baf&app_key=040d7bdf8d951b6270f52071ff42392d&q=kimchi
