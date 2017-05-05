require 'HTTParty'
require 'dotenv-rails'


BASE_URL = "https://api.edamam.com/search"

class RecipesApiWrapper
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

    # if logic: send back array of recipes if 'more' response

  end
end

# Example GET request
# curl "https://api.edamam.com/search?q=chicken&app_id=${YOUR_APP_ID}&app_key=${YOUR_APP_KEY}&from=0&to=3&calories=gte%20591,%20lte%20722&health=alcohol-free"
