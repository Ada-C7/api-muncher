class RecipesController < ApplicationController

  def view_recipes

    @search_query = params[:search]
    @recipes_number = Recipe.count_all(@search_query, params["health"])
    @recipes = Recipe.search(params[:search], params[:from], params["health"])

    if @recipes.length == 0
      flash[:result_text] = "Could not find recipes. Try again"
      redirect_to root_path
    end

  end


  def welcome
    # @health_labels_list = ["vegan", "vegetarian", "paleo", "dairy-free",
    #   "gluten-free", "wheat-free", "fat-free", "low-sugar", "egg-free",
    #   "peanut-free", "tree-nut-free", "soy-free", "fish-free", "shellfish-free"]
      @health_labels_list = ["vegan", "vegetarian", "peanut-free", "tree-nut-free"]
    end


    def new
    end

    def create
    end

    def show_recipe
      @recipe = Recipe.find_recipe(params[:uri])

    end




  end
