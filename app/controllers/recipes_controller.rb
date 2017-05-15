class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  # GET /recipes
  # GET /recipes.json
  def index
    from_param = (params[:p].to_i * 10)
    @recipes = RecipeApi.search(params[:query], from_param )
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
  end





  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = RecipeApi.find(params[:id])
  end




end
