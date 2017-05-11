require_dependency '../../lib/recipe.rb'

class RecipesController < ApplicationController
  #just the search page itself
  def search_show
  end
  #gets the actual info from the API
  def search
    @recipes = Recipe.all_recipes(params[:search])
    if @recipes.nil?
      flash[:errors] = "No recipe found"
      redirect_to search_show_path
      #TODO COME BACK TO THIS
    end
  end
  #shows the indivudual recipe
  def show_recipe
    @recipe = Recipe.a_recipe(params[:uri])
  end

# need a controller method to bring up the form
# and then a controller method to submit form
end
