require 'HTTParty'
require 'dotenv-rails'


BASE_URL = "https://api.edamam.com/search"

class RecipesApiWrapper
  class RecipesApiWrapperException < StandardError
  end

  attr_accessor :name, :uri, :label

  def initialize(params)
    @uri = params[:uri]
    @label = params[:label]

  end

  def self.search(query)
    query_params = {
      "q" => query,
      "app_id" => ENV["EDAMAM_ID"],
      "app_key" => ENV["EDAMAM_TOKEN"]
    }


    return HTTParty.get(BASE_URL, query: query_params)


    if response["hits"]
      recipes_list = response["hits"].map do |hit|
        recipe_data = {
          uri: hit["recipe"]["label"],
          label: hit["recipe"]["label"],
          image: hit["recipe"]["label"],
          url: hit["recipe"]["label"],
          calories: hit["recipe"]["label"],
          dietlabels: hit["recipe"]["label"],
          healthlabels: hit["recipe"]["label"],
          ingredients: hit["recipe"]["label"]
        }
        self.new(recipe_data)
      end
    else
      raise RecipesApiWrapperException.new(response["error"])
    end
  end
end

# Example GET request
# curl "https://api.edamam.com/search?q=chicken&app_id=${YOUR_APP_ID}&app_key=${YOUR_APP_KEY}&from=0&to=3&calories=gte%20591,%20lte%20722&health=alcohol-free"
