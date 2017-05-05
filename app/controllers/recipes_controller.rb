class RecipesController < ApplicationController

  def index
    # if params[:q]
      @recipes = SearchApiWrapper.listRecipes(params[:q])
      @recipes_pages = @recipes.paginate(:page => params[:page], :per_page => 10)

      if @recipes.empty?
        flash[:error] = "Sorry, there is no match"
      else
        return @recipes
      end

    # @recipes = SearchApiWrapper.getRecipes("chicken")
    # else
      # @recipes = []
    # end
  end

  def show
    @recipe = SearchApiWrapper.showRecipe(params[:uri])
  end
end
