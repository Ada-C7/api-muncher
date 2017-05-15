require 'HTTParty'
require 'recipes'
require 'dotenv-rails'
require 'will_paginate/array'

class RecipesController < ApplicationController
  def index
    @recipes = RecipesApiWrapper.search(params[:query_term]).paginate(:page => params[:page], :per_page => 10)
    # in brackets: form field that will be accepting the query term
    # this index page is displaying the results, so another view page will have to be made for the form the user enters the search into, doesn't need its own controller
  end

  def show
    @recipe = RecipesApiWrapper.search(params[:label])[0]
  end

  def homepage
  end
end


# Example GET request
# curl "https://api.edamam.com/search?q=chicken&app_id=${YOUR_APP_ID}&app_key=${YOUR_APP_KEY}&from=0&to=3&calories=gte%20591,%20lte%20722&health=alcohol-free"
