require_dependency '../../lib/recipe_api_wrapper'

class RecipesController < ApplicationController

  def view_recipes
    # @@total_number - total number of recepies with search term (I need it to calculate number of pages to display in a view )
    if params[:from].to_i == 0
      @@total_number =  RecipeApiWrapper.search(params[:search],params[:from],params[:health], count = true)
      if @@total_number != nil
        @@total_number = 300 if @@total_number > 300 #api gives max 300 results
      end
    end
    @recipes = RecipeApiWrapper.search(params[:search], params[:from],params[:health], count = false)

    if @@total_number  == nil || @@total_number == 0 || @recipes == nil || @recipes.length == 0
      flash[:result_text] = "Could not find recipes. Try again"
      redirect_to root_path
    else
      @recipes_number = @@total_number
      @per_page = 12
      @number_of_pages = @@total_number/@per_page
      @number_of_pages += 1 if @@total_number % @per_page > 0

      @from_previous = params[:from].to_i - @per_page
      @from_next = params[:from].to_i + @per_page
    end

    if @login_user
      @search = Search.new(user_id: @login_user.id, keyword: params[:search])
      if params[:health] != nil
        @search.set_up_search(params[:health])
      end
      @user_search = Search.find_by(user_id: @login_user.id, keyword: params[:search],
      vegan: @search.vegan, treenutfree: @search.treenutfree,
      vegetarian: @search.vegetarian, peanutfree: @search.peanutfree)
      if @user_search == nil
        @search.save
      end
    end
  end

  def show_recipe
    @recipe = RecipeApiWrapper.find_recipe(params[:uri])
    if @recipe == nil
      flash[:result_text] = "Could not find recipe. Try again"
      redirect_to root_path
    else
      @favorite_recipe = Recipe.new
    end
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


end
