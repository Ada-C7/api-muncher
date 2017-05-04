class RecipesController < ApplicationController

  def view_recipes
    all =  RecipeApiWrapper.all(params[:search], params[:vegan], params[:kosher], params[:vegetarian], params[:paleo])
    @search_query = params[:search]
    @optional_params = ""
    @optional_params += "&vegan=vegan" if params[:vegan] != nil
    @optional_params += "&kosher=kosher" if params[:kosher] != nil
    @optional_params += "&vegetarian=vegetarian" if params[:vegetarian] != nil
    @optional_params += "&paleo=paleo" if params[:paleo] != nil

    @recipes = RecipeApiWrapper.search(params[:search], params[:from], params[:vegan], params[:kosher], params[:vegetarian], params[:paleo])

    if all  == nil || all== 0 || @recipes == nil || @recipes.length == 0
      flash[:result_text] = "Could not find recipes. Try again"
      redirect_to root_path
    else
      @recipes_number = all.length
    end
    if @login_user
      # @search = Search.new(user_id: @login_user.id, keyword: params[:search], vegan: params[:vegan], kosher: params[:kosher],vegetarian: params[:vegetarian], paleo: params[:paleo])
      @search = Search.new(user_id: @login_user.id, keyword: params[:search])
      @search.vegan = true if  params[:vegan] != nil
      @search.kosher = true if  params[:kosher] != nil
      @search.vegetarian = true if  params[:vegetarian] != nil
      @search.paleo = true if  params[:paleo] != nil
      if @search.save
          flash[:result_text] = "You succesessfully saved your search"
      end
    end
  end


  def welcome
    @health_labels_list = ["vegan", "vegetarian", "paleo", "dairy-free",
      "gluten-free", "wheat-free", "fat-free", "low-sugar", "egg-free",
      "peanut-free", "tree-nut-free", "soy-free", "fish-free", "shellfish-free"]
    end

    def show_recipe
      @recipe = RecipeApiWrapper.find_recipe(params[:uri])
      @favorite_recipe = Recipe.new
    end

    def new
      @favorite_recipe = Recipe.new
    end

    def create
      @favorite_recipe = Recipe.new(name: params[:name],recipe_uri: params[:recipe_uri], user_id: params[:user_id] )
      if @favorite_recipe.save
        flash[:result_text] = "You added recipe to your favorite"
        redirect_to show_recipe_path(@favorite_recipe.recipe_uri)
      end
    end


    def destroy
      favorite_recipe = Recipe.find(params[:id])
      if favorite_recipe.destroy
        redirect_to user_path(favorite_recipe.user.id)
      end
    end



    private
    def recipe_params
      params.require(:recipe).permit(:name, :recipe_uri, :user_id)
    end

    def search_params
      params.require(:search).permit(:keywords, :vegan, :kosher, :vegetarian, :paleo)
    end


  end
