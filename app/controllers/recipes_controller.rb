require_dependency '../../lib/recipe'

class RecipesController < ApplicationController

  def search
    # @recipe = Recipe.new
  end

  def index
    @search_term = params["q"]
    @recipes = Recipe.search(params_hash)
    count = Recipe.count_results(params["q"])
    @to = (params["to"] ||= 10).to_i
    @to += 10 if count > @to
  end

  def show
    @search_term = params["q"]
    @recipe = Recipe.search("q" => params["id"]).first
    #full recipe
  end

  #add strong params
  private
  def params_hash
    { "q" => params["q"], "from" => params["from"] ||= 0, "to" => params["to"] ||= 10 }
  end
end
