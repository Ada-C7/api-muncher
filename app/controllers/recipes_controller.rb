class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new
    if @recipe.create(name: params[:recipe_name], recipe_url: params[:recipe_url])
      flash[:success] = "Added #{@recipe.name} to your favorites list"
      redirect to :root
    else
      flash.new[:failure] = "Unable to add to favorites right now. Sorry!"
      render :new
    end

  end

  def destroy
    Recipe.find(params[:id]).destroy
  end

end
