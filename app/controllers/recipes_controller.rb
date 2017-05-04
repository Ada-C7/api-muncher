class RecipesController < ApplicationController

  def view_recipes

    @search_query = params[:search]
    all =  Recipe.all(params[:search], params[:vegan], params[:kosher], params[:vegetarian], params[:paleo])

    # @recipes = Recipe.search(params[:search], params[:from], params["health"])
    @recipes = Recipe.search(params[:search], params[:from], params[:vegan], params[:kosher], params[:vegetarian], params[:paleo])

    if all  == nil || all== 0 || @recipes == nil || @recipes.length == 0
      flash[:result_text] = "Could not find recipes. Try again"
      redirect_to root_path
    else
      @recipes_number = all.length
    end
  end


  def welcome
    @health_labels_list = ["vegan", "vegetarian", "paleo", "dairy-free",
      "gluten-free", "wheat-free", "fat-free", "low-sugar", "egg-free",
      "peanut-free", "tree-nut-free", "soy-free", "fish-free", "shellfish-free"]

    end


    def new
    end

    def create
    end

    def show_recipe
      @recipe = Recipe.find_recipe(params[:uri])

    end




  end
