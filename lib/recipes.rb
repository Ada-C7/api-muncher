require 'HTTParty'
require 'dotenv-rails'


BASE_URL = "https://api.edamam.com/search"

class RecipesApiWrapper
  attr_accessor :name

  def initialize
  end

  def self.search(query)
    query_params = {
      "q" => query
      "app_id" => EDAMAM_ID
      "app_key" => EDAMAM_TOKEN
    }

    return HTTParty.get("#{BASE_URL}?app_key=#{app_key}&app_id=#{app_id}&q=#{query}")

  end
end

# Example GET request
# curl "https://api.edamam.com/search?q=chicken&app_id=${YOUR_APP_ID}&app_key=${YOUR_APP_KEY}&from=0&to=3&calories=gte%20591,%20lte%20722&health=alcohol-free"
