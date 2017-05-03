require 'HTTParty'
require '.env'

class RecipesController < ApplicationController
  def index
    @data = RecipesApiWrapper.search(query)
  end

  def show
  end
end


# Example GET request
# curl "https://api.edamam.com/search?q=chicken&app_id=${YOUR_APP_ID}&app_key=${YOUR_APP_KEY}&from=0&to=3&calories=gte%20591,%20lte%20722&health=alcohol-free"
