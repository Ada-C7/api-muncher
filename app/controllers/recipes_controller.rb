class RecipesController < ApplicationController

    def results
      if !session[:searches]
        session[:searches] = [params[:query]]
      else
        session[:searches] << params[:query]
      end
      results = EdamamApiWrapper.listRecipes(params[:query])

      if results.empty?
        flash.now[:error] = "Your search had no results. Try again!"
        render 'index'
      else
        @recipes = results.paginate(:page => params[:page], :per_page => 10)
        return @recipes
      end
    end

    def show
      @recipe = EdamamApiWrapper.getRecipe(params[:recipe_id])
    
      if !@recipe
        flash[:error] = "Cannot find that recipe"
        render_404
      else
        return @recipe
      end


    end

    def searches; end

end
