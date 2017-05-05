require 'HTTParty'
require 'recipes'
require 'dotenv-rails'

class RecipesController < ApplicationController
  def index
    @recipes = RecipesApiWrapper.search(params[:query_term])
    # in brackets: form field that will be accepting the query term
    # this index page is displaying the results, so another view page will have to be made for the form the user enters the search into, doesn't need its own controller
  end

  def show
  end

  def homepage
  end
end


# Example GET request
# curl "https://api.edamam.com/search?q=chicken&app_id=${YOUR_APP_ID}&app_key=${YOUR_APP_KEY}&from=0&to=3&calories=gte%20591,%20lte%20722&health=alcohol-free"
