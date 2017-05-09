require_dependency '../../lib/recipe'

class RecipesController < ApplicationController
  def index
    # this has been added because Edamam was trying to prevent me from filtering for gluten free
    # whoops
    @recipes = []
    recipes_list = Recipe.all_by_search_term(params[:search_term], params[:from], params[:to])
    recipes_list.each do |recipe|
      if recipe.health_labels.include? "Gluten-Free"
        @recipes << recipe
      end
    end
    @from = params[:from].to_i
    @to = params[:to].to_i
    return @recipes
  end

  def show
    begin
      @recipe = Recipe.find_by_name(params[:uri])
    rescue ArgumentError => @message
    end
  end

end
