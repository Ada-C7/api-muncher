require "httparty"
class EdamamApiWrapper < ApplicationController

  URL = "https://api.edamam.com/search"
  HEADERS = {
    "app_key" => ENV["APP_KEY"],
    "app_id" => ENV["APP_ID"]
  }

attr_reader :name, :image, :uri

  def initialize(recipe)
    @uri = recipe["uri"]
    @name = recipe["label"]
    @image = recipe["image"]
  end

  def self.all(search_terms)
    recipe_array = []
    recipes = api_call(search_terms)

    if recipes["hits"]
      recipes["hits"].each do |recipe|
        recipe_array << new(recipe["recipe"])
      end
    end
    return recipe_array
  end

  private
  def self.api_call(search_terms)
    url = "https://api.edamam.com/search"
    recipes = HTTParty.get(URL, headers: HEADERS, query: search_terms).parsed_response
    return recipes
  end
end
