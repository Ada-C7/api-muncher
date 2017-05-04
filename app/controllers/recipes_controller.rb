class RecipesController < ApplicationController

  def search
    # @recipe = Recipe.new
  end

  def index
    @search_term = params["q"]
    @recipes = Recipe.search("q" => params["q"], "to" => params["to"], "from" => params["from"])
    count = Recipe.count_results(params["q"])
    @to = (params["to"] ||= 10).to_i
    @to += 10 if count > @to
  end

  def show
    @search_term = params["q"]
    @recipe = Recipe.search("q" => params["id"]).first
  end

  #add strong params
end
