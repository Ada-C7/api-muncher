class RecipesController < ApplicationController

  def view_recipes

    print  ">>>>>>>>>>>>>>"
    print params["health_labels"]
    print  "<<<<<<<<<<<<<<<<<"
    @search_query = params[:search]
    @recipes_number = Recipe.count_all(@search_query)
    @recipes = Recipe.search(params[:search], params[:from],params["health_labels"]) #, params[health_labels:[]]) #

    if @recipes.length == 0
      flash[:result_text] = "Could not find recipes. Try again"
      redirect_to root_path
    end

  end


  def welcome
    # @health_labels_list = ["vegan", "vegetarian", "paleo", "dairy-free",
    #   "gluten-free", "wheat-free", "fat-free", "low-sugar", "egg-free",
    #   "peanut-free", "tree-nut-free", "soy-free", "fish-free", "shellfish-free"]
      @health_labels_list = ["alcohol-free", "dairy-free",
           "gluten-free","egg-free", "low-sugar", "paleo",
            "kosher", "peanut-free", "soy-free", "vegetarian", "vegan"]
    end


    def new
    end

    def create
    end

    def show_recipe
      @recipe = Recipe.find_recipe(params[:uri])

    end




  end
