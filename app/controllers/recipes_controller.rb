require 'edamam_recipe'

class RecipesController < ApplicationController
  def root
  end

  def index
    @recipes = EdamamRecipe.search(params[:search_text], params[:from], params[:to])
    @text = params[:search_text]
    @from = params[:from]
    @to = params[:to]
      
  end

  def show
    # @recipe = EdamamRecipe.show("http://www.edamam.com/ontologies/edamam.owl#recipe_f1c853a77986214680bbdd424883499a")
    @recipe = EdamamRecipe.show(params[:uri])
  end

  def more

  end

end # END of class RecipesController
