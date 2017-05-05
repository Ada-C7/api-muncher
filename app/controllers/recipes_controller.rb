class RecipesController < ApplicationController

    def view_recipes
      all_without_from =  RecipeApiWrapper.all(params[:search], params[:vegan], params[:kosher], params[:vegetarian], params[:paleo])
      @recipes = RecipeApiWrapper.search(params[:search], params[:from], params[:vegan], params[:kosher], params[:vegetarian], params[:paleo])

      if all_without_from  == nil || all_without_from == 0 || @recipes == nil || @recipes.length == 0
        flash[:result_text] = "Could not find recipes. Try again"
        redirect_to root_path
      else
        @recipes_number = all_without_from.length
        @per_page = 12
        @number_of_pages = @recipes_number/@per_page
        @number_of_pages += 1 if @recipes_number % @per_page > 0
      end

      if @login_user
        @search = Search.new(user_id: @login_user.id, keyword: params[:search])

        params[:vegan] == nil ? @search.vegan = false : @search.vegan = true
        params[:kosher] == nil ? @search.kosher = false : @search.kosher = true
        params[:vegetarian] == nil ? @search.vegetarian = false : @search.vegetarian = true
        params[:paleo] == nil ? @search.paleo = false : @search.paleo = true

        @user_search = Search.find_by(user_id: @login_user.id, keyword: params[:search],
                                  vegan: @search.vegan, kosher: @search.kosher,
                                  vegetarian: @search.vegetarian, paleo: @search.paleo )
        if @user_search == nil
          @search.save
        end
      end
    end

    def show_recipe
      @recipe = RecipeApiWrapper.find_recipe(params[:uri])
      @favorite_recipe = Recipe.new
    end

    def new
      @favorite_recipe = Recipe.new
    end

    def create
      @favorite_recipe = Recipe.new(name: params[:name],recipe_uri: params[:recipe_uri], user_id: params[:user_id])
      if @favorite_recipe.save
        flash[:result_text] = "You added recipe to your favorite"
        redirect_to show_recipe_path(@favorite_recipe.recipe_uri)
      end
    end

    def destroy
      favorite_recipe = Recipe.find(params[:id])
      if favorite_recipe.destroy
        flash[:result_text] = "You removed recipe from your favorite"
        redirect_to user_path(favorite_recipe.user.id)
      end
    end

    private
    def favorite_recipe_params
      params.require(:favorite_recipe).permit(:name, :recipe_uri, :user_id)
    end

    def search_params
      params.require(:search).permit(:search, :from, :vegan, :kosher, :vegetarian, :paleo)
    end

  end
