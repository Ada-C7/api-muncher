
class RecipesController < ApplicationController

  def index
    if params[:q]
      @recipes = EdamamApiWrapper.search(params[:q])
      @recipes_pages = @recipes.paginate(:page => params[:page], :per_page => 10)

    end
  end


  def show
    @recipe = EdamamApiWrapper.show_recipe(params[:uri])
  end
end
