class SearchesController < ApplicationController

  def results
    @results = EdamamApiWrapper.searchRecipes(params[:q])
  end




end
