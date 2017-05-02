class RecipesController < ApplicationController

  def index

    if params[:search_term]
      @results = ...
  end
end
