require 'edamam_recipe'

class RecipesController < ApplicationController
  def root
  end

  def index
    @recipes = EdamamRecipe.search(params[:search_text], params[:from], params[:to])
    @text = params[:search_text]
    @from = params[:from]
    @to = params[:to]
    # if @recipes.nil?
    #   flash.now[:text_message] = "Please try again."
    # elsif @recipes[0] == []
    #   flash.now[:text_message] = "There were no hits for this search. Try something else :)."
    # end
    if @recipes[0] == []
      flash.now[:text_message] = "There were no hits for this search. Try something else :)"
    end
  end

  def show
    @recipe = EdamamRecipe.show(params[:uri])
    if @recipe[0].nil?
      flash.now[:text_message] = "No such recipe could be found"
    end
  end


end # END of class RecipesController



# @recipe = EdamamRecipe.show("http://www.edamam.com/ontologies/edamam.owl#recipe_f1c853a77986214680bbdd424883499a")
