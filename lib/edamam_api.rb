require 'httparty'


class EdamamApi

  BASE_URL = "https://api.edamam.com/search"

  def initialize(hash_params)
    @image = hash_params[:image]
    @uri = hash_params[:uri]
    @label = hash_params[:label]
    @recipe_source_label = hash_params[:source]
    @recipe_source_uri = hash_params[:uri]
  end

  def self.list_recipes(query)
    query_params = {
      "app_id" => ENV["APP_ID_SENSITIVE"],
      "app_key" => ENV["API_KEY_SENSITIVE"],
      "q" => query,
      "from" => 0,
      "to" => 8
    }
    url = "#{BASE_URL}?"
    response = HTTParty.get(url, query: query_params)["hits"]
    recipe_array = []
    response.each do |recipe|
      recipe_array << self.new({label: recipe["recipe"]["label"], image: recipe["recipe"]["image"], source: recipe["recipe"]["source"], uri: recipe["recipe"]["uri"], url: recipe["recipe"]["url"] })
    end
    return recipe_array
  end
end
